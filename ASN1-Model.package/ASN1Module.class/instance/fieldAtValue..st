accessing
fieldAtValue: anObject 
	^ self fields associations
			detect: [:each| each value = anObject ]
			ifNone: [ nil ]