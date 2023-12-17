*SBE-BookCompatibility-Squeak60
sbeEndsWith: sequence caseSensitive: caseSensitive
	"Answer if the receiver ends with the argument collection."
	
	| index sequenceSize offset |
	caseSensitive ifTrue: [^ self endsWith: sequence].
	sequence isString ifFalse: [ ^super endsWith: sequence ].
	sequenceSize := sequence size.
	(offset := self size - sequenceSize) < 0 ifTrue: [ ^false ].
	index := 0.
	[ (index := index + 1) <= sequenceSize ] whileTrue: [
		((sequence at: index) sameAs: (self at: index + offset)) ifFalse: [ ^false ] ].
	^true