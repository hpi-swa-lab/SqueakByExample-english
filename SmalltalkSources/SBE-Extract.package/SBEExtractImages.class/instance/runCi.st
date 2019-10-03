as yet unclassified
runCi

	[SBEExtractImages new extractFrom: (FileSystem disk referenceTo: '/home/tom/Code/squeak/ecs/SWT2019Trunk.app/Contents/Resources/test-tex') to: '' ]
		valueSupplyingAnswers: {
			{'safety checks'. true}. " our own confirm "
			{'*'. 'overwrite that file'}. " file overwriting for each picture "
		}