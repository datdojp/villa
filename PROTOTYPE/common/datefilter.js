document.write(
	[
		'From date<input id="fromdate" type="text"/>',
		'To date<input id="todate" type="text"/>'
	].join('')
);
$("#fromdate").datepicker();
$("#todate").datepicker();