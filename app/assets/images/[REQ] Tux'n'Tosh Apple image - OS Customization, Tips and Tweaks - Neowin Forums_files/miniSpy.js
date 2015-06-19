var minispy;
var minispyTimer;
var minispyUpdate = "";
var lastRow;

document.observe("dom:loaded", function() {
	minispy_func();
	$('disable_miniSpy').observe('click',disable_miniSpy);
});

function minispy_func() {

	// Fetch new posts every 15 seconds
	alternate = $('spy_forum_table').down('tr',1).hasClassName('row2');  // check to see what color the last inserted row is.
	lastRow = alternate ? "row2" : "row1";
	url  = "/spy/mini?ajax=true&lastRow=" + lastRow + "&time=" + minispyUpdate;
	minispy = new Ajax.Request(url,
	{
		method: 'post',
		hideLoader: true,
		onSuccess: function(transport) {
			var json = transport.responseText.evalJSON();
			if (json.status=="ok") {
				minispyUpdate = json.time;
				if (json.data != "") {
					$('spy_data').insert({ after: json.data });
					element = $('spy_forum_table').down('tr',1);
					Effect.Pulsate(element, { pulses: 1, duration: 1 });
					trimTable();
				}
			} else { ajaxError(json.status) }
		}			
	});

	minispyTimer = setTimeout("minispy_func()",15000);
}

function trimTable() {
	$i = 0;
	$$('#spy_forum_table tr').each(function(n) {
		$i++;
		if ($i > 6) {
			n.remove();
		}
	});
}

function ajaxError(errorCode) {
	alert("Error received: " + errorCode);
}

function disable_miniSpy(){
	url  = ipb.vars['base_url'] + "app=core&module=ajax&section=miniSpy&disable=1&secure_key=" + ipb.vars['secure_hash'];	
	
	minispy_disable = new Ajax.Request(url,
	{
		method: 'post',
		onSuccess: function(transport) {
			var json = transport.responseText.evalJSON();
			if (json.status=="ok") {
				clearTimeout ( minispyTimer );
				Effect.BlindUp('mini_spy', { duration: 0.5 });
			} else { ajaxError(json.status) }
		}			
	});
}