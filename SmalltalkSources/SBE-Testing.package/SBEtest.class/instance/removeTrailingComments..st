initialize-release
removeTrailingComments: testResult
	^ testResult copyWithRegex: '\s*".*$' matchesReplacedWith: ''.