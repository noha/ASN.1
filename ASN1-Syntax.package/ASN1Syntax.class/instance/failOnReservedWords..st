actions
failOnReservedWords: aParser
	^ ASN1Configuration default failOnReservedWords
		ifTrue: [
			aParser >=> [:stream :cc| | string position |
				position := stream position.
				string := cc value. 
				(self class reservedWords includes: string) 
					ifTrue: [
						stream position: position. 
						PPFailure message: 'reserved token' at: stream position]
					ifFalse: [ string]]]
		ifFalse: [ aParser ]