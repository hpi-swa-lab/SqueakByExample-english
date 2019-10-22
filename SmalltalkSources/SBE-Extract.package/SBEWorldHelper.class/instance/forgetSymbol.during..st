utils
forgetSymbol: aSymbol during: aBlock

	| classPool |
	classPool := Symbol classPool.
	#(SymbolTable NewSymbols)
		collect: [:name | classPool at: name]
		thenDo: [:table |
			(table includes: aSymbol) ifTrue: [
				table remove: aSymbol.
				thisContext home insertSender: (Context contextEnsure: [
					table add: aSymbol])]].
	^ aBlock value