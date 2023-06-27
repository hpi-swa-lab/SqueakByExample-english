Display uiScaleFactor: 1.0; flag: #workaround. "smalltalkCI: default scale factor in Squeak64-6.0 image is wrong (https://github.com/hpi-swa/smalltalkCI/issues/569)"

SystemVersion current version = 'Squeak6.0' ifTrue: [
	"Install latest updates which fix some stuff needed for figure generation"
	MCMcmUpdater
		updateFromServer;
		flag: #workaround "smalltalkCI: always install latest image (https://github.com/hpi-swa/smalltalkCI/issues/560)"].

[SBEFigureBuilder generateBuildersIn: SBEFigureBuilder resourceDirectory]
	valueSuppressingMessages: #('*safety checks*').
