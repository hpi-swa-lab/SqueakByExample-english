converting
storeOn: aStream

	aStream nextPutAll:
('({1} new
	title: {2};
	addChildren: {3};
	text: {4};
	extraLabels: {5};
	yourself)' format:
		{self class name.
		self title sbeStoreHtmlString.
		self children storeString.
		self text sbeStoreHtmlString.
		self extraLabels storeString})