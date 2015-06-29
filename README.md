# Ruby on Rails App Store Top Charts

This project is an 'approximation' of the Apple App Store created with Ruby on Rails. 
The data for the database was pulled on May 8, 2015.

A live demo of this project can be viewed at http://topcharts.kylesbox.com/

# Features
- Reads raw data from a CSV file and stores it in a PostgreSQL database.
- Displays a view for the Top Paid Apps for corresponding data.
- Displays a view for the Top Free Apps for corresponding data.
- Displays a view for the Top Grossing Apps for corresponding data.
- Uses pagination to limit the lists to 50 apps on each page.
- Pagination infinite-scroll for each chart.

# To Do
- Periodically pull app store data.
- Monitor change in app rankings.
- Display if app has In App Purchases.
- Display a view for "New and Rising" Apps.
