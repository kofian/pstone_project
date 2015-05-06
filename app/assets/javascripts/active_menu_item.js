
$(document).ready(function() {
	$('a.tab_link').click(function(e) {
	  $('a.tab_link').removeClass('active');
	  var $this = $(this);
	  if (!$this.hasClass('active')) {
	    $this.addClass('active');
	  }
	  e.preventDefault();
	});
});

$(document).ready(function() {
	$('.nav-pills li a.btn').click(function(e) {
	  $('.nav-pills li a.btn').removeClass('active');
	  var $this = $(this);
	  if (!$this.hasClass('active')) {
	    $this.addClass('active');
	  }
	  e.preventDefault();
	});
});

