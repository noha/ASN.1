X.680 grammar
bitStringValue
	^ self
	 	ambiguousMatch: #bitStringValue 
		withAlternatives: #( valueSet objectSet bitStringValuePlain)
							