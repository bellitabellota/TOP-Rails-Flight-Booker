# TOP Project: Flight Booker

![image](https://github.com/user-attachments/assets/20f14b74-47dc-4e3c-9b55-ba1964d0c2d5)

## Screenshots
Flights#index page
![image](https://github.com/user-attachments/assets/dd3e5f8d-ef35-4bf6-8cc5-d52cfa9747c5)

Bookings#new page
![image](https://github.com/user-attachments/assets/0a4150e0-9651-418c-9280-0153b10313d9)

Bookings#show page
![image](https://github.com/user-attachments/assets/4b2ce129-de01-494b-b17f-3323e53f7e5a)

Confirmation email
![image](https://github.com/user-attachments/assets/25290c88-c290-4405-b67e-d43e8050c17b)


To open this project locally on your computer, after cloning the project from git and entering the repository folder the following commands need to be run:

      rails db:migrate
      
      rails db:seed


## Introduction
In this project, you’ll get a chance to tackle some more advanced forms. This is the kind of thing you’ll have to work with when handling user orders for anything more complicated than an e-book. In this case, we’ll build the first three steps of a typical checkout process for booking a one-way flight:

A typical airline booking flow:

1. Enter desired dates / airports and click “Search”
2. Choose from among a list of available flights
3. Enter passenger information for all passengers
4. Enter billing information


Step 4 would be done via integration of something like the [Paypal API](http://coding.smashingmagazine.com/2011/09/05/getting-started-with-the-paypal-api/), via [the paypal-express gem](https://github.com/nov/paypal-express),[ the paypal-sdk-merchant SDK](https://www.tommyblue.it/2013/07/02/paypal-express-checkout-with-ruby-on-rails-and-paypal-sdk-merchant/), or [Stripe](https://docs.stripe.com/checkout/quickstart).

## TOP Assignment instructions
We’ll be creating a one-way flight booker. You’ll get lots of practice populating and building dropdown menus, radio buttons, and nested submissions. Let the fun begin!

This project will require you to seed your database, so use your `db/seeds.rb` file to write the code necessary to populate Airports and Flights. One trick for toy apps like this (don’t do it for production!) is to use the `db:seed:replant` task for simultaneously clearing the database and running your seeds file. That way, when you create a new model or change how you want your sample data set up, you can just update the `seeds.rb` file and run `$ rake db:seed:replant` to have a clean slate of data.

### Setup
1. Think through the data architecture required to bring this to life.
2. Create a new Rails app, e.g. odin-flight-booker, and a new Git repo
3. Modify the README to explain what you’re doing and link back to the project here.
   
### Screen 1: search
For the first screen, you will be creating 4 dropdown menus that will allow users to search for available flights - departure airport, arrival airport, date, and number of passengers. This requires relatively vanilla forms that happen to be prepopulated with collections of data. Working with dates will cover a bit of new ground for you.

1. Create an Airport model (which basically just needs an airport code like “SFO” or “NYC”) and use the `db/seeds.rb` file to create several airports.
2. Create a Flight model (with the departure and arrival airport `id`s, start datetime and flight duration).
3. Set up associations so you can ask `Flight.first.departure_airport`, `Flight.first.arrival_airport` and get back Airport objects. Same for `Airport.first.departing_flights` and` Airport.first.arriving_flights`, which should return a list of Flight objects.
4. Seed your database with flights.
5. You will search and view results in the same page. Set up your FlightsController and routes to make the Index page (`/flights`) the root route.
6. Create your search form on the `/flights` index page to submit using a GET (not POST) request back to the same URL.
7. Add the four dropdown menus – a list of departure airports, arrival airports, number of passengers (1-4), and a date dropdown for the flight date. The date dropdown should only include dates that have existing flights. Don’t worry about restricting the contents of the airport dropdowns – you’d normally use JavaScript – so just allow the user to select any airport. See this [Stack Overflow post on formatting dates in dropdown lists](http://stackoverflow.com/questions/15720940/rails-format-date-in-drop-down-list-in-view), this short [Stack Overflow post on selecting months/years](http://stackoverflow.com/questions/13001904/rails-drop-down-select-month-year) and the Rails [DateHelper API Docs](http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html) for some help with creating Date selects.
   
### Screen 2: pick a flight
Once search results are returned, the user just needs to choose from among the available flights.

1. Once the user has submitted the form, your controller should detect the additional query parameters (e.g. from `/flights?departure_code=SFO&arrival_code=NYC&date=20131215&num_tickets=2`) and should pull the flights which match that criteria from your database through smart querying model methods.
2. Send those flights back to your `app/views/flights/index.html.erb` view. Make it so that the view will display the results below (if present).
3. Don’t get rid of the search dropdowns – keep the search form active at the top so the user can try running a new search.
The search results will need to be in their own form – this time for selecting which of the flights the user would like to choose. Each returned flight should render with a radio button next to it. The user will select which flight to submit and move onto the next step. 4. The form should submit to the `#new` action of the BookingsController you’re about to create using another GET method. You’ll need to include a hidden field that contains the number of passengers.

### Screen 3: passenger information
Once the user has submitted their chosen flight, it’s time to take their booking information. You’ll need a form to submit the Booking and also create a Passenger object for each passenger who needs a ticket. Don’t worry about creating a separate “Ticket” object, we’ll assume the airline will issue those once the booking is verified.

1. Create and migrate the Booking model.
2. Create and migrate the Passenger model (just keep the information simple – name and email only).
3. Set up associations between Bookings, Passengers, and Flights.
4. Create a BookingsController and appropriate routes.
5. Set up your `#new` action, which should have received the flight ID and passenger number parameters, and use it to help render a form for a new booking which displays the currently chosen date, airports, flight ID and a set of fields to enter personal information for each passenger. You’ll want to create a new blank Passenger object in your controller for each passenger, and then use `#fields_for` in the view to set up the sub-forms.
6. Try submitting the form and check out the parameters in your server.
7. You’ll need your `#create` action to create a new Booking (linking it to the appropriate Flight) but it will also need to accept the nested attributes for each of the Passenger objects and create a new Passenger from them. Be mindful of allowing the nested parameters as well.
8. Go to the Booking model and implement the `#accepts_nested_attributes_for` method. See the [Rails API](http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html) for examples and this [Stack Overflow post on nested attributes and mass assignment](http://stackoverflow.com/questions/18540679/rails-4-accepts-nested-attributes-for-and-mass-assignment) for another.
9. Once your form is successfully submitted, render the booking’s `#show` page which displays the booking information (flight and passenger information).
10. Make sure your ticketing flow is working properly. Good work!

## TOP Assignment instructions for adding/removing additional passengers via Stimulus

1. Add a controller that allows the user to add another passenger by clicking on an “Add passenger” button, which adds another set of fields to enter the passenger details (hint: have a look at the [`<template>` tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/template)).
2. Allow to remove existing passengers by clicking a “Remove” button, which removes the one set of passenger fields (make sure submissions to the server still works as expected)
3. Prevent removing the last set of passenger details.

## TOP Assignment instructions for Sending Confirmation Emails

You’ll be dusting off your Flight Booker project and having it send out a “You have booked your ticket” confirmation email to all Passengers when they are created as part of the booking process. Make sure to send out one email to each Passenger in the Booking, not just one for the whole Booking. (Alternatively, you can use one of your other projects, as long as it has users registering.)

1. Locate and load up the project file.
2. Do some pushups and jumping jacks. You’ve been spending a bit too much time at the computer lately.
3. Generate your new mailer with `$ rails generate mailer PassengerMailer`.
4. Install the [Letter Opener gem](https://github.com/ryanb/letter_opener) to open your emails in the browser instead of sending them in the development environment.
5. Follow through the steps listed in the [Rails Guide](http://guides.rubyonrails.org/action_mailer_basics.html) to create the action to send the confirmation email.
6. Build both an `.html.erb` and `.text.erb` version of your ticket confirmation email.
7. Test that the email sends by creating a new flight booking (`letter_opener` should open it in the browser for you if you’ve set it up properly).
8. Try out one other trick – call the mailer directly from the Rails Console using something like:

   ```
   > PassengerMailer.confirmation_email(Passenger.first).deliver_now!
   ```
