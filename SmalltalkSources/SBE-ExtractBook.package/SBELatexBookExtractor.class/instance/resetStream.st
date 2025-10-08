private
resetStream

	stream := TextStream on: Text new.
	previousLineBreaks := 0.
	labels := Dictionary new.