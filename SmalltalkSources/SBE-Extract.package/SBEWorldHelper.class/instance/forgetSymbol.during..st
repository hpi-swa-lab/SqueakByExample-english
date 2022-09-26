utils
forgetSymbol: aStringOrSymbol during: aBlock

	self flag: #danger. "ct: This is not thread-safe! See Symbol class>>#intern: on how this should be done correctly."
	
	(Symbol lookup: aStringOrSymbol) ifNotNil: [:symbol |
		#(SymbolTable NewSymbols) do: [:name | | table |
			table := Symbol classPool at: name.
			(table respondsTo: #beWritableObject) ifTrue: [table beWritableObject].
			table remove: symbol ifAbsent: [].
			(table respondsTo: #beReadOnlyObject) ifTrue: [table beReadOnlyObject].
			thisContext home insertSender: (Context contextEnsure: [
				table := Symbol classPool at: name.
				(table respondsTo: #beWritableObject) ifTrue: [table beWritableObject].
				[(table remove: symbol ifAbsent: []) isNil] whileFalse.
				table add: symbol.
				(table respondsTo: #beReadOnlyObject) ifTrue: [table beReadOnlyObject]])]].
	^ aBlock value