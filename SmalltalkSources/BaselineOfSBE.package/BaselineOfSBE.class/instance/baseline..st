baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
			spec
				package: #'SBE-Environment';
				package: #'SBE-Extract';
				package: #'SBE-Quinto';
				package: #'SBE-Morphic';
				package: #'SBE-Streams';
				package: #'SBE-Testing'.
			spec
				group: #ci with: #(#'SBE-Extract' #'SBE-Quinto' #'SBE-Morphic')].