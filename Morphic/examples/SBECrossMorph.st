'From Squeak3.9gamma of ''23 July 2006'' [latest update: #7061] on 12 November 2006 at 11:36:23 am'!
Morph subclass: #SBECrossMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LesMorph'!

!SBECrossMorph methodsFor: 'drawing' stamp: 'HilaireFernandes 11/11/2006 10:24'!
drawOn: aCanvas 
	| aBounds crossHeight crossWidth |
	crossHeight := (self height / 3) asFloat.
	crossWidth := (self width / 3) asFloat.
	aBounds := self bounds top: self top + crossHeight.
	aBounds := aBounds bottom: self bottom - crossHeight.
	aCanvas fillRectangle: aBounds color: self color.
	aBounds := self bounds left: self left + crossWidth.
	aBounds := aBounds right: self right - crossWidth.
	aCanvas fillRectangle: aBounds color: self color.! !


!SBECrossMorph methodsFor: 'geometry testing' stamp: 'HilaireFernandes 11/11/2006 10:53'!
containsPoint: aPoint 
	| aBounds1 aBounds2 crossHeight crossWidth |
	crossHeight := (self height / 3) asFloat.
	crossWidth := (self width / 3) asFloat.
	aBounds1 := self bounds top: self top + crossHeight.
	aBounds1 := aBounds1 bottom: self bottom - crossHeight.
	aBounds2 := self bounds left: self left + crossWidth.
	aBounds2 := aBounds2 right: self right - crossWidth.
	^ (aBounds1 containsPoint: aPoint ) | (aBounds2 containsPoint: aPoint )! !


!SBECrossMorph methodsFor: 'events-processing' stamp: 'HilaireFernandes 11/12/2006 11:18'!
handleKeystroke: evt 
	| keyValue |
	keyValue := evt keyValue.
	keyValue = 30
		ifTrue: [self position: self position - (0 @ 1)].
	keyValue = 31
		ifTrue: [self position: self position + (0 @ 1)].
	keyValue = 29
		ifTrue: [self position: self position + (1 @ 0)].
	keyValue = 28
		ifTrue: [self position: self position - (1 @ 0)]! !

!SBECrossMorph methodsFor: 'events-processing' stamp: 'HilaireFernandes 11/12/2006 09:29'!
handlesMouseDown: anEvent 
	^ true! !

!SBECrossMorph methodsFor: 'events-processing' stamp: 'HilaireFernandes 11/12/2006 10:35'!
handlesMouseOver: anEvent 
	^ true! !

!SBECrossMorph methodsFor: 'events-processing' stamp: 'HilaireFernandes 11/12/2006 11:34'!
mouseDown: evt 
	evt redButtonPressed
		ifTrue: [self color: Color red].
	evt yellowButtonPressed
		ifTrue: [self color: Color blue].
	self changed! !

!SBECrossMorph methodsFor: 'events-processing' stamp: 'HilaireFernandes 11/12/2006 10:35'!
mouseEnter: evt 
	evt hand newKeyboardFocus: self! !

!SBECrossMorph methodsFor: 'events-processing' stamp: 'HilaireFernandes 11/12/2006 10:37'!
mouseLeave: evt 
	evt hand newKeyboardFocus: nil! !

!SBECrossMorph methodsFor: 'events-processing' stamp: 'HilaireFernandes 11/12/2006 11:29'!
step
	(self color diff: Color black)
			< 0.1
		ifTrue: [self color: Color red]
		ifFalse: [self color: self color darker]! !

!SBECrossMorph methodsFor: 'events-processing' stamp: 'HilaireFernandes 11/12/2006 11:26'!
stepTime
	^ 100! !
