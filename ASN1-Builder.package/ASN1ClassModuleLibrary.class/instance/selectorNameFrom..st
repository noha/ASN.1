as yet unclassified
selectorNameFrom: aString
	^ ( aString copyWithout: $-  ) withFirstCharacterDownshifted asSymbol