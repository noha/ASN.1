accessing
bindingNameOfOid: aString 
	self modules do: [:each|
		(each definesOid: aString) ifTrue: [
			^ each bindingNameOfOid: aString ] ].
	^ nil