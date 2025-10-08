documentation
example

	| book dir |
	dir := FileSystem disk root resolve: '/path/to/SqueakByExample-english'.
	book := SBEBookExtractor new
		imageScaleFactor: 2.5;
		squeakVersion: (SystemVersion new version: 'Squeak6.0');
		extractFromRootFile: dir / 'SBE.tex';
		book.
	book pdfUrl: 'https://github.com/hpi-swa-lab/SqueakByExample-english/releases/download/6.0/SBE-6.0.pdf'.
	"SBEHelp book: book."
	^ book asHelpTopic open