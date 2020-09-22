*SBE-Extract-private
removeSender: aContext

	(self findCalleeOf: aContext) privSender: aContext sender.
	aContext privSender: nil.