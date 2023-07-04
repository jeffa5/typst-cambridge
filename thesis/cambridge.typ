#let front-page(title, author, college, college-shield) = {
    let lastline = "This dissertation is submitted for the degree of Doctor of Philosophy"
    [
    #image(width: 20em, "light-logo.svg")
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
    pagebreak(weak: true)
    set text(1.6em)
    v(3em)
    it.body
    v(2em)
}
#heading(level: 1, "Index")
]

// Waiting for https://github.com/typst/typst/pull/1427
#let clearpage = [
#pagebreak()
#pagebreak()
]

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
    body,
) = {
    set page(
        paper: "a4",
    )

    show heading.where(level: 1): it => {
        pagebreak(weak: true)
        set text(1.6em)
        v(2em)
        it.body
        v(2em)
    }

    set par(leading: 1em)

    front-page(title, author, college, college-shield)
    clearpage
    declaration(author, date)
    clearpage
    abstract-page(title, author, abstract)
    clearpage
    acknowledgements-page(acknowledgements)
    clearpage

    outline()
    clearpage

    glossary()
    clearpage

    set page(numbering: "1")
    set heading(numbering: "1.1")

    show heading.where(level: 1): it => {
        pagebreak(weak: true)
        set text(1.6em)
        v(3em)
        block[
            Chapter #counter(heading).display()

            #it.body
        ]
        v(2em)
    }

    body

    index()
}

#let chapter(content) = {
    heading(level: 1, content)
}
