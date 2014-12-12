accessing
at: aKey ifAbsent: aBlock
	| fieldType  |
	map at: aKey ifPresent: [ : value |  ^ value ].  
	
	fieldType := self basicTypeAt: aKey.
	
	^ selfExpanding 
		ifTrue: [ 
			(fieldType isAsn1Primitive and: [ fieldType isAsn1ExternalType not ]) ifTrue: [ ^ nil ].
			self expandKey: aKey ] 
		ifFalse: [ aBlock value] 
