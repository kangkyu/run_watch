import Vue from "vue";
import Router from "vue-router";

import Tasks from '@/components/Tasks'

Vue.use(Router);

export default new Router({
  mode: "history",
  // base: process.env.BASE_URL,
  routes: [
    {
      path: "/tasks-all",
      component: Tasks
    },
    {
      path: "/tasks-no-complete",
      component: Tasks
    }
  ]
});
