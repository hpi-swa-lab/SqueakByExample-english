converting
storeOn: aStream

	aStream nextPutAll:
('({1} new
	key: {2};
	label: {3};
	entries: {4};
	referenceKeys: {5};
	forwardReference: {6};
	yourself)' format:
		{self class name.
		self key storeString.
		self label sbeStoreHtmlString.
		self entries storeString.
		self referenceKeys storeString.
		self forwardReference storeString})