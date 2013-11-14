finding
findElement: aBlock 
	^ (aBlock value: self) 
		ifTrue: [  self  ]
		ifFalse: [  nil  ]