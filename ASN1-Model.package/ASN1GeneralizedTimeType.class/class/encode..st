codec
encode: aDateAndTime
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