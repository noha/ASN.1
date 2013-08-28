as yet unclassified
visitAssociation: anAssociation
	super visitAssociation: anAssociation.
	(anAssociation key = key) ifTrue:[
		objects add: anAssociation value ]