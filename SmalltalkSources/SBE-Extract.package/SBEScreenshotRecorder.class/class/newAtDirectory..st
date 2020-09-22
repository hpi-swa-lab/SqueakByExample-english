instance creation
newAtDirectory: aDirectory

	^ self new
		setFileDirectoryFrom: aDirectory;
		yourself