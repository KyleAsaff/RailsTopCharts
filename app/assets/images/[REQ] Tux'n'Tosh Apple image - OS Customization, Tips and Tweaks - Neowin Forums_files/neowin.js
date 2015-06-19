function moveForum(elm, dir, forumId)
{
	url  = ipb.vars['base_url'] + "app=core&module=ajax&section=favorites&do=" + dir + "&forumid=" + forumId + "&secure_key=" + ipb.vars['secure_hash'];
	forumMover = new Ajax.Request(url,
	{
		method: 'post',
		onSuccess: function(transport) {
			var json = transport.responseText.evalJSON();
			if (json.status=="ok") {
				if (dir == 'up') {
					current = $(elm).up('tr');
					previous = $(current).previous();
					if ( $(previous).hasClassName('row1') )
					{
						$(current).removeClassName('row2');
						$(current).addClassName('row1');
						$(previous).removeClassName('row1');
						$(previous).addClassName('row2');
						$(previous).insert({ before: current });
						
					} else if ( $(previous).hasClassName('row2') )
					{
						$(current).removeClassName('row1');
						$(current).addClassName('row2');
						$(previous).removeClassName('row2');
						$(previous).addClassName('row1');
						$(previous).insert({ before: current });		
					}
				} else if (dir == 'down')
				{
					current = $(elm).up('tr');
					next = $(current).next();
					if ( $(next) )
					{
						if ( $(next).hasClassName('row1') )
						{
							$(current).removeClassName('row2');
							$(current).addClassName('row1');
							$(next).removeClassName('row1');
							$(next).addClassName('row2');
							$(next).insert({ after: current });
						} else 
						{
							$(current).removeClassName('row1');
							$(current).addClassName('row2');
							$(next).removeClassName('row2');
							$(next).addClassName('row1');
							$(next).insert({ after: current });
						}
					}				
				}
			} else { ajaxError(json.status) }
		}			
	});
}

function searchNews(elm)
{
	$$('li.active').each( function(mod){
		$( mod ).removeClassName('active');
	});
	$('nav-discussion').addClassName('active');
	$(elm).up().addClassName('active');

	url  = "/spy/news/?ajax=true";
	newsSearch = new Ajax.Request(url,
	{
		method: 'post',
		evalJSON: 'force',	
		onSuccess: function(transport) {
			var json = transport.responseJSON;
			if (json.status=="ok") {
				searchData = "<table class='ipb_table topic_list' cellspacing='0' id='forum_table'><tr class='subheading'><th scope='col' class='col_f_icon'></th><th scope='col' class='col_f_topic'></th><th scope='col' class='col_f_starter'></th><th scope='col' class='col_f_starter short'></th><th scope='col' class='col_f_views stats'></th><th scope='col' class='col_f_post'></th></tr>";
				for (a=0; a < json.data.length; a++) { 
					row_class = (a%2) ? "row1" : "row2";
					searchData = searchData + "<tr class=\"" + row_class + "\"><td class=\"short altrow\"><img src=\"public/style_images/master/t_unread.png\" alt=\"\"></td><td colspan=\"5\"><a href=\"/news/" + json.data[a]['slug'] +"/\" title=\"\" class=\"topic_title\">" + json.data[a]['title'] +"</a><br><span class=\"desc\">By: <a href=\"/profile/" + json.data[a]['poster_slug'] + "\">" + json.data[a]['realname'] +"</a> on " + json.data[a]['parsed_time'] + "</span></td></tr>";
				}
				searchData = "</table>" + searchData;
				$('search-content').replace( searchData );

			} else { ajaxError(json.status) }
		}
	});
}

function changeTheme(e)
{
	var url = e.element().href;
	var regex = /settingNewSkin=(\d+)/i;
	var skinId = url.match(regex)[1];
	
	$('newSkin').setValue(skinId);
	$('footer-theme-chooser').submit();
	e.stop();
}

document.observe('dom:loaded', function() {
	$$('#header-theme-chooser a').each(function(item) {
		item.observe('click', changeTheme);
	})
});