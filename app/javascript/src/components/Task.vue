<template>
  <div class="race">
    {{task.date | date}}
    <template v-if="task.title === 'cancel'">
      <strong>cancelled</strong>
    </template>
    <template v-else>
      {{'Ep ' + task.episode}}
      <template v-if="task.completed !== undefined">
        <button class="buttons" v-on:click="toggle(task.id)">{{completed ? 'w' : 'check'}}</button>
      </template>
    </template>
  </div>
</template>

<script>
import api from "@/api";

export default {
  props: {
    task: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      completed: this.task.completed
    };
  },
  methods: {
    toggle: function(id) {
      api.toggleTaskStatus(id).then(response => {
        this.completed = response.data.completed;
        if (this.$route.path === '/tasks-no-complete' && this.completed === true) {
          this.$parent.loadTasksNoComplete();
        }
      });
    }
  }
}
</script>

<style scoped lang="scss">
$blue: #4479BA;

.race {
  padding: 2px 4px;
}
.buttons {
  width: 60px;
  height: 100%;
  background-color: $blue;
  border: solid 1px #2A4E77;
  color: #FFF;
  border-radius: 8%;
}
</style>
