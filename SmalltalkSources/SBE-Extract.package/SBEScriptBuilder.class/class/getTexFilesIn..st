code generation
getTexFilesIn: aFileReference

	^ aFileReference allFiles select: [:file | file extension = 'tex']