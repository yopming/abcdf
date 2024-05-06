#import "@local/abcdf:0.0.1": *

#show: exam.with(
  title: "Test",
  authors: (
    "Tieming",
  ),
  course: "CSC120 Introduction to Programming Methodology",
  date: "05/06/2024",
  semester: "Spring 2024",
  show_cover: true,
  show_solution: false
)

#instruction[
  - Make sure your exam is complete. There should be #context counter(page).final().first() pages including this cover sheet.
  - This exam will be close-book and close to electronic devices, but you can use the prepared one-page note (double-sided).
  - DO NOT copy someone else's solution, identical answers will be investigated.
  - You have 1 hour 50 minutes to work on the final exam.
  - Good luck!
]

#category[Multiple Choices Problems] 

#prob(points:1)[
  Which of the following process is used by the CPU to execute instructions in a program?
  #prob_choices(
    vertical: false, 
    "Decode-Fetch-Execute",
    "Fetch-Decode-Execute",
    "Decode-Execute-Fetch",
    "Fetch-Execute_Decode",
    "Fetch-Execute_Decode",
    "Fetch-Execute_Decode",
  )
]


#prob[
  Which of the following is the coding scheme contains a set of 128 or 256 numeric codes that used to represent characters in the computer's memory.
  #prob_choices("Unicode", "ASCII", "FORTRAN", "Two' Complement")
]

#prob(points:2)[
  test2 
  #solution[
    'test'
  ]
]
 
#prob(points:1)[
  test2
  #prob_choices("Test", "Second", "Third", "Fourth") 
]


#prob(points:2)[
  Convert the binary number 01101101 to decimal. Show your work to get full score.
  #prob_blank(space: 5em)
]

#prob(points:2)[
  Convert the binary number 01101101 to decimal. Show your work to get full score.
  #prob_blank(space: 20pt)
]
