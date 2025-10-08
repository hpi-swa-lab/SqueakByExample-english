html
openHtmlOn: aHtmlReadWriter 

	aHtmlReadWriter nextPutAll:
		('<sbeTextLabelLink label="{1}">' format: {self label}).