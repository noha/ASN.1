versions
version0712: spec
	<version: '0.7.12' imports: #('0.7.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: ''.
		spec author: 'NorbertHartl'.
		spec timestamp: '7/22/2013 17:37'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.5';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-HolgerHansPeterFreyther.59';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.7';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.49';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.7';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.2';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.18';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.1';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.36';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.4'. ].