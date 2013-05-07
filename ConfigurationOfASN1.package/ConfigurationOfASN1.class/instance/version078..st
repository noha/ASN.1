versions
version078: spec
	<version: '0.7.8' imports: #('0.7.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.7.8 : combined two production rules into one so that one instVar can be removed. Now we can upgrade to the latest petit parser which introduces a new instVar'.
		spec author: 'NorbertHartl'.
		spec timestamp: '5/7/2013 14:55'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.4';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.5';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.56';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.5';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.48';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.5';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.2';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.17';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.1';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.36';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.4'. ].
