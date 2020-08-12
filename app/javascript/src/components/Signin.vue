<template>
<div>
  <h2>Log in</h2>

  <p v-if="error" class="error">
    {{ error }}
  </p>
  <form v-on:submit.prevent="signIn" autocomplete="off">
    <div class="field">
      <label for="username">Username</label>
      <input type="text" name="username" id="username" v-model.trim="username" required>
    </div>
    <div class="field">
      <label for="password">Password</label>
      <input type="password" name="password" id="password" v-model.trim="password" required>
    </div>
    <div class="actions">
      <input type="submit" name="commit" value="Login" class="buttons">
    </div>
  </form>
</div>
</template>

<script>
import api from "@/api";

export default {
  data() {
    return {
      username: "",
      password: "",
      error: ""
    };
  },
  methods: {
    signIn() {
      api.createSession(this.username, this.password)
      .then(response => {
        localStorage.setItem("user", JSON.stringify(response.data))
        this.$router.replace(this.$route.query.redirect || "/tasks-all");
      })
      .catch(error => {
        localStorage.removeItem("user")
        this.error = error;
      })
    }
  }
};
</script>

<style scoped lang="scss">
form {
  margin-top: 10px;
}
.error {
  color: #E8890C;
  // text-align: center;
}
</style>
