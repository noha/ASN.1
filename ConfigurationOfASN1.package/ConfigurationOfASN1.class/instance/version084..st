versions
version084: spec
	<version: '0.8.4' imports: #('0.8.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8.3 : exchanged usage of deprecated #value method in new version of petit parser
0.8.4 : removed obsolete isTyped selector. Collections have long been converted in typed and non-typed classes so the testing selector is obsolete.
Added a generic traverse and find method'.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/14/2013 17:13'.
		spec project: 'PetitParser' with: '1.8-snapshot'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.6';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.65';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.63';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.11';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.4';
			package: 'ASN1-Codec' with: 'ASN1-Codec-HolgerHansPeterFreyther.33';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.8';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.49';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.11'. ].
