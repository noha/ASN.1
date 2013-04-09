X.680 grammar
identifier
	"spec:
		An 'identifier' shall consist of an arbitrary number (one or more) of letters, digits, 
		and hyphens. The initial character shall be a lower-case letter. A hyphen shall not 
		be the last character. A hyphen shall not be immediately followed by another hyphen."
	"letting each identifier be an asn1Token is probably too permissive"
	^ (#lowercase asParser, (
		(#word asParser star, ($- asParser, #word asParser plus) star)
		)) flatten asn1Token