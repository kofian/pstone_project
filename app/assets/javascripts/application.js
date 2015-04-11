// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
$(function() {
	$('a.tab_link').click(function(e) {
	    $('a.tab_link').removeClass('active');
	    $(this).addClass('active');
	});
});

// $(function() {
//   $("#accounts th a, #accounts .pagination a").live("click", function() {
//     $.getScript(this.href);
//     return false;
//   });
//   $("#accounts_search input").keyup(function() {
//     $.get($("#accounts_search").attr("action"), $("#accounts_search").serialize(), null, "script");
//     return false;
//   });
// });

// $(function() {
//   $("#customers th a, #customers .pagination a").live("click", function() {
//     $.getScript(this.href);
//     return false;
//   });
//   $("#customers_search input").keyup(function() {
//     $.get($("#customers_search").attr("action"), $("#customers_search").serialize(), null, "script");
//     return false;
//   });
// });

// $(function() {
//   $("#acct_transactions th a, #acct_transactions .pagination a").live("click", function() {
//     $.getScript(this.href);
//     return false;
//   });
//   $("#acct_transactions_search input").keyup(function() {
//     $.get($("#acct_transactions_search").attr("action"), $("#acct_transactions_search").serialize(), null, "script");
//     return false;
//   });
// });