accessing
pdfUrl

	| fragment |
	fragment := self pdfUrlFragment ifNil: [^ self parent pdfUrl].
	^ self book pdfUrl withFragment: fragment