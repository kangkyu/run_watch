<template>
  <div class="race">
    {{task.date | date}}
    <template v-if="task.title === 'cancel'">
      <strong>cancelled</strong>
    </template>
    <template v-else>
      {{'Ep ' + task.episode}}
      <button class="buttons" v-on:click="complete(task.id)">{{completed ? 'w' : 'check'}}</button>
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
    complete: function(id) {
      console.log(id)
      api.completeTask(id, {button: !this.completed}).then(response => {
        this.completed = !this.completed
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
