class Api::BooksController < ApplicationController
  protect_from_forgery :except => [:create,:update]
  rescue_from Exception, with: :render_status_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404
  def index
    @books = Book.all
    render "index", formats: :json, handlers: "jbuilder"
  end
  def show
    @book = Book.find(params[:id])
    render "show", formats: :json, handlers: "jbuilder"
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      head :no_content
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      render "index", formats: :json, handlers: "jbuilder"
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      head :no_content
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.fetch(:book, {}).permit(
      :title, :author, :publisher, :genre
    )
  end
  def render_status_404(exception)
    render json: { errors: [exception] }, status: 404
  end

  def render_status_500(exception)
    render json: { errors: [exception] }, status: 500
  end
end
