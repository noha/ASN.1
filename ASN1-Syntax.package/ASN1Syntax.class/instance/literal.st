X.681 grammar
literal
	"Spec:
		Literal ::= word |
		',' "
	"Spec:
		A 'word' shall consist of a sequence of characters as specified for a 'typereference' in
		 ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.2.1, except that no lower-case letters or digits shall be included."
	^ self failOnReservedLiteralWords: (
		((#uppercase asParser plus separatedBy: $- asParser), #lowercase asParser not ) flatten 
		/ ',' asParser) 