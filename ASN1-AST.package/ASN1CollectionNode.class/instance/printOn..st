printing
printOn: aStream
	elements ifNotNil: [
		(elements isCollection) 
			ifTrue: [
				"elements 
					do: [:each| aStream nextPutAll: each greaseString ]
					separatedBy: [ aStream nextPut: $, ]]"
				elements printElementsOn: aStream ]]