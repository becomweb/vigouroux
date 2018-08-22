{extends file='parent:catalog/product.tpl'}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="row">
      <div class="col-lg-5 l-column p-page">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}
              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
            {/block}
          </section>
        {/block}
        </div>
        <div class="col-lg-7 r-column">
          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
            {/block}
          {/block}
          {block name='product_details_info'}
                {if isset($product_manufacturer->id)}
                  <div class="product-manufacturer">
                    {if isset($manufacturer_image_url)}
                      <a href="{$product_brand_url}">
                        <img src="{$manufacturer_image_url}" class="img manufacturer-logo" />
                      </a>
                    {else}
                      <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
                      <span>
                        <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
                      </span>
                    {/if}
                  </div>
                {/if}
              {block name='product_prices'}
                {include file='catalog/_partials/product-prices.tpl'}
              {/block}
          {/block}
          <div class="product-information">
            <div class="product-actions">
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}

                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block}

                  {block name='product_refresh'}
                    <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit" value="{l s='Refresh' d='Shop.Theme.Actions'}">
                  {/block}
                </form>
              {/block}
              {block name='product_description_short'}
              <div id="product-description-short-{$product.id}" class="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
            {/block}              
            </div>


          </div>
        </div>
      </div>
      <div class="row">
        {if $product.description}
            {block name='product_description'}
              <section class="product-description">
                <div class="product_page_section_title">
                  {l s='Description' d='Shop.Theme.Catalog'}
                </div>
                {$product.description nofilter}
              </section>
            {/block}
        {/if}
        {if $product.features}
        <!-- Caracteristiques -->
        <section class="product-features">
          <div class="product_page_section_title">
            {l s='Features' d='Shop.Theme.Catalog'}
          </div>
          <ul id="product_features_list">
            {foreach from=$product.features item=feature}
            <li>
                <strong>{$feature.name} : </strong>
                <span>{$feature.value}</span>
            </li>
            {/foreach}
          </ul>
        </section>
        {/if}
      </div>

    {block name='product_tabs'}
         <div class="more-info">
           <ul class="nav nav-tabs_alternative">
             <li class="nav-item">
               <a class="data-sheet-tab nav-link{if $product.condition || $product.show_quantities || $product.availability_date || ($product.show_availability && $product.availability_message) || $product.minimal_quantity > 1 || $product.features || isset($product.specific_references)} active{/if}" data-toggle="tab" href="#product-details">
                 {l s='Product Details' d='Shop.Theme.Catalog'}
               </a>
             </li>
             {if $product.attachments}
             <li class="nav-item">
               <a class="nav-link {if !$product.condition && !$product.show_quantities && !$product.availability_date && !($product.show_availability && $product.availability_message) && !$product.minimal_quantity > 1 && !$product.features && !$product.specific_references && !$product.description} active{/if}" data-toggle="tab" href="#attachments">
                 {l s='Attachments' d='Shop.Theme.Catalog'}
               </a>
             </li>
             {/if}
             {foreach from=$product.extraContent item=extra key=extraKey}
             <li class="nav-item">
               <a class="nav-link" data-toggle="tab" href="#extra-{$extraKey}">{$extra.title}</a>
             </li>
             {/foreach}
             {if $accessories}
            <li class="nav-item">
               <a class="nav-link" data-toggle="tab" href="#accessories">{l s='Accessories' d='Shop.Interiorcatalog'}</a>
             </li>
             {/if}
            {if $product.is_customizable && count($product.customizations.fields)}
              <li class="nav-item">
                 <a class="nav-link" data-toggle="tab" href="#customization">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
             </li>
             {/if}
            {block name='product_tab'}
                {hook h='productTab'}
            {/block}
           </ul>


            {block name='product_details'}
              {include file='catalog/_partials/product-details.tpl'}
            {/block}

            {block name='product_attachments'}
              {if $product.attachments}
               <div class="tab-pane fade in{if !$product.condition && !$product.show_quantities && !$product.availability_date && !($product.show_availability && $product.availability_message) && !$product.minimal_quantity > 1 && !$product.features && !$product.specific_references && !$product.description} active{/if}" id="attachments">
                  <section class="product-attachments tab-pane-inner">
                    <h3 class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</h3>
                    {foreach from=$product.attachments item=attachment}
                      <div class="attachment">
                        <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                        <p>{$attachment.description}</p
                        <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                          {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                        </a>
                      </div>
                    {/foreach}
                  </section>
                </div>
              {/if}
            {/block}

            {foreach from=$product.extraContent item=extra key=extraKey}
            <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
              <div class="tab-pane-inner">
              {$extra.content nofilter}
              </div>
            </div>
            {/foreach}
            {block name='product_accessories'}
              {if $accessories}
                <div id="accessories" class="tab-pane fade in">
                    <section class="product-accessories carousel-products single-carousel products clearfix">
                      <div class="grid row js-carousel-accessories">
                        {foreach from=$accessories item="product_accessory"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
                          {/block}
                        {/foreach}
                      </div>
                    </section>
                </div>
              {/if}
            {/block}
            {if $product.is_customizable && count($product.customizations.fields)}
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
            {/if}
            {block name='product_tab_content'}
              {hook h='productTabContent'}
            {/block}
         </div>
    {/block}
    {block name='hook_display_reassurance'}
      <!-- Reassurance -->
      {hook h='displayReassurance'}
    {/block}
    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
