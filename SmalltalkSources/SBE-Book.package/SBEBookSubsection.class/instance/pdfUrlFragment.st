accessing
pdfUrlFragment

	^ '{1}.{2}' format:
		{self parent pdfUrlFragment. self index}