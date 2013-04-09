visiting
visitReferenceNode: aReferenceNode

	^ aReferenceNode isDeclaration 
		ifTrue: [ super visitReferenceNode: aReferenceNode ]
		ifFalse: [ 
			self 
				useModule: (self visit: aReferenceNode module) 
				during: [ self visit: aReferenceNode definition ] ]