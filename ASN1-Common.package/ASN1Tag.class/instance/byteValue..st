accessing
byteValue: constructed
	| byte |
	byte := self clazzIdentifier bitShift: 6.
	constructed ifTrue: [
		byte := byte bitOr: 16r20 ].
	byte := byte bitOr: self number.
	^ byte 