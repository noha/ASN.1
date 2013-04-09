X.680 grammar
typeReferenceRule
	"spec:
		12.2.1	A 'typereference' shall consist of an arbitrary number (one or more) of letters, 
			digits, and hyphens. The initial character shall be an upper-case letter. A hyphen shall 
			not be the last character. A hyphen shall not be immediately followed by another hyphen."
	^ self failOnReservedWords:   (#uppercase asParser, (
		(#word asParser star, ($- asParser, #word asParser plus) star)  
		)) flatten 