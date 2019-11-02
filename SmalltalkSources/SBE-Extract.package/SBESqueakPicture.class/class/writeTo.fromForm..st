screenshots
writeTo: aString fromForm: aFormBlock

	^ self
		filePath: (FSPath from: aString delimiter: $/)
		frame: #morphs
		buildBlock: [:helper |
			helper world color: Color transparent.
			(aFormBlock cull: helper) asMorph openInWorld]