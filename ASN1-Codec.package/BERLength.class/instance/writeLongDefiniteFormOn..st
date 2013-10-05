writing
writeLongDefiniteFormOn: aStream 
	"long definite form is 7bit chunked with the highest bit set if the following
	octet is part of this length"
	| length array | 
	length := self contentLength.
	array := ByteArray streamContents: [ :stream | 
		stream nextPut: (length bitAnd: 16r7f).
		[ length > 16r7f ] whileTrue: [
			length := length bitShift: -7.
		 	stream nextPut: ((length bitAnd: 16r7f) bitOr: 16r80) ]].
	aStream nextPutAll: array reversed