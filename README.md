# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Technology Stacks:
------------------
  * Ruby - ruby 2.5.1
  * Ruby on Rails - 5.2.0
  * MySQL
  * HTML5
  * CSS3
  * Twitter Bootstrape
  * jQuery

How to run the test suite
---------------------------
  $ rake spec

Deployment instructions
-------------------------
  $ cap production deploy

User Stories
------------
*Guest User:
1. As a guest user, I should be able to login to the msurlshorten page. - [Done]
2. As a guest user, I should be able to add a valid URL in a text area. - [Done]
3. As a guest user, I should see a validation error message if the entered URL is incorrect. - [Done]
4. As a guest user, when I enter the the URL system should return a shorten uniq URL. - [Done]
5. As a user, I should see a copy URL button and when I click the URL should be copied to my clipboard. - [In Progress]

*Generic:
1. Every public URL should have a expire date. - [Done]
2. Create an API end point, where shorten_url is passed as a parameter and get the detail about the URL.

*Types of validation:
1. URL should be valid.  - [Done]
2. Shorten URL should be unique.  - [Done]
3. Shorten URL should only contain Alphabet OR number OR both.  - [Done]

*Logged In User:
1. As a logged in user, I should be able to shorten valid URL. - [Not Started]
2. As a logged in user, I should see a validation message if the URL is incorrect. - [Not Started]
3. As a logged in user, I should see list of url which I have shorten with details like - no of clicks each URL. - [Not Started]
4. As a logged in user, I should set my URL preference like when URL will get expire, Public View.  - [Not Started]
5. As a logged in user, I should be able to customize my URL - [Not Started]

Improvement:
------------
 * User dashboard should have a stats section with graph showing which URL hit the most. And should the result of each URL.
 * When a user enter a URL, based on URL we can come up with Algorithm about user's interests.
 * We can implement Admin interface to set the preference like - URL expire_date.
 * We should have a invitation module, where a user can invite other user to join the system.
 * User should be able to categories URL. 
 * Can give option for user to sign in / sign up using Facebook / Google.
 
Development improvement:
------------------------
 * Internal after login pages should be build using JavaScript framework - Angular / ReachJS / Vue.js
 * Can use rSpec for End to End / feature testing as well.
 * Write a cron job to delete / Archive all the expired URL. 
