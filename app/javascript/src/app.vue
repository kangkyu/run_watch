<template>
  <div id="app">
    <div class="container">
      <div class="traverse">
        <router-link to="/tasks-all">All</router-link>
        |
        <router-link to="/tasks-no-complete">Uncompleted</router-link>
      </div>
      <h2>
        All Episodes
        <small><a href="http://ko.wikipedia.org/wiki/%EB%9F%B0%EB%8B%9D%EB%A7%A8%EC%9D%98_%EB%B0%A9%EC%98%81_%EB%AA%A9%EB%A1%9D" target="_blank">(wikipedia)</a></small>
      </h2>
      <router-view :key="$route.path"></router-view>
    </div>
  </div>
</template>

<script>
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
