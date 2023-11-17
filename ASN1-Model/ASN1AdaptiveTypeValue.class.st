Class {
	#name : #ASN1AdaptiveTypeValue,
	#superclass : #ASN1ValueObject,
	#category : 'ASN1-Model'
}

{ #category : #'instance-creation' }
ASN1AdaptiveTypeValue class >> asAsn1TypeIn: aContext [
	^  (aContext bindingNamed: self asn1TypeName) value
]

{ #category : #accessing }
ASN1AdaptiveTypeValue class >> asn1TypeName [
	self subclassResponsibility 
]

{ #category : #'instance-creation' }
ASN1AdaptiveTypeValue class >> type: aType [
	^ self new
		type: aType
]

{ #category : #accessing }
ASN1AdaptiveTypeValue >> baseValue [
	^ self
]

{ #category : #finding }
ASN1AdaptiveTypeValue >> find: aKey [
	^ self basicFind: aKey
]

{ #category : #finding }
ASN1AdaptiveTypeValue >> find: aKey in: aCollection [
	aCollection do: [:each|
		each isAsn1Composite ifTrue: [
			(each basicFind: aKey) ifNotNil: [:elem|
				^ elem ]]].
	^ nil
]

{ #category : #testing }
ASN1AdaptiveTypeValue >> isAsn1Composite [
	^ true
]

{ #category : #accessing }
ASN1AdaptiveTypeValue >> mapKeyForMessage: aMessage [
	^ aMessage selector asString asn1Denormalized
]

{ #category : #accessing }
ASN1AdaptiveTypeValue >> selfExpanding: aBoolean [
]

{ #category : #validating }
ASN1AdaptiveTypeValue >> validate [
	type ifNil: [ Error signal: 'type is nil' ].
	type validate: self
]
