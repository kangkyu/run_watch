<template>
  <div>
    <div v-show="isLoading" class="spinner">
      <i class="fa fa-spinner fa-spin"></i>
    </div>
    <div class="row">
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
    if (this.$route.path === '/tasks-no-complete') {
      this.loadTasksNoComplete();
    } else {
      this.loadTasksAll();
    }
  },
  methods: {
    loadTasksAll: function() {
      this.isLoading = true;
      let options = {};
      api.getTasks(options).then(response => {
        this.tasks = response.data;
        this.isLoading = false;
      });
    },
    loadTasksNoComplete: function() {
      this.isLoading = true;
      let options = {};
      options.filter = 'no-complete';
      api.getTasks(options).then(response => {
        this.tasks = response.data;
        this.isLoading = false;
      });
    }
  }
};
</script>

<style scoped lang="scss">
.spinner {
  font-size: 7rem;
  text-align: center;
}
</style>
