T&C Generator
==============

## Data
Added two files in data folder and added clauses and sections in them.
we can add multiple clauses in clauses.rb file.
we can add multiple sections in sections.rb file.

## Setup
Run `bundle`

## Generate Template
Run `ruby -r "./lib/template_generator.rb" -e "TemplateGenerator.new.create([3,4], [1])"`
We can pass multiple ids of the clauses and sections as an array. As we have passed above.
First argument will be clause ids and second one will be section ids.

## Rspec
Run `rspec`

## Time
I have completed this in 4 hours
