<template>
  <div class="container">
    <h1 class="#f3e5f5 purple lighten-5 center">本の編集</h1>
    <form class="col s12">
      <div class="row">
        <div class="input-field">
          <input placeholder="Title" type="text" class="validate" v-model="book.title" required="required">
        </div>
      </div>
      <div class="row">
        <div class="input-field">
          <input placeholder="Author" type="text" class="validate" v-model="book.author" required="required">
        </div>
      </div>
      <div class="row">
        <div class="input-field">
          <input placeholder="Publisher" type="text" class="validate" v-model="book.publisher" required="required">
        </div>
      </div>
      <div class="row">
        <div class="input-field">
          <input placeholder="Genre" type="text" class="validate" v-model="book.genre" required="required">
        </div>
      </div>
      <div class="btn" v-on:click="updateBook">本の情報を変更</div>
    </form>
  </div>
</template>

<script>
  import axios from 'axios';
  export default {
    data: function () {
    return {
      book: {}
    }
  },
    mounted () {
      this.getBook()
    },
    methods: {
      getBook(){
        axios
      .get(`/api/books/${this.$route.params.id}.json`)
      .then(response => (this.book = response.data))
      },
      updateBook() {
        axios
        .put(`/api/books/${this.$route.params.id}`, { book: this.book })
        .then(response => {
          this.$router.push({ path: '/' });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
      }
    }
  }
</script>

<style scoped></style>
