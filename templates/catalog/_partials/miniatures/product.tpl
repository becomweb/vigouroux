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
{block name='product_miniature_item'}
  <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">
      <div class="thumbnail-wrapper">
      {block name='product_thumbnail'}
        <a href="{$product.url}" class="thumbnail product-thumbnail">
          {foreach name="thumbnails" from=$product.images item=image}
            {if $smarty.foreach.thumbnails.iteration == 2}
              <img
                class="thumbnail-alternate"
                src="{$image.bySize.home_default.url}"
                alt="{$image.legend}"
              >
            {/if}
          {/foreach}
          <img
            class="thumbnail-img"
            src = "{$product.cover.bySize.home_default.url}"
            alt = "{$product.cover.legend}"
            data-full-size-image-url = "{$product.cover.large.url}"
          >
        </a>
      {/block}
        {block name='product_flags'}
        <ul class="product-flags">
          {if $product.has_discount}
              {if $product.discount_type === 'percentage'}
                <span class="discount-percentage">{$product.discount_percentage}</span>
              {elseif $product.discount_type === 'amount'}
                <span class="discount-percentage">{$product.discount_amount_to_display}</span>
              {/if}
          {/if}
          {foreach from=$product.flags item=flag}
            <li class="{$flag.type}">{$flag.label}</li>
          {/foreach}
        </ul>
        {/block}
      </div>
        {block name='product_variants'}
        {if $product.main_variants}
          {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
        {/if}
        {/block}
      <div class="right-block">
      <div class="product-desc">
        {block name='product_reviews'}
          {hook h='displayProductListReviews' product=$product}
        {/block}
        {block name='product_name'}
          <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:48:'...'}</a></h3>
        {/block}
        {* Appellation et couleur du vin *}
        {if isset($product.wine_origin) && isset($product.wine_color)}
        <p class="wine_color_and_origin">
          {if !empty($product.wine_origin)}<span class="wine_origin">{l s='PDO' d='Shop.Theme.Catalog'} {$product.wine_origin}</span> - {/if}
          {if !empty($product.wine_color)}<span class="wine_color">{$product.wine_color}</span>{/if}
        </p>
        {/if}
        {block name='product_description'}
          <p class="product_desc">{$product.description|strip_tags:'UTF-8'|truncate:200:'...'}</p>
        {/block}
        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping">
              <span itemprop="price" class="price">{$product.price}</span>
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                <span class="regular-price">{$product.regular_price}</span>
              {/if}

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              <div class="product_unit_price">
                {if (isset($product.unit_price) && !empty($product.unit_price != '')) && (isset($product.unity) && ($product.unity != ''))}
                ({l s='So' d='Shop.Theme.Global'} {$product.unit_price} / {$product.unity})
                {/if}
              </div>
            {hook h='displayProductPriceBlock' product=$product type='weight'}
          </div>
        {/if}
        {/block}
        {* Conditionnement (ex : carton de x bouteilles) *}
        <div class="product_conditioning">
          {if isset($product.conditioning) && ($product.conditioning  != '')}
            {$product.conditioning|truncate:36:'...'}
          {/if}
        </div>
    </div>
        <div class="highlighted-informations{if !$product.main_variants} no-variants{/if}">
          <div class="inner">
            {if !$configuration.is_catalog}
                {include file='catalog/_partials/custom/add-to-cart-product-list.tpl' product=$product name_module='product-list'}
            {/if}
            {hook h='displayProductListFunctionalButtons' product=$product}
            {block name='quick_view'}
              <a class="quick-view" href="#" data-link-action="quickview">
                <i class="font-eye"></i><span>{l s='Quick view' d='Shop.Theme.Actions'}</span>
              </a>
            {/block}
            {block name='more_info'}
                <a href="{$product.url}" class="link-view">
                  <i class="font-more"></i>
                    <span>{l s='More info' d='Shop.Interioractions'}</span>
                </a>
            {/block}
          </div>
        </div>
      </div>
  </article>
{/block}
