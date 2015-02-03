codec
decode: anObject
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
