# me-book

## Live: [me-book](https://me-book.herokuapp.com)


## Fully-featured social media app built with Ruby on Rails.

* Social media site for content sharing: Users can sign up securely, 
  create a profile, add friends, post, comment, and like other content.
* Uses Devise for user registration.
* Implements photo uploading with active_storage.
* Deployed on Heroku


## Getting started

* System dependencies

```
  Ruby version: 2.5.1
  Rails version: 5.2.1
  Bundler version: 1.16.1
```

To get started with the app, clone the repo and then install the needed gems:

```
 > bundle install --without production
```

Next, migrate the database:

```
 > rails db:migrate
```

Finally run the app in a local server:

```
> rails server
```

Open your browser at `localhost:3000`.
