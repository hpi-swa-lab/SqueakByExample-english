as yet unclassified
mouseDown: anEvent
   anEvent redButtonPressed
      ifTrue: [isStopped := isStopped not]