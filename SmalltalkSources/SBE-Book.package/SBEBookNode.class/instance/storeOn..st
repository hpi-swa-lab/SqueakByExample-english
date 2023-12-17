converting
storeOn: aStream

	aStream nextPutAll:
('({1} new
	title: {2};
	addChildren: {3};
	text: {4};
	index: {5};
	hasStarIndex: {6};
	extraLabels: {7};
	typeName: {8};
	yourself)' format:
		{self class name.
		self title sbeStoreHtmlString.
		self children storeString.
		self text sbeStoreHtmlString.
		self index storeString.
		self hasStarIndex storeString.
		self extraLabels storeString.
		self typeName storeString})