baselines
baseline0829: spec
	<version: '0.8.29-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main'.
		spec 
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.9';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ];
			project: 'PetitParser Tests' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '1.9';
					loads: #('Tests' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ];
			project: 'Phexample' with: [
				spec
					className: #ConfigurationOfPhexample;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Phexample/Phexample/main/' ].
		spec 
			package: 'ASN1-Common';
			package: 'ASN1-Model' with: [
				spec requires: #('ASN1-Common' ). ];
			package: 'ASN1-Tests-Model' with: [
				spec requires: #('ASN1-Model' 'Phexample' ). ];
			package: 'ASN1-Codec' with: [
				spec requires: #('ASN1-Common' 'PetitParser' ). ];
			package: 'ASN1-Tool' with: [
				spec requires: #('ASN1-Model' 'ASN1-Codec' ). ];
			package: 'ASN1-Tests-Codec' with: [
				spec requires: #('ASN1-Codec' ). ];
			package: 'ASN1-Syntax' with: [
				spec requires: #('ASN1-Common' 'PetitParser' ). ];
			package: 'ASN1-AST' with: [
				spec requires: #('ASN1-Syntax' ). ];
			package: 'ASN1-Builder' with: [
				spec requires: #('ASN1-AST' 'ASN1-Model' ). ];
			package: 'ASN1-Tests-Syntax' with: [
				spec requires: #('ASN1-Syntax' 'PetitParser Tests' ). ];
			package: 'ASN1-Tests-AST' with: [
				spec requires: #('ASN1-AST' 'ASN1-Tests-Syntax' ). ];
			package: 'ASN1-Tests-Builder' with: [
				spec requires: #('ASN1-Builder' 'ASN1-Tests-AST' 'ASN1-Tests-Model' ). ];
			package: 'ASN1-Tests-Tool' with: [
				spec requires: #('ASN1-Builder' 'ASN1-Tool' 'ASN1-Tests-Model' 'ASN1-Tests-Codec' 'ASN1-Tests-AST' 'ASN1-Tests-Builder' ). ].
		spec 
			group: 'builder' with: #('ASN1-AST' 'ASN1-Model' 'ASN1-Builder' );
			group: 'builder-tests' with: #('ASN1-Tests-Syntax' 'ASN1-Tests-AST' 'ASN1-Tests-Model' 'ASN1-Tests-Builder' );
			group: 'tool' with: #('ASN1-Tool' );
			group: 'tool-tests' with: #('ASN1-Tests-Tool' 'ASN1-Tests-Codec' );
			group: 'tests' with: #('builder-tests' 'tool-tests' );
			group: 'default' with: #('builder' 'tool' );
			group: 'all' with: #('default' 'builder-tests' 'tool-tests' ). ].
