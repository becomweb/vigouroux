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
{if $product.show_price}
  <div class="product-prices">
    {block name='product_discount'}
      {if $product.has_discount}
        <div class="product-discount">
          {hook h='displayProductPriceBlock' product=$product type="old_price"}
          
        </div>
      {/if}
    {/block}

    {block name='product_price'}
      <div
        class="product-price h5 {if $product.has_discount}has-discount{/if}"
        itemprop="offers"
        itemscope
        itemtype="https://schema.org/Offer"
      >
        <link itemprop="availability" href="https://schema.org/InStock"/>
        <meta itemprop="priceCurrency" content="{$currency.iso_code}">

        <div class="current-price">
          <span class="price" itemprop="price" content="{$product.price_amount}">{$product.price}</span>
          {* HT / TTC *}
          <span> {if $configuration.display_taxes_label} {$product.labels.tax_long}{/if}</span>
          {* Mention conditionnement *}
          {if isset($product_conditioning) && $product_conditioning != ''}
          <span class="product_conditioning">{l s='per' d='Shop.Theme.Global'} {$product_conditioning}</span>
          {/if}
          {if $product.has_discount}
            {if $product.discount_type === 'percentage'}
              <span class="discount discount-percentage">{l s='-' d='Shop.Theme.Catalog'} {$product.discount_percentage_absolute}</span>
            {else}
              <span class="discount discount-amount">
                  {l s='-' d='Shop.Theme.Catalog'} {$product.discount_to_display}
              </span>
            {/if}
            <span class="regular-price">{$product.regular_price}</span>
          {/if}
        </div>

        {block name='product_unit_price'}
          {if $displayUnitPrice}
            <p class="product-unit-price sub">({l s='So' d='Shop.Theme.Global'} {l s='%unit_price%' d='Shop.Theme.Catalog' sprintf=['%unit_price%' => $product.unit_price]} {l s='per' d='Shop.Theme.Global'} {l s='%unity%' d='Shop.Theme.Catalog' sprintf=['%unity%' => $product.unity]})</p>
          {/if}
        {/block}
      </div>
    {/block}

    {block name='product_without_taxes'}
      {if $priceDisplay == 2}
        <p class="product-without-taxes">{l s='%price% tax excl.' d='Shop.Theme.Catalog' sprintf=['%price%' => $product.price_tax_exc]}</p>
      {/if}
    {/block}

    {block name='product_pack_price'}
      {if $displayPackPrice}
        <p class="product-pack-price"><span>{l s='Instead of %price%' d='Shop.Theme.Catalog' sprintf=['%price%' => $noPackPrice]}</span></p>
      {/if}
    {/block}

    {block name='product_ecotax'}
      {if $product.ecotax.amount > 0}
        <p class="price-ecotax">{l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax.value]}
          {if $product.has_discount}
            {l s='(not impacted by the discount)' d='Shop.Theme.Catalog'}
          {/if}
        </p>
      {/if}
    {/block}

    {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}

    <div class="tax-shipping-delivery-label">
      {hook h='displayProductPriceBlock' product=$product type="price"}
      {hook h='displayProductPriceBlock' product=$product type="after_price"}
      {if $product.additional_delivery_times == 1}
        {if $product.delivery_information}
          <span class="delivery-information">{$product.delivery_information}</span>
        {/if}
      {elseif $product.additional_delivery_times == 2}
        {if $product.quantity > 0}
          <span class="delivery-information">{$product.delivery_in_stock}</span>
        {else}
          <span class="delivery-information">{$product.delivery_out_stock}</span>
        {/if}
      {/if}
    </div>
  </div>
{/if}
