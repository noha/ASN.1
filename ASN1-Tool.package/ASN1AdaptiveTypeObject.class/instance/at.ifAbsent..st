accessing
at: aKey ifAbsent: aBlock
	| fieldType  |
	map at: aKey ifPresent: [ : value |  ^ value ].  
	
	fieldType := self basicTypeAt: aKey ifAbsent: aBlock.
	
	selfExpanding 
		ifTrue: [ | object | 
			(fieldType isAsn1Primitive and: [ fieldType isAsn1ExternalType not ]) ifTrue: [ ^ nil ].
			object := self objectFor: aKey type: fieldType.
			^ map at: aKey put: object ] 
		ifFalse: [ ^ nil ] 
