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
)

#instruction[
  - Make sure your exam is complete. There should be #context counter(page).final().first() pages including this cover sheet.
  - This exam will be close-book and close to electronic devices, but you can use the prepared one-page note (double-sided).
  - DO NOT copy someone else's solution, identical answers will be investigated.
  - You have 1 hour 50 minutes to work on the final exam.
  - Good luck!
]


#prob[
  test 
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
