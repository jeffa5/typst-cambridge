#import "cambridge.typ": *

#let abstract = [
#lorem(100)
]

#show: thesis.with(
    author: "Andrew Jeffery",
    short-author: "A. Jeffery",
    college: "Trinity",
    college-shield: "CollegeShields/Trinity.svg",
    title: [Cambridge PhD thesis template],
    subtitle: "",
    short-title: "Cambridge thesis",
    date: [27#super("th") June 2023],
    abstract: abstract,
)

= Introduction

#lorem(100)

== A subsection

#lorem(1000)

= Work piece 1

#lorem(100)

== Some context

#lorem(1000)
