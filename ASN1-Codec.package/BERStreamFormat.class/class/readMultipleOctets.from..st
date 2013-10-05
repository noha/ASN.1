as yet unclassified
readMultipleOctets: aNumber from: aStream
	| value byte |
	value := aNumber.
	[ ((byte := aStream next) bitAnd: 16r80) = 16r80 ] whileTrue: [
		value := (value bitShift: 7) bitOr: (byte bitAnd: 16r7f). 
	].
	value := value bitShift: 7.
	^ value bitOr: byte