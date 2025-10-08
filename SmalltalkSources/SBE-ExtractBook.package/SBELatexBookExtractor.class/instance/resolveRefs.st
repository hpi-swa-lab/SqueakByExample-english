private
resolveRefs
	"Replace all ref placeholders in the stream with a full ref. This makes it possible to provide information for the ref label/appearance after the reference has been defined. #nameForKey: does not use this at the moment, though."

	| text index key nextIndex |
	text := stream contents.
	stream reset.
	index := 1.
	[index <= text size] whileTrue:
		[(text at: index)
			caseOf:
				{[self refPlaceholderStart] ->
					[nextIndex := text indexOf: self refPlaceholderStop startingAt: index + 1.
					key := text copyFrom: index + 1 to: nextIndex - 1.
					text isText
						ifTrue:
							[| attributes |
							attributes := text attributesAt: index + 1.
							stream withAttributes: attributes do:
								[self emitRef: key asString]]
						ifFalse:
							[self emitRef: key asString].
					index := nextIndex]}
			otherwise: [:character |
				stream withAttributes: (text runs at: index) do:
					[stream nextPut: character]].
		index := index + 1].