resolving
resolveName: aString
	Transcript show: 'WARNING: resolving name ',aString printString ,' globally ';cr.
	self modules do: [:module|
		module localNames
			at: aString
			ifPresent: [:val| ^ val ]].
	Error signal: 'couldn''t resolve name ', aString printString, String cr