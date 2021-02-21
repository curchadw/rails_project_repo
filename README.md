# Flight Scheduler App

# Rails Version
This project is using the Ruby on Rails version 5.


# Description
Flight Scheduler App is a type of content management application where a admin or staff memeber is able to assign a pilot to a particular flight created in the app. 

# Installation
- You will fork from my repo and clone on to your system.
- Once you clone and open it on your system, you will do a "bundle install" in your terminal terminal to install the required dependicies or gems for it to run properly


# Usage
For now you will only be able to access from a local server. You will type start a rails server in your terminal, and type in localhost:3030 in your browser. You will be able to create a user accounts as an admin and non admin, and log in. The application will provide html based forms for you to fill out and save information on flights, destinations, and pilots. You will be able to also use the pilots and destination within your flight creation and view. If user is an admin, they will be delete and edit data while non admin users will only be able to read, and create data.

# Database Migration
You will need to be sure to run `rake db:migrate` to run the database migration. You will probably need to run the enviornment migration....but it will let you know if needed. After you run the migration run `rake db:seed` to seed the data I left in the seed file so you will not have to worry about creating to many destinations and pilots. You will be able to add some yourself too. 

# Contributing
I am open to pull request. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

# License
Copyright 2020 Curtis Chadwell

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# flight_scheduler
