as yet unclassified
faces: aNumber
   "Set the number of faces"
   (aNumber isInteger
         and: [aNumber > 0]
         and: [aNumber <= 9])
      ifTrue: [faces := aNumber]