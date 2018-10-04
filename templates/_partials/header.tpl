{**
 * 2007-2018 PrestaShop
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
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='parent:_partials/header.tpl'}

{block name='header_top'}
  <div class="header-top">
    <div class="container">
       <div class="row inner-wrapper hidden-md-down">
          <div id="_desktop_logo" class="col-md-2">
              {if $page.page_name == 'index'}
                <h1>
              {/if}
                  <a href="{$urls.base_url}">
                    <picture>
                      <source media="(min-width: 992px)" srcset="{$shop.logo}">
                      <source media="(max-width: 991px)" srcset="{$urls.img_url}logo_vigouroux_mobile.png">
                      <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}, {l s='wine online shop' d='Shop.Theme.Global'}">
                    </picture>
                  </a>
              {if $page.page_name == 'index'}
                </h1>
              {/if}
          </div>
        {hook h='displayTop'}
      </div>
      <div id="mobile_top_menu_wrapper" class="row hidden-lg-up">
        <div class="wrapper-nav">
            <div id="_mobile_contact_link"></div>
            <div id="_mobile_wishlist_top"></div>
            <div id="_mobile_user_info"></div>
        </div>
        <div class="wrapper-modules">
          <div id="_mobile_search_bar"></div>
        </div>
        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
      </div>
    </div>
  </div>
  {hook h='displayNavFullWidth'}
{/block}