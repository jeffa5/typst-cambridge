// This theme is inspired by the Cambridge University presentation templates

#import "typst-slides/slides.typ": *

#let cambridge-theme(
  debug: false,
  numbering: "1 / 1",
  slide-count: true,
  footer: none,
) = data => {
  let blue = rgb("#0072CF")
  let light-blue = rgb("#68ACE5")
  let dark-blue = rgb("#003E74")
  let background = rgb("#FFFFFF")
  let blue-text = rgb("#1f4e79")

  let debug-stroke = 1pt + red
  let stroke(slide-info) = if debug {
    debug-stroke
  } else if "debug" in slide-info and slide-info.debug {
    debug-stroke
  } else {
    none
  }

  let slide-number = logical-slide.display(numbering, both: slide-count)
  let make-footer(content) = text(size: 0.5em, content)
  let footer = if footer != none {
    make-footer(footer(section: section.display(), slide-number: slide-number))
  } else {
    make-footer[#data.short-title #h(2em) #data.short-authors #h(2em) #slide-number #section.display()]
  }

  let title-slide(slide-info, bodies) = {
    if bodies.len() != 0 {
        panic("title slide of Cambridge theme does not support any bodies")
    }

    set text(fill: white)
    let stroke = stroke(slide-info)

    block(
      width: 100%, height: 28%, outset: 0em, inset: (x: 2em), breakable: false,
      stroke: stroke, spacing: 0em, fill: white,
      align(horizon, image(width: 10em, "light-logo.svg"))
    )
    block(
      width: 100%, height: 49%, outset: 0em, inset: (x: 2em), breakable: false,
      stroke: stroke, spacing: 0em, fill: blue,
      [
      #align(left + horizon, text(size: 1.7em, data.title))
      #align(left + horizon, text(size: 1em, data.subtitle))
      ]
    )
    block(
      width: 100%, height: 9%, outset: 0em, inset: (x: 2em), breakable: false,
      stroke: stroke, spacing: 0em, fill: dark-blue,
      [
      #box(width: auto, height: 100%, stroke: stroke, clip: true, [#align(horizon, data.authors.join(", "))])
      #h(1fr)
      #box(width: auto, height: 100%, stroke: stroke, clip: true, [#align(horizon, data.date)])
      ]
    )
    block(
      width: 100%, height: 5%, outset: 0em, inset: (x: 2em), breakable: false,
      stroke: stroke, spacing: 0em, fill: light-blue,
    )
    block(
      width: 100%, height: 9%, outset: 0em, inset: (x: 2em), breakable: false,
      stroke: stroke, spacing: 0em,
      align(right + horizon, text(fill: blue-text, make-footer(slide-number)))
    )
  }

  let displayed-title(slide-info) = if "title" in slide-info {
    heading(level: 1, slide-info.title)
  } else {
    []
  }

  let main(slide-info, bodies) = {
    set text(fill: blue-text)
    let stroke = stroke(slide-info)

    block(
      width: 100%, height: 15%, outset: 0em, inset: (x: 2em), breakable: false,
      stroke: stroke, spacing: 0em, fill: white, clip: true,
      align(left + horizon, displayed-title(slide-info))
    )
    block(
      width: 100%, height: 73%, outset: 0em, inset: (x: 2em), breakable: false,
      stroke: stroke, spacing: 0em, fill: white, clip: true,
      align(left + horizon, [ #for body in bodies { body } ])
    )
    block(
      width: 100%, height: 12%, outset: 0em, inset: (x: 2em), breakable: false,
      stroke: stroke, spacing: 0em, fill: dark-blue, clip: true,
      [#box(width: 5em, height: 100%, stroke: stroke, clip: true, [#align(horizon, image(width: 5em, "dark-logo.svg"))])
      #h(1fr)
      #box(width: 80%, height: 100%, stroke: stroke, clip: true, align(right + horizon, text(fill: white, footer)))]
    )
  }

  (
    "title slide": title-slide,
    "default": main,
  )
}
