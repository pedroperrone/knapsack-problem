[![Build Status](https://semaphoreci.com/api/v1/pedroperrone/knapsack-problem/branches/master/badge.svg)](https://semaphoreci.com/pedroperrone/knapsack-problem)
[![Maintainability](https://api.codeclimate.com/v1/badges/0bfdc3e212c1f2147a32/maintainability)](https://codeclimate.com/github/pedroperrone/knapsack-problem/maintainability)

## Dependencies
* Ruby 2.5.1

## The Knapsack Problem
The Knapsack Problem is a famous problem in the computer science, being the Binary Knapsack Problem the most famous one and the one studied in this repository. An instance of this problems receives a weight capacity for a knapsack and a list of items. Each one of these items has a value and a weight. The questios aproached by the problem is `what is the greatest value that the knapsack can carrie?`

## The solution
The solution implemented here makes use of dynamic programming. This méthod is based on the ideia of optimal substructure, wich means the following: if the problem `A` is contained in `B`, then the best solution for the problem `A` is contained in the best solution for the problem `B`.
This implementation uses a matrix with `number of items` rows and `knapsack_capacity + 1` columns to save the solutions for the subproblems.

## How to run

Clone this repository and go to the new folder. Having the correct version of ruby installed, run `bundle install`.

### Open the ruby console with the project

Run `rake console:open` to open the console with all the lib files included.

## Tests

To run unit test, use the command `bundle exec rspec`.
