comparing
= aObjectIdNode
	(self class = aObjectIdNode class) ifFalse: [ ^ false ].
	^ self components = aObjectIdNode components