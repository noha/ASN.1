accessing
bindingNameOfOid: anOidOrString
	self modules do: [:each|
		(each definesOid: anOidOrString asAsn1Oid) ifTrue: [
			^ each bindingNameOfOid: anOidOrString asAsn1Oid ] ].
	^ nil