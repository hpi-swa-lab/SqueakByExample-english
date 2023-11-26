accessing
entriesDo: entryAndLabelBlock

	(self entries withKeysSorted: self keySortFunction)
		do: entryAndLabelBlock.