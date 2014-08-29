codec
encode: aBoolean
	^ aBoolean
		ifTrue: #[ 16rff ]
		ifFalse: #[ 16r00 ]