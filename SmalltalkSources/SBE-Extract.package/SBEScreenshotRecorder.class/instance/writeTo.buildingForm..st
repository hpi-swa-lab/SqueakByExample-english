saving
writeTo: aFileString buildingForm: aBuildBlock

	^ self
		writeScene: (SBEFormScene building: aBuildBlock)
		to: aFileString