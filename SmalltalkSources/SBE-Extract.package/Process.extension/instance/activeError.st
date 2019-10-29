*SBE-Extract-accessing
activeError

	| ctxt handler |
	ctxt := self suspendedContext.
	handler := MethodReference class: ToolSet class selector: #handleError:.
	[ctxt isMethodContext and: [ctxt method methodReference = handler]]
		whileFalse: [
			ctxt := ctxt sender.
			ctxt ifNil: [^ nil]].
	^ ctxt tempAt: 1