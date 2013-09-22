(function($){
	var jTabGroupCount = 0;
	$.fn.jTab = function(options) {
	   
		var defaults = {
			tabTitle: ''
		};
		var o = $.extend(defaults, options);
	   
		var tabs = $(this);
	   
		tabs.not(':first').css('display', 'none');
	    var tabStr = '<div class="jTab_links"><div id="jTab_group_' + ++jTabGroupCount + '">';
		tabs.each(function(i) {
			var tab = $(this);
			tab.addClass('jTab');
			var title = tab.children(o.tabTitle + ':first').text();
			tabStr += '<a href="#" alt="' + title + '">' + title + '</a> ';
		});
		tabStr += '</div></div><div style="clear:both;"></div>';
		tabs.eq(0).before(tabStr);
		
		var links = $('#jTab_group_' + jTabGroupCount + ' a');
		links.each(function(i) {
			var currLink = $(this);
			if(currLink.is(':first-child')) {
				currLink.addClass('first').addClass('active');
			} else if(currLink.is(':last-child')) {
				currLink.addClass('last');
			}
			currLink.click(function() {
				links.removeClass('active');
				currLink.addClass('active');
				tabs.not(':eq(' + i + ')').css('display', 'none');
				tabs.eq(i).css('display', 'block');
				return false;
			});
		});

		return tabs;
	};	
})(jQuery);