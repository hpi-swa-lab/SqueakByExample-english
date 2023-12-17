converting
storeOn: aStream

	aStream nextPutAll:
('({1}
	pdfUrl: {2};
	bookIndex: {3};
	yourself)' format:
		{String streamContents: [:stream | super storeOn: stream].
		self pdfUrl storeString.
		self bookIndex storeString})