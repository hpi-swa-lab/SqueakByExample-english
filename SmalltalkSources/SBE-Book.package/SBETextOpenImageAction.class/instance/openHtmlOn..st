html
openHtmlOn: aHtmlReadWriter 

	| data |
	data := (ByteArray streamContents: [:stream |
		PNGReadWriter putForm: self image onStream: stream])
			base64Encoded.
	
	aHtmlReadWriter nextPutAll:
		('<sbeTextOpenImage data="{1}" initialExtent="{2}">' format:
			{data. self initialExtent storeString}).