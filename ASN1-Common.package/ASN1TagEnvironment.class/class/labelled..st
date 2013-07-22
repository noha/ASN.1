accessing
labelled: aString
	^ self subclasses 
		detect: [:cls| cls label = aString ]