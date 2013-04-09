testing
isOptional
	^ self modifiers anySatisfy: [:each| each isOptional ]