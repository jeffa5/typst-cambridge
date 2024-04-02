#import "cambridge.typ": cambridge-theme, title-slide, slide

#show: cambridge-theme

#title-slide(
  title: [Cambridge `polylux` template],
  authors: "Andrew Jeffery",
  date: [2#super("nd") April 2024],
)

#slide(title: "Installation")[
  You should have the `liberation` font installed, or set the `TYPST_FONT_PATHS` environment variable to its location.
]

#slide(title: "Getting started")[
  ```typst
// brings in the typst-slides bits too
#import "@preview/cambridge-slides:0.1.0": cambridge-theme, title-slide, slide

#show: cambridge-theme.with(
  aspect-ratio: "4-3",
)
  ```
]

#slide(title: "Slide types")[
  There are just two slide variants: `title-slide` and `slide`.
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
