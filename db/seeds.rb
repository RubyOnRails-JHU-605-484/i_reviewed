Book.destroy_all
Reviewer.destroy_all

reviewers = Reviewer.create! [
  { name: "Joe", password: "abc123" },
  { name: "Jane", password: "123abc" }
]
Book.create! [
  { name: "My way or highway", author: "Me", reviewer: reviewers.sample },
  { name: "The Rails Way", author: "The Other Guy", reviewer: reviewers.sample },
  { name: "Cracking the Coding Interview", author: "McDowell", reviewer: reviewers.sample },
  { name: "The Design of Everyday Things", author: "Norman", reviewer: reviewers.sample },
  { name: "R for Data Science", author: "Wickham", reviewer: reviewers.sample },
  { name: "Python Crash Course", author: "Matthes", reviewer: reviewers.sample },
  { name: "Clean Code", author: "Martin", reviewer: reviewers.sample },
  { name: "SQL in 10 minutes", author: "Forta", reviewer: reviewers.sample },
  { name: "Eloquent Javascript", author: "Haverbeke", reviewer: reviewers.sample },
  { name: "Eloquent Ruby", author: "Olsen", reviewer: reviewers.sample },
  { name: "Head First Ruby", author: "McGavren", reviewer: reviewers.sample }
]

mine = Book.find_by author: "Me"
mine.notes.create! [
  { title: "Fascinating", note: "This book is simply amazing!" },
  { title: "What?", note: "Wait... did I write this?" }
]

200.times do |index| 
  Book.create!({ name: "Book#{index}", author: "Author#{index}", 
                 reviewer: reviewers.sample }) 
end