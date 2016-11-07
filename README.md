# bookapp

[![Build Status](https://travis-ci.org/LynxEyes/booksapi_wrapper-ruby.svg?branch=master)](https://travis-ci.org/LynxEyes/booksapi_wrapper-ruby)
[![Code Climate](https://codeclimate.com/github/LynxEyes/booksapi_wrapper-ruby/badges/gpa.svg)](https://codeclimate.com/github/LynxEyes/booksapi_wrapper-ruby)
[![CircleCI](https://circleci.com/gh/LynxEyes/booksapi_wrapper-ruby.svg?style=svg)](https://circleci.com/gh/LynxEyes/booksapi_wrapper-ruby)

## Requirements

* ruby 2.3
* bundler


## Setup

Simply run `bundle install` from the app root and you're ready to go.


## Running the tests

Just run `rspec` from the app root folder


## Running the app

The app comes with an executable at `bin/bookapp`.  
Run `bookapp -h` to see available options


## Notes about implementation

There are 2 main notes about implementation: Architecture and Dependency Injection.

On the architecture side, I've tried to implement uncle Bob's Clean Architecture - AKA Hexagonal Architecture. I say "I've tried" because, although perfectly possible using Ruby, it gets kind of weird to read the code (due to the lack of static typing).
To overcome the downside of not having static typing as a code readability tool, I've many times injected concrete implementations on the constructors of certain objects, as if they were a guideline for the future maintainer on what is expected.


On the Dependency Injection side... This is a term that I've seen many "Rails developers" scared of. It is actually just a "big word" for a very simple concept that I find very convenient, specially when it comes to writing testable code. It is far easier to inject a mock than it is to know the ins-and-outs of RSpec (or whatever testing tool) on how to "inject" mocks.
So, whenever I can, I prefer to use Dependency Injection over framework-dependent injection.


## Notes about the features

The google books API has many filters that you can apply when searching by books such as:

* filter by title
* filter by author
* filter by publisher
* filter by subject
* filter by isbn
* filter by lccn
* filter by oclc

I've chosen to only implement the *filter by author* filter.
Implementing the remainder of the filters would just be "copy paste" code from the first filter. (in fact, come to think of it, they could all be implemented on one sweep...)

