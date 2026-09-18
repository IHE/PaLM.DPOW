# Diagram sources

The DPOW narrative pages currently embed their diagrams as **inline Mermaid**
fenced code blocks (```` ```mermaid ````), which the IHE FHIR IG template renders
directly. This matches the authoritative source document and keeps the diagrams
diffable in version control.

For final IG publication the PaLM TC may prefer to export each diagram to
**SVG or PlantUML** and place the source here (`input/images-source/`), then
reference it from the page with a Liquid include, e.g.:

```
<figure>
{% include actor-diagram.svg %}
<figcaption><strong>Figure 1:XX.1-1: DPOW Actor Diagram</strong></figcaption>
</figure>
```

The IG Publisher copies `input/images-source/*` to `input/images/` during the
build. PlantUML is recommended by the template as more stable than Mermaid and
supports clickable links on artifacts. See
<https://build.fhir.org/ig/FHIR/ig-guidance/diagrams-mermaid.html>.

Diagrams to export (all currently inline):

| Page | Diagram | Type |
|---|---|---|
| index.md | Ecosystem / scope overview | graph LR |
| volume-1.md | Figure 1:XX.1-1 DPOW Actor Diagram | graph LR |
| volume-1.md | Figure 1:XX.4.1-1 Physical Asset Hierarchy | graph TD |
| volume-1.md | Use Case #1-#8 process flows (7 diagrams; UC7 has none) | sequenceDiagram |
