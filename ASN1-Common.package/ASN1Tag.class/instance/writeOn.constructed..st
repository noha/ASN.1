as yet unclassified
writeOn: aStream constructed: constructed
	| byte |
	byte := self clazzIdentifier bitShift: 6.
	constructed ifTrue: [
		byte := byte bitOr: 16r20 ].

	self number < 31
		ifTrue: [aStream nextPut: (byte bitOr: self number)]
		ifFalse: [
			| rest octets |

			rest := self number.

			"Add the last octet first"
			octets := OrderedCollection new.
			octets add: (rest bitAnd: 127).
			rest := rest bitShift: -7.
			[ rest > 0 ] whileTrue: [
				octets add: ((rest bitAnd: 127) bitOr: 128).
				rest := rest bitShift: -7.
			].
			aStream nextPut: (byte bitOr: 16r1F).
			octets reverseDo: [:each | aStream nextPut: each ].
		].