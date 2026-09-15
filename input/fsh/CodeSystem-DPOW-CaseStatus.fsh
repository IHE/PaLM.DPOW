// DPOW Case Status - the ORC-25 (Order Status Modifier) sub-statuses used by the
// Case Update transaction [LAB-101] to refine the ORC-1 / ORC-5 order status.
// These formalise the codes shown on the informal `99DPOW` local coding system
// (see Open Issue 10).
CodeSystem: DPOWCaseStatus
Id: dpow-case-status
Title: "DPOW Case Status"
Description: "DPOW case sub-statuses conveyed in ORC-25 (Order Status Modifier) of the Case Update transaction [LAB-101], used together with ORC-1 (Order Control) and ORC-5 (Order Status) to convey the case status."
* ^caseSensitive = true
* ^content = #complete
* ^experimental = true
* #Draft "Draft" "The report is saved as a draft but is not yet completed or signed."
* #Preliminary "Preliminary" "The report has been preliminarily signed."
* #ForTranscription "For Transcription" "A sound file has been dictated and is waiting to be transcribed."
* #Final "Final" "The report has been signed as final and is available in PACS."
* #Ended "Ended" "The report has been distributed."
