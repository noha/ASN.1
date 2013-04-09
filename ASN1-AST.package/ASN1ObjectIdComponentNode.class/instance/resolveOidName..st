testing
resolveOidName: aString
	^ self class definedNumbers 
		at: aString 
		ifAbsent: [
			[ Number readFrom: aString ]
				on: Error 
				do: [:err|
					Error signal: 'cannot resolve oidName ', aString printString ]]