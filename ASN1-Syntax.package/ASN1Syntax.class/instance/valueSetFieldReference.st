X.681 grammar
valueSetFieldReference
	"Spec:
		A 'valuesetfieldreference' shall consist of an ampersand ('&') immediately followed by a sequence of 
		characters as specified for a typereference in ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.2."
	^ $& asParser, typeReference ==> #second