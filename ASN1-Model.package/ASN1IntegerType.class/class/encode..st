codec
encode: anInteger
	| value stream |
	anInteger isZero ifTrue: [ ^ #[ 0 ] ].
	(anInteger = -1) ifTrue: [ ^ #[  16rff ] ]. 
	value := anInteger. 
	stream := ByteArray new writeStream.
	value positive 
		ifTrue: [ 
			"encode integer to bytes. encode all but the MSB"
			[  value > 16rff ] whileTrue: [ 
				stream nextPut: (value bitAnd: 16rff).
				value := value bitShift: -8 ]. 
			"put MSB to stream"
			stream nextPut: value.
			"if MSB has the highest bit set a zero byte needs to be
			appended to have no signed bit set in MSB which is now 0"
			((value bitAnd: 16r80) >0) ifTrue: [ 
				stream nextPut: 0 ] ]
		ifFalse: [ 
			"negative values seem to be in 2s complement form so just
			copy the bits"
			[  value = -1 ] whileFalse: [ 
				stream nextPut: (value bitAnd: 16rff).
				value := value bitShift: -8 ] ].
	^ stream contents reversed