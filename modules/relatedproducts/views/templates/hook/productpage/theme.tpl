{*
 * RelatedProducts Merchandizing (Version 2.0.0)
 *
 * @author Lineven / Lineven-ICT <support-prestashop@lineven.com>
 * @copyright 2018 Lineven
 * @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * International Registered Trademark & Property of Lineven
 *}

{extends file='module:relatedproducts/views/templates/hook/_partials/layout_theme.tpl'}

{block name="lrlp_header"}
	<div class="theme">
{/block}
{block name="lrlp_title"}
    {if !isset($lineven.rlp.hook.datas.in_tab)}
		<div class="product-page-cross-selling-section-title">{$section_title|escape:'htmlall':'UTF-8'}</div>
	{/if}
{/block}
{block name="lrlp_content_header"}
	<section id="products">
		<div class="products catalog-products owl-carousel product-page-cross-selling-carousel">
{/block}
{block name="lrlp_product"}
	{include file="catalog/_partials/miniatures/product.tpl" product=$related_product}
{/block}
{block name="lrlp_content_footer"}
		</div>
	</section>
{/block}
{block name="lrlp_footer"}
	</div>
{/block}
