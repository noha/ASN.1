X.680 grammar
objectIdentifierValue 
	^ self ambiguousMatch: #objectIdentifierValue withAlternatives: #( #objectIdentifierValuePlain #sequenceValue) 