as yet unclassified
dieValue: aNumber
   (aNumber isInteger
         and: [aNumber > 0]
         and: [aNumber <= faces])
      ifTrue:
         [dieValue := aNumber.
         self changed]