X.681 grammar
objectClassReference
	"spec:
		An 'objectclassreference'  shall consist of a sequence of characters as 
		specified for a 'typereference' in ITU-T Rec. X.680 | ISO/IEC 8824-1, 12.2, 
		except that no lower-case letters shall be included."
	^ self failOnReservedWords: (
		(#uppercase asParser plus separatedBy: $- asParser), (#lowercase asParser not)) asn1Token 