#import "cambridge.typ": *

#show: chapter

= Introduction

#lorem(100)

== A subsection
=== A subsection
==== A subsection
===== A subsection
====== A subsection

#figure(
  caption: [#lorem(10)],
  ```python
print("Hello, world!")
```,
)

#figure(caption: [Test figure image], image("./CollegeShields/CUni.svg"))
#figure(caption: [Test figure image 2], image("./CollegeShields/Trinity.svg"))

#figure(caption: [Test Table], table(columns: 2, [*Key*], [*Value*]))
