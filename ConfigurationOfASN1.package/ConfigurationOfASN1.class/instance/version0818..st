versions
version0818: spec
	<version: '0.8.18' imports: #('0.8.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8.17 : added draft extension support'.
		spec author: 'NorbertHartl'.
		spec timestamp: '1/24/2014 11:00'.
		spec 
			project: 'PetitParser' with: '1.8-snapshot';
			project: 'PetitParser Tests' with: '1.8-snapshot'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.11';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.3';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.75';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.12';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.69';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.17';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.7';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.35';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.8';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.56';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.11'. ].
