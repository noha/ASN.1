replacing
replaceContentFrom: anObject
	(anObject hasSameType: type) ifFalse: [ Error signal: 'cannot exchange content from different types' ].
	anObject copyContentTo: self.