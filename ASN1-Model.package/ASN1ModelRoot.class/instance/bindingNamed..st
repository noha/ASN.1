accessing
bindingNamed: aString
	self modules do:[:module|
		module fields associationsDo: [:field|
			(field key = aString)
				ifTrue: [ ^ field ]]].
	^ nil