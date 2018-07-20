<div id="_desktop_cart">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    <div class="cart-header">
      {if $cart.products_count > 0}
        <a class="inner-wrapper" rel="nofollow" href="{$cart_url}">
      {else}
        <span class="inner-wrapper">
      {/if}
        <i class="font-cart"></i>
        <span class="cart-products-count">{$cart.products_count}</span>
      {if $cart.products_count > 0}
        </a>
      {else}
        </span>
      {/if}
    </div>
    <div class="body cart-hover-content">
        <div class="container">
             <ul>
             {foreach from=$cart.products item=product}
                 <li class="cart-wishlist-item">
                 {include 'module:ps_shoppingcart/ps_shoppingcart-product-line.tpl' product=$product}
                 </li>
             {/foreach}
             </ul>
             <div class="cart-footer">
                 <div class="cart-subtotals">
                     {foreach from=$cart.subtotals item="subtotal"}
                     <div class="{$subtotal.type}">
                         <span class="value">{$subtotal.value}</span>
                         <span class="label">{$subtotal.label}</span>
                     </div>
                     {/foreach}
                    <div class="cart-total">
                         <span class="value">{$cart.totals.total.value}</span>
                         <span class="label">{$cart.totals.total.label}</span>
                    </div>
                 </div>
                 <div class="cart-wishlist-action">
                     <a class="btn cart-wishlist-checkout" href="{$cart_url}">{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
                 </div>
             </div>
         </div>
     </div>
  </div>
</div>

