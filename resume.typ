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
        "https://linkedin.com/in/carleyfant",
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


#let giac(GIAC_cert, GIAC_details) = {
  set text(size: heading-row-font-size)
  generic-one-by-two(
      left: [ *#GIAC_cert* --- #GIAC_details ]
    )
}


#let comptia(CompTIA_cert, CompTIA_details) = {
  set text(size: heading-row-font-size)
  generic-one-by-two(
      left: [ *#CompTIA_cert* --- #CompTIA_details ]
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
#set text(size: 9pt)
*Architecture & Platform Engineering* *(*Technical Lead*)*
#set text(size: 10pt)


- Designed and operated a cloud-native internal platform supporting *65 repositories* and *19 production microservices*, enabling secure *self-service* infrastructure and consistent delivery across domains.
- Built and maintained an enterprise *Terraform* module ecosystem with *36 reusable modules*, defining core AWS infrastructure patterns through versioned, testable code bases.
- Architected private *EKS* clusters with *Fargate* and IRSA, using secure-by-default configurations and *namespace-level isolation* to support *multi-tenant* workloads at scale.
- Established *golden paths* and *paved roads* for infrastructure and CI/CD, reducing developer friction and eliminating ad hoc provisioning.
- Created a *GitHub Actions* platform with *65 reusable composite actions*, standardizing build, test, security scanning, and deployment workflows as shared platform primitives across services.
- Implemented *policy-as-code* guardrails using Terraform validation and *Kubernetes admission controls*, embedding security, compliance, and cost awareness into the platform layer.
- Led *GitOps* adoption with *ArgoCD*, using ApplicationSets to manage multi-environment Kubernetes deployments with automated reconciliation and rollback.
- Built shared *observability* foundations including centralized audit logging, metrics, dashboards, and alerting used by both *platform and service teams* to support operational excellence and compliance.
- Designed a multi-account AWS *hub-and-spoke architecture* with secure cross-account access patterns, automated IAM role provisioning, and zero-trust networking controls.
- Partnered directly with product engineering teams to deliver *platform abstractions* that improved delivery speed, reliability, and developer satisfaction.

#work-experience(
  "Security Analyst",
  "Administrative Office of the Courts",
  "Atlanta, GA",
  datetime(year: 2023, month: 11, day: 01),
  datetime(year: 2025, month: 05, day: 01),
)

- Built threat informed *detections* and cloud attack scenarios using *Stratus Red Team*, *Prowler, TrailDiscover*, *Pacu*, and custom research to identify misconfigurations and logic flaws.
- Deployed *Wiz* across *AWS Organizations* and *CI pipelines*, resolving 200(+) high risk issues within the year.
- Designed and operated the agency wide *vulnerability management program*, defining classification workflows, reporting, and SLAs. Reduced MTTR for critical and high risk vulnerabilities to 5.5 days.

== #ti-book() EDUCATION & CERTIFICATIONS

#education(
  "Columbus State University",
  "B.S. in Information Technology",
  "Atlanta, GA",
  datetime(year: 2023, month: 05, day: 01),
  datetime(year: 2026, month: 05, day: 01),
)
- (2) x Certificate of Excellence in Chemistry

#giac( 
  "GIAC Certified",
  "SANS Cloud Security Automation (GCSA), SANS Advisory Board Member"
)
#comptia(
  "CompTIA Certified",
  "Network+, Security+",
)

== #ti-presentation() PRESENTATIONS & CTFs

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
- Presented the OWASP Amass v5 release in the OWASP Community Room, Recon Village, and Bug Bounty Village.

#presentation(
  "SANS SEC540: Cloud Wars CTF",
  "Challenge Coin Recipient",
  datetime(year: 2025, month: 09, day: 01),
)
