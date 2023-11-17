Class {
	#name : #ASN1EncodedConstructedValue,
	#superclass : #ASN1EncodedValue,
	#instVars : [
		'collection'
	],
	#category : 'ASN1-Codec'
}

{ #category : #'as yet unclassified' }
ASN1EncodedConstructedValue >> add: aType [
	self elements add: aType
]

{ #category : #accessing }
ASN1EncodedConstructedValue >> contents [
	^ self 
]

{ #category : #'as yet unclassified' }
ASN1EncodedConstructedValue >> do: aBlock [
	^ collection do: aBlock
]

{ #category : #'as yet unclassified' }
ASN1EncodedConstructedValue >> elements [
	^ collection
]

{ #category : #'as yet unclassified' }
ASN1EncodedConstructedValue >> findValueWithTag: aTag [ 
	(self tag = aTag) ifTrue: [  ^ self ].
	collection do: [ :each|
		(each findValueWithTag: aTag) ifNotNil: [ :value |
			^ value ] ]
]

{ #category : #'as yet unclassified' }
ASN1EncodedConstructedValue >> firstElement [
	^ collection first
]

{ #category : #testing }
ASN1EncodedConstructedValue >> hasError [
	^ collection anySatisfy: [ :each | each hasError ]
]

{ #category : #'initialize-release' }
ASN1EncodedConstructedValue >> initialize [ 
	super initialize.
	collection := OrderedCollection new 
]

{ #category : #initialization }
ASN1EncodedConstructedValue >> initializeFrom: anObject [
	| stream |
	stream := BERTLVStream on: anObject readStream.
	[ stream atEnd ] whileFalse: [ 
		(stream peek = 0) ifTrue: [
			stream nextByte.
			stream nextByte.
			^ self ].
		collection add: stream next]
]

{ #category : #testing }
ASN1EncodedConstructedValue >> isConstructed [
	^ true
]

{ #category : #accessing }
ASN1EncodedConstructedValue >> size [
	^ (self elements collect: [ :elem| elem size ]) sum
]

{ #category : #'as yet unclassified' }
ASN1EncodedConstructedValue >> valueWithTag: aTag [ 
	^ collection 
		detect: [ :each| each tag = aTag ]
		ifNone: [  nil ]
]

{ #category : #'as yet unclassified' }
ASN1EncodedConstructedValue >> writeOn: aStream [
	aStream nextPutConstructed: self
]
