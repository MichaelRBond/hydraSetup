var facetfun = "";

// If JavaScript Enabled - Setup
$(document).ready(function() {
  $(".wvu-header .list").addClass("destroy"); 
  $(".wvrhc-header .list2").addClass("destroy");   
  $("#wvrhctoggle .fa-chevron-up").addClass("hiding"); 
  $("#wvutoggle .fa-chevron-up").addClass("hiding"); 
  $("#menu-toggle #menu-toggle2").addClass("hiding");
  $("#search-toggle #search-toggle2").addClass("hiding");
  $("#facet-toggle #filter-toggle2").addClass("hiding");  

   facetfun = $('#sidebar').html();
});

//Mobile Facet Move
$(window).bind("load resize", function() {

	$('#facets').remove();

	if( $(window).width() < 768) {
  		$('.sticky-header-filter-sidebar').html(facetfun);
	}
  	else { 
  		$('#sidebar').html(facetfun);
	} 
	$(".sticky-header-filter-sidebar #facets #facet-panel-collapse").removeClass("collapse");
});


// Mobile Facet Setup
$(document).ready(function() {

	var windowh = document.documentElement.clientHeight;
	var tabbar = $('.sticky-header').height();

	var fheight = windowh - tabbar;

    $('.sticky-header-filter-sidebar').css('max-height', fheight);   

});

// Mobile Facet Resize
$(window).resize(function(){

	var windowh = document.documentElement.clientHeight;
	var tabbar = $('.sticky-header').height();

	var fheight = windowh - tabbar;

    $('.sticky-header-filter-sidebar').css('max-height', fheight);   

});

// Mobile WVU Nav
$(function () {
	$("#wvutoggle").click(function () {		
		$(".list").slideToggle("fast");
		$("#wvutoggle .fa-chevron-up").toggleClass("hiding");
		$("#wvutoggle .fa-chevron-down").toggleClass("hiding");
	});
});

// Mobile WVRHC Nav
$(function () {
	$("#wvrhctoggle").click(function () {		
		$(".list2").slideToggle("fast");
		$("#wvrhctoggle .fa-chevron-up").toggleClass("hiding");
		$("#wvrhctoggle .fa-chevron-down").toggleClass("hiding");
	});
});

// Tab Bar Navigation: Menu
$(function () {
	$("#menu-toggle").click(function () {		
		$("#sticky-header-nav-menu").toggleClass("tabbarToggle");
		$(".sticky-header-nav").toggleClass("tabbarBlue");
		$("#menu-toggle #menu-toggle1").toggleClass("hiding");
		$("#menu-toggle #menu-toggle2").toggleClass("hiding");

		$(".search-query-form").removeClass("tabbarToggle");
		$(".search-query-form").removeClass("tabbarToggleSearch");
		$(".sticky-header-search").removeClass("tabbarBlue");
		$("#search-toggle #search-toggle1").removeClass("hiding");
		$("#search-toggle #search-toggle2").addClass("hiding");	

		$(".sticky-header-filter-sidebar").removeClass("tabbarToggle2");
		$(".sticky-header-filter").removeClass("tabbarBlue");
		$("#facet-toggle #filter-toggle1").removeClass("hiding");
		$("#facet-toggle #filter-toggle2").addClass("hiding");	
	});
});

// Tab Bar Navigation: Search
$(function () {
	$("#search-toggle").click(function () {		
		$(".search-query-form").toggleClass("tabbarToggle");
		$(".search-query-form").toggleClass("tabbarToggleSearch");
		$(".sticky-header-search").toggleClass("tabbarBlue");
		$("#search-toggle #search-toggle1").toggleClass("hiding");
		$("#search-toggle #search-toggle2").toggleClass("hiding");

		$("#sticky-header-nav-menu").removeClass("tabbarToggle");
		$(".sticky-header-nav").removeClass("tabbarBlue");
		$("#menu-toggle #menu-toggle1").removeClass("hiding");
		$("#menu-toggle #menu-toggle2").addClass("hiding");

		$(".sticky-header-filter-sidebar").removeClass("tabbarToggle2");
		$(".sticky-header-filter").removeClass("tabbarBlue");
		$("#facet-toggle #filter-toggle1").removeClass("hiding");
		$("#facet-toggle #filter-toggle2").addClass("hiding");		
	});
});

// Tab Bar Navigation: Filter
$(function () {
	$("#facet-toggle").click(function () {		
		$(".sticky-header-filter-sidebar").toggleClass("tabbarToggle2");
		$(".sticky-header-filter-sidebar").toggleClass("tabbarToggleSearch");
		$(".sticky-header-filter").toggleClass("tabbarBlue");
		$("#facet-toggle #filter-toggle1").toggleClass("hiding");
		$("#facet-toggle #filter-toggle2").toggleClass("hiding");

		$("#sticky-header-nav-menu").removeClass("tabbarToggle");
		$(".sticky-header-nav").removeClass("tabbarBlue");
		$("#menu-toggle #menu-toggle1").removeClass("hiding");
		$("#menu-toggle #menu-toggle2").addClass("hiding");

		$(".search-query-form").removeClass("tabbarToggle");
		$(".search-query-form").removeClass("tabbarToggleSearch");
		$(".sticky-header-search").removeClass("tabbarBlue");
		$("#search-toggle #search-toggle1").removeClass("hiding");
		$("#search-toggle #search-toggle2").addClass("hiding");			
	});
});