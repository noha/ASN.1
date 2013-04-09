X.680 grammar
restrictedCharacterStringType
	"spec:
		RestrictedCharacterStringType ::=
			BMPString |  GeneralString |  GraphicString | 
			IA5String |  ISO646String | NumericString | 
			PrintableString | TeletexString |  T61String | 
			UniversalString |  UTF8String |  VideotexString | 
			VisibleString"
	^ ('BMPString' asParser / 'GeneralString' asParser / 'GraphicString' asParser / 'IA5String' asParser / 
		'ISO646String' asParser / 'NumericString' asParser / 'PrintableString' asParser / 
		'TeletexString' asParser /  'T61String' asParser / 'UniversalString' asParser / 'UTF8String' asParser / 
		'VideotexString' asParser / 'VisibleString' asParser) asn1Token