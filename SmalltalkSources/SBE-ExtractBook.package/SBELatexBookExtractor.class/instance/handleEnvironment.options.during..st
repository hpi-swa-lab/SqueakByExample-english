private - handling
handleEnvironment: name options: options during: contentBlock

	| handler |
	handler := self environmentHandlerFor: name.
	handler ifNil:
		[self notify: ('unknown environment: {1}' format: {name}).
		^ contentBlock value].
	^ handler value: contentBlock value: options