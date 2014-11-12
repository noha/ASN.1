accessing
bindingNamed: aString
	self modules do: [:module|
		module assignments associationsDo: [:assignment|
			(assignment left label = aString ) ifTrue: [
				^ assignment ]]].
	^ nil