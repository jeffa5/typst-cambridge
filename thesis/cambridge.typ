// Given a location at the start of a page, obtain the current
// heading. Current means:
// - The first heading on this page if present.
// - Else, the previous heading if one exists.
// - Else, return none.
#let get-current-heading(loc, level: 1) = {
  let heading-selector = heading.where(level: level, outlined: true)
  let el = query(heading-selector.after(loc), loc).at(0, default: none)
  if el != none and el.location().page() == loc.page() {
    return none
  } else {
    return query(heading-selector.before(loc), loc).at(-1, default: none)
  }
}

#let figure_caption(it) = {
  strong[#it.supplement #it.counter.display(it.numbering)#it.separator]
  it.body
}

#let front-page(title, author, college, college-shield) = {
  let lastline = "This dissertation is submitted for the degree of Doctor of Philosophy"
  [
    #align(center, image(width: 20em, "light-logo.svg"))
    #align(center + horizon, text(2.5em, title)) \
    #v(4em)
    #align(center + horizon, [#text(1.5em, author) \ #image(width: 5em, college-shield) #text(1.3em, college)])
    #align(center + bottom, text(1em, lastline))
    #v(1em)
  ]
}

#let declaration(name, date) = [
  #heading(level: 1, outlined: false, "Declaration")
  #v(2em)

  This dissertation is the result of my own work and includes nothing which is the outcome
  of work done in collaboration except as declared in the Preface and specified in the text. It
  is not substantially the same as any that I have submitted, or am concurrently submitting,
  for a degree or diploma or other qualification at the University of Cambridge or any other
  University or similar institution except as declared in the Preface and specified in the text.
  I further state that no substantial part of my dissertation has already been submitted, or
  is being concurrently submitted, for any such degree, diploma or other qualification at the
  University of Cambridge or any other University or similar institution except as declared
  in the Preface and specified in the text. This dissertation does not exceed the prescribed
  limit of 60 000 words.

  #v(2em)

  #align(right, [#name \ #date])
]

#let abstract-page(title, name, content) = [
  #heading(level: 1, outlined: false, "Abstract")

  #strong(title)

  #emph(name)

  #content
]

#let acknowledgements-page(content) = [
  #heading(level: 1, outlined: false, "Acknowledgements")

  #content
]

#let glossary() = [
  #heading(level: 1, outlined: false, "Glossary")
]

#let index() = [
  #set heading(numbering: none)
  #show heading.where(level: 1): it => {
    set text(1.6em, weight: "regular")
    v(2em)
    it.body
    v(-0.5em)
    line(length: 100%)
    v(2em)
  }
  #pagebreak(weak: true)
  #heading(level: 1, "Index")
]

#let clearpage(compact) = {
  if not compact {
    pagebreak(to: "odd")
  }
}

#let thesis(
  title: none,
  author: none,
  college: none,
  college-shield: none,
  subtitle: none,
  short-title: none,
  short-author: none,
  date: none,
  abstract: none,
  acknowledgements: none,
  compact: false,
  body,
) = {
  let leading = if compact { 1em } else { 1.5em }

  set page(
    paper: "a4",
    // One Cambridge thesis-binding company, J.S. Wilson & Son, recommend on their web page to leave 30 mm margin on the spine and 20 mm on the other three sides of the A4 pages sent to them. About a centimetre of the left margin is lost when the binder stitches the pages together.
    margin: (
      inside: 30mm,
      outside: 20mm,
      top: 20mm,
      bottom: 20mm,
    ),
  )

  show heading: set block(above: 2em, below: 2em)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set text(1.6em, weight: "regular")
    v(2em)
    it.body
    v(-0.5em)
    line(length: 100%)
    v(2em)
  }

  set par(leading: leading, first-line-indent: leading, justify: true)

  front-page(title, author, college, college-shield)
  clearpage(compact)
  declaration(author, date)
  clearpage(compact)
  abstract-page(title, author, abstract)
  clearpage(compact)
  acknowledgements-page(acknowledgements)
  clearpage(compact)

  outline(indent: auto)
  clearpage(compact)

  glossary()
  clearpage(compact)

  set page(numbering: "1", header: {
      locate(loc => {
          let current-page = counter(page).at(loc).first()
          let current-chapter = get-current-heading(loc)
          let current-section = get-current-heading(loc, level: 2)
          if current-chapter != none {
            if calc.rem(current-page, 2) == 0 {
              let current-section-text = if current-section == none {[]} else {
                emph[#counter(heading).display(). #current-section.body]
              }
              [
                #h(1fr)
                #current-section-text
                #v(-0.5em)
                #line(length: 100%)
              ]
            } else {
              [
                #emph[Chapter #counter(heading.where(level: 1)).display(). #current-chapter.body]
                #h(1fr)
                #v(-0.5em)
                #line(length: 100%)
              ]
            }
          } else {[]}

        })
    })
  set heading(numbering: "1.1")

  show heading.where(level: 1) : it => {
    set text(1em, weight: "regular")
    v(2em)
    h(1fr)
    [Chapter #counter(heading).display()]
    set text(1.6em, weight: "regular")
    line(length: 100%)
    block[
      #it.body
    ]
    line(length: 100%)
    v(2em)
  }
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.caption: figure_caption

  body

  clearpage(compact)
  index()
}

// For rendering chapters separately.
#let chapter(
  compact: false,
  body,
) = {
  let leading = if compact { 1em } else { 1.5em }

  set page(
    paper: "a4",
    // One Cambridge thesis-binding company, J.S. Wilson & Son, recommend on their web page to leave 30 mm margin on the spine and 20 mm on the other three sides of the A4 pages sent to them. About a centimetre of the left margin is lost when the binder stitches the pages together.
    margin: (
      inside: 30mm,
      outside: 20mm,
      top: 20mm,
      bottom: 20mm,
    ),
  )

  show heading: set block(above: 2em, below: 2em)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set text(1.6em, weight: "regular")
    v(2em)
    it.body
    v(-0.5em)
    line(length: 100%)
    v(2em)
  }

  set par(leading: leading, first-line-indent: leading, justify: true)

  set page(numbering: "1", header: {
      locate(loc => {
          let current-page = counter(page).at(loc).first()
          let current-chapter = get-current-heading(loc)
          let current-section = get-current-heading(loc, level: 2)
          if current-chapter != none {
            if calc.rem(current-page, 2) == 0 {
              let current-section-text = if current-section == none {[]} else {
                emph[#counter(heading).display(). #current-section.body]
              }
              [
                #h(1fr)
                #current-section-text
                #v(-0.5em)
                #line(length: 100%)
              ]
            } else {
              [
                #emph[Chapter #counter(heading.where(level: 1)).display(). #current-chapter.body]
                #h(1fr)
                #v(-0.5em)
                #line(length: 100%)
              ]
            }
          } else {[]}

        })
    })
  set heading(numbering: "1.1")

  show heading.where(level: 1) : it => {
    set text(1em, weight: "regular")
    v(2em)
    h(1fr)
    [Chapter #counter(heading).display()]
    set text(1.6em, weight: "regular")
    line(length: 100%)
    block[
      #it.body
    ]
    line(length: 100%)
    v(2em)
  }
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.caption: figure_caption

  body
}
