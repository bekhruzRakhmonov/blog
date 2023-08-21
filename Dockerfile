# Use the official Ruby image as the base
FROM ruby:3.2.2

# Set the working directory within the container
WORKDIR /app

# Install dependencies
# RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client

# Copy Gemfile and Gemfile.lock and install gems
COPY Gemfile Gemfile.lock /app/
RUN bundle install

# Copy the rest of the application
COPY . /app/

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails application server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
