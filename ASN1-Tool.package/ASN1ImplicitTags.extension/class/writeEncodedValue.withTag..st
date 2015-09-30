*asn1-tool
writeEncodedValue: aEncodedValue withTag: aTag 
	"in an implicit tag environment the outer tag overwrites the
	inner tag "
	^ aEncodedValue tag: aTag