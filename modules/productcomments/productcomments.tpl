{*
* 2007-2016 PrestaShop
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
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*
*
*
*}

<script type="text/javascript">
    var productcomments_controller_url = '{$productcomments_controller_url}';
    var confirm_report_message = '{l s='Are you sure that you want to report this comment?' d='Shop.Interiorproductcomments' js=1}';
    var secure_key = '{$secure_key}';
    var productcomments_url_rewrite = '{$productcomments_url_rewriting_activated}';
    var productcomment_added = '{l s='Your comment has been added!' d='Shop.Interiorproductcomments' js=1}';
    var productcomment_added_moderation = '{l s='Your comment has been submitted and will be available once approved by a moderator.' d='Shop.Interiorproductcomments' js=1}';
    var productcomment_title = '{l s='New comment' d='Shop.Interiorproductcomments' js=1}';
    var productcomment_ok = '{l s='OK' d='Shop.Interiorproductcomments' js=1}';
    var moderation_active = {$moderation_active};
</script>

<section id="productCommentsBlock">
    <div class="product_page_section_title">{l s='Comments' d='Shop.Theme.Global'}</div>
    <div id="new_comment_form_ok" class="alert alert-success" style="display:none;padding:15px 25px"></div>
    <div id="product_comments_block_tab">
        {if $comments}
            {foreach from=$comments item=comment}
                {if $comment.content}
                    <div class="comment col-12" itemprop="review" itemscope itemtype="https://schema.org/Review">
                        <div class="comment_date">
                            <meta itemprop="datePublished" content="{$comment.date_add|escape:'html':'UTF-8'|substr:0:10}" />
                            {dateFormat date=$comment.date_add|escape:'html':'UTF-8' full=0}
                        </div>
                        <div itemprop="name" class="comment_title">
                            {$comment.title}
                        </div>
                        <div class="star_content clearfix d-none">
                            {section name="i" start=0 loop=5 step=1}
                                {if $comment.grade le $smarty.section.i.index}
                                    <div class="star"></div>
                                {else}
                                    <div class="star star_on"></div>
                                {/if}
                            {/section}
                        </div>
                        <div class="comment_text" itemprop="reviewBody">
                            {$comment.content|escape:'html':'UTF-8'|nl2br}
                        </div>
                        <div class="comment_author_infos">
                            {$comment.customer_name|escape:'html':'UTF-8'}
                        </div>
                    </div>
                {/if}
            {/foreach}
        {else}
            {if (!$too_early AND ($logged OR $allow_guests))}
                {* <p class="align_center alert alert-info">
                    <a id="new_comment_tab_btn" class="open-comment-form" href="#new_comment_form">{l s='Be the first to write your review' d='Shop.Interiorproductcomments'} !</a>
                </p>*}
            {else}
                <p class="align_center col-12">{l s='No customer reviews for the moment.' d='Shop.Interiorproductcomments'}</p>
            {/if}
        {/if}
    </div>
    <div class="text-center">
        {if ($too_early == false AND ($logged OR $allow_guests))}
            <a class="open-comment-form btn btn-primary btn_skine-two" href="#new_comment_form">{l s='Write your review' d='Shop.Interiorproductcomments'}</a>
        {/if}
    </div>
{if isset($product) && $product}
    <!-- Fancybox -->
    <div style="display:none">
        <div id="new_comment_form">
            <form id="id_new_comment_form" action="#">
                <div class="title">{l s='Write your review' d='Shop.Interiorproductcomments'}</div>
                    {*<div class="product clearfix">
                        <div class="product_desc">
                            <p class="product_name"><strong>{$product.name}</strong></p>
                            {$product.description_short nofilter}
                        </div>
                    </div>*}
                <div class="new_comment_form_content">
                    <div id="new_comment_form_error" class="error" style="display:none;padding:15px 25px">
                        <ul></ul>
                    </div>
                    {if $criterions|@count > 0}
                        <ul id="criterions_list">
                            {foreach from=$criterions item='criterion'}
                                <li>
                                    <label>{$criterion.name|escape:'html':'UTF-8'}</label>
                                    <div class="star_content">
                                        <input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="1"/>
                                        <input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="2"/>
                                        <input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="3"/>
                                        <input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="4"/>
                                        <input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="5" checked="checked"/>
                                    </div>
                                </li>
                            {/foreach}
                        </ul>
                    {/if}
                    {if $allow_guests == true && !$logged}
                        <label>{l s='Your name' d='Shop.Interiorproductcomments'}<sup class="required">*</sup></label>
                        <input id="commentCustomerName" class="form-control" name="customer_name" type="text" value=""/>
                    {/if}
                    <label for="comment_title">{l s='Title for your review' d='Shop.Interiorproductcomments'}<sup class="required">*</sup></label>
                    <input id="comment_title" class="form-control" name="title" type="text" value=""/>
                    <label for="content">{l s='Your review' d='Shop.Interiorproductcomments'}<sup class="required">*</sup></label>
                    <textarea id="content" class="form-control" name="content"></textarea>
                    <div id="new_comment_form_footer">
                        <input id="id_product_comment_send" name="id_product" type="hidden" value='{$id_product_comment_form}'/>
                        <p class="required"><sup>*</sup> {l s='Required fields' d='Shop.Interiorproductcomments'}</p>
                        <div class="productcomments__footer__box">
                            <a class="btn btn_skine-three" href="#" onclick="$.fancybox.close();" title="{l s='Cancel' d='Shop.Interiorproductcomments'}">{l s='Cancel' d='Shop.Interiorproductcomments'}</a>
                            <button class="btn" id="submitNewMessage" name="submitMessage" type="submit">{l s='Send' d='Shop.Interiorproductcomments'}</button>
                        </div>
                    </div>
                </div>
            </form><!-- /end new_comment_form_content -->
        </div>
    </div>
    <!-- End fancybox -->
    {/if}
</section>
