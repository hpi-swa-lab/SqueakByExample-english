handlers
environmentHandlerFor: name

	| handler |
	handler := environmentHandlers at: name ifAbsent: [^ nil].
	handler isSymbol ifTrue:
		[^ [:contentBlock :options | self perform: handler with: contentBlock with: options]].
	^ [:contentBlock :options | handler value: self value: contentBlock value: options]