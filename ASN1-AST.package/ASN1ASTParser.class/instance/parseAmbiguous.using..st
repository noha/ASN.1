X.680 grammar
parseAmbiguous: aParser using: aBlock
	^ aParser >=> [:stream :block| | startPos parsed |
		startPos := stream position.
		parsed := block value.
		parsed isPetitFailure
			ifTrue: [ 
				stream position: startPos.
				parsed ]
			ifFalse: [ 
				aBlock 
					value: parsed 
					value: (stream collection copyFrom: startPos + 1 to: stream position )]]