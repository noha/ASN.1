X.680 grammar
realNumber
	"Spec:
		A 'realnumber' shall consist of an integer part that is a series of one or more digits, and optionally 
		a decimal point (.). The decimal point can optionally be followed by a fractional part which is one 
		or more digits. The integer part, decimal point or fractional part (whichever is last present) can 
		optionally be followed by an e or E and an optionally-signed exponent which is one or more digits. 
		The leading digit of the exponent shall not be zero unless the exponent is a single digit."
	^ number , 
		((($. asParser, number ) / $. asParser) optional), 
		(($e asParser / $E asParser), signedNumber) optional