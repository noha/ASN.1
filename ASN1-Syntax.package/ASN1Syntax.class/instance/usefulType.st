X.680 grammar
usefulType
	"spec: UsefulType	::= typereference"
	"Usefultypes are further specified as the following types"
	^ 'GeneralizedTime' asParser / 'UTCTime' asParser / 'ObjectDescriptior' asParser