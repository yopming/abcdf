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

#prob(points: 5)[
  test
]

#prob(points:111)[
  test2  
  #solution[
    'test' 
  ]
]
