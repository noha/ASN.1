accessing
tagEnvironment
	^ tagEnvironment ifNil: [
		tagEnvironment := self module tagEnvironment ]