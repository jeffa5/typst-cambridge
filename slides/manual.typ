#import "typst-slides/slides.typ": *
#import "cambridge.typ": *

#show: slides.with(
    authors: "Andrew Jeffery",
    short-authors: "A. Jeffery",
    title: [Cambridge `typst-slides` templates],
    subtitle: "",
    short-title: "Cambridge template",
    date: [27#super("th") June 2023],
    theme: cambridge-theme(),
)

#slide(theme-variant: "title slide")

#slide(title: "Getting started")[
    ```typst
#import "typst-slides/slides.typ": *
#import "cambridge.typ": *

#show: slides.with(
    // usual typst-slides pieces
    theme: cambridge-theme(),
)
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
