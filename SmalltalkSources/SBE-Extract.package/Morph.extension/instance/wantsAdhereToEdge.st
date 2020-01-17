*SBE-Extract-testing
wantsAdhereToEdge

	^ (self valueOfProperty: #edgeToAdhereTo ifAbsent: [^ false]) ~= #none