codec
encode: aDateAndTime
	| date |
	date := aDateAndTime asUTC.
	^ String streamContents: [ :stream |
		stream
			nextPutAll: (date year printPaddedWith: $0 to: 4);
			nextPutAll: (date month printPaddedWith: $0 to: 2);
			nextPutAll: (date day printPaddedWith: $0 to: 2 );
			nextPutAll: (date hour printPaddedWith: $0 to: 2);
			nextPutAll: (date minute printPaddedWith: $0 to: 2);
			nextPutAll: (date second printPaddedWith: $0 to: 2).
		(date nanoSecond > 0) ifTrue: [ | scaled |
			stream nextPut: $..
			scaled := (date nanoSecond * (1 / (10 raisedTo: 9))) asScaledDecimal.
			(scaled * (10 raisedTo: scaled scale)) rounded printOn: stream ].
		stream nextPut: $Z ]