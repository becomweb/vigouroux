{extends file='parent:catalog/product.tpl'}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="row">
      <div class="col-md-5 l-column p-page">
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
        <div class="col-md-7 r-column">
          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
            {/block}
            {block name='product_description_short'}
              <div id="product-description-short-{$product.id}" class="product-description-short" itemprop="description">
                <p>{$product.description_short|strip_tags}</p>
              </div>
            {/block}
            <div id="ratings_and_wine_infos" class="row">
                {if isset($product_nb_comments) && $product_nb_comments > 0}
                {include file="module:productcomments/productcomments_reviews.tpl" averageTotal=$product_average_grade nbComments=$product_nb_comments}
                {/if}
                {if isset($wine_color) || isset($wine_orgin)}
                <h2 id="winecolor_and_origin">
                  {if isset($wine_origin) && $wine_origin != ''}
                  <span id="wine_origin">{$wine_origin}</span>
                  {/if}
                  {if isset($wine_color) && $wine_color != ''}
                  <span id="wine_color">{$wine_color}</span>
                  {/if}
                </h2>
                {/if}
            </div>
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
            </div>
          </div>
        </div>
      </div>

      {if $product.description}
      <!-- Description longue -->
      {block name='product_description'}
        <section class="product-description">
          <div class="product_page_section_title">
            {l s='Description' d='Shop.Theme.Catalog'}
          </div>
          {$product.description nofilter}
        </section>
      {/block}
      {/if}

      {* Hook custom pour affichage des listes de cross-selling du module relatedproducts (voir override/modules/relatedproducts.php) *}
      {hook h='displayCrossSellingProduct'}

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

      {if isset($medals) && $medals}
      <!-- Recompenses / Medailles -->
      <section class="product-rewards">
        <div class="product_page_section_title">
          {l s='Rewards' d='Shop.Theme.Catalog'}
        </div>
        <ul id="product_rewards_list">
          {foreach from=$medals item=medal}
          <li>
            <span class="reward_year">{$medal.year}</span>
            <span class="reward_level {$medal.color}">
              {if $medal.level == '1'}
                {l s='Gold' d='Shop.Theme.Catalog'}
              {elseif $medal.level == '2'}
                {l s='Silver' d='Shop.Theme.Catalog'}
              {elseif $medal.level == '3'}
                {l s='Bronze' d='Shop.Theme.Catalog'}
              {else}
                {if !empty($medal.level_custom)}{$medal.level_custom}{else}N/A{/if}
              {/if}
            </span>
            <span class="reward_name">
              {$medal.name}
            </span>
          </li>
          {/foreach}
        </ul>
      </section>
      {/if}

      {block name='hook_display_reassurance'}
        <!-- Reassurance -->
        {hook h='displayReassurance'}
      {/block}

      {block name='product_accessories'}
      {if $accessories}
        <!-- Accessoires -->
        <section class="product-accessories carousel-products single-carousel products clearfix">
          <div class="product_page_section_title">{l s='Accessories' d='Shop.Interiorcatalog'}</div>
          <div class="grid row js-carousel-accessories">
            {foreach from=$accessories item="product_accessory"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
      {/block}

      {block name='product_details'}
        <!-- Details (conditions, reference,...) -->
        {* Non present sur les maquettes dont caché avec classe "d-none" *}
        {include file='catalog/_partials/product-details.tpl'}
      {/block}


      {block name='product_attachments'}
        {if $product.attachments}
          <!-- Documents joints -->
          <section class="product-attachments">
            <div class="product_page_section_title">{l s='Download' d='Shop.Theme.Actions'}</div>
            <div class="table-responsive">
              <table class="table table-bordered">
                  <tbody>
                    {foreach from=$product.attachments item=attachment}
                    <tr>
                        <td>{$attachment.name}</td>
                        <td>{$attachment.description} ({$attachment.file_size_formatted})</td>
                        <td>
                            <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                              <i class="material-icons">cloud_download</i>
                            </a>
                        </td>
                    </tr>
                    {/foreach}
                  </tbody>
              </table>
            </div>
          </section>
        {/if}
      {/block}


    {block name='product_tabs'}
    <div class="more-info">
      <ul class="nav nav-tabs_alternative">
        {foreach from=$product.extraContent item=extra key=extraKey}
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#extra-{$extraKey}">{$extra.title}</a>
        </li>
        {/foreach}
      {if $product.is_customizable && count($product.customizations.fields)}
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#customization">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
        </li>
        {/if}
      {block name='product_tab'}
          {hook h='productTab'}
      {/block}
      </ul>
      {foreach from=$product.extraContent item=extra key=extraKey}
      <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
        <div class="tab-pane-inner">
        {$extra.content nofilter}
        </div>
      </div>
      {/foreach}
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
