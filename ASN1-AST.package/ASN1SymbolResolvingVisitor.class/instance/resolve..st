as yet unclassified
resolve: anObject
	anObject isAsn1Node ifTrue: [  
		anObject isAsn1ReferenceNode ifTrue: [ 
			^ self resolveReference: anObject ].
		anObject isTypeNode ifTrue: [ 
			^ anObject ].
		anObject isValueNode ifTrue: [ 
			^ anObject ]].
	anObject isString ifTrue: [ 
		^ self resolveLabel: anObject ].
	self halt.