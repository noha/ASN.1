resolving
resolveAmbiguities
	"rewrite ambiguous nodes to real nodes using  their context"
	| visitor newRoot |
	visitor := ASN1AmbiguitySolvingVisitor  new root: self.
	newRoot := self accept: visitor