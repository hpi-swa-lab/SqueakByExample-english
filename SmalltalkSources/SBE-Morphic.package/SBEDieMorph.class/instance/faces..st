die logic
faces: aNumber
   "Set the number of faces"
   (aNumber isInteger and: [aNumber between: 1 and: 9])
      ifTrue: [faces := aNumber]