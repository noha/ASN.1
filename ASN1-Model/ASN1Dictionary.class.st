Class {
	#name : #ASN1Dictionary,
	#superclass : #ASN1Composite,
	#instVars : [
		'keys',
		'values'
	],
	#category : 'ASN1-Model'
}

{ #category : #converting }
ASN1Dictionary >> asAsn1Dictionary [
	^ self 
]

{ #category : #converting }
ASN1Dictionary >> asDictionary [
	| dict |
	dict := Dictionary new.
	self keysAndValuesDo: [ :key :value |
		dict at: key put: value ].
	^ dict
]

{ #category : #accessing }
ASN1Dictionary >> at: aKey [
	| index |
	index := keys indexOf: aKey.
	^ (index > 0)
		ifTrue: [ values at: index ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
ASN1Dictionary >> at: anObject ifAbsent: aBlock [
	^ (self at: anObject) ifNil: aBlock
]

{ #category : #accessing }
ASN1Dictionary >> at: anObject ifPresent: aBlock [
	^ (self at: anObject) ifNotNil: aBlock
]

{ #category : #accessing }
ASN1Dictionary >> at: aKey put: anObject [
	(keys includes: aKey)
		ifTrue: [ 
			values 
				at: (keys indexOf: aKey ) 
				put: anObject ]
		ifFalse: [
			keys add: aKey.
			values add: anObject ]
]

{ #category : #'as yet unclassified' }
ASN1Dictionary >> basicFind: aKey [
	self 
		at: aKey 
		ifPresent: [:elem| ^ elem ].
	^ self find: aKey in: values  
]

{ #category : #copying }
ASN1Dictionary >> copyFrom: aASN1Dictionary [ 
	aASN1Dictionary keys do: [ :key |
		self at: key put: (aASN1Dictionary at: key) ].
]

{ #category : #'as yet unclassified' }
ASN1Dictionary >> doesNotUnderstand: aMessage [
	aMessage selector isUnary
		ifTrue: [ ^ self at: aMessage selector asString asn1Denormalized  ].
	(aMessage arguments size = 1) ifTrue: [
		^ self at: aMessage selector asString asn1Denormalized  put: aMessage arguments first ].
	^ super doesNotUnderstand: aMessage 
]

{ #category : #accessing }
ASN1Dictionary >> externalValue [
	^ self
]

{ #category : #testing }
ASN1Dictionary >> includesKey: anObject [
	^ keys includes: anObject
]

{ #category : #'as yet unclassified' }
ASN1Dictionary >> initialize [
	super initialize.
	keys := OrderedCollection new.
	values := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
ASN1Dictionary >> keys [
	^ keys
]

{ #category : #accessing }
ASN1Dictionary >> keysAndValuesDo: aBlock [
	^ (1 to: keys size) do: [:index|
		aBlock value: (keys at: index) value: (values at: index)]
]

{ #category : #accessing }
ASN1Dictionary >> privAt: aKey [
	^ self at: aKey
]

{ #category : #'as yet unclassified' }
ASN1Dictionary >> removeKey: anObject [
	| index |
	index := keys indexOf: anObject.
	(index > 0)
		ifTrue: [ 
			keys removeAt: index.
			values removeAt: index  ]
]

{ #category : #'as yet unclassified' }
ASN1Dictionary >> size [
	^ keys size
]

{ #category : #validating }
ASN1Dictionary >> validate [
	
]

{ #category : #accessing }
ASN1Dictionary >> valueForKey: aKey type: aType [
	^ self class new
]

{ #category : #'as yet unclassified' }
ASN1Dictionary >> values [
	^ values
]
