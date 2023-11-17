Class {
	#name : #ASN1Module,
	#superclass : #ASN1BasicObject,
	#instVars : [
		'name',
		'oid',
		'fields',
		'tagEnvironment',
		'modelRoot',
		'pduLabel'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1Module >> abstractSyntaxes [
	^ self allObjectsWithClass: 'ABSTRACT-SYNTAX'
]

{ #category : #visiting }
ASN1Module >> accept: aVisitor [
	^ aVisitor visitModule: self
]

{ #category : #accessing }
ASN1Module >> addField: anAssociation [
	self fields add: anAssociation
]

{ #category : #accessing }
ASN1Module >> addFields: aDictionary [
	aDictionary associations do: [:field |
		self addField: field ]
]

{ #category : #accessing }
ASN1Module >> allObjects [
	^ self fields select: [:each| each isAsn1Object ]
]

{ #category : #accessing }
ASN1Module >> allObjectsWithClass: aString [
	^ self allObjects select: [:each| each clazz = aString]
]

{ #category : #accessing }
ASN1Module >> bindingNameOfOid: aString [
	^ (self fieldDefiningOid: aString) key
]

{ #category : #testing }
ASN1Module >> definesOid: anOid [
	^ (self fieldDefiningOid: anOid) notNil
]

{ #category : #accessing }
ASN1Module >> fieldAt: aString [ 
	^ self fields at: aString
]

{ #category : #accessing }
ASN1Module >> fieldAt: aString put: anObject [
	self fields at: aString put: anObject
]

{ #category : #accessing }
ASN1Module >> fieldAtValue: anObject [ 
	^ self fields associations
			detect: [:each| each value = anObject ]
			ifNone: [ nil ]
]

{ #category : #accessing }
ASN1Module >> fieldDefiningOid: anOid [
	self fields associationsDo: [:each |
			each value = anOid
				ifTrue: [^each]].
	^nil	
]

{ #category : #accessing }
ASN1Module >> fields [
	^ fields ifNil: [
		fields := Dictionary new ]
]

{ #category : #accessing }
ASN1Module >> fields: anObject [
	fields := anObject
]

{ #category : #initialization }
ASN1Module >> initialize [
	super initialize.
	"default tag environment is explicit"
	tagEnvironment := ASN1ExplicitTags 
]

{ #category : #accessing }
ASN1Module >> modelRoot [
	^ modelRoot ifNil: [ NotFound signal: 'cannot find model root for ', self asString ]
]

{ #category : #accessing }
ASN1Module >> modelRoot: aModelRoot [ 
	modelRoot := aModelRoot
]

{ #category : #accessing }
ASN1Module >> name [
	^ name
]

{ #category : #accessing }
ASN1Module >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASN1Module >> objectsWithClass: aString [
	^ self fields select: [:each|
		each isAsn1Object and: [ each clazz = aString]]
]

{ #category : #accessing }
ASN1Module >> oid [
	^ oid
]

{ #category : #accessing }
ASN1Module >> oid: anObject [
	oid := anObject
]

{ #category : #accessing }
ASN1Module >> pdu [
	^ self fields at: pduLabel
]

{ #category : #accessing }
ASN1Module >> pduLabel: aString [ 
	pduLabel := aString
]

{ #category : #printing }
ASN1Module >> printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPut: $:;
		nextPutAll: self name;
		nextPutAll: ' (';
		nextPutAll: oid printString;
		nextPutAll: ')'
]

{ #category : #accessing }
ASN1Module >> tagEnvironment [
	^ tagEnvironment
]

{ #category : #accessing }
ASN1Module >> tagEnvironment: aString [
	tagEnvironment := aString
]
