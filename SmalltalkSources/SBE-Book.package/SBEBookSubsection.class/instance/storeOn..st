converting
storeOn: aStream

	aStream nextPutAll:
('({1}
	level: {2};
	yourself)' format:
		{String streamContents: [:stream | super storeOn: stream].
		self level})