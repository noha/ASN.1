as yet unclassified
universalTag
	^ universalTag ifNil: [
		universalTag := self buildUniversalTag ]