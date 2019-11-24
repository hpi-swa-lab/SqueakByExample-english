accessing
fileDirectory

	^ fileDirectory ifNil: [self defaultFileDirectory]