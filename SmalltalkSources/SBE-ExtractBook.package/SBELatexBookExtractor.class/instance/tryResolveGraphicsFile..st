resolving
tryResolveGraphicsFile: fileName

	^ self
		tryResolveFile: fileName
		extensions: graphicsExtensions
		paths: graphicsPath