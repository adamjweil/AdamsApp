  # AdamsApp - Web Scraping Made Easy!

# Summary
This application is meant to provide an easy way to scrape websites for the content located within it's h1, h2, h3, h4 and p tags, as well as for any links and photos. You can easily access your search history by navigating to the 'Prior Searches' page.  For best results, please enter the full URL of the webpage you are trying to scrape. As an example, if you wanted to scrape facebook.com, you would need to enter https://www.facebook.com. After typing in and submitting the URL you are trying to scrape, the content located within the tags mentioned above will be displayed to you in the most organized way possible.

# Tech Details
This web application was built in Ruby, compiled using a Rails framework, and has a postgresql database. If you have any questions, please shoot me an email @ adamjweil@gmail.com.  

I hope you enjoy the application!

# Heroku Details
  *This web application can be found using the URL pasted below:*
    https://murmuring-anchorage-57613.herokuapp.com/

  **If you would prefer to clone this repository down to your machine and run locally, please follow the instructions below**
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

# Screenshots
  - Home Page
  <img width="1193" alt="search_page" src="https://user-images.githubusercontent.com/25589910/37607795-60a65b46-2b6f-11e8-869c-0cb7f77b2cb4.png">

  - Search Results (Top of Page)
  <img width="1331" alt="results_pags" src="https://user-images.githubusercontent.com/25589910/37607846-72dbdd2c-2b6f-11e8-8416-e5c16d0ad97f.png">

  - Search Results (Links / Photos)
  <img width="1331" alt="results_pags" src="https://user-images.githubusercontent.com/25589910/37607867-7ef82ed0-2b6f-11e8-99cd-9e1433b398ab.png">

  - Scrape History
  <img width="1187" alt="prev_searches" src="https://user-images.githubusercontent.com/25589910/37607886-88395fbe-2b6f-11e8-8c92-75f72719afd5.png">
