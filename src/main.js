import { createApp } from 'vue';

import { createRouter, createWebHistory } from 'vue-router';
import App from './App.vue'
import Home from './views/Home.vue';
import Article from './views/Article.vue';
import Articles from './views/Articles.vue';
import CreateArticle from './views/CreateArticle.vue';


const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            name: 'Home',
            component: Home,
            },
        {
            path: '/articles/article/:id',
            name: 'Article',
            component: Article,
            props: true,
        },
        {
            path: '/articles',
            name: 'Articles',
            component: Articles,
        },
        {
            path: '/article/create',
            name: 'CreateArticle',
            component: CreateArticle,
        },
    ],
});

const app = createApp(App);
app.use(router);
app.mount('#app');
