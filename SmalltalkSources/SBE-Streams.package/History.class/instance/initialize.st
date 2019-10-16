initialize-release
initialize
	super initialize.
	stream := ReadWriteStream on: Array new.