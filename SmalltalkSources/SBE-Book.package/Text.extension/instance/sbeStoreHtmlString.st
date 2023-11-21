*SBE-Book-converting
sbeStoreHtmlString

	^ '(SBEHtmlReadWriter on: {1} readStream) nextText' format:
		{((String streamContents: [:stream |
			(SBEHtmlReadWriter on: stream) nextPutText: self])
				copyReplaceAll: (String value: 1) with: '&#01;')
					fullPrintString}