screenshots
writeTo: aString fromForm: aFormBlock

	^ SBESqueakFormPicture
		writeTo: aString
		frame: #morphs
		using: aFormBlock