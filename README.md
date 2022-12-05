# RotarTrack for Aggie Rotaract

## Introduction

The purpose of this application is to create events and keep track of member attendance for Aggie Rotaract. 

## External Dependencies

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Requirements 

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in the `Gemfile` file at the root of this repository.
* PostgreSQL - 13.3 
* Nodejs - v16.9.1
* Yarn - 1.22.11

## How to Run Locally

### Clone the repository    

**Note:** There are multiple ways to do this. Instructions are given at this website: https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository#cloning-a-repository.

#### The most common way is using Git Bash
Git Bash can be downloaded from this website: https://git-scm.com/downloads.
- Navigate to the directory where you would like the repository to reside.    
- Download this code repository by using git: `git clone https://github.com/rishavkrd/RotarTrack.git`.

### Installation

Run the following command in Powershell if using Windows or the terminal using Linux/Mac:

`docker run --rm -it --volume "$(pwd):/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

Once the Docker Image has started, type `cd csce431\RotarTrack`. To make sure this is correct, type `pwd`. It should say `/csce431/RotarTrack`
  
Next, the proper dependencies are required. Type `bundle install`
  
Next, we need a package manager for our application. In this case, it is Yarn. Type `rails webpacker:install`. This will take between 5 to 15 minutes. No need to panic. You can go and do something else in the meantime while this builds in the background.

We need to create the database. We will do this by typing `rails db:create`.

Next, run the migrations for the database by typing `rails db:migrate`.
  
Seed the database values by typing `rails db:seed`.

### Tests

An RSpec test suite is available and can be ran using:

  `rspec spec`

### Execute your code

To execute your code, run `./bin/dev`

The application can be seen using a browser and navigating to http://localhost:3000/

### Environmental files/variables

We have environment variables setup for Authentication. The tutorial can be found here: https://auth0.com/docs/quickstart/webapp/rails/01-login

The tutorial above will help you understand how we encrypted the website!

## Deployment 

Please follow this link to learn how to deploy to Heroku: https://devcenter.heroku.com/articles/git

## CI/CD

CI/CD enables the proper implementation of Agile methodologies as any latest updates can be integrated to the code base present in GitHub, whenever we merge the newly developed branch into the main branch. 

This automated testing (Rubocop, RSpec, etc.) is made possible by GitHub workflow which is setup in the workflows folder. It has setup instructions and a set of tests which need to be run when a development branch is merged into the main. Heroku continuously monitors the main branch of GitHub, hence, when a new branch is merged into the main branch, Heroku will automatically test and deploy the new product on the website. Thus, instead of waiting for the complete product to be developed, we can launch the product in stages and be able to get it reviewed as the development progresses. 

## Support

Admins looking for support should first look at the application help page.
Users looking for help should seek out assistance from the customer.
