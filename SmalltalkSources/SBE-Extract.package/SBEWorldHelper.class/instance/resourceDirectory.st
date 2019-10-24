accessing
resourceDirectory

	^ ResourceDirectory ifNil: [
		Smalltalk globals at: #SmalltalkCI
			ifPresent: [:sci | sci
				perform: #getEnv: with: 'TRAVIS_BUILD_DIR']
			ifAbsent: [FileDirectory default]]