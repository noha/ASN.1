X.681 grammar
objectFieldReference
	"Spec:
		An 'objectfieldreference' shall consist of an ampersand ('&') immediately followed by a sequence of 
		characters as specified for an 'objectreference' in 7.2."
	^ $& asParser, objectReference 