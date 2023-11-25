actions
openInPDF

	| url |
	url := self pdfUrl asString.
	url := url asText
		addAttribute: (TextURL url: url);
		yourself.
	^ url editWithLabel: ('PDF URL of {1}' format: {self title})