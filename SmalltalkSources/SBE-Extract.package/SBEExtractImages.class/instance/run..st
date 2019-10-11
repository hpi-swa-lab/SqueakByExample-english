as yet unclassified
run: aString

	[SBEExtractImages new extractFrom: (FileSystem disk referenceTo: aString) to: '' ]
		valueSupplyingAnswers: {
			{'safety checks'. true}. " our own confirm "
			{'.* already exists.'. 'overwrite that file'}. " file overwriting for each picture "
		}