accessing
at: aKey ifAbsent: aBlock
	| fieldType  |
	map at: aKey ifPresent: [ : value |  ^ value ].  
	
	"lookup field type to trigger an early exception if a field is not defined
	for this type"
	fieldType := self basicTypeAt: aKey.
	
	^ selfExpanding 
		ifTrue: [ 
			(fieldType isAsn1Primitive and: [ fieldType isAsn1ExternalType not ]) ifTrue: [ ^ nil ].
			self expandFieldNamed: aKey type: fieldType ] 
		ifFalse: [ aBlock value] 
