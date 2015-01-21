creating
new: anObject
	anObject isBlock ifTrue: [ 
		^ anObject cull: self  ].
	^anObject  dispatchInstanceCreationOn: self