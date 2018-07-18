$(document).ready(function() {
	//index page
	$(".js-carousel-products").each(function() {
		var owlProductsIndex = $(this);
			owlProductsIndex.owlCarousel({
			items: 4,
			nav: owlProductsIndex.children().length > 1,
			dots: false,
			autoplay: true,
			loop: owlProductsIndex.children().length > 1,
			responsiveClass:true,
			responsive:{
				0:{
					items:2
				},
				480:{
					items:2
				},
				768:{
					items:3
				},
				991:{
					items:4
				}
			},
			navText: ['<i class="font-arrow-left">','<i class="font-arrow-right">']
		});
	});
	/*product page*/
	var owlProducts = $('.js-carousel-productscategory,.js-carousel-accessories, .js-carousel-featured');
	owlProducts.owlCarousel({
		items: 5,
		nav: false,
		dots: true,
		autoplay: true,
		loop: owlProducts.children().length > 1,
		responsiveClass:true,
		responsive:{
			0:{
				items:1
			},
			480:{
				items:2
			},
			768:{
				items:3
			},
			991:{
				items:4
			}
		},
		navText:	['<i class="font-left-open-big">','<i class="font-right-open-big">']
	});
});

