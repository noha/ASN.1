Class {
	#name : #ASN1AdaptiveTypeObject,
	#superclass : #ASN1AdaptiveTypeValue,
	#instVars : [
		'map',
		'selfExpanding'
	],
	#category : 'ASN1-Model'
}

{ #category : #'initailize-release' }
ASN1AdaptiveTypeObject class >> asn1TypeName [
	^ self subclassResponsibility 
]

{ #category : #'initailize-release' }
ASN1AdaptiveTypeObject class >> typedCollection [
	^ ASN1TypedCollectionType type: self
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> at: aKey [
	^ self 
		at: aKey 
		ifAbsent: [ KeyNotFound signalFor: aKey ]
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> at: aKey ifAbsent: aBlock [
	"a value can be one of three types: primitive, adaptive type or encoded value. In the
	first case we want to return the unwrapped value. This is to deliver a convenient API
	where reading values is easy. In the latter two type cases we just deliver themselves.
	If it is a adaptive type we return it so we can have message chaining while accessing
	the structure. If it is an encoded value we need to return it as a intact whole"
	| fieldType  |
	map at: aKey ifPresent: [ : value |  
		(value isAsn1Composite | value isAsn1EncodedValue) ifTrue: [ ^ value ].
			^ value contents ].  
	
	"lookup field type to trigger an early exception if a field is not defined
	for this type"
	fieldType := self basicTypeAt: aKey.
	
	^ selfExpanding 
		ifTrue: [ 
			(fieldType isAsn1Primitive and: [ fieldType isAsn1ExternalType not ]) ifTrue: [ ^ nil ].
			self expandFieldNamed: aKey type: fieldType ] 
		ifFalse: [ aBlock value] 

]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> at: aKey put: anObject [
	| typeForKey |
	anObject isAsn1 
		ifTrue: [ Error signal: 'no ASN.1 values allowed here' ].
	
	typeForKey := type 
		elementAt: aKey 
		ifNone: [ NotFound signal: 'no field ', aKey asString,' found' ].
	
	(self expandFieldNamed: aKey type: typeForKey) contents: anObject.
	
	^ anObject
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> baseValueAt: aString [
	^ ( self privAt: aString ) baseValue
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> baseValueAt: aString put: anObject [
	^ self 
		expandFieldNamed: aString
		type: (self basicTypeAt: aString)
		baseValue: anObject
]

{ #category : #finding }
ASN1AdaptiveTypeObject >> basicFind: aKey [
	map 
		at: aKey 
		ifPresent: [:elem| ^ elem ].
	^ self find: aKey in: map values  
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> basicTypeAt: aKey [
	^ self 
		basicTypeAt: aKey
		ifAbsent: [ ASN1InvalidFieldName signal: 'cannot find field ', aKey asString ]
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> basicTypeAt: aKey ifAbsent: aBlock [
	^ type 
		elementAt: aKey 
		ifNone: aBlock
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> beSelfExpanding [
	selfExpanding := true
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> beStrict [
	selfExpanding := false
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> contents [
	^ self
]

{ #category : #copying }
ASN1AdaptiveTypeObject >> copyContentTo: anObject [ 
	anObject setMap: map
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> doesNotUnderstand: aMessage [
	(aMessage arguments size = 0) ifTrue: [ 
		^ self 
			at: (self mapKeyForMessage: aMessage) 
			ifAbsent: [ nil ] ].
	(aMessage arguments size = 1) ifTrue: [ 
		self 
			at: (self mapKeyForMessage: aMessage) allButLast 
			put: aMessage arguments first.
		^ self  ].
	^ super doesNotUnderstand: aMessage
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> expandAt: aString using: aBlock [
	aBlock value: (self expandFieldNamed: aString)
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> expandFieldNamed: aFieldName [
	^ self 
		expandFieldNamed: aFieldName 
		type: (self basicTypeAt: aFieldName) 
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> expandFieldNamed: aFieldName type: aFieldType [

	"if a value for the given fieldName is present just return it"
	map at: aFieldName ifPresent: [ :v | ^ v ].

	"create a value from the determined type and set the field with value"	
	^ map at: aFieldName put: (
		aFieldType newValue
			initializeFrom: self )
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> expandFieldNamed: aFieldName type: aFieldType baseValue: aValue [

	"if a value for the given fieldName is present just return it"
	map at: aFieldName ifPresent: [ :v | ^ v ].

	"create a value from the determined type and set the field with value"	
	^ map at: aFieldName put: (
		(aFieldType newBaseValue: aValue)
			initializeFrom: self )
]

{ #category : #testing }
ASN1AdaptiveTypeObject >> hasField: aString [
	^ ( self basicTypeAt: aString ifAbsent: [ ^ false ] ) notNil
]

{ #category : #testing }
ASN1AdaptiveTypeObject >> hasSameType: aType [ 
	^ aType == type 
]

{ #category : #testing }
ASN1AdaptiveTypeObject >> includesKey: anObject [
	^ map includesKey: anObject
]

{ #category : #initialization }
ASN1AdaptiveTypeObject >> initialize [
	super initialize.
	map := SmallDictionary new.
	selfExpanding := false
]

{ #category : #initialize }
ASN1AdaptiveTypeObject >> initializeFrom: anObject [
	selfExpanding := anObject isSelfExpanding
]

{ #category : #testing }
ASN1AdaptiveTypeObject >> isSelfExpanding [
	^ selfExpanding 
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> keys [
	^ map keys
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> keysAndValuesDo: aBlock [
	type keys do: [ :key |
		map at: key ifPresent: [:value| aBlock value: key value: value ] ]
]

{ #category : #testing }
ASN1AdaptiveTypeObject >> matchesType: aType [
	^ { ASN1SequenceType . ASN1ChoiceType } includes: aType class
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> privAt: aKey [ 
	^ map at: aKey
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> privAt: aKey ifAbsent: aBlock [
	^ map at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> privAt: aKey put: anObject [

 	^ map at: aKey put: anObject.

]

{ #category : #removing }
ASN1AdaptiveTypeObject >> removeKey: anObject [
	^ map removeKey: anObject
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveTypeObject >> removeKey: anObject ifAbsent: aBlock [ 
	^ map removeKey: anObject ifAbsent: aBlock
]

{ #category : #replacing }
ASN1AdaptiveTypeObject >> replaceContentAt: key with: anObject [
	self removeKey: key ifAbsent: [].
	(self expandFieldNamed: key) replaceContentFrom: anObject
]

{ #category : #replacing }
ASN1AdaptiveTypeObject >> replaceContentFrom: anObject [
	(anObject hasSameType: type) ifFalse: [ Error signal: 'cannot exchange content from different types' ].
	anObject copyContentTo: self.
]

{ #category : #'class membership' }
ASN1AdaptiveTypeObject >> respondsTo: aSymbol [
	(aSymbol isUnary and: [ map includesKey: aSymbol asString ]) ifTrue: [ ^ true ].
	^ super respondsTo: aSymbol 
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> selfExpanding: aBoolean [
	selfExpanding := aBoolean 
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> setMap: aDictionary [
	map := aDictionary
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> size [
	^ map size
]

{ #category : #accessing }
ASN1AdaptiveTypeObject >> soleValue [
	^ map values first
]
