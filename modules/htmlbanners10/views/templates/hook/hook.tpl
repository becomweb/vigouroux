{*
* 2007-2018 PrestaShop
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
*  @copyright  2007-2018 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if $htmlbanners10.slides}
<div class="container">
  <div id="htmlbanners10" class="features-home">
      <div data-wow-offset="50" class="wow fadeInUp htmlbanners10-inner js-htmlbanners10-carousel {if $htmlbanners10.carousel_active == 'true'}htmlbanners10-carousel{else}view-grid{/if} row" {if $htmlbanners10.carousel_active == 'true'} data-carousel={$htmlbanners10.carousel_active} data-autoplay={$htmlbanners10.autoplay} data-timeout="{$htmlbanners10.speed}" data-pause="{$htmlbanners10.pause}" data-pagination="{$htmlbanners10.pagination}" data-navigation="{$htmlbanners10.navigation}" data-loop="{$htmlbanners10.wrap}" data-items="{$htmlbanners10.items}" data-items_1199="{$htmlbanners10.items_1199}" data-items_991="{$htmlbanners10.items_991}" data-items_768="{$htmlbanners10.items_768}" data-items_480="{$htmlbanners10.items_480}"{/if}>
        {foreach from=$htmlbanners10.slides item=slide name='htmlbanners10'}
          <div class="{$slide.customclass}">
            <div class="feature-item-inner">
              {if $slide.url != $slide.url_base}
              <a class="banner-link" href="{$slide.url}"{*title="{$slide.legend|escape}"*}>
              {else}
              <div class="banner-link">
              {/if}
                {if $slide.image_url != $slide.image_base_url}
                <img class="img-banner" src="{$slide.image_url}" alt="{$slide.legend|escape}">
                {/if}
                {if $slide.description}
                    <div class="banner-description">
                        {$slide.description nofilter}
                    </div>
                {/if}
                {if $slide.url != $slide.url_base}
                </a>
                {else}
                </div>
                {/if}
            </div>
          </div>
        {/foreach}
      </div>
  </div>
</div>
{/if}

