testing
hasField: aString
	^ ( self basicTypeAt: aString ifAbsent: [ ^ false ] ) notNil