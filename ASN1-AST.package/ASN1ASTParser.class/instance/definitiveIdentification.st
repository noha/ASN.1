X.680 grammar
definitiveIdentification
	"disabling iri value for now"
	self flag: #incomplete.
	^ super definitiveIdentification ==> [:nodes| 
		nodes 
			ifNotNil: [ nodes first ]
			ifNil: [ nil ] ]