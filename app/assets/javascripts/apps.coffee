# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	if $(".pagination").length
		$(window).scroll ->
			if  $(window).scrollTop() > $(document).height() - $(window).height() - 200
				nextpage = $(".pagination a[rel=next]").attr("href")
				$(".pagination").text("Loading more apps...")
				getNextPage = ->
					console.log(nextpage)
					console.log("bottom of page")
					$.getScript(nextpage)
				if nextpage?
					setTimeout(getNextPage, 1000)