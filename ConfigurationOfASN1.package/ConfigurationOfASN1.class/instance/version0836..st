versions
version0836: spec
	<version: '0.8.36' imports: #('0.8.28-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8.36'.
		spec author: 'NorbertHartl'.
		spec timestamp: '9/9/2015 14:12'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.150';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.14';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.48';
			package: 'ASN1-Tool' with: 'ASN1-Tool-HolgerHansPeterFreyther.98';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.28';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.14';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.98';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.41';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.21';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.11';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.20'. ].
