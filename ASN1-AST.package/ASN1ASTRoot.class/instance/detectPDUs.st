actions
detectPDUs 
	"annotate a module with the definition of a PDU"
	self modules allButFirst do: [:each| | a |
		a := self pduForModule: each. ]