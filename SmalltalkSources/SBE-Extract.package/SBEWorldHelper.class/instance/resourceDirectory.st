accessing
resourceDirectory

	^ ResourceDirectory ifNil: [FileDirectory default]