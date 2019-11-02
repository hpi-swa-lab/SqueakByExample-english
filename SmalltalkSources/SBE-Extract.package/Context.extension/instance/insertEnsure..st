*SBE-Extract-controlling
insertEnsure: aBlock

	self insertSender: (Context contextEnsure: aBlock).