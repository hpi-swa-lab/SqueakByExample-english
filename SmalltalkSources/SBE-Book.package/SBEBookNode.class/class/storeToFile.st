documentation
storeToFile

	| original store |
	original := SBEHelp book.
	store := original storeString.
	
	(FileSystem disk workingDirectory / 'sbe.sbebook') writeStreamDo: [:stream |
		stream nextPutAll: store].