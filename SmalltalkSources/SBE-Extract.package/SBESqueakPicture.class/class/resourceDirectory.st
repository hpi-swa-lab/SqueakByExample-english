accessing
resourceDirectory
	"Returns a FSReference"

	^ ResourceDirectory ifNil: [
		Smalltalk globals at: #SmalltalkCI
			ifPresent: [:sci | FileSystem disk referenceTo: (
				sci perform: #getEnv: with: 'TRAVIS_BUILD_DIR')]
			ifAbsent: [FileDirectory default asFSReference]]