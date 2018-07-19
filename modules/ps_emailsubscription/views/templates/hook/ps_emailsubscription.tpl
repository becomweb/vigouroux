{*
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="block_newsletter col-xl-8 col-md-6 col-xs-12 wow slideInLeft">
    {if $msg}
    <p class="alert {if $nw_error}alert-danger{else}alert-success{/if}">
      {$msg}
    </p>
    {/if}
  <div class="newsletter-inner">
  <h3 class="hidden-md-down">{l s='Newsletter subscription' d='Shop.Extremesnewsletter'}</h3>
  <div class="block_newsletter_list">
    {*{if $conditions}
      <p class="conditions">{$conditions}</p>
    {/if}*}
    <div class="form">
    <form action="{$urls.pages.index}#footer" method="post">
      {if isset($id_module)}
        {hook h='displayGDPRConsent' id_module=$id_module}
      {/if}
        <div class="input-wrapper">
          <input
          class="form-control"
          name="email"
          type="email"
          value="{$value}"
          placeholder="{l s='Your email address' d='Shop.Forms.Labels'}">
          <input type="hidden" name="action" value="0">
          <button 
            class="btn btn-submit"
            name="submitNewsletter"
            type="submit"
          >
          <span>{l s='Subscribe' d='Shop.Theme.Actions'}</span>
          </button>
        </div>
    </form>
    </div>
  </div>
  </div>
</div>
<div class="text-center col-xl-4 col-md-6 col-xs-12">
    <img src="{$urls.img_url}logo_footer.png" id="footer_logo" />
</div>
