as yet unclassified
testBitStringValueString
	| bitStringType bitStringValue |
	bitStringType := ASN1BitStringType new 
		bits: { ASN1NamedValue new name: 'version1'; value: 0}.
	bitStringValue := ASN1BitStringValue new
		bits: #( 'version1');
		type: bitStringType.
	self assert: bitStringValue stringValue = '1'.
	