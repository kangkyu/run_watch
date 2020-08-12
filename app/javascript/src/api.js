import axios from "axios";

// const API_URL = process.env.API_URL || "http://localhost:3000";

// axios.defaults.baseURL = API_URL;
// axios.defaults.headers.post["Content-Type"] = "application/json";
// axios.defaults.xsrfCookieName = "CSRF-TOKEN";
// axios.defaults.xsrfHeaderName = "X-CSRF-Token";
// axios.defaults.withCredentials = true;

export default {
  getTasks(params = {}) {
    const urlParams = new URLSearchParams(params).toString();
    return axios.get(`/api/tasks?${urlParams}`);
  },
  // createUser(username, password) {
  //   return axios.post("/users", { username, password });
  // },
  createSession(username, password) {
    return axios.post("/api/session", { username, password });
  },
  toggleTaskStatus(id) {
    return axios.put(`/api/tasks/${id}/toggle`);
  }
};
