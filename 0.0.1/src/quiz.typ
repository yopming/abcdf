#let exam(
  title: "",
  authors: (), 
  course: "",
  pre_name: "Name: ________________________",
  pre_id: "Bronco ID: ________________",
  date: "",
  show_cover: false,
  body
) = {
  // set the document's basic properties
  set document(title: title, author: authors)
  set par(justify: true)
  set page(paper: "us-letter")
  set text(11pt, font: "Linux Libertine", lang: "en") // font size
  show raw: text.with(font: "Iosevka") // code font family

  set page(
    margin: (top: 5em), // page top margin
    header: [
      #set text(10pt)
      #course
      #h(1fr)
      #date
    ],
    header-ascent: 10%
  )

  if show_cover {
    // show cover page for exam
  } else {
    // show only header information for  quiz
    align(center)[
      #line(length: 100%, stroke: .7pt)
      #block(above:5pt, below: 15pt, text(weight: 500, 16pt, title))
      #text(pre_name)
      #h(20pt)
      #text(pre_id)
      #line(length: 100%, stroke: 1.3pt)
      #v(20pt)
    ]
  }

  // main body  
  body
}

// problem numbering
#let prob_counter = counter("prob")

// problem description
#let prob(body, points: none) = {
  [#prob_counter.step() #prob_counter.display(). ] // number

  // point or points
  if points != none {
    [(points: #points)]
  }

  body
}

// multiple choice problem
#let prob_single(body) = {
}

// multiple answer problem
#let prob_multiple(body) = {
}

// short answer problem
#let prob_short(body) = {
}

// blank space problem, space
#let prob_blank(body) = {
}

// problem solution
#let solution(body) = {
  [
    #pad(left: 12pt,
      rect(width: 100%, stroke: red)[
        #set text(red)
        #body
      ]
    )

  ]
}
