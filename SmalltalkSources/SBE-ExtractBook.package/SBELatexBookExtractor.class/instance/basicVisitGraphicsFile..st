visiting
basicVisitGraphicsFile: file

	| image |
	image := file readStreamDo: [:fileStream |
		[ImageReadWriter formFromStream: fileStream]
			ifError:
				[('<error reading graphics>' asText
					addAttribute: (SBETextColor property: #errorColor scope: #TestRunner);
					addAttribute: TextFontChange font4;
					asMorph)
						imageForm
							magnifyBy: self imageScaleFactor]].
	
	self emitImage: image.