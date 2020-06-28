<template>
  <div class="container">
    <h2>
      All Episodes
      <small><a href="http://ko.wikipedia.org/wiki/%EB%9F%B0%EB%8B%9D%EB%A7%A8%EC%9D%98_%EB%B0%A9%EC%98%81_%EB%AA%A9%EB%A1%9D" target="_blank">(wikipedia)</a></small>
    </h2>
    <div v-show="isLoading" class="spinner">
      <i class="fa fa-spinner fa-spin"></i>
    </div>
    <div class="row">
      <!-- <PageLinks/> -->
      <div v-for="task in tasks" :key="task.id">
        <Task :task="task"/>
      </div>
    </div>
  </div>
</template>

<script>
import api from "@/api";
import Task from "@/components/Task";

export default {
  components: {
    Task
  },
  data() {
    return {
      tasks: [],
      isLoading: true
    };
  },
  created() {
    api.getTasks().then(response => {
      this.tasks = response.data;
      this.isLoading = false;
    });
  }
};
</script>

<style scoped lang="scss">
.spinner {
  font-size: 7rem;
  text-align: center;
}
</style>
