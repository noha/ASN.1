X.681 grammar
objectSetFieldReference
	"Spec:
		An objectsetfieldreference shall consist of an ampersand (&) immediately followed by a sequence of 
		characters as specified for an 'objectsetreference' in 7.3."
	^ $& asParser, objectSetReference ==> #second