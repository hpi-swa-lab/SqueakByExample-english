documentation
example

	| book dir |
	dir := FileSystem disk root resolve: '/path/to/SqueakByExample-english'.
	book := SBEBookExtractor new
		imageScaleFactor: 2.5;
		extractFromRootFile: dir / 'SBE.tex';
		book.
	"SBEHelp book: book."
	^ book asHelpTopic open