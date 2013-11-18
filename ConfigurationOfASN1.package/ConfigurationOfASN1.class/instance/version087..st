versions
version087: spec
	<version: '0.8.7' imports: #('0.8.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8.6 : new baseline to include all test packages'.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/18/2013 18:33'.
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
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.34';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.8';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.50';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.11'. ].
