binding
bindingOf: aString
	self hasParameters ifTrue: [ 
		self parameters do: [:each| 
			(each bindingOf: aString)
				ifNotNil: [:val| ^ val ]]].
	self definition 
		ifNotNil: [ (self definition bindingOf: aString) ifNotNil: [:val |
				^ val ]]
		ifNil: [ 
			self hasType ifTrue: [ 
				(self type definition bindingOf: aString) ifNotNil: [ :val |
					^ val  ] ] ].
	^ nil 