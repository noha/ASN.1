accessing
tagEnvironment
	^ tagEnvironment ifNil: [
		tagEnvironment := self definingModule tagEnvironment ]