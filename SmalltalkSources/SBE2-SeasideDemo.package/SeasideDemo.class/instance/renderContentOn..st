rendering
renderContentOn: html
	html heading: 'Rendering Demo'.

	html heading
		level: 2;
		with: 'Rendering basic HTML: '.
	html div
		class: 'subcomponent';
		with: htmlDemo.

	html heading
		level: 2;
		with: 'A form subcomponent: '.
	html div
		class: 'subcomponent';
		with: formDemo.

	html heading
		level: 2;
		with: 'Calling an edit field subcomponent: '.
	html div
		class: 'subcomponent';
		with: editDemo.

	html heading
		level: 2;
		with: 'Some standard dialogs: '..
	html div
		class: 'subcomponent';
		with: dialogDemo.