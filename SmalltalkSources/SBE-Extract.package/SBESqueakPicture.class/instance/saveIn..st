export
saveIn: aFilePath

	^ self saveAs: (aFilePath resolve: self filePath)