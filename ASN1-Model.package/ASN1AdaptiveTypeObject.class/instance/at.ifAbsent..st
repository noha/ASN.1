accessing
at: aKey ifAbsent: aBlock
	"a value can be one of three types: primitive, adaptive type or encoded value. In the
	first case we want to return the unwrapped value. This is to deliver a convenient API
	where reading values is easy. In the latter two type cases we just deliver themselves.
	If it is a adaptive type we return it so we can have message chaining while accessing
	the structure. If it is an encoded value we need to return it as a intact whole"
	| fieldType  |
	map at: aKey ifPresent: [ : value |  
		(value isAsn1Composite | value isAsn1EncodedValue) ifTrue: [ ^ value ].
			^ value contents ].  
	
	"lookup field type to trigger an early exception if a field is not defined
	for this type"
	fieldType := self basicTypeAt: aKey.
	
	^ selfExpanding 
		ifTrue: [ 
			(fieldType isAsn1Primitive and: [ fieldType isAsn1ExternalType not ]) ifTrue: [ ^ nil ].
			self expandFieldNamed: aKey type: fieldType ] 
		ifFalse: [ aBlock value] 
