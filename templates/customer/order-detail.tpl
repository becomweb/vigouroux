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
{extends file='parent:customer/order-detail.tpl'}

{block name='order_infos'}
    <div id="order-infos">
    <div class="box">
        <div class="row">
            <div class="col-xs-{if $order.details.reorder_url}9{else}12{/if}">
            <strong>
                {l
                s='Order Reference %reference% - placed on %date%'
                d='Shop.Theme.Customeraccount'
                sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]
                }
            </strong>
            </div>
            {if $order.details.reorder_url}
            <div class="col-xs-3 text-xsright">
                <a href="{$order.details.reorder_url}" class="grey_btn">{l s='Reorder' d='Shop.Theme.Actions'}</a>
            </div>
            {/if}
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="box">
        <ul>
            <li><strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$order.carrier.name}</li>
            <li><strong>{l s='Payment method' d='Shop.Theme.Checkout'}</strong> {$order.details.payment}</li>

            {if $order.details.invoice_url}
            <li>
                <a class="grey_btn" href="{$order.details.invoice_url}">
                {l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}
                </a>
            </li>
            {/if}

            {if $order.details.recyclable}
            <li>
                {l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}
            </li>
            {/if}

            {if $order.details.gift_message}
            <li>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</li>
            <li>{l s='Message' d='Shop.Theme.Customeraccount'} {$order.details.gift_message nofilter}</li>
            {/if}
        </ul>
    </div>
    </div>
{/block}