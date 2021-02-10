import Vue from "vue";
import Router from "vue-router";
Vue.use(Router);
import Home from "../views/Home.vue";
import About from "../views/About.vue";
import BookEdit from '../views/BookEdit.vue'

const router = new Router({
    mode: "history",
    routes: [
        //ルーティングの設定
        {
            path: "/",
            component: Home,
            name: 'Home'
        },
        {
            path: "/about",
            component: About,
        },
        {
            path: '/edit/:id(\\d+)',
            name: 'BookEdit',
            component: BookEdit
        },
    ],
});
export default router;