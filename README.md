# Teller Quickstart

This repo contains Teller's Quickstart example application. It's a simple Ruby application that demonstrates how to enroll a user using Teller Connect, obtain an access token, make an initial API request using your client certificate, and display the response.

## Requirements

- Ruby 2.7 >
- Bundler

To start the application copy your Teller client certificate and private key into the top-level`certificates` folder and run the following commands.

```bash
bundle install
env APP_ID=app_XXXXXXXXXXX bundle exec rackup
```

Your application should be running on `localhost:9292`