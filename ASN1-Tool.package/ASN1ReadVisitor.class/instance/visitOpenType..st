visiting
visitOpenType: anOpenType 
	"an open type does not specify its kind. So we return the anonymous data. The data needs to be parsed
	in a second pass"
	^ stack top 