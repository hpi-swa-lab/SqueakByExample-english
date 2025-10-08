private
nextText

	^ super nextText
		"preserve tabs"
		copyReplaceAll: '&nbsp;&nbsp;&nbsp;&nbsp;' asTextFromHtml
		with: String tab