accessing
defaultValue
	^ (self modifiers 
		detect: [:each| each isDefaultValue ]
		ifNone: [ ^ nil ]) value