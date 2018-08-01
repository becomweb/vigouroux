{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

{* Template custom pour mieux afficher les commentaires et pas les horaires (les horaires sont notes dans les commentaires car ils sont saisonniers ) *}
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Our cellars' d='Shop.Theme.Global'}
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-stores">

    {foreach $stores as $store}
      <article id="store-{$store.id}" class="store-item card">
        <div class="store-item-container row clearfix">
          <div class="store-picture col-12 col-md-6 col-lg-4">
            <img src="{$store.image.bySize.stores_default.url}" alt="{$store.image.legend}" title="{$store.image.legend}">
          </div>
          <div class="store-contact col-12 col-md-6 col-lg-4">
            <p class="store-name h3 card-title">{$store.name}</p>
            <address>{$store.address.formatted nofilter}</address>
            {if $store.phone}
            <p class="strore-phone"><i class="material-icons">&#xE0B0;</i> {$store.phone}</p>
            {/if}
            {if $store.email}
            <p class="strore-email"><i class="material-icons">&#xE0BE;</i> {$store.email}</p>
            {/if}
          </div>
          <div class="store-infos col-12 col-lg-4">
              {if $store.note}
                <p class="text-justify">{$store.note|nl2br nofilter}<p>
              {/if}
          </div>
      </article>
    {/foreach}
  </section>
{/block}
