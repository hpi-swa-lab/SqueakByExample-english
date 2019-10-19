event handling
mouseDown: anEvent
   anEvent redButtonPressed
      ifTrue: [isStopped := isStopped not]