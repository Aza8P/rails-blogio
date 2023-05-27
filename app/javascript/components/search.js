// search.js
import Vue from 'vue';
// import TurbolinksAdapter from "vue-turbolinks";
// Vue.use(TurbolinksAdapter);

const app = new Vue ({
  el: "#app",
  data: {
    query: "",
    articles: [],
    currentUser: {
      id: parseInt(document.body.dataset.userId)
    }
  },
  mounted() {
    console.log("hello from search.js")
    const searchForm = document.getElementById("search-form");
    if (searchForm) {
      searchForm.addEventListener('submit', function(event) {
        event.preventDefault();
        this.query = document.getElementById("query").value;
        this.searchArticles();
      }.bind(this));
    }
    console.log("currentUser", this.currentUser)
  }, 
  methods:{
    searchArticles() {
      console.log("hello from searchArticles")
      console.log(this.query)
      fetch(`/articles.json?query=${this.query}`)
      .then(response => response.json())
      .then(data => {
        console.log("response is --->", data)
        this.articles = data;
      })
      .catch(error => {
        console.error(error);
      });
    },
  }
});

