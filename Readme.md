#URL Shortener

A simple URL shortener built in Rails. It's functionality is similar to that of
bit.ly, only the application is run locally on a user's machine.

A user enters a url and submits (e.g. http://somedomain.com/some-super-long-url),
then receives a shortened url (e.g. http://localhost:3000/short_url).

To run the app:

```bash
bundle install
rails server
```

To run the tests:

```bash
rspec
```
