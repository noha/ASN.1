codec
decode: anObject
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
			offset := Duration days: 0 hours: (stream next: 2) minutes: (stream next: 2) seconds: 0 ].
		(offsetChar = $-) ifTrue: [ 
			offset := (Duration days: 0 hours: (stream next: 2) minutes: (stream next: 2) seconds: 0) negated ]]
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
