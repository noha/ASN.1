as yet unclassified
instantiateFieldAt: aString value: anObject
	^ (self fieldAt: aString) 
		dereferenced createInstance: anObject