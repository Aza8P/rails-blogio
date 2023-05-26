import "@hotwired/turbo-rails"
import 'jquery'
import 'bootstrap'
import 'bootstrap-datepicker'
import Vue from 'vue'
import Search from "./components/search"

// document.addEventListener('turbolinks:load', () => {
//   const search = new Vue({
//     el: '#articles',
//     data: {
//       query: '',
//       articles: []
//     },
//     components: { Search },
//   });
// });


document.addEventListener('DOMContentLoaded', () => {
  const search = new Vue(Search);
  search.$mount('#search-form');
});