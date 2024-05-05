#let exam(
  title: "",
  authors: (), 
  course: "",
  pre_name: "Name: ________________________",
  pre_id: "Bronco ID: ________________",
  semester: "",
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


  if show_cover {
    // show cover page for exam
    set page(header: context {
      let page_number = counter(page).get().first()
      if page_number > 1 [
        #text(style: "italic")[#course] // header left
        #h(1fr)
        #page_number
        #line(length: 100%, stroke: .7pt)
      ]
    })

    align(center)[
      #v(1fr)
      #block(text(size: 24pt, weight: 700, title)) // title
      #v(1fr)
      #block(text(size: 18pt, course))
      #block(text(size: 16pt, semester))
      #v(1fr)
      #text(pre_name)
      #v(10pt)
      #text(pre_id)
      #v(4fr)
      #block(text(size: 14pt, date))

      #pagebreak() // page break for cover page
    ]

    // main body 
    body
  } else {
    // show only header information for quiz
    set page(
      margin: (top: 5em), // page top margin
      header: [
        #set text(10pt)
        #text(style: "italic")[#course] // header left
        #h(1fr)
        #text(style: "italic")[#date] // header right
      ],
      header-ascent: 10%
    )

    align(center)[
      #line(length: 100%, stroke: .7pt)
      #block(above:15pt, below: 15pt, text(weight: 500, 16pt, title))
      #block(text(semester))
      #text(pre_name)
      #h(20pt)
      #text(pre_id)
      #line(length: 100%, stroke: 1.3pt)
      #v(20pt)
    ]

    // main body 
    body
  }
}


// exam instruction
#let instruction(body) = {
  block(
    width: 100%,
    stroke: .7pt,
    radius: 3pt,
    inset: 10pt,
    body
  )
  v(30pt)
}

// problem numbering
#let prob_counter = counter("prob")

// problem description
#let prob(body, points: none) = {
  [#prob_counter.step() #prob_counter.display(). ] // number

  // point or points
  if points != none {
    [(pts: #points)]
  }

  body

  v(1em)
}

// multiple answer problem
#let prob_choices(..items) = {
  let choice_counter = counter("options")
  let options = for item in items.pos() {
    choice_counter.step() 
    choice_counter.display("A. ")
    (item)
    h(1fr)
  }
  
  pad(left: 12pt,
    stack(dir: ltr, spacing: 100pt, options)
  )
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
