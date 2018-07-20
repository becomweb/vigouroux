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
{extends file='parent:checkout/_partials/steps/shipping.tpl'}

{block name='delivery_options'}
<div class="delivery-options">
  {foreach from=$delivery_options item=carrier key=carrier_id}
      <div class="row delivery-option">
        <div class="col-1">
          <span class="custom-radio float-xs-left">
            <input type="radio" name="delivery_option[{$id_address}]" id="delivery_option_{$carrier.id}" value="{$carrier_id}"{if $delivery_option == $carrier_id} checked{/if}>
            <span></span>
          </span>
        </div>
        <label for="delivery_option_{$carrier.id}" class="col-11 delivery-option-2">
          <div class="row">
            <div class="delivery_option_carrier_logo col-3 col-sm-2">
            {if $carrier.logo}
                <img src="{$carrier.logo}" alt="{$carrier.name}" />
            {/if}
            </div>
            <div class="col-9 col-sm-7">
              <p class="h6 carrier-name">{$carrier.name}</p>
              <p class="carrier-delay">{$carrier.delay}</p>
            </div>
            <div class="carrier-price col-12 col-sm-3 text-center font-weight-bold">{$carrier.price}</div>
          </div>
        </label>
      </div>
      <div class="row carrier-extra-content"{if $delivery_option != $carrier_id} style="display:none;"{/if}>
        {$carrier.extraContent nofilter}
      </div>
      <div class="clearfix"></div>
  {/foreach}
  <!-- Avertissement livraison hors France -->
  <div id="delivery_abroad_warning">
    {l s='For out of France delivery, please contact our sales department from monday to friday from 9:00 to 18:00 at <strong>%1$s</strong> or by email at the following address <strong>%2$s</strong>' sprintf=[$shop.phone, $shop.email] d='Shop.Theme.Checkout'}
  </div>
</div>
{/block}