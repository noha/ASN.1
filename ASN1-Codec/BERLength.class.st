"
I can handle the length for definite and indefinite length. I wonder
of myself if I should be class or instance based or even be a SmallInteger or an
extension to a SmallInteger. Should I have a method called isIndefinite. Time will tell.
"
Class {
	#name : #BERLength,
	#superclass : #BERStreamFormat,
	#instVars : [
		'definiteForm',
		'contentLength'
	],
	#category : 'ASN1-Codec-BER'
}

{ #category : #decoding }
BERLength class >> parseFrom: aStream [
	"create a BERLength instance by reading its values from a stream"
	| berLength octet number |
	berLength := self new.
	octet := (self nextFrom: aStream )asInteger.
	number := octet bitAnd: 16r7f.
	((octet bitAnd: 16r80) = 16r80)
		ifTrue: [ 
			(number = 0) 
				ifTrue: [ berLength definiteForm: false ]
				ifFalse: [ berLength contentLength: (self readMultipleOctets: number from: aStream) ]]
		ifFalse: [ berLength contentLength: number ].
	^ berLength 
]

{ #category : #accessing }
BERLength >> contentLength [
	^ contentLength
]

{ #category : #accessing }
BERLength >> contentLength: anObject [
	contentLength := anObject
]

{ #category : #accessing }
BERLength >> definiteForm: anObject [
	definiteForm := anObject
]

{ #category : #accessing }
BERLength >> hasDefiniteForm [
	^ definiteForm
]

{ #category : #'initialize-release' }
BERLength >> initialize [ 
	super initialize.
	definiteForm := true
]

{ #category : #printing }
BERLength >> printOn: aStream [
	self hasDefiniteForm 
		ifTrue: [ 
			aStream
				nextPutAll: 'length: ';
				nextPutAll: self contentLength printString ]
		ifFalse: [
			aStream
				nextPutAll: 'indefinite length'] 
]

{ #category : #'initialize-release' }
BERLength >> readFrom: aStream [
	"we are an instance of a length specification. This method reads the computate length
	of bytes from a stream and returns them"
	^ self hasDefiniteForm 
		ifTrue: [ 
			((aStream size - aStream position) >=  self contentLength) ifFalse: [ ^ ASN1EncodedError  new ]. 
			aStream next: self contentLength ]
		ifFalse: [ 
			ByteArray streamContents: [:writeStream| | byte |
				byte := aStream next.
				[ (byte = 0) and: [ aStream peek = 0 ]] whileFalse: [
					writeStream nextPut: byte.
					byte := aStream next ].
				aStream next ]]
]

{ #category : #private }
BERLength >> writeDefiniteLongForm: aStream [
	| data |
	data := self contentLength asByteArray.
	data size >= 127
		ifTrue: [^self error: 'Content length number of length must be smallter than 127'. ].

	aStream nextPut: (data size bitAt: 8 put: 1).
	aStream nextPutAll: data.
]

{ #category : #writing }
BERLength >> writeOn: aStream [
	(self hasDefiniteForm) 
		ifTrue: [(self contentLength <= 16r7f)
			ifTrue:[ aStream nextPut: self contentLength ]
			ifFalse: [ self writeDefiniteLongForm: aStream ]]
		ifFalse: [ aStream nextPut: 128 ]
]
