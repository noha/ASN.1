reading
readMultipleOctets: aNumber from: aStream
	| value |
	value := 0.
	aNumber timesRepeat: [
		value := (value bitShift: 8) bitOr: ( self nextFrom: aStream ) asInteger ].
	^ value