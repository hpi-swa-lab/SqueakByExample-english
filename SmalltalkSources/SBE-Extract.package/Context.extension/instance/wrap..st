*SBE-Extract-controlling
wrap: aBlock
	"aBlock is expected to receive one block as an argument and must evaluate it exactly one time"

	self insertSender: (Context contextWrap: aBlock).