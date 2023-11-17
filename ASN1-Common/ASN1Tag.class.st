Class {
	#name : #ASN1Tag,
	#superclass : #Object,
	#instVars : [
		'clazz',
		'number'
	],
	#category : 'ASN1-Common'
}

{ #category : #'as yet unclassified' }
ASN1Tag class >> classLabelOf:  aNumber [
	| label |
	label := aNumber bitAnd: 3.
	(label = 0) ifTrue: [
		^ 'UNIVERSAL' ].
	(label = 1) ifTrue: [
		^ 'APPLICATION' ].
	(label = 2) ifTrue: [
		^ nil ].
	(label = 3) ifTrue: [
		^ 'PRIVATE' ].
	Error signal: 'invalid tag class number'
]

{ #category : #'as yet unclassified' }
ASN1Tag class >> classNumberOf: aString [
	(aString = 'UNIVERSAL') ifTrue: [
		^ 0 ].
	(aString = 'APPLICATION') ifTrue: [
		^  1 ].
	aString isNil ifTrue: [
		^ 2 ].
	(aString = 'PRIVATE') ifTrue: [
		^ 3 ].
	Error signal: 'class identifier cannot be found'
]

{ #category : #'as yet unclassified' }
ASN1Tag class >> clazz: aString number: aNumber [
	^ self new
		clazz: aString;
		number: aNumber
]

{ #category : #comparing }
ASN1Tag >> = aTag [
	^ (clazz = aTag clazz) and: [ number = aTag number ]
]

{ #category : #accessing }
ASN1Tag >> clazz [
	^ clazz
]

{ #category : #accessing }
ASN1Tag >> clazz: anObject [
	clazz := anObject
]

{ #category : #accessing }
ASN1Tag >> clazzIdentifier [
	^ self class classNumberOf: clazz
]

{ #category : #accessing }
ASN1Tag >> clazzString [
	^ clazz ifNil: [ 'CONTEXT' ]
]

{ #category : #comparing }
ASN1Tag >> hash [
	^ clazz hash bitXor: number hash
]

{ #category : #testing }
ASN1Tag >> isLabelled: aString [
	 ^ ($: split: aString) asArray = { self clazzString  . number asString }

]

{ #category : #accessing }
ASN1Tag >> number [
	^ number
]

{ #category : #accessing }
ASN1Tag >> number: anObject [
	number := anObject
]

{ #category : #printing }
ASN1Tag >> printOn: aStream [
	aStream
		nextPutAll: (self clazz ifNil: [ 'CONTEXT' ]);
		nextPut: $:;
		nextPutAll: self number printString
]

{ #category : #'as yet unclassified' }
ASN1Tag >> writeOn: aStream constructed: constructed [
	| byte |
	byte := self clazzIdentifier bitShift: 6.
	constructed ifTrue: [
		byte := byte bitOr: 16r20 ].

	self number < 31
		ifTrue: [aStream nextPut: (byte bitOr: self number)]
		ifFalse: [
			| rest octets |

			rest := self number.

			"Add the last octet first"
			octets := OrderedCollection new.
			octets add: (rest bitAnd: 127).
			rest := rest bitShift: -7.
			[ rest > 0 ] whileTrue: [
				octets add: ((rest bitAnd: 127) bitOr: 128).
				rest := rest bitShift: -7.
			].
			aStream nextPut: (byte bitOr: 16r1F).
			octets reverseDo: [:each | aStream nextPut: each ].
		].
]
