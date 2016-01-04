X.680 grammar
ambiguousMatch: aProductionSymbol withAlternatives: aCollection 
	"try to parse a set of alternatives that all match the same rule. The 
	match needs to be determined in a later step. At the same time track
	stream progress for the case the rule fails we need to reset the stream
	to its old position like a normal production rule would do"
	^ self 
		parseAmbiguous: (super perform: aProductionSymbol withArguments: #()  inSuperclass: ASN1Syntax )  
		using: [:parsed :contents|
			parsed isAsn1Node 
				ifTrue: [ parsed ]
				ifFalse: [ | alt |
					alt := (aCollection
							collect: [:each| self class parse: contents startingAt: each ])
								select: [:each| each isPetitFailure not ].
					alt ifEmpty: [ Error signal: 'could not find alternative for ambiguous node' ].
					"alternative types do not parse equally under all cicrumstances. Regarding 
					the matched pattern only one type could match. In that case we try to look
					like a normal production rule and return a single value"
					(alt size = 1) 
						ifTrue: [ alt anyOne ]
						ifFalse: [
							ASN1AmbiguousNode new
								name: (aProductionSymbol, ' ambiguity') asString;
								alternatives: alt ]]]