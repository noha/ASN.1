testing
isUnresolved
	^ self isDeclaration not and: [ (self propertyAt: #definition ifAbsent: [ nil ]) isNil ]