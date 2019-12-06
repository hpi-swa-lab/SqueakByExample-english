*SBE-Extract-initialize-release
destroy

	self name initialIntegerOrNil ifNotNil: [:number |
		SystemVersion current unregisterUpdate: number].
	ChangesOrganizer removeChangeSet: self.