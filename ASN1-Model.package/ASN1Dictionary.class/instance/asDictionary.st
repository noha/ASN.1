converting
asDictionary
	| dict |
	dict := Dictionary new.
	self keysAndValuesDo: [ :key :value |
		dict at: key put: value ].
	^ dict