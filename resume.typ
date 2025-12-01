#import "@preview/use-tabler-icons:0.15.0": *

#let today = datetime.today()

#set page(
  paper: "us-letter",
  margin: 0.5in,
  footer: context {
    set align(center)
    [
      _Last updated #datetime.display(today, "[day padding:none] [month repr:long] [year]")_
    ]
  },
)
#set text(font: "Iosevka", size: 10pt)

#let heading-row-font-size = 10.5pt

#show heading.where(level: 1): it => [
  #set text(weight: 700, size: 20pt)
  #pad(it.body)
]

#show heading.where(level: 2): it => [
  #pad(top: 0em, bottom: 0.25em, it.body)
]

#grid(
  columns: (1fr, auto),
  gutter: 1em,
  align: bottom,
  [
    = Carley Fant
    #ti-mail() contact\@carleyfant.com
    | #ti-file-phone() \+1(678) 313-1217
    | #ti-map-pin() Atlanta, GA
  ],
  stack(
    spacing: 0.4em,
    [
      #link("https://5o5.sh")[#ti-world() 5o5.sh]
    ],
    [
      #link(
        "https://linked.com/in/carleyfant",
      )[#ti-brand-linkedin() linkedin.com/in/carleyfant]
    ],
    [
      #link(
        "https://github.com/51nk0r5w1m",
      )[#ti-brand-github() github.com/51nk0r5w1m]
    ],
  ),
)

#line(length: 100%)

#let showdate(date) = {
  if (date == datetime.today()) {
    "Present"
  } else {
    datetime.display(date, "[month repr:short] [year]")
  }
}

// Generic one by two component for resume
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  pad(
    bottom: -0.15em,
    [
      #left #h(1fr) #right
    ],
  )
}

#let work-experience(title, company, location, start, end) = {
  set text(size: heading-row-font-size)
  generic-one-by-two(
    left: [ *#title* --- #company --- #location ],
    right: [ _#showdate(start) - #showdate(end)_ ],
  )
}

#let education(school, degree, location, start, end) = {
  set text(size: heading-row-font-size)
  generic-one-by-two(
    left: [ *#school* --- #degree --- #location ],
    right: [ _#showdate(start) - #showdate(end)_ ],
  )
}

#let presentation(title, place, date) = {
  set text(size: heading-row-font-size)
  generic-one-by-two(
    left: [ *#title* --- #place ],
    right: [ _#showdate(date)_ ],
  )
}

== #ti-briefcase-filled() WORK EXPERIENCE

#work-experience(
  "IT Security Manager",
  "Administrative Office of the Courts",
  "Atlanta, GA",
  datetime(year: 2025, month: 05, day: 01),
  datetime.today(),
)

- Lead Application Security for a statewide multi-tenant Court Case Management SaaS, integrating *threat modeling*, *secure design reviews*, and *secure coding practices* in collaboration with AWS ProServe and Slalom engineering teams. 
- Conduct manual *security testing of web and API components*, identifying critical issues such as a public Odoo (list_db) endpoint, an exposed (.git) directory, and a Django REST registration flaw enabling privilege escalation through reusable OTPs and writable account fields. Built PoCs to demonstrate unauthorized account creation and guided remediation by enforcing server side validation.
- Apply *OWASP ASVS*, *WSTG*, and *Top 10* standards for architecture and code reviews, evaluating authentication logic, authorization boundaries, and data handling paths.
- Analyze and secure *OAuth 2.0*, *OIDC*, and *JWT* workflows,ensuring strong token handling, validation, and cross tenant isolation.
- Collaborate with roughly two hundred architects and developers to capture *security requirements* early and ensure consistent *access control*, *identity flows*, *logging*, and *data protection* across services.
- Author detailed *vulnerability reports*, *PoCs*, and *developer guidance* for high impact findings, improving fix quality and reducing reintroduction of insecure patterns.
- *Tools & Tech*: Burp Suite, Caido, ZAP, ffuf, Amass, Subfinder, Stratus Red Team, Pacu, Semgrep, Wiz Code, Corgea, Trivy, Python, Bash.

#work-experience(
  "Security Analyst",
  "Administrative Office of the Courts",
  "Atlanta, GA",
  datetime(year: 2023, month: 11, day: 01),
  datetime(year: 2025, month: 05, day: 01),
)

- Built threat informed *detections* and cloud attack scenarios using *Stratus Red Team*, *Prowler, TrailDiscover*, *Pacu*, and custom research to identify misconfigurations, logic flaws, and vulnerable identity paths.
- Deployed *Wiz* across *AWS Organizations* and *CI pipelines*, resolving more than two hundred high risk issues identified through reachable exploit paths.
- Designed and operated the agency wide *vulnerability management program*, defining classification workflows, reporting, and SLAs. Reduced MTTR for critical and high risk vulnerabilities to 5.5 days.
- Authored incident response procedures for *IAM misuse*, *container compromise*, and *exposed credentials* enabling consistent response across cloud and application environments.

#work-experience(
  "Cybersecurity Intern",
  "Orcannus Technologies",
  "Woodstock, GA",
  datetime(year: 2023, month: 08, day: 01),
  datetime(year: 2023, month: 12, day: 01),
)

== #ti-book() EDUCATION

#education(
  "Columbus State University",
  "B.S. in Information Technology",
  "Atlanta, GA",
  datetime(year: 2023, month: 05, day: 01),
  datetime(year: 2026, month: 05, day: 01),
)

- Certificate of Excellence in Chemistry

== #ti-presentation() TALKS & PRESENTATIONS

#presentation(
  "Where Art Thou, O'Auth? Trust Tragedies in Single Page Apps",
  "GrrCON",
  datetime(year: 2025, month: 09, day: 01),
)

- Presented research on insecure OAuth implementations, showing how browser-managed tokens enable XSS-driven token theft and outlining secure architectural alternatives.

#presentation(
  "OWASP Amass: Village Workshops",
  "DEF CON 33",
  datetime(year: 2025, month: 08, day: 01),
)
- Presented the OWASP Amass v5 release in the OWASP Community Room, Recon Village, and Bug Bounty Village, demonstrating new features improving graph database queries and active reconnaissance modules.

