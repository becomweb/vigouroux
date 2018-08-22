{* Version "light" d'un item produit pour les listes (sans conditionnement / "labels nouveau, pack, pret-a-boire,... ") *}
{* Et sur demande SEO le nom du produit n'est pas un titre *}
{* Utilisé par les modules qui se greffent dans la colonne de gauche (nouveautes, meilleurs ventes,...) *}
{block name='product_miniature_item'}
  <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">
      <div class="thumbnail-wrapper">
      {block name='product_thumbnail'}
        <a href="{$product.canonical_url}" class="thumbnail product-thumbnail">
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
          <div class="h3 product-title" itemprop="name"><a href="{$product.canonical_url}">{$product.name|truncate:48:'...'}</a></div>
        {/block}
        {block name='product_description'}
          <p class="product_desc">{$product.description|strip_tags:'UTF-8'|truncate:100:'...'}</p>
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
    </div>
        <div class="actions_buttons_container {*highlighted-informations*} {if !$product.main_variants} no-variants{/if}">
          <div class="inner">
            {if !$configuration.is_catalog}
                {include file='catalog/_partials/custom/add-to-cart-product-list.tpl' product=$product name_module='product-list'}
            {/if}
            {* Bouton ajout au panier *}
            {hook h='displayProductListFunctionalButtons' product=$product}
            {block name='more_info'}
                <a href="{$product.canonical_url}" class="link-view btn">
                  <span>{l s='Discover this product' d='Shop.Theme.Catalog'}</span>
                </a>
            {/block}
          </div>
        </div>
      </div>
  </article>
{/block}
