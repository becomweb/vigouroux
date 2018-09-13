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

{if $htmlbanners5.slides}
  <div id="htmlbanners5" class="testimonials-wrapper wow fadeInUp" data-wow-offset="200">
    <div class="container">
      <div class="headline-section">
          {l s='Testimonials' d='Shop.Themestestimonials'}
      </div>
        <div class="htmlbanners5-inner js-htmlbanners5-carousel htmlbanners5-carousel row">
          {foreach from=$htmlbanners5.slides item=slide name='htmlbanners5'}
            <div class="testimonials-item {$slide.customclass}">
              <div class="testimonials-inner">
                {if ($slide.image_url != $slide.image_base_url) && $slide.url != $slide.url_base}
                <a class="avatar-wrapper" href="{$slide.url}" title="{$slide.legend|escape}">
                {else}
                <div class="avatar-wrapper">
                {/if}
                  {if $slide.image_url != $slide.image_base_url}
                  <img class="avatar" src="{$slide.image_url}" alt="{$slide.legend|escape}">
                  {/if}
                {if ($slide.image_url != $slide.image_base_url) && $slide.url != $slide.url_base}
                </a>
                {else}
                </div>
                {/if}
                {if $slide.description}
                  <div class="testimonials-description">
                      {$slide.description nofilter}
                      <p class="testimonials-author"><span>{$slide.title}</span></p>
                  </div>
                {/if}
              </div>
            </div>
          {/foreach}
        </div>
    </div>
    <div class="testimonials-controls">
      <div class="owl-controls">
        <div id="testimonials-dots" class="owl-dots">
          {foreach from=$htmlbanners5.slides item=slide name='htmlbanners5'}
            <div class="owl-dot">
                {if $slide.image_url != $slide.image_base_url}
                  <img class="avatar-dot-image" src="{$slide.image_url}" alt="{$slide.legend|escape}">
                {/if}
            </div> 
          {/foreach}
        </div>
        <div id="testimonials-navs" class="owl-navs">
        </div>
      </div>
    </div>
  </div>
{/if}

