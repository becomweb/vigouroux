{*
* 2007-2015 PrestaShop
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
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{* Meme contenu que le template original mais avec un markup plus propre (pas de multiplication de <br>...) *}
{if $status == 'ok'}
	<h3 class="h3">{l s='Payment by check' d="Modules.Checkpayment.Shop"}</h3>
	<p>{l s='Your order on %s is complete.' sprintf=[$shop_name] d='Modules.Checkpayment.Shop'}</p>
	<p>{l s='Your check must include:' d='Modules.Checkpayment.Shop'}</p>
	<ul>
		<li>
			<strong>{l s='Payment amount.' d='Modules.Checkpayment.Shop'}</strong> : <span class="price">{$total_to_pay}</span>
		</li>
		<li>
			<strong>{l s='Payable to the order of' d='Modules.Checkpayment.Shop'}</strong> : {if $checkName}{$checkName}{else}___________{/if}
		</li>
	</ul>
	<p><strong>{l s='Mail to' d='Modules.Checkpayment.Shop'}</strong></p>
	<p id="check_address">
		{if $checkAddress}{$checkAddress nofilter}{else}___________{/if}
	</p>
	{if !isset($reference)}
	<p>{l s='Do not forget to insert your order number #%d.' sprintf=[$id_order] d='Modules.Checkpayment.Shop'}</p>
	{else}
	<p>{l s='Do not forget to insert your order reference %s.' sprintf=[$reference] d='Modules.Checkpayment.Shop'}</p>
	{/if}
	<p>{l s='An email has been sent to you with this information.' d='Modules.Checkpayment.Shop'}</p>
	<p><strong>{l s='Your order will be sent as soon as we receive your payment.' d='Modules.Checkpayment.Shop'}</strong></p>
	<p>{l s='For any questions or for further information, please contact our' d='Modules.Checkpayment.Shop'} <a href="{$link->getPageLink('contact', true)|escape:'html'}">{l s='customer service department.' d='Modules.Checkpayment.Shop'}</a>.</p>
{else}
	<p class="alert alert-warning">
		{l s='We have noticed that there is a problem with your order. If you think this is an error, you can contact our' d='Modules.Checkpayment.Shop'}
		<a href="{$link->getPageLink('contact', true)|escape:'html'}">{l s='customer service department.' d='Modules.Checkpayment.Shop'}</a>.
	</p>
{/if}
