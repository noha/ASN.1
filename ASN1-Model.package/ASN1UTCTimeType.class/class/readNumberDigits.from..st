reading
readNumberDigits: aNumber from: aStream
	| value |
	value := 0.
	(aNumber - 1 to: 0 by: -1) do: [ :exp |
		 value := value + (aStream next digitValue * (10 raisedTo: exp)) ].
	^ value