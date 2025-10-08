html
openHtmlOn: aHtmlReadWriter 

	aHtmlReadWriter nextPutAll:
		('<sbeTextLabelAnchor label="{1}">' format: {self label}).