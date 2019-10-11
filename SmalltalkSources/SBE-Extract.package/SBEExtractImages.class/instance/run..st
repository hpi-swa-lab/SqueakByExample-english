as yet unclassified
run: aString

	[SBEExtractImages new extractFrom: (FileSystem disk referenceTo: aString) to: '' ]
		valueSupplyingAnswers: {
			{'safety checks'. true}. " our own confirm "
			{'*'. 'overwrite that file'}. " file overwriting for each picture "
		}