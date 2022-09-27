private utils
useTemporaryChangeSetStrictlyDuring: aBlock

	ChangeSet
		newChangesNamed: 'Temporary changeset for SBE recording'
		strictlyDuring: [
			| friendlyName |
			friendlyName := 'Squeak by Example'.
			self assert: (ChangeSet named: friendlyName) isNil.
			^ ChangeSet current useName: friendlyName during: aBlock]