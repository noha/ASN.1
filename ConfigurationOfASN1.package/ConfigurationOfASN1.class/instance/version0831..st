versions
version0831: spec
	<version: '0.8.31' imports: #('0.8.27-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8.31'.
		spec author: 'NorbertHartl'.
		spec timestamp: '8/18/2014 15:12'.
		spec 
			project: 'PetitParser' with: '1.8-snapshot';
			project: 'PetitParser Tests' with: '1.8-snapshot'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.85';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.7';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.43';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.64';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.16';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.11';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.83';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.24';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.3';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.15';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.7';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.14'. ].
