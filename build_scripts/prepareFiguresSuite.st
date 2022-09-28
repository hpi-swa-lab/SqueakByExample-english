Display uiScaleFactor: 1.0; flag: #workaround. "smalltalkCI: default scale factor in Squeak64-6.0 image is wrong (https://github.com/hpi-swa/smalltalkCI/issues/569)"
[SBEFigureBuilder generateBuildersIn: SBEFigureBuilder resourceDirectory]
	valueSuppressingMessages: #('*safety checks*').
