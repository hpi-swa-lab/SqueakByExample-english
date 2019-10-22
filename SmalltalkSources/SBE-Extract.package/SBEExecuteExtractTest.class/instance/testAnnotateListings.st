as yet unclassified
testAnnotateListings

	| dir matches pathMatcher scripts |
	dir := FileDirectory default / 'gitWin' / 'SqueakByExample-english'.
pathMatcher := '\.package[\/\\](.*)\.(class|extension)[\/\\]' asRegex.
scripts := (dir asFSReference / 'ListingSources') allFiles
	select: [:file | '*st' match: file extension].
matches := (scripts gather: [:file | (pathMatcher submatchesIn: file fullName) collect: [:match | file -> match second]]) as: Dictionary.
matches keysAndValuesDo: [:file :class | file writeStreamDo: [:stream |
	stream
		<< class;
		<< #>>>;
		<< (file contents lines allButFirst joinSeparatedBy: String cr)]].