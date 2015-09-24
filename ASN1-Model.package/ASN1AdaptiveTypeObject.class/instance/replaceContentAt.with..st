replacing
replaceContentAt: key with: anObject
	self removeKey: key ifAbsent: [].
	(self expandFieldNamed: key) replaceContentFrom: anObject