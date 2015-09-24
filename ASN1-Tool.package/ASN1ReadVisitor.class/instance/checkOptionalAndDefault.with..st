as yet unclassified
checkOptionalAndDefault: anElement with: aCollection
	"check if the element is optional and add default value if available"
	anElement value isOptional ifFalse: [ 
		(ASN1MandatoryElementNotFound new 
			messageText: 'cannot find element with tag ',  anElement printString) signal ].
	self flag: #needsRedesign.
	"here we get an ugly sequene 'value defaultValue value'. This is because an element is
	a key-value object. The value of the element can be a component type that can have a
	default value. FInally the defaultValue ist a primitive value and we are only interested in
	the value inside the wrapped primitive value"
	anElement value hasDefaultValue ifTrue: [ 
		aCollection privAt: anElement key put: anElement value defaultValue value ] 