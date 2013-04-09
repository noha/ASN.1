comparing
= aObjectIdComponent
	(self name notNil and: [ aObjectIdComponent name notNil ]) ifTrue: [
		^ self name = aObjectIdComponent name ].
	^ self number = aObjectIdComponent number