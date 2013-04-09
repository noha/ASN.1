X.681 grammar
valueFieldReference
	"Spec:
		A 'valuefieldreference' shall consist of an ampersand ('&') immediately followed by a sequence of 
		characters as specified for a valuereference in ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.4."
	^ $& asParser, valueReference ==> #second