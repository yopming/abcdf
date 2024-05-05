#import "@local/abcdf:0.0.1": *

#show: exam.with(
  title: "Test",
  authors: (
    "Tieming",
  ),
  course: "CSC120 Introduction to Programming Methodology",
  date: "05/06/2024", 
  show_cover: false,
)

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
