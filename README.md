Lex
===

### Tech Stack
#### Front end
  - [CoffeeScript](http://coffeescript.org/)
  - [Haml](http://haml.info/)
  - [SASS](http://sass-lang.com/)
  - [Bootstrap](http://getbootstrap.com/)
  - [jQuery](http://jquery.com/)
  - [Backbone.js](http://backbonejs.org/)
  - [Underscore.js](http://underscorejs.org/)

#### Back end
  - [Ruby](http://www.ruby-lang.org/)
  - [Ruby on Rails](http://rubyonrails.org/)
  - [PostgreSQL](http://www.postgresql.org/)

### Setup
First you must install all the dependencies listed below:

  - [Git](http://git-scm.com/downloads)
  - [PostgreSQL (native client)](http://www.postgresql.org/download/) or 
  [Postgres.app (only for Mac OS)](http://postgresapp.com/)
  - [RVM](http://rvm.io/)

When all the dependencies have been installed, open a terminal and get the
code:

    git clone https://github.com/hph/Lex.git && cd Lex

Install Ruby 2.1.2 with RVM:

    rvm install ruby-2.1.2 && rvm use ruby-2.1.2

Set Ruby 2.1.2 as the default Ruby for this application:

    echo "rvm use 2.1.2" > .rvmrc

Install Ruby gems (libraries):

    bin/bundle

Setup your PostgreSQL user:

    sudo -u postgres createuser -s `whoami`
    psql postgres -tAc "ALTER USER `whoami` WITH PASSWORD '`whoami`'"

Add database configuration for the development environment:

    echo "development:
      adapter: postgresql
      database: lex
      username: `whoami`
      password: `whoami`
      host: localhost" > config/database.yml

Now create the database with the application schema and seed it:

    bin/rake db:create db:schema:load db:seed

You're done! See [Usage](https://github.com/hph/Lex#usage) for instructions on
how to run the application server and more.

### Usage
#### Application server
To run the application server, run the following command:

    bin/rails s

The application will be available at [localhost:3000](http://localhost:3000).

#### Rails console
The Rails console allows you to run commands through Pry with the Rails
environment:

    bin/rails c

You can also run the console in sandbox mode to rollback any database changes
automatically on exit:

    bin/rails c -s

### Maintenance
#### Updating dependencies
You should run Bundler every time you see that *Gemfile.lock* has been modified
after pulling the latest commits:

    bin/bundle

#### Migrations
You should also run database migrations after pulling the latest commits if
there are new migrations in *db/migrate* or *db/schema.rb* is updated when you
pull:

    bin/rake db:migrate

Otherwise you may just load the database schema directly:

    bin/rake db:schema:load

#### Seeding
If the database is in a pristine condition and you need test data, you can seed
the database:

    bin/rake db:seed
