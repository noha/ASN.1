Class {
	#name : #ASN1ChoiceType,
	#superclass : #ASN1CollectionType,
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1ChoiceType >> accept: aVisitor [ 
	^ aVisitor visitChoiceType: self 
]

{ #category : #testing }
ASN1ChoiceType >> includesTag: aTag [
	^ (self elements 
		detect: [:each| each value includesTag: aTag ]
		ifNone: [ nil ]) notNil
]

{ #category : #accessing }
ASN1ChoiceType >> tagEnvironment [ 
	^ ASN1ExplicitTags 
]

{ #category : #validating }
ASN1ChoiceType >> validate: aValue [ 

	(aValue size = 1) ifFalse: [ 
		Error signal: 'object contains more than one key which is not valid for a choice type' ].
	(elements anySatisfy: [ :each | each key = aValue keys first]) ifFalse: [ 
		Error signal: 'key in object does not match type' ].
	self 
		validateType: ( self elementAt: aValue keys first ) value
		value: aValue values first

]
