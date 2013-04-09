accessing
tagEnvironment
	^ (self propertyAt: #tagEnvironment) ifNil: [
		self definingModule tagEnvironment ]