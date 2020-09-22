utils
scrollSelectionsIntoView: aMorph

	aMorph fullBounds. "Avoid possible layout issues"
	(aMorph submorphsSatisfying: [:morph | morph respondsTo: #scrollSelectionIntoView])
		do: #scrollSelectionIntoView.
