private
withCommandArguments: arguments do: aBlock

	| previousArguments |
	previousArguments := commandArguments.
	commandArguments := arguments.
	^ aBlock ensure:
		[commandArguments := previousArguments]