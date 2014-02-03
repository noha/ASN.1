visiting
visit: aNode
	aNode ifNil: [ ^ self  ].
	aNode providesScope 
		ifTrue: [
			self 
				pushScope: aNode 
				during: [ super visit: aNode ]  ]
		ifFalse: [  super visit: aNode ]