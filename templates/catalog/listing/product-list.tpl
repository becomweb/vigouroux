{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='parent:catalog/listing/product-list.tpl'}

{block name='content'}
  <section id="main">

    <div class="page-heading product-listing catalog-title">
      <h2>
        {if $page.page_name == 'category'}
          {* Ajout "Notre selection" sur demande SEO *}
          <span>{$category.name} : {l s='Our selection' d='Shop.Theme.Catalog'}</span>
        {elseif $page.page_name == 'prices-drop'}
          <span>{l s='Prices drop' d='Shop.Interiorcatalog'}</span>
        {elseif $page.page_name == 'new-products'}
          <span>{l s='New products' d='Shop.Interiorcatalog'}</span>
      {elseif $page.page_name == 'best-sales'}
          <span>{l s='Best sellers' d='Shop.Interiorcatalog'}</span>
        {elseif $page.page_name == 'manufacturer'}
          <span>{$manufacturer.name}</span>
        {elseif $page.page_name == 'supplier'}
          <span>{$supplier.name}</span>
        {elseif $page.page_name == 'search'}
          <span>{l s='Search' d='Shop.Interiorcatalog'}</span>
        {/if}
      </h2>
      <span class="heading-counter">
        {if $listing.pagination.total_items > 1}
          {l s='There are %product_count% products.' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.pagination.total_items]}
        {else if $listing.pagination.total_items > 0}
          {l s='There is 1 product.' d='Shop.Theme.Catalog'}
        {/if}
      </span>
    </div>
      {block name='product_list_brand_description'}
      {if $page.page_name == 'manufacturer' && $manufacturer.description}
        <div id="manufacturer-short_description">{$manufacturer.short_description nofilter}</div>
        <div id="manufacturer-description">{$manufacturer.description nofilter}</div>
      {elseif $page.page_name == 'supplier' && $supplier.description}
        <div id="supplier-description">{$supplier.description nofilter}</div>
      {/if}
      {/block}
      {if $page.page_name == 'category'}
     {block name='category_subcategories'}
        <aside class="clearfix subcategories_list">
          {if $subcategories|count}
          <p class="subcategory-heading">{l s='Subcategories' d='Shop.Interiorcatalog'}</p>
            <nav class="subcategories">
              <ul>
                {foreach from=$subcategories item="subcategory"}
                  <li>
                    {block name='category_miniature'}
                      {include file='catalog/_partials/miniatures/category.tpl' category=$subcategory}
                    {/block}
                  </li>
                {/foreach}
              </ul>
            </nav>
          {/if}
        </aside>
      {/block}
      {/if}
    <section id="products" class="grid">
      {if $listing.products|count}
        <div id="">
          {block name='product_list_top'}
            {include file='catalog/_partials/products-top.tpl' listing=$listing}
          {/block}
        </div>

        {block name='product_list_active_filters'}
          <div id="" class="hidden-sm-down">
            {$listing.rendered_active_filters nofilter}
          </div>
        {/block}

        <div id="">
          {block name='product_list'}
            {include file='catalog/_partials/products.tpl' listing=$listing}
          {/block}
        </div>
       {*<div id="js-product-list-bottom">*}
          {block name='product_list_bottom'}
            {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
          {/block}
        {*</div>*}
      {else}

        {include file='errors/not-found.tpl'}

      {/if}
    </section>
    {hook h='displayHtmlContent4'}
  </section>
{/block}
