as yet unclassified
shouldCreateValue
	| val |
	val := self model newValue.
	self assert: val notNil.
	^ val
	