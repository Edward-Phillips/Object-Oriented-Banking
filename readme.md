## Bank Transactions
## Sections 
[Intro](#Introduction) | [Spec](#Specification) | [Criteria](#Acceptance-criteria) | [Approach](#Approach) | [Documentation](#Documentation)


## Introduction
The intent of this project is to test drive a solution to the following Specification that meets the Acceptance Criteria while writing high quality code following Object Oriented Design principles.

## Specification
[(test source)](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md)
## Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Approach

## Tools

In approaching this project I decided to use [Trello](https://trello.com/b/gryo6RQX/code-quality-week) and [Google Sheets](https://docs.google.com/spreadsheets/d/15ZCla-0Q_DpdFfHUktD8q8yGbNkmqz66WVx6Bz6MVTM/edit#gid=0) as tools to track my progress.

In terms of technical tools used to aid my development workflow I made use of: Rspec as my testing suite; Rubocop as my linting tool and Simplecov to monitor test coverage. I also used Git as my version control tool.


## Design

The simplest implementation of this project is structured as a monolithic class that is responsible for: deposits; withdrawals; keeping track of the balance AND printing the statement - several different responsiblities for one class, which is far from ideal.

I decided that a preferable implementation would be to have 3 separate classes: one for handling the deposits/withdrawals as they happen; one for storing the information relating to each transaction and one for displaying the statement.


Class Structure:

[![Mermaid diagram of class structure](https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG4gIEFjY291bnQgPC0tIFRyYW5zYWN0aW9uXG4gIGNsYXNzIEFjY291bnQge1xuICArU3RhdGVtZW50IHRyYW5zYWN0aW9uc1xuICArTnVtZXJpYyBCYWxhbmNlXG4gICtkZXBvc2l0KE51bWVyaWMpXG4gICt3aXRoZHJhdyhOdW1lcmljKVxuICB9XG4gIGNsYXNzIFRyYW5zYWN0aW9uIHtcbiAgK0RhdGUgZGF0ZVxuICArTnVtZXJpYyBiYWxhbmNlXG4gICtOdW1lcmljIHZhbHVlXG4gIH1cbiAgQWNjb3VudCA8LS0gU3RhdGVtZW50XG4gIGNsYXNzIFN0YXRlbWVudCB7XG4gICtBcnJheSB0cmFuc2FjdGlvbl9oaXN0b3J5XG4gICtwcmludF9zdGF0ZW1lbnQoKVxuICB9IiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG4gIEFjY291bnQgPC0tIFRyYW5zYWN0aW9uXG4gIGNsYXNzIEFjY291bnQge1xuICArU3RhdGVtZW50IHRyYW5zYWN0aW9uc1xuICArTnVtZXJpYyBCYWxhbmNlXG4gICtkZXBvc2l0KE51bWVyaWMpXG4gICt3aXRoZHJhdyhOdW1lcmljKVxuICB9XG4gIGNsYXNzIFRyYW5zYWN0aW9uIHtcbiAgK0RhdGUgZGF0ZVxuICArTnVtZXJpYyBiYWxhbmNlXG4gICtOdW1lcmljIHZhbHVlXG4gIH1cbiAgQWNjb3VudCA8LS0gU3RhdGVtZW50XG4gIGNsYXNzIFN0YXRlbWVudCB7XG4gICtBcnJheSB0cmFuc2FjdGlvbl9oaXN0b3J5XG4gICtwcmludF9zdGF0ZW1lbnQoKVxuICB9IiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)


## Documentation

## Git Commit messages
Where possible git messages are prefixed with one of the following:
- R: - this indicates a failing test and is followed by the functionality the test is driving.  
- G: - this indicates a passing test and is also followed by the functionality the test is driving.
- RF: - this indicates a refactor and is followed by a brief description of the effect of the refactor.

## Installation
required: Git CLI; Bundler; Ruby installed; A REPL such as IRB or PRY
- clone this repository to your local machine.
- navigate to the repo using a terminal
- run the following command in your terminal
  ```
  bundle install
  ```

## using the program:

 The program is structured using three classes and can be interacted with using IRB or any other REPL 

- if you are using IRB, type the following into your terminal
  ```
  IRB
  ```
- this will launch the IRB REPL, from which you can load the account.rb file located in the lib folder, using the command below:
  ```
  require './lib/account.rb'
  ```
- if this is successful it will return true, if it returns false, check to ensure you are running IRB from the root of the repository folder.
- once you have the file required you can create a new account instance with the following command:
  ```
  account = Account.new
  ```
- with a new account created you're good to go, you can start by making a deposit:
  ```
  account.deposit(12345)
  ```
- if you'd like to make a withdrawal you can do so with the following command:
  ```
  account.withdraw(12340)
  ```
- if you'd like to see your statement you can use the following command:
  ```
  account.print_statement
  ```
## in action:
![photo of program running in the terminal](https://i.imgur.com/F8PnGls.png)

## edge cases
 The edge cases covered:
  - deposit/withdrawal inputs must be positive numbers with no more than 2 decimal places.
  - withdrawal amounts may not exceed the current balance of the account.

## code coverage and style

- my code coverage is currently 100%, which I feel has been delivered through tests for desired behaviour, not testing for the sake of testing.
- There are currently 12 rubocop issues, after much consideration I have decided to accept these to favour readability over linting guidelines.