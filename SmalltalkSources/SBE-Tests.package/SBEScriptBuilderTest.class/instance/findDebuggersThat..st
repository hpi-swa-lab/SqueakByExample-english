private
findDebuggersThat: aBlock

	^ SystemWindow
		windowsIn: World
		satisfying: [:window |
			(window model isKindOf: Debugger)
				and: [aBlock value: window]]