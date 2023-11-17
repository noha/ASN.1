Class {
	#name : #ASN1ObjectIdComponentNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'name',
		'number'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'instance creation' }
ASN1ObjectIdComponentNode class >> definedName: aString [
	^ self new
		name: aString;
		number: (self definedNumbers at: aString)
]

{ #category : #accessing }
ASN1ObjectIdComponentNode class >> definedNumbers [
	self flag: #needsredesign.
	^ Dictionary new
		at: 'itu-t' put: 0;
		at: 'joint-iso-itu-t' put: 2;
		at: 'recommendation' put: 0;
		at: 'q' put: 17;
		at: '773' put: 773;
		at: '775' put: 775;
		at: '1218' put: 1218;
		at: '1228' put: 1228;
		yourself
]

{ #category : #testing }
ASN1ObjectIdComponentNode class >> isDefinedName: aString [
	self definedNumbers 
		at: aString
		ifPresent: [ ^ true ].
	^ false
]

{ #category : #'instance creation' }
ASN1ObjectIdComponentNode class >> name: aString [
	^ self new
		name: aString
]

{ #category : #'instance creation' }
ASN1ObjectIdComponentNode class >> name: aString number: aNumber [
	^ self new
		name: aString;
		number: aNumber
]

{ #category : #'instance creation' }
ASN1ObjectIdComponentNode class >> nodes: anObject [
	anObject isAsn1Node ifTrue: [ ^ anObject ].
	anObject isNumber ifTrue: [
		^ self number: anObject ].
	self definedNumbers
		at: anObject
		ifPresent: [:num|
			 ^ self new
				name: anObject;
				number: num ].
	^ anObject asn1Reference 
]

{ #category : #'instance creation' }
ASN1ObjectIdComponentNode class >> number: aNumber [
	^ self new
		number: aNumber
]

{ #category : #comparing }
ASN1ObjectIdComponentNode >> = aObjectIdComponent [
	(self name notNil and: [ aObjectIdComponent name notNil ]) ifTrue: [
		^ self name = aObjectIdComponent name ].
	^ self number = aObjectIdComponent number
]

{ #category : #visiting }
ASN1ObjectIdComponentNode >> accept: aVisitor [ 
	^ aVisitor visitObjectIdComponentNode: self
]

{ #category : #comparing }
ASN1ObjectIdComponentNode >> hash [
	(self name notNil) ifTrue: [
		^ self name hash].
	^ self number hash
]

{ #category : #accessing }
ASN1ObjectIdComponentNode >> name [
	^ name
]

{ #category : #accessing }
ASN1ObjectIdComponentNode >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASN1ObjectIdComponentNode >> nodes: aCollectionOrString [
	(aCollectionOrString isString or: [aCollectionOrString isAsn1Node ]) ifTrue: [
		name := aCollectionOrString.
		^ self ].
	name := aCollectionOrString first.
	number := aCollectionOrString second
	
	
]

{ #category : #accessing }
ASN1ObjectIdComponentNode >> number [
	^ number ifNil: [
		number :=  self resolveOidName: name asString ]
]

{ #category : #accessing }
ASN1ObjectIdComponentNode >> number: anObject [
	number := anObject
]

{ #category : #printing }
ASN1ObjectIdComponentNode >> printNumberOn: aStream [
	self flag: #needsRedesign.
	self number 
		ifNotNil: [ aStream nextPutAll: number asString ]
		ifNil: [ aStream nextPutAll: 'N/A' ]
]

{ #category : #printing }
ASN1ObjectIdComponentNode >> printOn: aStream [
	aStream 
		nextPutAll: self name printString;
		nextPutAll: ' (';
		nextPutAll: self number printString;
		nextPut: $)
]

{ #category : #testing }
ASN1ObjectIdComponentNode >> resolveOidName: aString [
	^ self class definedNumbers 
		at: aString 
		ifAbsent: [
			[ Number readFrom: aString ]
				on: Error 
				do: [:err|
					Error signal: 'cannot resolve oidName ', aString printString ]]
]
