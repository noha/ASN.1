X.680 grammar
encodingReferenceDefault
	"Spec:
		EncodingReferenceDefault ::= 
			encodingreference INSTRUCTIONS |	
			empty"
	^ (encodingReference , 'INSTRUCTIONS' asParser trim) optional