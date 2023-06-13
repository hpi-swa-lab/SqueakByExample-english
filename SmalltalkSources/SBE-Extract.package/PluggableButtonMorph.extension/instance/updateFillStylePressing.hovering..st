*SBE-Extract-debug-override
updateFillStylePressing: isPressing hovering: isHovering

	| gradient cc |
	((Smalltalk at: #SBEDebugUpdateFillStye ifAbsent: []) = true and: [self model isKindOf: ObjectExplorer]) ifTrue: [
		Transcript showln: {self. isPressing. isHovering. self currentEvent. (String streamContents: [:s | thisContext errorReportOn: s])}].
	
	"Migrate old instances."
	hoverColor ifNil: [hoverColor := onColor darker].
	
	self labelOffset: (isPressing ifTrue: [1@1] ifFalse: [0@0]).
	
	self getModelState
		ifTrue: [self color: onColor]
		ifFalse: [self color: offColor].
	self borderStyle color: borderColor.
	
	self wantsGradient ifFalse: [
		isPressing ifTrue: [
			self color: feedbackColor.
			self borderStyle color: feedbackColor muchDarker].
		isHovering ifTrue: [
			self color: hoverColor.
			self borderStyle color: borderColor].
		^ self].
	
	isPressing ifTrue: [
		cc := feedbackColor.
		self borderColor: feedbackColor muchDarker.
		gradient := GradientFillStyle ramp: {
			0.0 -> cc muchDarker.
			0.1-> (cc adjustBrightness: -0.2).
			0.5 -> cc.
			0.9-> (cc adjustBrightness: -0.1).
			1 -> cc muchDarker}].
	isHovering ifTrue: [
		cc := hoverColor.
		gradient := GradientFillStyle ramp: {
			0.0 -> Color white.
			0.1-> (cc adjustBrightness: 0.05).
			0.6 -> (cc darker)}].
	gradient ifNil: [
		cc := self color.
		gradient := GradientFillStyle ramp: {
			0.0 -> Color white.
			0.1-> (cc adjustBrightness: 0.05).
			0.6 -> (cc darker)}].
		
	gradient origin: bounds topLeft.
	gradient direction: 0@self height.
	
	self fillStyle: gradient.