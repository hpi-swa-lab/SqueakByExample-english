visiting - nodes
visitPackageInclude: node

	| names |
	self assert: node children size >= 2.
	self flag: #todo. "arguments"
	names := node children last.
	names := names sbeType caseOf:
		{[#curlyGroupPathList] ->
			[names children
				select: [:ea | ea sbeType = #path]
				thenCollect: [:ea | ea contents]]}.
	
	names do: [:name |
		(self tryResolveFile: name extensions: #('.sty')) ifNotNil:
			[:file | ^ self extractFromFile: file].
	
		"skip default packages..."].