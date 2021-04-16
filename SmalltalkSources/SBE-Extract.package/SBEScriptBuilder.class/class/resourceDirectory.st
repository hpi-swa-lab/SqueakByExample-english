accessing
resourceDirectory
	"Returns a FSReference"

	^ ResourceDirectory ifNil: [
		| directory |
		(Smalltalk classNamed: #SmalltalkCI) ifNotNil: [:sci | | path |
			#(GITHUB_WORKSPACE TRAVIS_BUILD_DIR)
				detect: [:key | (path := sci getEnv: key) notNil]
				ifNone: [].
			path ifNotNil: [
				directory := FileSystem disk referenceTo: path]].
		directory ifNil: [FileDirectory default asFSReference]]