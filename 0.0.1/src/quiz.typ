// global variables
#let _g_show_solution = state("show_solution", false)

#let exam(
  title: "",
  authors: (), 
  course: "",
  pre_name: "Name: ________________________",
  pre_id: "Bronco ID: ________________",
  semester: "",
  date: "",
  show_cover: false,
  show_solution: false,
  body
) = {
  // set the document's basic properties
  set document(title: title, author: authors)
  set par(justify: false)
  set page(paper: "us-letter")
  set text(11pt, font: "Linux Libertine", lang: "en") // font size
  show raw: text.with(font: "Iosevka") // code font family

  // update global properties
  _g_show_solution.update(show_solution)


  if show_cover {
    // show cover page for exam
    set page(header: context {
      let page_number = counter(page).get().first()
      if page_number > 1 [
        #text(style: "italic")[#course] // header left
        #h(1fr)
        #counter(page).display("1/1", both: true)
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
  v(20pt)
}

// problem separation such as sections, or different types
#let category(body) = {
  align(center)[
    #v(20pt)
    #line(length: 100%, stroke: .5pt)
    #block(above: 4pt, below: 7pt, text(weight: 700, smallcaps(body)))
    #line(length: 100%, stroke: .5pt)
  ]
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
// solution by default is 0 (no solution), and the index of choice starts with 1
#let prob_choices(vertical: true, solution: "0", ..items) = {
  let choice_counter = counter("choices")
  choice_counter.update(0) // reset counter for each problem

  /* manually build the choices stack:
     - if vertical, 10pt + 1fr separation
     - otherwise, new line break 
   */
  let _index = 1 // choice index 
  let choices = for item in items.pos() {
    choice_counter.step() 
    item = choice_counter.display("A. ") + item

    // highlight the correct answer
    let choice_indices = solution.split(",")
    let _index_str = str(_index)
    if choice_indices.contains(_index_str) {
      highlight(fill: red, extent: 2pt)[#text(white)[#item]]
    } else {
      item
    }

    // layout of choices
    if not vertical {
      linebreak()
    } else {
      h(10pt)
      h(1fr)
    }

    _index += 1
  }
  
  pad(left: 12pt, stack(choices))
}

// short answer problem
#let prob_short(body) = {
}

// blank space problem, space
#let prob_blank(space: 1em) = {
  align(center)[#v(space)]
}

// problem solution
#let solution(body) = {
  locate(loc => {
    let show_solution = _g_show_solution.final(loc)

    if show_solution {
      [
        #pad(left: 12pt,
          rect(width: 100%, stroke: red)[
            #set text(red)
            #body
          ]
        )
      ]
    } else {
      hide[#body]
    }
  })
}
