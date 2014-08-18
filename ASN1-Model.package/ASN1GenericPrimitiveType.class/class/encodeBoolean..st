codec
encodeBoolean: aBoolean
	^ aBoolean
		ifTrue: #[ 16rff ]
		ifFalse: #[ 16r00 ]