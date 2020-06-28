<template>
  <div class="race">
    {{task.date | date}}
    Ep {{task.episode}}
    <a class="buttons">{{'check'}}</a>
  </div>
</template>

<script>
export default {
  props: {
    task: {
      type: Object,
      required: true
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
