as yet unclassified
initialize
	super initialize.
	types := IdentityDictionary new.
	modulesByOid := Dictionary new. 
	moduleByName := IdentityDictionary new