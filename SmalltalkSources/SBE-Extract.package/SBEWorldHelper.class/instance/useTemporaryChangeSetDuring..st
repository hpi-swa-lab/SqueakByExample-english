private utils
useTemporaryChangeSetDuring: aBlock

	^ ChangeSet
		newChangesNamed: 'Temporary changeset for SBE recording'
		during: [
			| friendlyName |
			friendlyName := 'Squeak by Example'.
			self assert: (ChangeSet named: friendlyName) isNil.
			ChangeSet current useName: friendlyName during: aBlock]