visiting
visitReferenceNode: aReferenceNode

	^ aReferenceNode isDeclaration 
		ifTrue: [ super visitReferenceNode: aReferenceNode ]
		ifFalse: [ 
			self 
				useModule: (self visit: (aReferenceNode definition propertyAt: #definingModule)) 
				during: [ self visit: aReferenceNode definition ] ]