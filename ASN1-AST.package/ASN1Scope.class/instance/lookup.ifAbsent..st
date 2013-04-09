resolving
lookup: aString ifAbsent: aBlock
	^ (self bindingOf: aString) ifNil: [ 
		parent ifNil: [ aBlock value ].
		parent lookup: aString ifAbsent: aBlock ]