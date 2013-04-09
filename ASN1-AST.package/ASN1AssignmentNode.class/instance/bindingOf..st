binding
bindingOf: aString
	right parameters ifNil: [ ^ nil ].
	^ (right parameters anySatisfy: [:each| each contains: aString ])
		ifTrue: [ true ]
		ifFalse: [ nil ]