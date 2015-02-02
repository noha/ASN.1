codec
encode: aDateAndTime
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