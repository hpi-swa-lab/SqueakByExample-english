export
open

	"Hacked - don't use #openAsMorph because this would open our picture in the helper's world"
	(Project current world instVarNamed: #worldState) hands first
		attachMorph: self picture asMorph