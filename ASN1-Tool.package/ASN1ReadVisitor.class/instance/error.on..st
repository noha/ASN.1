as yet unclassified
error: anError on: anObject
	skipErrors 
		ifTrue: [  ^ anObject ]
		ifFalse: [ anError signal ]