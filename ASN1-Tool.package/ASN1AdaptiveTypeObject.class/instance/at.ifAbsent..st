accessing
at: aKey ifAbsent: aBlock
	| fieldType object |
	map at: aKey ifPresent: [ : value |  ^ value ].  
	
	fieldType := self basicTypeAt: aKey ifNone: aBlock.
	(fieldType isAsn1Primitive and: [ fieldType isAsn1ExternalType not ]) ifTrue: [ ^ nil ].

	object := self objectFor: aKey type: fieldType.
	
	"(fieldType class = ASN1ExternalType) ifTrue: [ 
			fieldType := object type. ]."
	
	^ map at: aKey put: object