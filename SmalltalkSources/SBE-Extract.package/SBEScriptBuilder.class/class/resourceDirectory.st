accessing
resourceDirectory
	"Returns a FSReference"

	^ ResourceDirectory ifNil: [
		| directory |
		Smalltalk globals at: #SmalltalkCI
			ifPresent: [:sci | (sci perform: #getEnv: with: #TRAVIS_BUILD_DIR)
				ifNotNil: [:path | directory := FileSystem disk referenceTo: path]].
		directory ifNil: [FileDirectory default asFSReference]]