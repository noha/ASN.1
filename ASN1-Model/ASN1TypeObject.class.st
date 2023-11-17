Class {
	#name : #ASN1TypeObject,
	#superclass : #ASN1DefinitionObject,
	#instVars : [
		'valueFactory'
	],
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1TypeObject class >> defaultValueFactory [
	^ [ :type | type asn1ValueClass new ]
]

{ #category : #creating }
ASN1TypeObject class >> newValue [
	^ self new newValue
]

{ #category : #validating }
ASN1TypeObject >> acceptsType: anObject [
	^ self class = anObject class
]

{ #category : #accessing }
ASN1TypeObject >> asAsn1Type [
	^ self
]

{ #category : #accessing }
ASN1TypeObject >> asAsn1TypeIn: aContext [
	^ self
]

{ #category : #accessing }
ASN1TypeObject >> asn1ValueClass [
	self shouldBeImplemented 
]

{ #category : #accessing }
ASN1TypeObject >> basicType [
	^ self
]

{ #category : #finding }
ASN1TypeObject >> findTypeWithKey: aString [
	^ ASN1FindByKeyVisitor new 
		key: aString;
		visit: self;
		object
]

{ #category : #testing }
ASN1TypeObject >> isAsn1ExternalType [
	^ false
]

{ #category : #testing }
ASN1TypeObject >> isAsn1Type [
	^ true
]

{ #category : #testing }
ASN1TypeObject >> isOptional [ 
	^ false
]

{ #category : #testing }
ASN1TypeObject >> matchesValue: aValue [
	^ aValue matchesType: self 
]

{ #category : #'instance-creation' }
ASN1TypeObject >> newValue [
	valueFactory ifNil: [ 
		^ (self class defaultValueFactory value: self)
			type: self ].
	valueFactory isClass ifTrue: [ 
		^ valueFactory new 
			type: self ].
	valueFactory isBlock ifTrue: [ 
		^ (valueFactory value: self)
			type: self ].
	Error signal: 'only Class and BlockClosure are supported as valueFactory'
]

{ #category : #validating }
ASN1TypeObject >> validate: anObject [
	(self acceptsValue: anObject) ifFalse: [ 
		Error signal: 'type classes do not match' ]
]

{ #category : #accessing }
ASN1TypeObject >> valueFactory [
	^ valueFactory
]

{ #category : #accessing }
ASN1TypeObject >> valueFactory: anObject [
	valueFactory := anObject
]
