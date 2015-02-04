instance-creation
newValue

	valueFactory isClass ifTrue: [ 
		^ valueFactory new 
			type: self ].
	valueFactory isBlock ifTrue: [ 
		^ (valueFactory value: self)
			type: self ].
	Error signal: 'only Class and BlockClosure are supported as valueFactory'