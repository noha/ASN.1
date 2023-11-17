Class {
	#name : #ASN1GeneralizedTimeType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1GeneralizedTimeType class >> decode: anObject [
	| stream year month day hour minute second nanoSecond offset |
	stream := anObject readStream.
	year := (stream next: 4) asInteger.
	month := (stream next: 2) asInteger.  
	day := (stream next: 2) asInteger.  
	hour := (stream next: 2) asInteger.  
	minute := (stream next: 2) asInteger.  
	second := (stream next: 2) asInteger.  
	nanoSecond := ((stream peek = $.) 
			ifTrue: [ | num |
				stream next.
				num := Number readFrom: stream. 
				num * (10 raisedTo: (9 - num decimalDigitLength)) ]
			ifFalse: [ 0 ]). 
	stream next ifNotNil: [ :offsetChar |
		offsetChar = $Z ifTrue: [ offset := 0 hours ].
		(offsetChar = $+) ifTrue: [
			offset := Duration days: 0 hours: (stream next: 2) asNumber minutes: (stream next: 2) asNumber seconds: 0 ].
		(offsetChar = $-) ifTrue: [ 
			offset := (Duration days: 0 hours: (stream next: 2) asNumber minutes: (stream next: 2) asNumber seconds: 0) negated ]]
		ifNil: [ offset := DateAndTime localOffset ].
		
	^ DateAndTime 
		year: year
		month: month
		day: day
		hour: hour 
		minute: minute  
		second: second
		nanoSecond: nanoSecond 
		offset: offset 

]

{ #category : #codec }
ASN1GeneralizedTimeType class >> encode: aDateAndTime [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: (aDateAndTime year printPaddedWith: $0 to: 4);
			nextPutAll: (aDateAndTime month printPaddedWith: $0 to: 2);
			nextPutAll: (aDateAndTime day printPaddedWith: $0 to: 2 );
			nextPutAll: (aDateAndTime hour printPaddedWith: $0 to: 2);
			nextPutAll: (aDateAndTime minute printPaddedWith: $0 to: 2);
			nextPutAll: (aDateAndTime second printPaddedWith: $0 to: 2).
		(aDateAndTime nanoSecond > 0) ifTrue: [ | scaled |
			stream nextPut: $..
			scaled := (aDateAndTime nanoSecond * (1 / (10 raisedTo: 9))) asScaledDecimal.
			(scaled * (10 raisedTo: scaled scale)) rounded printOn: stream ].
			aDateAndTime offset isZero
				ifTrue: [ stream nextPut: $Z ]
				ifFalse: [ 
					stream nextPut: (aDateAndTime offset negative 
						ifTrue: [ $- ]
						ifFalse: [ $+ ]).
					stream nextPutAll: (aDateAndTime offset asHours rounded printPaddedWith: $0 to: 2 ).
					stream nextPutAll: (aDateAndTime offset minutes printPaddedWith: $0 to: 2 ). ] ]
]

{ #category : #accessing }
ASN1GeneralizedTimeType class >> universalType [
	^ 'GeneralizedTime'
]

{ #category : #'as yet unclassified' }
ASN1GeneralizedTimeType >> accept: aVisitor [
	^ aVisitor visitPrintableString: self
]
