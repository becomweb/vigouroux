{*
* 2007-2017 PrestaShop
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
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!-- Block search module TOP -->
<div id="_desktop_search_bar">
	<div id="search_widget" data-search-controller-url="{$search_controller_url}">
		<div class="search-bar hidden-lg-up">
			<form class="search-bar__wrap" method="get" action="{$search_controller_url}">
				<input type="hidden" name="controller" value="search">
				<input class="search-bar__text" type="text" name="s" value="{$search_string}" placeholder="{l s='I search : Malbec, Merlot,...' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
				<button class="search-bar__btn font-search" type="submit">
				</button>
			</form>
		</div>
		<div class="search-block hidden-md-down">
			<span class="js-search-btn-toggle search-btn-toggle font-search"></span>
			<form class="search-form" method="get" action="{$search_controller_url}">
				<span class="search-close js-search-close"></span>
				<div class="search-field container -responsive">
					<input type="hidden" name="controller" value="search">
					<input class="input-text" type="text" name="s" value="{$search_string}" placeholder="{l s='I search : Malbec, Merlot,...' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
					<button class="search-btn font-search" type="submit">
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- /Block search module TOP -->
