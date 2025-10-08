private - parsing
mapFromGroup: node

	| map tokens skipSeparators |
	self assert: node sbeType = #curlyGroup.
	self assert: (node children first sbeType isNil and: [node children first contents = '{']).
	self assert: (node children last sbeType isNil and: [node children last contents = '}']).
	tokens := node children allButFirst allButLast readStream.
	
	skipSeparators :=
		[[tokens atEnd not and: [(#(linebreak lineComment) includes: tokens peek sbeType) or: [tokens peek sbeType isNil and: [tokens peek contents isAllSeparators]]]]
			whileTrue: [tokens next]].
	
	map := OrderedDictionary new.
	[| key value |
	tokens atEnd ifTrue: [^ map].
	skipSeparators value.
	key := (self contentsIn: tokens next) asString.
	skipSeparators value.
	self assert: (tokens peek sbeType isNil and: [tokens next contents = '=']).
	skipSeparators value.
	value := Array streamContents: [:values |
		[tokens atEnd or: [tokens peek sbeType isNil and: [tokens peek contents = ',']]]
			whileFalse:
				[values nextPut: tokens next.
				skipSeparators value].
		tokens atEnd ifFalse: [tokens next]].
	map at: key put: value] repeat.
	^ map