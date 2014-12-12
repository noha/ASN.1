accessing
value: aDictionary
	aDictionary ifNil: [ ^ self ].
	map := aDictionary asDictionary