as yet unclassified
writeOn: aStream
	| byte |
	byte := self tag clazzIdentifier bitShift: 6.
	constructed ifTrue: [
		byte := byte bitOr: 16r20 ].
	byte := byte bitOr: self tag number.
	aStream nextPut: byte