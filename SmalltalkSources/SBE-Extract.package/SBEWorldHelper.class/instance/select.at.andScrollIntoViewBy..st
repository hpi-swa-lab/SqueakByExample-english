utils
select: aMorph at: anItemMatch andScrollIntoViewBy: aScrollOffset

	self select: aMorph at: anItemMatch.
	aScrollOffset
		timesRepeat: [self keyStroke: aMorph key: Character arrowDown];
		timesRepeat: [self keyStroke: aMorph key: Character arrowUp].