codec
decode: anObject
	| stream |
	stream := anObject readStream.
	^ DateAndTime 
		year: (stream next: 2) asInteger + 1900
		month: (stream next: 2) asInteger  
		day: (stream next: 2) asInteger  
		hour: (stream next: 2) asInteger  
		minute: (stream next: 2) asInteger  
		second: (stream next: 2) asInteger 
		offset: 0 asDuration
