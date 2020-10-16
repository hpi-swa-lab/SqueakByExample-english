private utils
useWorldAndHandDuring: aBlock

	{self world. self hand} do: [:ea |
		thisContext home wrap: [:block |
			ea becomeActiveDuring: block]].
	
	^ aBlock value