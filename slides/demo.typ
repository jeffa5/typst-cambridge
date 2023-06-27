#import "typst-slides/slides.typ": *
#import "cambridge.typ": *

#show: slides.with(
    authors: ("Andrew Jeffery", "Cam"),
    short-authors: "A. Jeffery",
    title: "Cambridge slides templates",
    subtitle: "Subtitle",
    short-title: "Cambridge template",
    date: "July 2023",
    theme: cambridge-theme(),
)

#slide(theme-variant: "title slide")

#slide(title:"Main slide style")[
  - There are two styles
    - The title slide
    - and this one!
]
