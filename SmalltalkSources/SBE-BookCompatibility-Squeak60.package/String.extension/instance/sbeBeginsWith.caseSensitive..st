*SBE-BookCompatibility-Squeak60
sbeBeginsWith: sequence caseSensitive: caseSensitive
	"Answer if the receiver starts with the argument collection."

	| index sequenceSize |
	caseSensitive ifTrue: [^ self beginsWith: sequence].
	sequenceSize := sequence size.
	self size < sequenceSize ifTrue: [ ^false ].
	index := 0.
	[ (index := index + 1) <= sequenceSize ] whileTrue: [
		((sequence at: index) sameAs: (self at: index)) ifFalse: [ ^false ] ].
	^true