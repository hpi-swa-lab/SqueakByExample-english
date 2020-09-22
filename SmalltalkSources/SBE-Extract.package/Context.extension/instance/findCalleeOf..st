*SBE-Extract-controlling
findCalleeOf: aContext

	| context callee |
	context := self.
	[context == aContext] whileFalse: [
		callee := context.
		context := context sender.
		context ifNil: [aContext ifNotNil: [
				self error: 'aContext not a sender']]].
	^ callee