X.680 grammar
bString
	"Spec:
		A 'bstring'  shall consist of an arbitrary number (possibly zero) of the characters:
		0 1 possibly intermixed with white-space, preceded by an APOSTROPHE (39) 
		character (') and followed by the pair of characters: 'B"
	^ $' asParser trim, 
		(( $0 asParser / $1 asParser / #space asParser) star) flatten,
		($' asParser, $B asParser ) ==> #second