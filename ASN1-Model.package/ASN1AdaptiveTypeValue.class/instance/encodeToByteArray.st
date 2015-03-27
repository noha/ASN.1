converting
encodeToByteArray
	^ self modelRoot resolveOidsWhile: [ 
		self basicEncodeToByteArray ]