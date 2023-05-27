# Blogio

*Blogio is a platform that allows users to create and share articles on science topics. It provides a user-friendly interface for managing articles, including features such as user authentication, article creation, editing, and publishing.*


## Table of Contents
1. Getting started
2. Features
3. Technologies Used
4. Usage
6. Challenges and Solutions

### Getting Started
- Ruby (version 3.1.2)
- Ruby on Rails (version 7.0.4)
- PostgreSQL (version 14.4)

### Features
- User Authentication: Secure user authentication using Devise gem. Users can sign up, log in, and log out to access protected routes.
- Article Management: Create, edit, and delete articles. Only authenticated users can perform these actions, and only authors can edit and delete the articles.
- Article Listing: Display a paginated list of articles on the index page. Articles are ordered by creation date, with the most recent articles displayed first.
- Article Search & Real-time results: Search for articles using the search function. The search is performed based on article titles. Search results are displayed dynamically without page reload.
- Article Read Count: Each time an article is viewed, its reading count is incremented. The author of the article is displayed on the article show page.
- Authorization: Restrict access to certain actions based on user authentication. Only authenticated users can create, edit, and delete articles.
- User-specific Articles: Access a list of articles created by the currently logged-in user. The "My Articles" page displays articles created by the logged-in user.
- Publish Date Picker: Utilized datepicker.js library to select and set the publish date of an article in create and edit actions. 

### Technologies Used
- Ruby on Rails
- HTML
- SCSS
- JavaScript
- Bootstrap
- jQuery
- Vue.js
- Devise
- PostgreSQL
- Faker
- Datepicker
- Git
- GitHub

### Challenges and Solutions
During the development process, one of the challenges encountered was implementing the search functionality. The requirement was to dynamically search articles based on the user's input and display the matching results without refreshing the page.

The main difficulty was integrating the front-end Vue.js framework with the back-end Rails application to achieve this dynamic search feature. Coordinating the data retrieval from the server, updating the DOM with the search results, and handling user input required careful coordination between the JavaScript, Rails controller, and HTML templates.

To overcome this challenge, the following steps were taken:

- A Vue.js component was created to handle the search functionality. This component was integrated into the HTML template using the appropriate Vue directives and event listeners.
- The search form was configured to submit the search query to the Rails backend using AJAX.
- In the Rails controller, an index action was modified to handle the search query and return the relevant articles.
- The response from the Rails controller was formatted as JSON and sent back to the front-end.
- The Vue.js component received the JSON response and updated the DOM with the search results, dynamically rendering the articles on the page.
- By carefully coordinating the front-end and back-end components, the search functionality was successfully implemented, allowing users to search for articles and see the results without having to reload the entire page.

