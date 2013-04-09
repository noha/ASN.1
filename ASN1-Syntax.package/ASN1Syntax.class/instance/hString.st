X.680 grammar
hString
	"Spec:
		An 'hstring' shall consist of an arbitrary number (possibly zero) of the characters:
		ABCDEF0123456789 possibly intermixed with white-space, preceded by an APOSTROPHE (39) 
		character (') and followed by the pair of characters: 'H"
	^ $' asParser trim,
		( $A asParser / $B asParser / $C asParser / $D asParser / $E asParser / $F asParser / #digit asParser / #space asParser) star flatten,
		($' asParser, $H asParser) trim ==> #second