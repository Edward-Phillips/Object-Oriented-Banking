## Bank Transactions
#### Sections 
[Intro](#Introduction) [Spec](#Specification) [Criteria](#Acceptance-criteria) [Approach](#Approach) [Documentation](#Documentation)


### Introduction
The intent of this project is to test drive a solution to the following Specification that meets the Acceptance Criteria while writing high quality code following Object Oriented Design principles.

## Specification
[(test source)](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md)
### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

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

### Tools

In approaching this project I decided to use [Trello](https://trello.com/b/gryo6RQX/code-quality-week) and [Google Sheets](https://docs.google.com/spreadsheets/d/15ZCla-0Q_DpdFfHUktD8q8yGbNkmqz66WVx6Bz6MVTM/edit#gid=0) as tools to track my progress.

In terms of technical tools used to aid my development workflow I made use of: Rspec as my testing suite; Rubocop as my linting tool and Simplecov to monitor test coverage.

### Design

The simplest implementation of this project is structured as a monolithic class that is responsible for: deposits; withdrawals; keeping track of the balance AND printing the statement - several different responsiblities for one class, which is far from ideal.

I decided that a preferable implementation would be to have 3 separate classes: one for handling the deposits/withdrawals as they happen; one for storing the information relating to each transaction and one for displaying the statement.

Class Structure:

[![Mermaid diagram of class structure](https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG4gIEFjY291bnQgPC0tIFRyYW5zYWN0aW9uXG4gIGNsYXNzIEFjY291bnQge1xuICArU3RhdGVtZW50IHRyYW5zYWN0aW9uc1xuICArTnVtZXJpYyBCYWxhbmNlXG4gICtkZXBvc2l0KE51bWVyaWMpXG4gICt3aXRoZHJhdyhOdW1lcmljKVxuICB9XG4gIGNsYXNzIFRyYW5zYWN0aW9uIHtcbiAgK0RhdGUgZGF0ZVxuICArTnVtZXJpYyBiYWxhbmNlXG4gICtOdW1lcmljIHZhbHVlXG4gIH1cbiAgQWNjb3VudCA8LS0gU3RhdGVtZW50XG4gIGNsYXNzIFN0YXRlbWVudCB7XG4gICtBcnJheSB0cmFuc2FjdGlvbl9oaXN0b3J5XG4gICtwcmludF9zdGF0ZW1lbnQoKVxuICB9IiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG4gIEFjY291bnQgPC0tIFRyYW5zYWN0aW9uXG4gIGNsYXNzIEFjY291bnQge1xuICArU3RhdGVtZW50IHRyYW5zYWN0aW9uc1xuICArTnVtZXJpYyBCYWxhbmNlXG4gICtkZXBvc2l0KE51bWVyaWMpXG4gICt3aXRoZHJhdyhOdW1lcmljKVxuICB9XG4gIGNsYXNzIFRyYW5zYWN0aW9uIHtcbiAgK0RhdGUgZGF0ZVxuICArTnVtZXJpYyBiYWxhbmNlXG4gICtOdW1lcmljIHZhbHVlXG4gIH1cbiAgQWNjb3VudCA8LS0gU3RhdGVtZW50XG4gIGNsYXNzIFN0YXRlbWVudCB7XG4gICtBcnJheSB0cmFuc2FjdGlvbl9oaXN0b3J5XG4gICtwcmludF9zdGF0ZW1lbnQoKVxuICB9IiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)


## Documentation

### in action:
[photo of program running in the terminal](https://imgur.com/aJ6r4Om)

### Installation
#### required: Git CLI; Ruby installed; A REPL such as IRB or PRY
- clone this repository to your local machine.
- run 'bundle install' in your terminal

### using the program:
 The program is structured using three classes and can be interacted with using IRB or any other REPL 
#### Commands:
 - account.deposit(): increases account balance by certain amount.
 - account.withdraw(): reduces account balance by a certain amount.
 - account.print_statement(): prints the current statement in reverse chronological order.

### edge cases
 The edge cases covered:
  - deposit/withdrawal inputs must be positive numbers with no more than 2 decimal places.
  - withdrawal amounts may not exceed the current balance of the account.

#### code coverage and style

- my code coverage is currently 100%, which I feel has been delivered through tests for desired behaviour, not testing for the sake of it.
- There are currently 4 rubocop issues, after much consideration I have decided to ignore these to favour readability over linting guidelines.