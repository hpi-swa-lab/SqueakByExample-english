html
openHtmlOn: aHtmlReadWriter 

	| data |
	data := (ByteArray streamContents: [:stream |
		PNGReadWriter putForm: self image onStream: stream])
			base64Encoded.
	
	aHtmlReadWriter nextPutAll:
		('<sbeTextAnchor data="{1}" extent="{2}" dyeMode="{3}">' format:
			{data. self extent storeString. self dyeMode storeString}).