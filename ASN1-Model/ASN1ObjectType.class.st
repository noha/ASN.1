Class {
	#name : #ASN1ObjectType,
	#superclass : #ASN1TypeObject,
	#instVars : [
		'clazz',
		'attributes'
	],
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1ObjectType >> accept: aVisitor [ 
	^ aVisitor visitObject: self 
]

{ #category : #attributes }
ASN1ObjectType >> attributeAt: aString [
	^ attributes at: aString ifAbsent: [ nil ]
]

{ #category : #attributes }
ASN1ObjectType >> attributeAt: aString put: anObject [
	attributes at: aString put: anObject
]

{ #category : #accessing }
ASN1ObjectType >> clazz [
	^ clazz
]

{ #category : #accessing }
ASN1ObjectType >> clazz: anObject [
	clazz := anObject
]

{ #category : #finding }
ASN1ObjectType >> findElement: aBlock [ 
	(aBlock value: self)
		ifTrue: [ ^ self ]
		ifFalse: [
			attributes do: [:attr|
				attr isAsn1 ifTrue: [  
					(attr findElement: aBlock) ifNotNil: [:op|
						^ op]]]].
		^ nil
]

{ #category : #testing }
ASN1ObjectType >> includes: aType [
	^ (super includes: aType) or:[
		attributes values anySatisfy: [ :each | each isAsn1Type and: [ each includes: aType ]  ]  ]
]

{ #category : #'initialize-release' }
ASN1ObjectType >> initialize [ 
	super initialize.
	attributes := Dictionary new
]

{ #category : #'initialize-release' }
ASN1ObjectType >> initializeFromDict: aDictionary [
	attributes := aDictionary
]

{ #category : #'*asn1-model' }
ASN1ObjectType >> isAsn1Object [
	^ true
]
