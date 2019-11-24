*SBE-Extract-controlling
wrapStrictlyToggleOn: aBlock toggleOff: anotherBlock

	aBlock value.
	self
		insertEnsure: anotherBlock;
		insertSender: (self class
			contextOn: Exception
			do: [:error |
				thisContext
					wrapToggleOn: anotherBlock
					toggleOff: aBlock.
				error pass]).