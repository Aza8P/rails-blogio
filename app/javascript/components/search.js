export default {
  data() {
    return {
      query: '',
      articles: [] // Make sure this property is defined
    }
  },
  methods: {
    searchArticles() {
      const query = document.getElementById('search-input').value;
      console.log("query is --->", query)
      fetch(`/articles.json?query=${query}`)
        .then(response => response.json())
        .then(data => {
          console.log("response is --->", data)
          // Update the articles data with the search results
          this.articles = data.articles;
        })
        .catch(error => {
          // Handle any errors that occur during the request
          console.error(error);
        });
    }
  },
  mounted() {
    document.getElementById('search-form').addEventListener('submit', this.searchArticles);
  },
  beforeUnmount() {
    document.getElementById('search-form').removeEventListener('submit', this.searchArticles);
  }
}
