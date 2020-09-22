*SBE-Extract-controlling
preponeSender: aContext

	self removeSender: aContext.
	aContext privSender: self.
	aContext
		push: nil "pseudo return value";
		jump.