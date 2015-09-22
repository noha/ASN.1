visiting
visitEnumeratedType: anEnumerated
	| number namedNumber |
	self flag: #hack.
	"this is an ugly hack for enumerated values that are encoded explicitly while being 
	in a implicit tag environment"
	number := currentTaggedValue isConstructed 
		ifTrue: [
			self 
				push: currentTaggedValue contents first
				during: [ self visitPrimitiveType: anEnumerated]]
		ifFalse: [ self visitPrimitiveType: anEnumerated ].
	namedNumber := anEnumerated atNumber: number value.
	^ ASN1EnumeratedValue new 
		value: namedNumber name 