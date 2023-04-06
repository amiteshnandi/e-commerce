// init Isotope
var $grid = $('.product-card-items').isotope({
	// options
});
// filter items on button click
$('.filter-button-group').on('click', 'button', function() {
	var filterValue1 = $(this).attr('data-filter');
	resetFilterBtns();
	$(this).addClass('active-filter-btn');
	$grid.isotope({ filter: filterValue1 });
});

var filterBtns = $('.filter-button-group').find('button');
function resetFilterBtns() {
	filterBtns.each(function() {
		$(this).removeClass('active-filter-btn');
	});
}








