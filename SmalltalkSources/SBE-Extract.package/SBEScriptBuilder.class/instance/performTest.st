private
performTest

	Transcript showln: 'Running test '; show: self.
	^ self executeSafely: [super performTest]