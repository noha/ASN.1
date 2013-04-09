as yet unclassified
parseSyntax: aSyntax
	| dict |
	dict := Dictionary new.
	syntax parse: aSyntax readStream into: dict.
	self validateFields: dict.
	^ dict