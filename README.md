# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

to use stimulus
  ・installing stimulus
  command) rails stimulus:install
  result) mkdir javascript/controllers
          controllers > application.js, hello_controller.js, index.js
  ・installing controller
  command) rails g stimulus {ControllerName}
  resulut) create app/javascript/controllers/chartkick_controller.js 
           ({ControllerName => chartkick})

to use importmap
command) ex) bin/importmap pin chartkick
result) write pin "chartkick", to: "https://ga.jspm.io/npm:chartkick@4.2.0/dist/chartkick.js" in importmap.rb

to use bootstrap
css) write gem "bootstrap" in gemfile → bundle install
     write @import "bootstrap" in application.scss(change application.css)
js) import importmap
    command) bin/importmap pin bootstrap
    write import "bootstrap" in application.js
    change pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2.11.6/dist/esm/index.js" in importmap.rb