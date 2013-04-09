binding
bindingOf: aString
	self hasParameters ifFalse: [ ^ nil ].
	self parameters do: [:each| 
		(each bindingOf: aString)
			ifNotNil: [:val| ^ val ]].
	^ nil