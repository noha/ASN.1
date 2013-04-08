decoding
decodeObjectIdentifier: anArray
	| objId next val |
	objId := OrderedCollection new.
	objId add: ((anArray first asInteger // 40) min: 2).
	objId add: anArray first asInteger - (objId last * 40).
	next := 2.
	val := 0.
	[ next <= anArray size ] whileTrue: [ | b |
		b := (anArray at: next) asInteger.
		next := next + 1.
		val := val bitOr: (b bitAnd: 127).
		((b bitAnd: 128) = 128)
			ifTrue: [ val := val bitShift: 7 ]
			ifFalse: [ 
				objId add: val.
				val := 0 ]
	].
	^ $. join: objId
	