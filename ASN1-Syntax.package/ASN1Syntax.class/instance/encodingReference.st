X.680 grammar
encodingReference
	"spec:
		EncodingReference ::=
   			encodingreference ':' |
   			empty"
	"spec:
		An 'encodingreference' shall consist of a sequence of characters as 
		specified for a 'typereference' in 12.2, except that no lower-case letters 
		shall be included."
	 ^ (((#uppercase asParser, (
		((#uppercase asParser / #digit asParser) star, ($- asParser, (#uppercase asParser / #digit asParser) plus) plus) /
		((#uppercase asParser / #digit asParser) star) 
		)) flatten), $: asParser) optional 