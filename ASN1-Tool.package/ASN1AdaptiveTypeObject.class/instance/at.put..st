accessing
at: aKey put: anObject

	(self basicTypeAt: aKey) validateValue: anObject.
	^ map at: aKey put: anObject