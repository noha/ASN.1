actions
failOnReservedLiteralWords: aParser
	^ aParser >=> [:stream :cc| | string position |
			position := stream position.
			string := cc value. 
			(self class reservedLiteralWords includes: string) 
				ifTrue: [
					stream position: position. 
					PPFailure message: 'reserved token' at: stream position]
				ifFalse: [ string]]