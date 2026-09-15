# PaLM.DPOW

This GitHub repository is the source content for the IHE PaLM Technical Framework
Supplement **Digital Pathology Ordering & Workflow (DPOW)**, Revision 0.1 -
*Draft for Public Comment*, authored with the
[IHE supplement-template](https://github.com/IHE/supplement-template) (FHIR IG
Publisher).

DPOW empowers the systems in the digital pathology ecosystem with the data needed
to drive the reading and ordering workflow, using HL7 v2.5.1 messaging for
physical-asset registration, case synchronisation, work orders, and
image-availability notification.

This repository is the authoritative source for the supplement: the pages under
`input/pagecontent/` are edited directly here, and the published guide is
rendered from them by the IG Publisher.

## HL7 v2 vs FHIR - important

The IHE supplement-template is designed for **FHIR** Implementation Guides (it
expects FSH conformance resources and `CapabilityStatement`s). **DPOW is an HL7
v2.5.1 messaging profile** - its conformance is expressed entirely in HL7 v2
message and segment tables (Volume 2 and `volume-2-appendix.md`). Consequently:

- There are **no** FHIR `StructureDefinition` profiles or `CapabilityStatement`s.
- `input/fsh/` contains only terminology (aliases plus the DPOW case-status
  CodeSystem/ValueSet), no conformance resources.
- The FHIR `mustSupport` / R2 machinery does not apply; HL7 v2 Usage codes
  (R / RE / O / C / X) express field conformance instead (see `index.md`).
- The generated IG is **narrative-only**: SUSHI produces the
  `ImplementationGuide` resource and the terminology; the Publisher renders the
  pages as a website.

## Layout

```
sushi-config.yaml          IG id ihe.palm.dpow, canonical .../PaLM/DPOW, pages + menu
ig.ini                     template = ihe.fhir.template#current
publication-request.json   PaLM/DPOW publication metadata
_updatePublisher.sh/.bat   fetch/refresh the IG Publisher (from the template repo)
_build.sh/.bat             SUSHI + IG Publisher build wrapper
input/
  ignoreWarnings.txt
  fsh/                     Aliases.fsh, CodeSystem/ValueSet-DPOW-CaseStatus.fsh
  images-source/           diagram export target (diagrams are inline Mermaid for now)
  pagecontent/
    index.md               Home: overview, ecosystem diagram, conformance boilerplate
    volume-1.md            Volume 1 profile detail (1:XX.n, template anchors)
    LAB-100.md .. LAB-104.md   Volume 2, one page per transaction
    volume-2-appendix.md   Vol 2 Appendix A (segments), B (templates/examples), C (placeholders)
    other.md               Changes to Other IHE Specs (GI Appendix A/B/D)
    testplan.md            Connectathon test scenarios
    download.md            downloads + IP statements
    issues.md              significant changes + open/closed issues
```

Volume 3 (content modules) and Volume 4 (national extensions) are not applicable
to DPOW and are noted as such in `index.md`; no Volume 3 content-module page exists.

## Building

There are two levels of build.

**1. Fast smoke test (SUSHI only).** Validates `sushi-config.yaml`, the page set,
and the menu, and generates the `ImplementationGuide` resource. Needs only Node +
SUSHI - no Java/Ruby:

```bash
npm install -g fsh-sushi
sushi .
```

**2. Full site render (IG Publisher).** Produces `output/index.html` plus the QA
report `output/qa.html` (errors, warnings, broken links - the real pass/fail
signal). Needs **Java 17+**, **Ruby + Jekyll**, and network access. Use the bundled
`_build` script (HL7's ig-publisher-scripts, the same wrapper other IHE IGs use):

```bash
./_build.sh            # Linux/macOS/Git Bash; on Windows run _build.bat
```

Run with no argument for an interactive menu, or pass a target:

- `./_build.sh update`  - download/refresh `publisher.jar` into `input-cache/`
- `./_build.sh build`   - full build (SUSHI + IG Publisher -> `output/`)
- `./_build.sh notx`    - build **offline**, skipping the terminology server
  (`-tx n/a`)
- `./_build.sh nosushi` - build without re-running SUSHI
- `./_build.sh clean`   - remove `output/`, `template/`, `temp/`

After a build, open **`output/qa.html`** (aim for 0 errors) and **`output/index.html`**.

The toolchain can be installed at **user level (no admin)**: a Temurin 17 JDK zip on
`PATH`, RubyInstaller+DevKit 3.3 (`ridk install 3`), then `gem install jekyll
bundler`.

## Follow-ups before publication

- Export the inline Mermaid diagrams to SVG/PlantUML under `input/images-source/`
  (see that folder's README).
- Resolve the open issues in `issues.md` (notably Issue 6 transaction-number
  registration, Issue 11 ORC-25 value set) and Work Items
  WI-DPOW-01 / WI-DPOW-02.
- Confirm the final IHE repository path (`IHE/PaLM.DPOW`) referenced in
  `issues.md`, `download.md`, and `publication-request.json`.
