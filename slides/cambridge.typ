/// This theme is inspired by the Cambridge University presentation templates

#import "@preview/polylux:0.3.1": *

/// The polylux theme for the University of Cambridge.
#let cambridge-theme(
  aspect-ratio: "16-9",
  font: "Liberation Sans",
  body,
) = {
  let background = rgb("#FFFFFF")
  set text(font: font)
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: 0pt,
    fill: background,
  )
  body
}

#let blue = rgb("#0072CF")
#let light-blue = rgb("#68ACE5")
#let dark-blue = rgb("#003E74")
#let blue-text = rgb("#1f4e79")

#let debug-stroke = 1pt + red
#let stroke(debug) = {
  if debug {
    debug-stroke
  } else {
    none
  }
}

#let make-footer(content) = text(size: 16pt, content)

#let title-slide(
  title: [],
  subtitle: [],
  authors: [],
  date: [],
  venue: [],
  numbering: "1 / 1",
  slide-count: false,
  debug: false,
) = {
  set text(fill: white, size: 20pt)
  let stroke = stroke(debug)

  let slide-number = logic.logical-slide.display(numbering, both: slide-count)

  polylux-slide[
    #block(
      width: 100%,
      height: 28%,
      outset: 0em,
      inset: (x: 2em),
      breakable: false,
      stroke: stroke,
      spacing: 0em,
      fill: white,
      align(horizon, image(width: 13em, "light-logo.svg")),
    )
    #block(
      width: 100%,
      height: 49%,
      outset: 0em,
      inset: 2em,
      breakable: false,
      stroke: stroke,
      spacing: 0em,
      fill: blue,
      [
        #align(left + horizon, text(size: 36pt, title))
        #align(left + horizon, text(size: 18pt, subtitle))
      ],
    )
    #block(
      width: 100%,
      height: 9%,
      outset: 0em,
      inset: (x: 2em),
      breakable: false,
      stroke: stroke,
      spacing: 0em,
      fill: dark-blue,
      [
        #set text(size: 18pt)
        #box(width: auto, height: 100%, stroke: stroke, clip: true, [#align(horizon, authors)])
        #h(1fr)
        #box(width: auto, height: 100%, stroke: stroke, clip: true, [#align(horizon, [#date @#venue])])
      ],
    )
    #block(
      width: 100%,
      height: 5%,
      outset: 0em,
      inset: (x: 2em),
      breakable: false,
      stroke: stroke,
      spacing: 0em,
      fill: light-blue,
    )
    #block(
      width: 100%,
      height: 9%,
      outset: 0em,
      inset: (x: 2em),
      breakable: false,
      stroke: stroke,
      spacing: 0em,
      align(right + horizon, text(fill: blue-text, make-footer(slide-number))),
    )
  ]
}

#let slide(
  title: [],
  short-authors: [],
  numbering: "1 / 1",
  debug: false,
  slide-count: false,
  body,
) = {
  set text(fill: blue-text, size: 20pt)
  let stroke = stroke(debug)
  let displayed-title = heading(level: 1, text(size: 26pt, title))
  let slide-number = logic.logical-slide.display(numbering, both: slide-count)
  let footer = make-footer[#short-authors #h(2em) #slide-number]

  polylux-slide[
    #block(
      width: 100%,
      height: 15%,
      outset: 0em,
      inset: (x: 2em),
      breakable: false,
      stroke: stroke,
      spacing: 0em,
      fill: white,
      clip: true,
      align(left + horizon, displayed-title),
    )
    #block(
      width: 100%,
      height: 73%,
      outset: 0em,
      inset: (x: 2em),
      breakable: false,
      stroke: stroke,
      spacing: 0em,
      fill: white,
      clip: true,
      align(left + horizon, body),
    )
    #block(
      width: 100%,
      height: 12%,
      outset: 0em,
      inset: (x: 2em),
      breakable: false,
      stroke: stroke,
      spacing: 0em,
      fill: dark-blue,
      clip: true,
      [#box(height: 100%, stroke: stroke, clip: true, [#align(horizon, image(width: 10em, "dark-logo.svg"))])
        #h(1fr)
        #box(height: 100%, stroke: stroke, clip: true, align(right + horizon, text(fill: white, footer)))],
    )
  ]
}
