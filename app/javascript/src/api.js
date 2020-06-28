import axios from "axios";

// const API_URL = process.env.API_URL || "http://localhost:3000";

// axios.defaults.baseURL = API_URL;
// axios.defaults.headers.post["Content-Type"] = "application/json";
// axios.defaults.xsrfCookieName = "CSRF-TOKEN";
// axios.defaults.xsrfHeaderName = "X-CSRF-Token";
// axios.defaults.withCredentials = true;

export default {
  getTasks() {
    return axios.get("/api/tasks");
  },
  // createUser(username, password) {
  //   return axios.post("/users", { username, password });
  // }
};
