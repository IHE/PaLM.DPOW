// DPOW Case Status value set - bound to ORC-25 in the Case Update [LAB-101]
// transaction. Working draft pending PaLM TC adoption and OID registration
// (see Open Issue 10).
ValueSet: DPOWCaseStatusVS
Id: dpow-case-status
Title: "DPOW Case Status"
Description: "The set of DPOW case sub-statuses carried in ORC-25 of the Case Update transaction [LAB-101]."
* ^experimental = true
* include codes from system DPOWCaseStatus
