handlers
commandHandlerFor: name

	| handler |
	handler := commandHandlers at: name ifAbsent: [^ nil].
	handler isSymbol ifTrue:
		[^ [:arguments | self perform: handler with: arguments]].
	^ [:arguments | handler value: self value: arguments]