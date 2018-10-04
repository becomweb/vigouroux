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
 {extends file='parent:catalog/_partials/product-cover-thumbnails.tpl'}
   {block name='product_cover'}
    <div class="product-cover">
      <img class="js-qv-product-cover" src="{$product.cover.bySize.large_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" style="width:100%;" itemprop="image">
      <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
        <i class="material-icons zoom-in">&#xE8B6;</i>
      </div>
      {block name='product_flags'}
        <ul class="product-flags">
          {foreach from=$product.flags item=flag}
            <li class="product-flag {$flag.type}"><span>{$flag.label}</span></li>
          {/foreach}
          {if isset($product.is_selected) && $product.is_selected}
            <li class="is_selected">{l s='Selected for you' d='Shop.Theme.Catalog'}</li>
          {/if}
            {if isset($product.is_ready_to_drink) && $product.is_ready_to_drink}
            <li class="is_ready_to_drink">{l s='Ready to drink' d='Shop.Theme.Catalog'}</li>
          {/if}
            {if isset($product.is_pack) && $product.is_pack}
                <li class="pack">{l s='Pack' d='Shop.Theme.Catalog'}</li>
            {/if}
        </ul>
      {/block}
      {if isset($product.has_ab_label) && $product.has_ab_label}
      <div id="ab_label_container">
        <img src="{$urls.img_url}logo_label_AB.gif" class="img-responsive" />
      </div>
      {/if}
      {* Images des medailles *}
      {if isset($medals) && $medals}
      <ul id="product-cover-medals">
        {assign var=medal_counter value=0}
        {foreach from=$product.medals item=medal}
        {if isset($medal.image_url) && $medal.image_url != '' && $medal_counter < 5}
        <li>
            <img src="{$medal.image_url}" class="img-responsive" />
        </li>
        {$medal_counter=$medal_counter+1}
        {/if}
        {/foreach}
      </ul>
      {/if}
    </div>
  {/block}