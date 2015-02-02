codec
decode: anObject
	| stream |
	stream := anObject readStream.
	^ DateAndTime 
		year: (stream next: 4) asInteger 
		month: (stream next: 2) asInteger  
		day: (stream next: 2) asInteger  
		hour: (stream next: 2) asInteger  
		minute: (stream next: 2) asInteger  
		second: (stream next: 2) asInteger  
		nanoSecond: ((stream next = $.) 
			ifTrue: [ | num |
				num := Number readFrom: stream. 
				num * (10 raisedTo: (9 - num decimalDigitLength)) ]
			ifFalse: [ 0 ]) 
		offset: 0 asDuration
