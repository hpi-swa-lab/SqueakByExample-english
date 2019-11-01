*SBE-Extract
evaluateWithTempNames: aStringOrText

	| compiledMethod methodNode |
	methodNode := self
		compileNoPattern: aStringOrText
		in: Object
		notifying: nil
		ifFail: [^ nil].
	compiledMethod := methodNode generateWithTempNames.
	^ nil executeMethod: compiledMethod