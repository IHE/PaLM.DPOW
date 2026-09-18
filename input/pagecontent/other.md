This section modifies the IHE Technical Frameworks General Introduction appendices. The content here is not part of the DPOW Profile itself; it will be incorporated into the target narrative when the DPOW Profile goes to Trial Implementation / Final Text. These are updates to the IHE Technical Frameworks **General Introduction** appendices, not to appendices of the PaLM Technical Framework.

## Appendix A - Actors

Add the following new or modified actors to the IHE Technical Frameworks General Introduction [Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html):

| New (or modified) Actor Name | Definition |
|---|---|
| **Physical Asset Workflow Manager (PAWM)** | Manages specimen, block, and slide registration. Processes work orders and responds to order requests. Receives digital image availability notifications from the IMA. Sends and receives case-level status updates to and from the DAWM. Typically played by a Laboratory Information System (LIS). In the context of the holistic digital pathology workflow, this actor represents the "order filler" - receiving orders for tissue examination from the EHR/order placer and fulfilling those requests. |
| **Digital Asset Workflow Manager (DAWM)** | Receives specimen, block, and slide registration information from the PAWM for visualisation of metadata associated with a whole slide image. Can place work orders to the PAWM for additional work on specimens (e.g., slide recuts, IHC panels). Receives digital image availability notifications from the IMA. Sends and receives case-level status updates to and from the PAWM. Coordinates the overall digital pathology ordering and workflow. |
| **Image Manager / Image Archive (IMA)** | A system that provides functions related to safe data storage and image data handling. Provides long-term storage of images, presentation states, Key Image Notes, and Evidence Documents. In this profile, this actor sends digital image availability notifications to both the DAWM and PAWM. Manages the storage of captured digital images in a manner that facilitates ready retrieval upon request by all other actors for display or analysis. |
{: .grid}

## Appendix B - Transactions

Add the following new or modified transactions to the IHE Technical Frameworks General Introduction [Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html):

| New (or modified) Transaction Name and Number | Definition |
|---|---|
| **Physical Asset Registration [LAB-100]** | The PAWM registers a physical asset (specimen, block, or glass slide) and broadcasts its availability and metadata to the DAWM. The asset type is identified by the MSH-21 profile identifier: `DPOW-SPECIMEN^IHE`, `DPOW-BLOCK^IHE`, or `DPOW-SLIDE^IHE`. |
| **Case Update [LAB-101]** | Either the PAWM or the DAWM sends case-level updates to the other actor to keep the case synchronised. Conveys any case-level data or metadata; case status (conveyed via ORC-1 / ORC-5 / ORC-25) is the principal example, alongside other case-level information such as pathologist assignment. |
| **Place Work Order [LAB-102]** | The DAWM places an order for additional work on a physical specimen (e.g., recut, IHC, FISH) to the PAWM, acting as order placer. |
| **Accept Work Order [LAB-103]** | The PAWM responds to a work order placed by the DAWM, acting as order filler, with the result or status of the requested work. |
| **Image Availability Notification [LAB-104]** | The IMA notifies the PAWM and/or DAWM that a digital whole slide image is available (or has been removed/de-associated) in the image archive. Uses `SPM-20` to indicate availability (`Y`) or de-association (`N`). |
{: .grid}

> **Note:** All transaction numbers (LAB-100 through LAB-104) are pending formal verification by the IHE Domain Coordination Committee (DCC).

## Appendix D - Glossary

Add the following new or modified glossary terms to the IHE Technical Frameworks General Introduction [Appendix D](https://profiles.ihe.net/GeneralIntro/ch-D.html):

| Term | Definition |
|---|---|
| **Physical asset** | A tissue specimen or part thereof, identified by a unique accession number and representing a distinct entity having diagnostic value. |
| **Digital image asset** | The digital representation of a physical asset. Multiple versions may exist for the same physical asset (e.g., a 20x image, a 40x image, and a 40x z-stacked image of the same glass slide). |
| **Image Acquisition** | The process of creating a digital image asset from a physical asset. |
| **IWOS** | Imaging Work Order Step. A service request that defines the detail for image acquisition. |
| **VNA** | Vendor Neutral Archive. A medical imaging technology in which images are stored in a standard format with a standard interface, accessible in a vendor-neutral manner. |
| **Barcode** | An array or matrix of rectangular bars and spaces representing a number or alphanumeric identifier. In this profile, the barcode on a glass slide uniquely identifies that physical asset and links case data to slide data across all actors. |
| **Specimen** | A substance, physical object, or collection of objects that the laboratory considers a single discrete, uniquely identified unit that is the subject of one or more steps in the laboratory workflow; it may comprise multiple physical pieces provided they are treated as a single unit within the workflow. Definition adopted from the HL7 Version 3 Domain Analysis Model: Specimen, Release 2 (Section 5.8). In DPOW, a specimen is the physical asset registered via [LAB-100] with `MSH-21 = DPOW-SPECIMEN^IHE`, and is the parent of blocks and slides in the physical-asset hierarchy. |
| **Block** | Tissue fixed in formalin, placed in a plastic cassette, and embedded in paraffin. |
| **Slide** | A specimen section shaved from a block, typically a few microns thick, placed on glass and stained. |
| **Tissue** | Clinical material used to divide into parts, blocks, and slides for pathological evaluation. |
| **WSI** | Whole Slide Image. A digitised histopathology glass slide created on a slide scanner. Represents a high-resolution digital replica of the original glass slide that can be reviewed and diagnosed using software. Also referred to as a virtual slide. |
| **IMS** | Image Management System. A system providing storage, retrieval, and management of medical images. Functionally equivalent to a PACS; the term IMS is frequently used in pathology to distinguish pathology-specific image management from radiology-oriented PACS deployments. In this profile, an IMS typically fulfils the Image Manager / Image Archive (IMA) actor role. |
| **PAWM** | Physical Asset Workflow Manager. The actor responsible for managing physical specimen, block, and slide registration. Typically realised by a Laboratory Information System (LIS). Formerly referred to as LSM (Laboratory Specimen Manager). |
| **DAWM** | Digital Asset Workflow Manager. The actor responsible for coordinating the digital pathology ordering and reading workflow. May be realised by various system types, including a PACS or IMS workflow module, a dedicated digital pathology platform, or an AI workflow orchestrator. Formerly referred to as DPWM (Digital Pathology Workflow Manager). |
| **Case** | The set of specimens, blocks, slides, images, and associated data for a single pathology examination of a patient, identified by an accession number. The case is the top-level unit of the diagnostic workflow and the subject of case-level synchronisation via [LAB-101]. |
| **Accession number** | The unique identifier the laboratory assigns to a case upon receipt, grouping all specimens, containers, and downstream physical and digital assets for that examination. In DPOW it is carried in SPM-30 (Accession ID) and, for alignment with DPIA, also in ORC-38 (Filler Order Group Number). |
| **Container** | A receptacle that holds a specimen, such as a specimen pot, a block cassette, or a glass slide. Corresponds to the SpecimenContainer concept in the HL7 Specimen DAM; in DPOW it is conveyed via the SAC segment and SPM-27 (Container Type). |
| **Grossing** | The process of examining and dissecting a received specimen and creating tissue blocks from it for downstream processing. Completion of grossing is a case milestone conveyed as a [LAB-101] case update with ORC-1 = `SC` and ORC-5 = `IP` (examination in progress). |
| **Work Order** | A request from the DAWM to the PAWM for additional processing of a physical asset (for example a recut, an additional stain, IHC, or FISH), conveyed by Place Work Order [LAB-102] and answered by Accept Work Order [LAB-103]. |
| **De-association** | The state in which a physical asset no longer has an available image associated with it, whether because the image was physically deleted or merely de-associated. The IMA notifies de-association via [LAB-104] with SPM-20 = N; on receipt the PAWM and DAWM clear any "images available" indication for the asset. |
| **LIS** | Laboratory Information System. The system that manages the laboratory's specimens, orders, and results; in a typical DPOW deployment the LIS plays the PAWM actor. |
| **PACS** | Picture Archiving and Communication System. A system for storage, retrieval, and management of medical images; in pathology it commonly fulfils the Image Manager / Image Archive (IMA) actor and may host the DAWM. |
{: .grid}
