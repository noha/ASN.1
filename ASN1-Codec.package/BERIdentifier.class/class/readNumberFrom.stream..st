as yet unclassified
readNumberFrom: anOctet stream: aStream
	| number |
	number := anOctet bitAnd: 16r1F.
	(number = 16r1F) ifTrue: [
		^ self readHighTagNumber: aStream ].
	^ number