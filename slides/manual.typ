#import "typst-slides/slides.typ": *
#import "cambridge.typ": *

#show: doc => slides(
    authors: "Andrew Jeffery",
    short-authors: "A. Jeffery",
    title: [Cambridge `typst-slides` template],
    subtitle: "",
    short-title: "Cambridge template",
    date: [27#super("th") June 2023],
    theme: cambridge-theme(),
    doc,
)

#slide(theme-variant: "title slide")

#slide(title: "Installation")[
You should have the `liberation` font installed, or set the `TYPST_FONT_PATHS` environment variable to its location.
]

#slide(title: "Getting started")[
    ```typst
// brings in the typst-slides bits too
#import "@preview/cambridge-slides:0.1.0": *

#show: slides.with(
    // usual typst-slides pieces
    theme: cambridge-theme(),
)
    ```
]

#slide(title: "Optional arguments")[
    You can pass the following arguments to the theme on instantiation `cambridge-theme((...))`:
    - `slides`: path to `typst-slides`' `slides.typ`, default: `"typst-slides/slides.typ"`
    - `debug`: enable debug globally, default `false`
    - `numbering`: numbering format for slide numbers, default `"1 / 1"`
    - `slide-count`: include the total number of slides, default `true`
    - `footer`: function to produce a custom footer, default `none`
    - `font`: font specification passed to `text`, default `"liberation sans"`
]

#slide(title: "Optional arguments example")[
    ```typst
#let footer(section: none, slide-number: none) = [#text(fill: green, [#slide-number span #section])]
#cambridge-theme(debug: true,
                numbering: "i / I",
                slide-count: false,
                footer: footer,
                font: "liberation serif")
    ```
]

#slide(title: "Slide types", theme-variant: "default")[
    There are just two slide variants: `title slide` and `default`.
]

#slide(title: "Footer")[
    The footer is built out of the `short-title`, `short-authors`, and the (internally calculated) `slide-number`.
]

#slide(title: "Debug slide", debug: true)[
    You can view the debug layout of the main slide elements, see the red boxes, by setting the debug parameter:

    ```typst
#slide(title: "Debug slide", debug: true)[
    debugged!
]
    ```
]
