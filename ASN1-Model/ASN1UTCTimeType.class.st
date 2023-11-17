Class {
	#name : #ASN1UTCTimeType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1UTCTimeType class >> decode: anObject [
	| stream year |
	stream := anObject asString readStream.
	year := self readNumberDigits: 2 from: stream.
	(year < 70)
		ifTrue: [ year := year + 100  ].
	^ DateAndTime 
		year: year + 1900
		month: (self readNumberDigits: 2 from: stream) asInteger  
		day: (self readNumberDigits: 2 from: stream) asInteger  
		hour: (self readNumberDigits: 2 from: stream) asInteger  
		minute: (self readNumberDigits: 2 from: stream) asInteger  
		second: (self readNumberDigits: 2 from: stream) asInteger 
		offset: 0 asDuration

]

{ #category : #codec }
ASN1UTCTimeType class >> encode: aDateAndTime [
	| date |
	date := aDateAndTime asUTC.
	^ String streamContents: [ :stream |
		stream
			nextPutAll: (date year \\ 100 printPaddedWith: $0 to: 2);
			nextPutAll: (date month printPaddedWith: $0 to: 2);
			nextPutAll: (date day printPaddedWith: $0 to: 2 );
			nextPutAll: (date hour printPaddedWith: $0 to: 2);
			nextPutAll: (date minute printPaddedWith: $0 to: 2);
			nextPutAll: (date second printPaddedWith: $0 to: 2).
		stream nextPut: $Z ]
]

{ #category : #reading }
ASN1UTCTimeType class >> readNumberDigits: aNumber from: aStream [
	| value |
	value := 0.
	(aNumber - 1 to: 0 by: -1) do: [ :exp |
		 value := value + (aStream next digitValue * (10 raisedTo: exp)) ].
	^ value
]

{ #category : #accessing }
ASN1UTCTimeType class >> universalType [
	^ 'UTCTime'
]

{ #category : #'as yet unclassified' }
ASN1UTCTimeType >> accept: aVisitor [
	^ aVisitor visitUTCTimeType: self
]
