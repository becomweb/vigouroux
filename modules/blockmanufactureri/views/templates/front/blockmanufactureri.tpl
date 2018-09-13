{*
* 2007-2012 PrestaShop
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
* versions in the future. If you swish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 7077 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{* Template legerement modifie pour SEO (h2 pour tite, title des liens et alt des img) *}
<!-- Liste des AOC -->
<section id="manufacturers-home" class="manufacturers-home container wow slideInRight" data-wow-offset="200">
	<h2 class="headline-section">{if $display_link_manufacturer}<a href="{$link->getPageLink('manufacturer')}" title="{l s='Our partners' d='Shop.Manufacturers'}">{/if}{$blockmanufactureri_category_name|escape:'html':'UTF-8'}{if $display_link_manufacturer}</a>{/if}</h2>
	<p class="description-section">
		{$blockmanufactureri_description_name|escape:'html':'UTF-8'}
	</p>
{if $manufacturers}
	<ul class="clearfix manufacturers-list js-man-carousel{if $text_list} carousel-view{else} grid-view{/if}" {if $text_list}data-carousel="{$text_list}"{/if}>
	{foreach from=$manufacturers item=manufacturer name=manufacturer_list}
		{if $smarty.foreach.manufacturer_list.iteration <= $text_list_nb}
		<li class="manufacturer-items">
	        {*<a href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)}" title="{l s='Discover %s PDO wines by' d='Shop.Theme.Global' sprintf=[$manufacturer.name]} {$shop.name}">*}
	        	<img src="{if $psversion < '1.7.0.0'}{$img_manu_dir}{else}{$urls.img_manu_url}{/if}{$manufacturer.id_manufacturer}-manufacturer_default.jpg" alt="{l s='%s PDO wines by' d='Shop.Theme.Global' sprintf=[$manufacturer.name]} {$shop.name}" />
	        {*</a>*}
        </li>
		{/if}
	{/foreach}
	</ul>
{else}
	<p>{l s='No manufacturer' d='Shop.Manufacturers'}</p>
{/if}
</section>