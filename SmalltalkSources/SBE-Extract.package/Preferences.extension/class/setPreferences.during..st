*SBE-Extract-get/set
setPreferences: associations during: aBlock
	"Changes the given values for the duration of aBlock"

	| values previousValues |
	values := associations as: Dictionary.
	previousValues := values associations collect: [:association |
		association key -> (self valueOfFlag: association key)].
	self setPreferences: values.
	^ [aBlock value] ensure: [
		self setPreferences: previousValues]