finding
findElement: aBlock 
	(aBlock value: self)
		ifTrue: [ ^ self ]
		ifFalse: [
			attributes do: [:attr|
				attr isAsn1 ifTrue: [  
					(attr findElement: aBlock) ifNotNil: [:op|
						^ op]]]].
		^ nil