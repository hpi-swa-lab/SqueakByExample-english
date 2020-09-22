I'm the abstract superclass for all builders that can create and store SBESqueakPictures. My classSide is responsible for managing a resource directory and provides some convenient methods for running all builders.

Popular commands on me include:

SBEFigureBuilder buildAllTexFigures.
SBEFigureBuilder generateBuildersIn: SBEFigureBuilder resourceDirectory.
SBEFigureBuilder resourceDirectory: FileDirectory default asFSReference / 'subfolder-to-tex-files'.