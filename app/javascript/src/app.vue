<template>
  <div id="app">
    <div class="container">
      <div class="traverse">
        <router-link to="/tasks-all">All</router-link>
        |
        <router-link to="/tasks-no-complete">Uncompleted</router-link>
      </div>
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
