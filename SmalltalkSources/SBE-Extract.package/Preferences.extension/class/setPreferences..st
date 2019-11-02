*SBE-Extract-get/set
setPreferences: associations

	associations associationsDo: [:association |
		self setPreference: association key toValue: association value].