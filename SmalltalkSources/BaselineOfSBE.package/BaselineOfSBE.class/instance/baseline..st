baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'FileSystem' with: [spec
			repository: 'github://j4yk/Squeak-FileSystem:master/src';
			loads: #('default' 'tests')].
		spec
			package: #'SBE-Environment';
			package: #'SBE-Extract' with: [spec requires: #('FileSystem')];
			package: #'SBE-Monticello';
			package: #'SBE-Morphic';
			package: #'SBE-Quinto';
			package: #'SBE-QuickTour';
			package: #'SBE-Streams';
			package: #'SBE-Testing';
			package: #'SBE-Tests'.
		spec group: #ci with: #(
			#'SBE-Environment'
			#'SBE-Extract'
			#'SBE-Monticello'
			#'SBE-Morphic'
			#'SBE-Quinto'
			#'SBE-QuickTour'
			#'SBE-Streams'
			#'SBE-Testing';
			#'SBE-Tests')].