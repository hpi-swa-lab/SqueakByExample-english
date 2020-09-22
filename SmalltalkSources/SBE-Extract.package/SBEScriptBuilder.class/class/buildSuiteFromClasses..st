building
buildSuiteFromClasses: classes

	| suite |
	suite := self suiteClass new.
	(classes reject: #isAbstract) do: [:class |
		class addToSuiteFromSelectors: suite].
	^ suite