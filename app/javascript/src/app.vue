<template>
  <div id="app">
    <div class="container">
      <div class="traverse">
        <router-link to="/tasks-all">All</router-link>
        |
        <router-link to="/tasks-no-complete">Uncompleted</router-link>
        <template v-if="isAuthenticated">
          |
          Logout
          |
          Hello, {{ username }}
        </template>
        <template v-else>
          |
          <router-link to="/sign-in">Login</router-link>
        </template>
      </div>
      <router-view :key="$route.path"></router-view>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    isAuthenticated() {
      return !!JSON.parse(localStorage.getItem("user"))
    },
    username() {
      return JSON.parse(localStorage.getItem("user")).username
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
