Class {
	#name : #ASN1InconsistencySolvingVisitor,
	#superclass : #ASN1RewriteVisitor,
	#category : 'ASN1-AST-Visitor'
}

{ #category : #visiting }
ASN1InconsistencySolvingVisitor >> visitDefinedSyntaxObjectNode: aNode [ 
	"Another ambiguity to solve. A literal node that consists only of uppercase letters
	takes precedence of a type reference. So we have a few literal nodes where there
	should be references that can be resolved to a type.
	Here we make an assumption that all mapped values of a parsed syntax cannot be 
	literals. We scan the values, detect the position in the syntax and exchange that node
	with a reference node that is too be resolved later on"
	| syntax literalValues |
	syntax := aNode parseSyntax.
	literalValues := syntax values select: #isLiteralNode.
	literalValues do: [ :literalValue | | index |
		index := aNode syntax detectIndex: [ :each |
 			(each isLiteralNode and: [ each = literalValue ]) ].
		aNode syntax at: index put: literalValue string asn1Reference ].
	^ super visitDefinedSyntaxObjectNode: aNode
]
