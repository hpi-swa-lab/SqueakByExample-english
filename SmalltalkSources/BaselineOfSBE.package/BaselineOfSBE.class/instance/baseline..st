baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
			spec
				package: #'SBE-Extract';
				package: #'SBE-Quinto';
				package: #'SBE-Morphic'.
			spec
				group: #ci with: #(#'SBE-Extract' #'SBE-Quinto' #'SBE-Morphic')].