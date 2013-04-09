printing
printOn: aStream
	elements ifNotNil: [
		(elements isCollection) 
			ifFalse: [ self halt. elements printOn: aStream ]
			ifTrue: [
				"elements 
					do: [:each| aStream nextPutAll: each greaseString ]
					separatedBy: [ aStream nextPut: $, ]]"
				elements printElementsOn: aStream ]]