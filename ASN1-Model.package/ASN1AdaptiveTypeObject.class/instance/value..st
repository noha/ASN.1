accessing
value: aDictionary
	aDictionary asDictionary ifNil: [ Error signal: 'cannot use nil as map' ].
	map := aDictionary asDictionary