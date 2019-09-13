accessing
enumerateTo: aCollection
	"Add all of the elements I represent to the collection."
	first asInteger to: last asInteger do:
		[:charCode |
		aCollection add: charCode asCharacter]