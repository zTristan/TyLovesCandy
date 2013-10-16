# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([
  {
    name: "Wedding Wishes",
    description: "Send Tyler and Candace your love",
    type: Category::CategoryVideo
  },
  {
    name: "Tyler and Candace",
    description: "Because lets face it, they are very good looking",
    type: Category::CategoryBoth
  },
  {
    id: 
    name: "On The Dance Floor",
    description: "Who has the best moves or the most fun",
    type: Category::CategoryBoth
  },
  {
    name: "The Kissing Booth",
    description: "Show you affection for each other",
    type: Category::CategoryBoth
  },  
  {
    name: "The Wedding Party",
    description: "Bridesmaids and Groomsmen",
    type: Category::CategoryBoth
  },
  {
    name: "Selfies",
    description: "Because you know you want to...",
    type: Category::CategoryPhoto
  },
  {
    name: "Everything Else",
    description: "Decorations, cake, and all around",
    type: Category::CategoryBoth
  },
])
