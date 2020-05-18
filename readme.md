## Bank Transactions
The intent of this project is to test drive a solution to the following problem while writing high quality code and following Object Oriented Design principles.

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

### Approach

In approaching this project I decided to use [Trello](https://trello.com/b/gryo6RQX/code-quality-week) and [Google Sheets](https://docs.google.com/spreadsheets/d/15ZCla-0Q_DpdFfHUktD8q8yGbNkmqz66WVx6Bz6MVTM/edit#gid=0) as tools to track my progress. 

<!--
This section is a WIP and will be added to as functionality of the program is implemented

 #### using the program:
 - The program is structured as a class and can be interacted with using IRB
 - Commands:
 - account.deposit(): increases account balance by certain amount.
 - account.withdraw()
 -account.print_statement()
  -->