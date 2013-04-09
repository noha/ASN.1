X.680 grammar
encodingPrefixedType
	"spec:
		EncodingPrefixedType ::=
  			 EncodingPrefix Type"
	"spec: 
		EncodingPrefix ::=
			'[' EncodingReference EncodingInstruction ']'"
	"spec: ecodingInstruction  all lexical items are allowed. To be able to return something use identifier"
	^ ($[ asParser, 
			encodingReference, 
			identifier, 
			$] asParser) , type 