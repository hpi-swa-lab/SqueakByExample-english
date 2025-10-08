as yet unclassified
compressImage

	self basicImage become:
		(ByteArray streamContents: [:stream | PNGReadWriter putForm: self basicImage onStream: stream]).

	"For SBE 6.0:
	* uncompressed Forms: ~440 MB
	* hibernated Forms: ~60 MB
	* PNG ByteArrays: ~45 MB
		... but after uncompressing again from PNG, we are just at ~110 MB?
	Anyway, PNG is smallest and compresses fast enough for browsing in the HelpBrowser. SBEHelp book fullText edit takes ~15 seconds.
	(don't quote me on those numbers, i only compared rss)"