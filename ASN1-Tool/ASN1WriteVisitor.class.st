Class {
	#name : #ASN1WriteVisitor,
	#superclass : #ASN1ModelVisitor,
	#instVars : [
		'currentValue'
	],
	#category : 'ASN1-Tool-Visitor'
}

{ #category : #exceptions }
ASN1WriteVisitor >> mandatoryElementNotFound [
	ASN1MandatoryElementNotFound signal
]

{ #category : #'as yet unclassified' }
ASN1WriteVisitor >> push: anObject during: aBlock [
	|  formerValue |
	anObject ifNil: [  Error signal: 'cannot push nil onto stack' ].
	formerValue := currentValue.
	currentValue := anObject.
	^aBlock ensure: [ currentValue := formerValue ]
]

{ #category : #visiting }
ASN1WriteVisitor >> visit: aType [
	(aType isNil ifTrue: [ Error signal: 'type cannot be nil' ]).
	"we need either a ASN.1 value object or an already encoded value"
	(currentValue isAsn1Value or: [ currentValue isAsn1EncodedValue ]) ifFalse: [ 
		Error signal: 'currentValue is not an ASN.1 value' ].
	( aType matchesValue: currentValue ) ifFalse: [ 
		Error signal: 'mismatch in type hierarchy: got ', aType class name, ' but got ', currentValue class name ].
	^ super visit: aType
]

{ #category : #visiting }
ASN1WriteVisitor >> visitChoiceType: aChoice [
	| key type  |
	key := currentValue keys first.
	type := (aChoice elements associations detect: [:each| each key = key asn1Denormalized ]) value.
	^ self
		push: (currentValue privAt: key)
		during: [ self visit: type ].
]

{ #category : #visiting }
ASN1WriteVisitor >> visitEnumeratedType: anEnumerated [
	
	^ currentValue encodedValue
]

{ #category : #visiting }
ASN1WriteVisitor >> visitExternalType: anExternalType [
	| encoded module   |
	encoded := ASN1EncodedConstructedValue new
		tag: anExternalType universalTag.
		
	encoded add: 	(ASN1ObjectIdentifierType new encodedValue: (currentValue oid)).
	module := (ASN1UnresolvedOid oid: currentValue oid) signal.
	encoded add:  (ASN1EncodedConstructedValue new
		tag: (ASN1Tag new number: 0);
		add: (self class new
		write: currentValue externalValue
		usingModule: module)) .
		
	^ encoded


]

{ #category : #visiting }
ASN1WriteVisitor >> visitObjectIdentifierType: anObjectIdentifier [ 	
	^ anObjectIdentifier encodedValue: currentValue contents.

]

{ #category : #visiting }
ASN1WriteVisitor >> visitOpenType: anOpenType [
	self flag: #hack.
	"oid := ASN1OpenTypeDefinition signal."
	^ currentValue isAsn1EncodedValue 
		ifTrue: [ currentValue ]
		ifFalse: [ 
			self push: currentValue contents 
			during: [self visit: currentValue type ] ]
]

{ #category : #visiting }
ASN1WriteVisitor >> visitPrimitiveType: aPrimitiveType [
	(currentValue type class = aPrimitiveType class) ifFalse: [ Error signal: 'primitive types do not match' ].
	^ currentValue encodedValue "aPrimitive encodedValue: currentValue value"
]

{ #category : #visiting }
ASN1WriteVisitor >> visitSequenceType: aSequence [ 
	|  encoded object |
	encoded := ASN1EncodedConstructedValue new
		tag: aSequence universalTag.
	aSequence hasElements ifFalse: [ ^ encoded ].
	object := currentValue "basicValue".
	aSequence elements associations do:  [ :each |
		(each value class = ASN1Extension) ifFalse: [   
			(object includesKey: each key) 
				ifTrue: [ 
					self 
						push: (object privAt: each key)
						during: [ encoded elements add: (self visit: (aSequence elementAt: each key)) ]]
				ifFalse: [
					each value isOptional
						ifTrue: [ each value hasDefaultValue ifTrue: [ 
							self 
								push: each value defaultValue 
								during: [ encoded elements add: (self visit: (aSequence elementAt: each key) value) ] ] ]
						ifFalse: [ self mandatoryElementNotFound ] ] ] ].
	^ encoded
]

{ #category : #visiting }
ASN1WriteVisitor >> visitTaggedType: aTaggedType [ 
	"tag the type based on the existance of an explicit tag and itsaTaggedType
	tag environment"
	^ aTaggedType encodeTaggedValue: (
		self 
			push: currentValue value 
			during: [ self visit: aTaggedType type ])
]

{ #category : #visiting }
ASN1WriteVisitor >> visitTypedCollection: aTypedSequence [ 
	"All elements that are on the top of the stack are encoded with the type
	of the typed sequence"
	|  encoded |
	encoded := ASN1EncodedConstructedValue new
		tag: aTypedSequence universalTag.
	currentValue elements do: [:assoc|
		self 
			push: assoc
			during: [ encoded elements add: (self visit: aTypedSequence type) ]].
	^ encoded
]

{ #category : #writing }
ASN1WriteVisitor >> write: anObject using: anAsn1Type [
	currentValue := anObject.
	^ self visit: anAsn1Type

]

{ #category : #writing }
ASN1WriteVisitor >> write: anObject usingModule: aModule [
	currentValue := anObject.
	^ self visit: aModule pdu
	

]
