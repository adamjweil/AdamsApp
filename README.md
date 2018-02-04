  # AdamsApp
# Summary
<h3>
This application is meant to provide an easy way to scrape websites for the content located within it's h1, h2 and h3 tags, as well as for any links. For seamless web scraping, you need fill out a very brief registration, which includes entering an email, username and password, after which you will be immediately granted access to use the search feature. For the best results, please enter the full URL of the website you are trying to scrape. As an example, if you wanted to scrape facebook.com, you would need to enter https://www.facebook.com. After entering a URL that you want to scrape, the content located within the tags mentioned above will be displayed to you in the most organized way possible.

# Heroku Details

# Instructions For Use
To use this application, please follow the below instructions.
  1. Clone down the repo to your local storage
  2. Within the terminal navigate into the main folder of this appication, named AdamsApp
  3. Run the following commands to configure the application:
      - bundle install
      - rake db:drop
      - rake db:create
      - rake db:migrate
  4. Start your local server using the below command
      - rails s
  5. Navigate to the localhost port that is shown in the terminal to access the application.


# Tech Details
  This web application was built in Ruby, compiled using a Rails framework, and has a postgresql database. If you have any questions, please shoot me an email @ adamjweil@gmail.com.  

  I hope you enjoy the application!

# Screenshots
  - Search Page
  <img width="1193" alt="search_page" src="https://user-images.githubusercontent.com/25589910/35782044-5059a66a-09c0-11e8-9ba0-35be0a1bf8a0.png">

  - Results Page
  <img width="1331" alt="results_pags" src="https://user-images.githubusercontent.com/25589910/35782060-72782708-09c0-11e8-9e52-1ef542008806.png">

  - Previously Searched URLs Page
  <img width="1187" alt="prev_searches" src="https://user-images.githubusercontent.com/25589910/35782067-8c957244-09c0-11e8-9b00-07bd94b199a5.png">

  - Registration Page
  <img width="1004" alt="registration" src="https://user-images.githubusercontent.com/25589910/35782071-9b1c362c-09c0-11e8-94ce-064caa97bbdf.png">
