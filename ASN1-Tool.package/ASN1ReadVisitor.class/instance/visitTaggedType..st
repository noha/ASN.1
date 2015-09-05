visiting
visitTaggedType: aTaggedType 
	"resolve the tagging environment over the tagged type because it is defined in the module
	defining the tagging environment (the type of the tagged type might be imported from another
	module. Delegate the decoding to the type of the tagged type so that types can alter the tagging 
	environment themselves (e.g. choicces are always explicit)"
	^ self 
		push: (aTaggedType decodeTaggedValue: currentTaggedValue) 
		during: [
			| val |
			"Put the right type on it"
			val := self visit: aTaggedType type.
			val isAsn1Value ifTrue: [val type: aTaggedType].
			val]