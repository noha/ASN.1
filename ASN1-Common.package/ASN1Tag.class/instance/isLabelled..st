testing
isLabelled: aString
	 ^ ($: split: aString) asArray = { self clazzString  . number asString }
