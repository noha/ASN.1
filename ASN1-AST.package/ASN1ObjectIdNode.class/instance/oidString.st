accessing
oidString
	^ String streamContents: [:stream|
		self components
			do: [:component| 
				component isAsn1ReferenceNode 
					ifTrue: [ stream nextPutAll: component label ]
					ifFalse: [ component printNumberOn: stream ]]
			separatedBy: [ stream nextPut: $. ]]