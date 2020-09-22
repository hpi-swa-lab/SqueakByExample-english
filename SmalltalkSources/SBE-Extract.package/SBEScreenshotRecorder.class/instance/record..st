recording
record: aBlock

	^ worldHelper beActiveDuring: [aBlock value: self cull: worldHelper]