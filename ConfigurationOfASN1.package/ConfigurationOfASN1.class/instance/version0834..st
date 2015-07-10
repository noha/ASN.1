versions
version0834: spec
	<version: '0.8.34' imports: #('0.8.27-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8.34'.
		spec author: 'NorbertHartl'.
		spec timestamp: '7/10/2015 18:02'.
		spec 
			project: 'PetitParser' with: '1.9';
			project: 'PetitParser Tests' with: '1.9'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-HolgerHansPeterFreyther.9';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.146';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.13';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.47';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.97';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.28';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-HolgerHansPeterFreyther.13';
			package: 'ASN1-AST' with: 'ASN1-AST-HolgerHansPeterFreyther.94';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.40';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.21';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.11';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.20'. ].
