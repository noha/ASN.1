X.680 grammar
bitStringValue
	^ self 
		parseAmbiguous: super bitStringValue  
		using: [:parsed :contents|
			parsed isAsn1Node 
				ifTrue: [ parsed ]
				ifFalse: [ | alt |
					alt := (#( bitStringValuePlain valueSet objectSet )
							collect: [:each| self class parse: contents startingAt: each ])
								select: [:each| each isPetitFailure not ].
					alt ifEmpty: [ self halt ].
					(alt size = 1) 
						ifTrue: [ alt anyOne ]
						ifFalse: [
							ASN1AmbiguousNode new
								name: 'bitstring ambiguity';
								alternatives: alt ]]]