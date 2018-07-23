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

{if $htmlbanners1.slides}
  <div id="htmlbanners1" class="home-banners wow fadeInDown" data-wow-delay="0.2s" data-wow-offset="200">
    <div class="htmlbanners1-inner js-htmlbanners1-carousel {if $htmlbanners1.carousel_active == 'true'}htmlbanners1-carousel {/if}row" {if $htmlbanners1.carousel_active == 'true'} data-carousel={$htmlbanners1.carousel_active} data-autoplay={$htmlbanners1.autoplay} data-timeout="{$htmlbanners1.speed}" data-pause="{$htmlbanners1.pause}" data-pagination="{$htmlbanners1.pagination}" data-navigation="{$htmlbanners1.navigation}" data-loop="{$htmlbanners1.wrap}" data-items="{$htmlbanners1.items}" data-items_1199="{$htmlbanners1.items_1199}" data-items_991="{$htmlbanners1.items_991}" data-items_768="{$htmlbanners1.items_768}" data-items_480="{$htmlbanners1.items_480}"{/if}>
      {foreach from=$htmlbanners1.slides item=slide name='htmlbanners1'}
        <div class="{$slide.customclass}">
          {if $slide.url != $slide.url_base}
          <a class="banner-link" href="{$slide.url}" {*title="{$slide.legend|escape}"*}>
          {else}
          <div class="banner-link">
          {/if}
          {if $slide.image_url != $slide.image_base_url}
          <figure>
          <img class="img-banner" src="{$slide.image_url}" alt="{$slide.legend|escape}">
          {/if}
              {if $slide.description}
                <figcaption class="banner-description">
                    {$slide.description nofilter}
                </figcaption>
              {/if}
          {if $slide.image_url != $slide.image_base_url}
          </figure>
          {/if}
          {if $slide.url != $slide.url_base}
          </a>
          {else}
          </div>
          {/if}
        </div>
      {/foreach}
    </div>
  </div>
{/if}

