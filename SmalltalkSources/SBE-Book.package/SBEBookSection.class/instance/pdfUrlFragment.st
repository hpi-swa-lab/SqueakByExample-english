accessing
pdfUrlFragment

	^ '{1}.{2}.{3}' format:
		{self typeName.
		self parent index.
		self index}