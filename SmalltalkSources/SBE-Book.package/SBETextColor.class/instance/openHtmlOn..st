html
openHtmlOn: aStream 

	aStream nextPutAll:
		('<sbeTextColor property="{1}" scope="{2}">' format:
			{self property storeString. self scope storeString}).