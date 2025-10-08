accessing
buildDate

	^ buildDate ifNil: [DateAndTime now]