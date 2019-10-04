private
mapButtons: someMouseButtons
	"Maps symbols to the integer equivalent used by morphic events."
	
	^ someMouseButtons
		inject: 0
		into: [:mask :buttonSymbol | mask bitOr: (self mapButton: buttonSymbol)]