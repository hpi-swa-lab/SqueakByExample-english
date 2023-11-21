visiting
basicVisitGraphicsFile: file

	| image |
	image := file readStreamDo: [:fileStream |
		[ImageReadWriter formFromStream: fileStream]
			ifError:
				[('<error reading graphics>' asText
					addAttribute: TextColor red;
					asMorph)
						imageForm]].
	
	self emitImage: image.