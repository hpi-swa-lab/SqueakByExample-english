Stack machine example for Seaside.
Demo:

	StackMachine new inspect

In the inspector view self and run:

	self push: 1; push: 1

Then repeatedly run:

	self dup; rotUp; add

The Seaside view class is RPNCalculator.
