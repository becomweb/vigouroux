/*
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 *  @author PrestaShop SA <contact@prestashop.com>
 *  @copyright  2007-2018 PrestaShop SA
 *  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

jQuery(document).ready(function() {
    var owlFeatures = $(".js-htmlbanners5-carousel");
    if (owlFeatures.data('carousel')){
        owlFeatures.owlCarousel({
            autoplaySpeed: 800,
            navSpeed: 800,
            dotsSpeed: 800,
            items: owlFeatures.data('items'),
            nav: (owlFeatures.children().length > 1) ? owlFeatures.data('navigation') : false,
            dots: (owlFeatures.children().length > owlFeatures.data('items')) ? owlFeatures.data('pagination') : false,
            autoplay: owlFeatures.data('autoplay'),
            autoplayTimeout: owlFeatures.data('timeout'),
            autoplayHoverPause: owlFeatures.data('pause'),
            loop: (owlFeatures.children().length > 1) ? owlFeatures.data('loop') : false,
            responsiveClass: true,
            responsive:{
                0:{
                    items: owlFeatures.data('items_480')
                },
                480:{
                    items: owlFeatures.data('items_768')
                },
                768:{
                    items: owlFeatures.data('items_991')
                },
                991:{
                    items: owlFeatures.data('items_1199')
                },
                1199:{
                    items: owlFeatures.data('items')
                }
            },
            navText: ['<i class="font-arrow-left">','<i class="font-arrow-right">']
        });
    }
});