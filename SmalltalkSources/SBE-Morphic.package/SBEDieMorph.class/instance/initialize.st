initialization
initialize
   super initialize.
   self extent: 50 @ 50.
   self useGradientFill; borderWidth: 2; useRoundedCorners.
   self setBorderStyle: #complexRaised.
   self fillStyle direction: self extent.
   self color: Color green.
   dieValue := 1.
   faces := 6.
   isStopped := false