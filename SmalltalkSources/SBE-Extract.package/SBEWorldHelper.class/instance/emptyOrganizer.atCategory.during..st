utils
emptyOrganizer: organizer atCategory: category during: aBlock

	| elements |
	elements := organizer listAtCategoryNamed: category.
	^ [elements do: [:element |
		self environment organization classify: element under: 'Old-' , category].
	aBlock value]
		ensure: [
			elements do: [:element |
				organizer classify: element under: category]]