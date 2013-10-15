visiting
visitEnumerated: anEnumerated
	| number namedNumber |
	self flag: #hack.
	"this is an ugly hack for enumerated values that are encoded explicitly while being 
	in a implicit tag environment"
	number := stack top isConstructed 
		ifTrue: [
			self 
				push: stack top contents first
				during: [ self visitPrimitive: anEnumerated]]
		ifFalse: [ self visitPrimitive: anEnumerated ].
	namedNumber := anEnumerated atNumber: number.
	^ namedNumber 
		ifNotNil: [ namedNumber number -> namedNumber name ]
		ifNil: [ ASN1ElementNotFound signal: 'no entry for number ', number asString, ' found' ]