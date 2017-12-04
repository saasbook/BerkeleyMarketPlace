# Berkeley MarketPlace

## Development Status

* CodeClimate GPA:[![Maintainability](https://api.codeclimate.com/v1/badges/705edb2e84f0704b4e90/maintainability)](https://codeclimate.com/github/yezhaoqin/BerkeleyMarketPlace/maintainability)

* CodeClimate test coverage: [![Test Coverage](https://api.codeclimate.com/v1/badges/705edb2e84f0704b4e90/test_coverage)](https://codeclimate.com/github/yezhaoqin/BerkeleyMarketPlace/test_coverage)

* Travis CI build status: <a href="https://travis-ci.org/yezhaoqin/BerkeleyMarketPlace.svg?branch=master"><img src="https://travis-ci.org/yezhaoqin/BerkeleyMarketPlace.svg?branch=master" /></a>

* Figma: [Berkeley-MarketPlace-MockUp](https://www.figma.com/file/J4KNIQxTTdhG4dIPiRQFAtrc/Berkeley-MarketPlace-MockUp)

* Heroku deployment: [berkeley-marketplace](https://berkeley-marketplace.herokuapp.com)

* Pivotal Tracker: [project 2217856](https://www.pivotaltracker.com/n/projects/2117856)

* License: MIT

## Customer Business

Berkeley MarketPlace provides a central platform for efficient C2C trading exclusive to the UC Berkeley community. 
Example features include product and event posting, category subscription, keyword search and filtering, personal wishlist, etc.
This is a brand new project and currently does not have website yet. 
Customer's description video is [here](https://youtu.be/-ZS0whNV32E).
Finished project features demo video is [here](https://youtu.be/lv7JcJ339H8).

## Dev Team Members (Group 5)

* Amy Ge

* Ashton Teng

* Jack Ye

* Jiazhen Chen

* Shuyin Deng

* Yunyi Huang

Dev screencasts are in this [playlist](https://www.youtube.com/playlist?list=PLWkDTUUZ-qQF8KqvIy4l0qWTI5tY6DiVz)


## Development Configurations


### Third Party Service Accounts

* Google API account needed for authentication at `config/initializers/omniauth.rb`

* Cloundinary account needed for image upload at `config/cloudinary.yml`


### Database Seed

We have two seeding modes, `normal` mode seed the database with our selected images, good for demo.
`funny` mode seed the database with random images, good for development. To seed, run:

```bash
rake seed:normal

rake seed:funny
```

In production mode, you will need to manually delete existing database (Enforced by Heroku) before reseeding.


### Git push to master

```bash
# 0. commit on your local branch
git commit -m "xxxxxxxx"

# 1. get to master branch
git checkout master

# 2. sync the master with remote
git pull --rebase

# 3. checkout the branch you are working
git checkout my-feature-branch

# 4. rebase your branch with the latest master, most conflicts resloved here
git rebase master

# 5. go back to master
git checkout master

# 6. merge master with your branch, no-ff means no-fast-forward
git merge --no-ff my-feature-branch

# 7. push to master now is safe
git push

# 8. back to your branch to continue the work
git checkout my-feature-branch
```

Please do EVERY COMMAND after EVERY COMMIT in your branch that you want to push to master.
This means that, ONLY push to master if you think your change affects other people's work or it completes a feature.
You can sync with most recent master locally by performing the first 4 steps of this workflow.
If you reslove any conflicts, make sure to run server to make sure everything works before push.

If you sync with master locally and then want to push to your own remote branch, 
you will have to pull remote and merge in order to force the remote branch to be rebased.
Otherwise, you can directly commit to your own branch, push to remote without doing anything above.
Push to your own remote branch allows you to see Travis coverage and create a pull request for team members to review.

The commit message types are in [this link](https://github.com/commitizen/conventional-commit-types/blob/master/index.json).

### ImageMagick on C9

We use `paperclip` gem to support image upload.
This gem uses ImageMagick CLI tool to validate image and resize.
To install, run `sudo apt-get install imagemagick` 
(also make sure you have run `sudo apt-get update` for this workspace once)

Because ImageMagick is a CLI, it needs to be vendored in Heroku deoloyment. 
We currently use version `7.0.4` vendored by [this repo](https://github.com/jasonfb/heroku-buildpack-cedar14-imagemagick704).
If developer needs to configure a new Heroku app, make sure to switch to Cedar14 stack before vendoring(the default is 16)

### PostgresSQL on C9 and TravisCI

Because our app includes search functionalities that relies on PostgresSQL,
we use PostgresSQL for all stages. This requires developer to install Postgres on C9 and also configure Heroku accordingly.
C9 stops this service after certain amount of time, and developer needs to restart manually.
Details for first time configuration at [this link](https://github.com/Aerogami/guides/wiki/Cloud9-workspace-setup-with-Rails-and-Postgresql),
and add [search extensions](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04).

In C9, if the database is not started, you will see some errors related to TCP/IP connection.
To start the service, run 

```bash
sudo service postgresql start
```

For testing stage, `.travis.yml`, `config/database.yml.travis` contains Travis CI test configuration for PostgresSQL.
It overwrites the database configuration to use default postgres user and no password to conduct tests.


### Test Javscript with Rails 4

Capybara does not support AJAX, so we use `poltergeist` as the default driver, 
and `PhantomJS` as the fake browser for testing.
`PhantomJS` can be installed on C9 by comand `npm i -g phantomjs-prebuilt`.

With this change, Rails 4 runs the test server on a different thread, 
so transactions become invisible to the test server.
Therefore, for each test, please create only minimum number of objects through `factory_bot`,
and we truncate the whole database using `database_cleaner` after each single unit/cucumber test.
Notice that we have to restrict cucumber version to `2.4.0` to allow the driver to work.
Higher versions currently (AOD 11/10/2017) results in `cucumber/rb_support/rb_language.rb` not found error.


### CodeClimate Test Converage Report

CodeClimate is currently (AOD 11/10/2017) developing automatic TravisCI coverage reporting, 
but it is still in public beta, and is buggy, most of the times it does not work properly following its own [instructions](https://docs.codeclimate.com/v1.0/docs/travis-ci-test-coverage).
We use its old code reporting tool, but have to restrict the gem version to `0.12.0` for `simplecov`,
and `1.0.0` for `codeclimate-test-reporter`, 
and report coverage by:

```bash
bundle exec rspec
bundle exec cucumber
CODECLIMATE_REPO_TOKEN=212e457edd4133bddd12366c7bb0d260cb40e73a4d53f749d4ebff902ad845ee bundle exec codeclimate-test-reporter
```

After running test coverage report in C9 locally, you have to manually kill the server by:

```bash
kill -9 $(lsof -i:$PORT -t)
```

### Security Concerns with Oauth

We use exactly the implementation of `omniauth-google-oauth2` introduced in [this blog](https://richonrails.com/articles/google-authentication-in-ruby-on-rails/).
It stores the user id in a cookie after hashing. Therefore, a hacker that obtains this cookie does get permanent access to this webiste with that user's identity.
We prevent this from happening by enforcing SSL to stop replay attack. This idea is discussed in details in [this blog](https://bryanrite.com/ruby-on-rails-cookiestore-security-concerns-lifetime-pass/).

### Materialize CSS for Rails

We use Materialize CSS (Google's CSS template) for this website. 
This template is designed mainly for a component based Javascript powered website, this does not work very well with Rails.
We directly use the CSS source code, and add our basic customizations to it. However, the Javascript components are vendored through `materialize-sass` gem.
In `assets/stylesheets/components/_color.scss`, we coded the colors we use for this website:

```scss
$berkeley: (
  "base": #003262,
  "founders-rock": #3B7EA1,
  "california-gold": #FDB515,
  "web-medalist": #C4820E,
  "wellman-tile": #D9661F,
  "web-bay-fog": #DDD5C7,
  "sather-gate": #B9D3B6,
  "web-background-gray": #EEEEEE,
  "rose-garden": #EE1F60,
  "lawrence": #00B0DA,
  "ion": #CFDD45,
  "golden-gate": #ED4E33,
  "web-lap-lane": #00A598,
  "web-soybean": #859438,
  "south-hall": #6C3302,
  "web-pacific": #46535E,
  "stone-pine": #584F29,
  "web-gray": #888888,
  "white": #ffffff,
);

```
There are two ways to use these colors:

1. use it as classes

```html

<p class="berkeley-text text-sather-gate">
    This text is in sather-gate color
</p>

<div class="berkeley sather-gate">
    This div will have sather-gate background color
</div>

```

2. change colors in `assets/stylesheets/application.scss`, lots of examples already inside about how to achieve this.

Some Javascript components need to be initialized when the page is loaded. 
Because we use `turbolinks` to do lazy loading,
all initializations are in `assets/javascripts/application.js`, and are envoked on `turbolinks:load` event.


### Possible Future Refactoring

* Model item, event and job as subclasses of post

* Externalize categories and subcategories into models (requires implenentation of migration mechanisms when adding/deleting a category)

* Externalize admin from user model to allow multiple levels of access permissions


### Possible Future Features

* Notifications of wishlisted posts, news feed for different categories

* More Admin features, better Admin layout (make it similar to Dashboard layout)

* Guide new users to connect to more social accounts for easy posting to different platforms
