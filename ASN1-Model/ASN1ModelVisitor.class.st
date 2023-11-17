Class {
	#name : #ASN1ModelVisitor,
	#superclass : #Object,
	#category : 'ASN1-Model-Visitor'
}

{ #category : #visiting }
ASN1ModelVisitor >> visit: anObject [
	^ anObject accept: self
]

{ #category : #'as yet unclassified' }
ASN1ModelVisitor >> visitAll: aCollection [
	aCollection isNil ifTrue: [ ^ nil ].
	^ aCollection collect: [:each|
		self visit: each ]
	
]

{ #category : #visiting }
ASN1ModelVisitor >> visitBitStringType: aBitStringType [
	^ self visitPrimitiveType: aBitStringType
]

{ #category : #visiting }
ASN1ModelVisitor >> visitBitStringValue: aBitStringValue [ 
	^ self visitPrimitiveValue: aBitStringValue 
]

{ #category : #visiting }
ASN1ModelVisitor >> visitBooleanType: aBooleanType [ 
	^ self visitPrimitiveType: aBooleanType 
]

{ #category : #visiting }
ASN1ModelVisitor >> visitChoiceType: aChoice [ 
	^ self visitCollection: aChoice
]

{ #category : #visiting }
ASN1ModelVisitor >> visitChoiceValue: aChoiceValue [ 
	^ aChoiceValue
]

{ #category : #visiting }
ASN1ModelVisitor >> visitClass: aClass [ 
	^ aClass
]

{ #category : #visiting }
ASN1ModelVisitor >> visitCollection: aCollection [ 
	self visitObject: aCollection.
	^ aCollection elements collect: [:each|
		self visit: each]
]

{ #category : #visiting }
ASN1ModelVisitor >> visitComponentType: aComponentType [
	"delegate to inner type"
	^ self visit: aComponentType type
]

{ #category : #visiting }
ASN1ModelVisitor >> visitEnumeratedType: aEnumerated [ 
	^ aEnumerated 
]

{ #category : #visiting }
ASN1ModelVisitor >> visitExtension: anExtension [ 
	^ anExtension
]

{ #category : #visiting }
ASN1ModelVisitor >> visitExternalType: anExternalType [ 
	^ self visitObject: anExternalType 
]

{ #category : #visiting }
ASN1ModelVisitor >> visitIA5StringType: anInteger [ 
	^ self visitPrimitiveType: anInteger
]

{ #category : #visiting }
ASN1ModelVisitor >> visitIntegerType: anInteger [ 
	^ self visitPrimitiveType: anInteger
]

{ #category : #visiting }
ASN1ModelVisitor >> visitIntegerValue: anIntegerValue [ 
	^ self visitPrimitiveValue: anIntegerValue 
]

{ #category : #visiting }
ASN1ModelVisitor >> visitModelRoot: aModelRoot [ 
	^ self visitAll: aModelRoot modules
]

{ #category : #visiting }
ASN1ModelVisitor >> visitModule: aModule [
	aModule fields do: [:each|
		self visit: each ].
	^ aModule
]

{ #category : #visiting }
ASN1ModelVisitor >> visitNullType: aNullType [ 
	^ self visitPrimitiveType: aNullType
]

{ #category : #visiting }
ASN1ModelVisitor >> visitNumericStringType: anOctetString [
	^ self visitPrimitiveType: anOctetString 
]

{ #category : #'as yet unclassified' }
ASN1ModelVisitor >> visitObject: anObject [
	^ anObject
]

{ #category : #visiting }
ASN1ModelVisitor >> visitObjectIdentifier: anOid [ 
	
]

{ #category : #'as yet unclassified' }
ASN1ModelVisitor >> visitObjectIdentifierType: anObjectIdentifier [ 
	^ self visitObject: anObjectIdentifier 
]

{ #category : #visiting }
ASN1ModelVisitor >> visitOctetString: anOctetString [
	^ self visitPrimitiveType: anOctetString 
]

{ #category : #visiting }
ASN1ModelVisitor >> visitOpenType: anOpenType [ 
	^ self visitObject: anOpenType 
]

{ #category : #visiting }
ASN1ModelVisitor >> visitPrimitiveType: aPrimitive [ 
	^ self visitObject: aPrimitive 
]

{ #category : #visiting }
ASN1ModelVisitor >> visitPrimitiveValue: anIntegerValue [ 
	^ anIntegerValue
]

{ #category : #visiting }
ASN1ModelVisitor >> visitPrintableString: aPrintableString [
	^ self visitPrimitiveType: aPrintableString 
]

{ #category : #visiting }
ASN1ModelVisitor >> visitSequenceType: aSequence [ 
	^ self visitCollection: aSequence
]

{ #category : #visiting }
ASN1ModelVisitor >> visitSet: aSet [
	^ aSet
]

{ #category : #visiting }
ASN1ModelVisitor >> visitTaggedType: aTaggedType [
	^ self visit: aTaggedType type
]

{ #category : #visiting }
ASN1ModelVisitor >> visitTypedCollection: aCollection [
	self visit: aCollection type.
	^ aCollection
]

{ #category : #visiting }
ASN1ModelVisitor >> visitTypedSequence: aSequence [ 
	^ self visitTypedCollection: aSequence
]

{ #category : #visiting }
ASN1ModelVisitor >> visitTypedSet: aSequence [ 
	^ self visitTypedCollection: aSequence
]

{ #category : #visiting }
ASN1ModelVisitor >> visitUTCTimeType: anUTCTimeType [ 
	^ self visitPrimitiveType: anUTCTimeType 
]
