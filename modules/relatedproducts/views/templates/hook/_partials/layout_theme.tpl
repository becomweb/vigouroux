{*
 * RelatedProducts Merchandizing (Version 2.0.0)
 *
 * @author Lineven / Lineven-ICT <support-prestashop@lineven.com>
 * @copyright 2018 Lineven
 * @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * International Registered Trademark & Property of Lineven
 *}

{if $lineven.rlp.is_active == true && isset($lineven.rlp.hook.datas.sections) && $lineven.rlp.hook.datas.sections}
    {assign var=section_title value={$lineven.rlp.hook.datas.title}}
    {block name="lrlp_before_sections"}{/block}
    <div class="row">
    {foreach from=$lineven.rlp.hook.datas.sections key=section_key item=section name=section}
        {*$section|@var_dump*}
        {if $lineven.rlp.hook.datas.is_separate_results}
            {assign var=section_title value={$section.title}}
        {/if}
        {if $section.products && count($section.products)}
            {* Fred - la fiche article peut avoir 2 listes de produits : une liste de produits associee manuellement (facultative) et une liste de produits de la meme categorie*}
            {* Si on a 2 listes ou +, chaque liste doit fair eune demi-largeur sur les "grands" ecrans et la 1ere liste (selection manuelle) doit avoir une classe particuliere *}
            {* Sinon la liste unique doit etre full-width *}
            {* Voir aussi custom.js pour parametrage des carousels *}
            <section class="lineven-relatedproducts product-page-cross-selling-section col-12 {if count($lineven.rlp.hook.datas.sections) > 1}col-lg-6 {if $smarty.foreach.section.first}selection{/if}{/if}">
                <div class="rlp-{$lineven.rlp.hook.datas.hook_class_name|escape:'htmlall':'UTF-8'}">
                    {block name="lrlp_header"}
                        <div class="{$lineven.rlp.hook.datas.template_class_name|escape:'htmlall':'UTF-8'}">
                    {/block}
                        {block name="lrlp_title"}{/block}
                        {block name="lrlp_content_header"}{/block}
                        {block name="lrlp_content"}
                            {foreach from=$section.products item=related_product name=related_product}
                                {block name="lrlp_product"}{/block}
                            {/foreach}
                        {/block}
                        {block name="lrlp_content_footer"}{/block}
                        {block name="lrlp_footer"}
                    </div>
                    {/block}
                </div>
            </section>
        {/if}
    {/foreach}
    </div>
    {block name="lrlp_after_sections"}{/block}
{/if}