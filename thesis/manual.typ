#import "cambridge.typ": *

#show: doc => thesis(
  author: "Andrew Jeffery",
  short-author: "A. Jeffery",
  college: "Trinity",
  college-shield: "CollegeShields/Trinity.svg",
  title: [Cambridge PhD thesis template with some extra long words],
  subtitle: "Date 01/01/1970",
  short-title: "Cambridge thesis",
  date: [27#super("th") June 2023],
  summary: lorem(100),
  acknowledgements: lorem(50),
  compact: false,
  doc,
)

#include "manual-1.typ"

#include "manual-2.typ"

#include "manual-3.typ"
