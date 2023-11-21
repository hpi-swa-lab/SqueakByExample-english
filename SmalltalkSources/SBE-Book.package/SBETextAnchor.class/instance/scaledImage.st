accessing
scaledImage

	^ scaledImage ifNil:
		[| image scaledExtent |
		image := self image.
		
		scaledExtent := self extent
			caseOf:
				{[#inline] -> [image extent * (TextStyle defaultFont height / image height)].
				[nil] -> [image extent * RealEstateAgent scaleFactor]}
			otherwise: [:point | point * RealEstateAgent scaleFactor].
		image := image scaledToSize: scaledExtent.
		
		self dyeMode ifNotNil:
			[image := image dyed:
				(self dyeMode caseOf:
					{[#dockingLogoColor] -> [self userInterfaceTheme theme get: #logoColor for: #TheWorldMainDockingBar]})].
		
		scaledImage := image]