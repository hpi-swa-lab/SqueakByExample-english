html
openHtmlOn: aStream 

	aStream nextPutAll:
		('<sbeTextFontReference style="{1}">' format:
			{self style storeString}).