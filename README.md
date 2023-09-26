Whether Sweater API
Whether Sweater is a Ruby on Rails application that serves as an API to provide weather-related information and user registration functionalities. The API uses external services like MapQuest's Geocoding and Weather APIs to retrieve weather data for a specific location and plan road trips. This README will guide you through the learning goals, setup process, obtaining API keys, and using the application's endpoints.

Learning Goals
The Whether Sweater API project was designed to test my knowledge of API consumption and creation with the following learning goals:

-Expose an API that aggregates data from multiple external APIs
-Expose an API that requires an authentication token
-Expose an API for CRUD functionality
-Determine completion criteria based on the needs of other developers
-Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

Follow these steps to clone and set up the Whether Sweater API on your local development environment:

Clone the repository from GitHub:

bash
Copy code
git clone https://github.com/jpnelson85/whether_sweater_apis.git
Navigate to the project directory:

bash
Copy code
cd whether_sweater_apis
Install the required gems:

bash
Copy code
bundle install
Set up the database and run migrations:

bash
Copy code
rails db:create
rails db:migrate
(Optional) Seed the database with test data:

bash
Copy code
rails s
The application should now be running locally at http://localhost:3000.

Obtaining API Keys
To use the Whether Sweater API, you'll need API key.  This will be auto-generated when you create an account.
The Whether Sweater API provides the following endpoints:

Retrieve Weather for a City

Endpoint: /api/v1/forecast?location=<city>,<state>
HTTP Method: GET
Usage: Retrieve current and forecasted weather data for a specific city and state. This endpoint will use the MapQuest Geocoding API and a weather data API to provide the weather information.
User Registration

Response
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "last_updated": "2023-04-07 16:30",
        "temperature": 55.0,
        etc
      },
      "daily_weather": [
        {
          "date": "2023-04-07",
          "sunrise": "07:13 AM",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00",
          "temperature": 54.5,
          etc
        },
        {...} etc
      ]
    }
  }
}

Endpoint: /api/v1/users
HTTP Method: POST
Usage: Register a new user by providing an email, password, and password confirmation in a JSON payload. The API will generate a unique API key for the user.
User Login

Request
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}

Response
status: 201
body:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
    }
  }
}

Endpoint: /api/v0/sessions
HTTP Method: POST
Usage: Authenticate a user by providing their email and password in a JSON payload. If the credentials are valid, the API will return the user's API key.
Plan a Road Trip

Request
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}

Response
status: 200
body:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
    }
  }
}

Endpoint: /api/v1/road_trip
HTTP Method: POST
Usage: Plan a road trip by specifying the origin, destination, and your API key in a JSON payload. The API will use MapQuest's Directions API to determine the travel time and provide weather conditions at the destination upon arrival.
Please ensure you provide the required parameters, headers, and credentials as specified in the project requirements. Use a tool like Postman to test the endpoints with various scenarios to verify the correct functionality.

Request
POST /api/v0/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Cincinatti,OH",
  "destination": "Chicago,IL",
  "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
}

Response
{
    "data": {
        "id": "null",
        "type": "road_trip",
        "attributes": {
            "start_city": "Cincinatti, OH",
            "end_city": "Chicago, IL",
            "travel_time": "04:40:45",
            "weather_at_eta": {
                "datetime": "2023-04-07 23:00",
                "temperature": 44.2,
                "condition": "Cloudy with a chance of meatballs"
            }
        }
    }
}

Feel free to explore and extend the Whether Sweater API as needed for your specific use case.
