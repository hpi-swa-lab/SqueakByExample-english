as yet unclassified
runCi

	self flag: #todo. "adjust path for CI, ideally via env var"
	
	[SBEExtractImages new extractFrom: (FileSystem disk referenceTo: '/home/tom/Code/squeak/ecs/SqueakByExample-english') to: '' ]
		valueSupplyingAnswers: {
			{'safety checks'. true}. " our own confirm "
			{'.* already exists.'. 'overwrite that file'}. " file overwriting for each picture "
		}