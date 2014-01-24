as yet unclassified
checkOptionalAndDefault: anElement with: aCollection
	"check if the element is optional and add default value if available"
	anElement value isOptional ifFalse: [ 
		(ASN1MandatoryElementNotFound new 
			messageText: 'cannot find element with tag ',  anElement tag printString) signal ].
	anElement value hasDefaultValue ifTrue: [ 
		aCollection at: anElement key put: anElement value defaultValue ] 