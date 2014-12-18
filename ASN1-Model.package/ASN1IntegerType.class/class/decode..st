codec
decode: aCollection
	| value  |
	value := 0.
	((aCollection first bitAnd: 16r80) > 0)
		ifTrue: [ 
			"copy bytes into integer. MSB is first in collection"
			value := aCollection asByteArray asInteger.
			"calculate negative 2s complement to positive value by subtracting
			1 and then ..."
			value := value - 1.
			"... invert all bits.  "
			value := value bitXor:  (2 raisedTo: (aCollection size * 8)) - 1.
			"negate it back as we calculated with positive numbers"
			^ value negated   ]
		ifFalse: [ 
			"just copy bytes to integer"
			^ aCollection asByteArray asInteger ]