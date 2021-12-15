# Artistible

## Introduction

Artistible is a prototype of a web application built as a marketplace to connect customers to services provided by artists.

Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

## Prerequisites

Make sure the following are installed on your machine:
- rails
- yarn

## Installation

Don't forget to execute: `bundle install` `yarn install` to install dependencies.

Then generate the database with `rails db:create db:migrate db:seed`.

[Cloudinary](https://cloudinary.com/) is set as the Active Storage service, therefore you will need to create a `.env` file and set your Cloudinary access token (URL) in it.

`CLOUDINARY_URL=your_access_url`
