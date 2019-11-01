I'm the abstract superclass for all builders that can create and store SBESqueakPictures. By definition, I am a test case, but actually my task is building rather than testing. My class is responsible for generating builder classes and running them.

Popular commands on me include:

SBEFigureBuilder buildAllTexFigures.
SBEFigureBuilder generateBuildersIn: SBEFigureBuilder resourceDirectory.
SBEFigureBuilder resourceDirectory: FileDirectory default asFSReference / 'subfolder-to-tex-files'.

Or if you have loaded some builders, you can simply run them using the TestRunner oder System Browser.