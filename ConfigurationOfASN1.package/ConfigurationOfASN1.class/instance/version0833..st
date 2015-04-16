versions
version0833: spec
	<version: '0.8.33' imports: #('0.8.27-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8.33'.
		spec author: 'NorbertHartl'.
		spec timestamp: '1/16/2015 13:43'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.7';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.114';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.11';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.43';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.86';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.20';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.11';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.86';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.30';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.19';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.9';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.20'. ].
