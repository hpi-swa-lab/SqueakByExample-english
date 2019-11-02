*SBE-Extract-active process
spawnNewProcessDuring: aBlock
	"Keep UI responsible during aBlock. Warning: aBlock must not change the ui process, e. g. by raising an UnhandledError."

	| result |
	self flag: #ct "Not tested outside of Morphic, thus not implemented in superclass so far".
	(Project current spawnNewProcessIfThisIsUI: Processor activeProcess)
		ifFalse: [^ aBlock value].
	result := aBlock value.
	Project current uiProcess terminate.
	Project current uiProcess: Processor activeProcess.
	^ result