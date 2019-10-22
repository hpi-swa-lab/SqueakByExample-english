utils
forgetSymbol: aSymbol during: aBlock

	^ self restoreMethods: {Symbol class >> #lookup:} after: [
		| source signature |
		source := (Symbol class sourceCodeAt: #lookup:) asString.
		signature := (source lines first: 3) joinSeparatedBy: String cr.
		Symbol class compile: (String streamContents: [:stream |
			stream
				nextPutAll: signature;
				cr; tab;
				nextPutAll: (source lines first allButFirst: 'lookup:' size) withoutLeadingBlanks;
				nextPutAll: ' asString = ';
				store: aSymbol asString;
				nextPutAll: ' ifTrue: [^ nil].';
				cr;
				nextPutAll: ((source lines allButFirst: 3) joinSeparatedBy: String cr)]).
		aBlock value]