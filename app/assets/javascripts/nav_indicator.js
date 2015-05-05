// Barnabas Bulpett
// WEB-289-YD1
// Spring 2015
// nav_indicator.js

// This file dynamically applies styles to active navigation elements to aid in usability.

var url = window.location; // get href of current page

// add active class to the nav element
$('ul.nav li a[href=:"'+ url +'"]').parent().addClass('active'); 