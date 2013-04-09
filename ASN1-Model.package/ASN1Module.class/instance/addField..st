accessing
addField: anAssociation
	"anAssociation value isAsn1Object ifTrue: [
		anAssociation value definingModule: self ]."
	self fields add: anAssociation