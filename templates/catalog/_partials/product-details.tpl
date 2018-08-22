
<div class="tab-pane fade in{if $product.condition || $product.show_quantities || $product.availability_date || ($product.show_availability && $product.availability_message) || $product.minimal_quantity > 1 || $product.features || isset($product.specific_references)} active{/if}"
     id="product-details"
     data-product="{$product.embedded_attributes|json_encode}"
  >
  <div class="tab-pane-inner">
      <div class="product-info">
            {block name='product_condition'}
            {if $product.condition}
              <div class="product-condition">
                <label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
                <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
                <span>{$product.condition.label}</span>
              </div>
            {/if}
          {/block}
          {block name='product_reference'}
            {if isset($product.reference_to_display)}
              <div class="product-reference">
                <label class="label">{l s='Reference' d='Shop.Theme.Catalog'} </label>
                <span itemprop="sku">{$product.reference_to_display}</span>
              </div>
            {/if}
          {/block}
          {block name='product_quantities'}
            {if $product.show_quantities}
              <div class="product-quantities">
                <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
                <span>{$product.quantity} {$product.quantity_label}</span>
              </div>
            {/if}
          {/block}

          {block name='product_availability_date'}
            {if $product.availability_date}
              <div class="product-availability-date">
                <label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
                <span>{$product.availability_date}</span>
              </div>
            {/if}
          {/block}
          {block name='product_minimal_quantity'}
              {if $product.minimal_quantity > 1}
                <p class="product-minimal-quantity alert alert-info">
                {l
                s='The minimum purchase order quantity for the product is %quantity%.'
                d='Shop.Theme.Checkout'
                sprintf=['%quantity%' => $product.minimal_quantity]
                }
                </p>
              {/if}
          {/block}
      </div>
      {block name='product_out_of_stock'}
        <div class="product-out-of-stock">
          {hook h='actionProductOutOfStock' product=$product}
        </div>
      {/block}

  {* if product have specific references, a table will be added to product details section *}
  {block name='product_specific_references'}
    {if isset($product.specific_references)}
      <section class="product-features">
        <h3 class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</h3>
          <dl class="data-sheet">
            {foreach from=$product.specific_references item=reference key=key}
              <dt class="name">{$key}</dt>
              <dd class="value">{$reference}</dd>
            {/foreach}
          </dl>
      </section>
    {/if}
  {/block}
</div>
</div>

