*SBE-Extract-current changeset
newChanges: aChangeSet during: aBlock

	| previousChanges |
	previousChanges := self current.
	self newChanges: aChangeSet.
	[^ aBlock cull: aChangeSet]
		ensure: [
			self newChanges: previousChanges]