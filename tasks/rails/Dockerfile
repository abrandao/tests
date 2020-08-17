FROM ruby:2.7.1-slim-buster
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
                                                     build-essential \ 
                                                     ruby-dev        \
                                                     nodejs          \
                                                     nano            \
                                                     libpq-dev       \
                                                     imagemagick     \
                                                     curl            \
                                                     gnupg           \
                                                     apt-utils       \
                                                     postgresql-client

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -qq -y yarn

RUN mkdir /tasks
WORKDIR /tasks
COPY Gemfile /tasks/Gemfile
COPY Gemfile.lock /tasks/Gemfile.lock
RUN bundle install
COPY . /tasks

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]