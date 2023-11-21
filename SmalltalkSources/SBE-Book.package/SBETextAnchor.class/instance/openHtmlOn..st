html
openHtmlOn: aHtmlReadWriter 

	| data |
	data := (ByteArray streamContents: [:stream |
		PNGReadWriter putForm: self image onStream: stream])
			base64Encoded.
	
	aHtmlReadWriter nextPutAll:
		('<sbeTextAnchor data="{1}">' format: {data}).