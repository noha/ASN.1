X.680 grammar
tag
	"spec:
		Tag ::= '[' EncodingReference Class ClassNumber ']' "
	^ $[ asParser trim, 
			encodingReference, 
			tagClass, 
			tagNumber trim, 
		$] asParser trim