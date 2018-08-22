{extends file='page.tpl'}


{block name='page_header_container'}
    {block name='page_header'}
        <h1 class="h1">{block name='page_title'}{l s='Our blog' d='Shop.Theme.Blog'}{/block}</h1>
    {/block}
{/block}

{block name="page_content_container"}
	<section id="content" class="page-content">
	{if isset($xipblogpost) && !empty($xipblogpost)}
    <div class="blog_posts_list general row blog_style_{$xipblogsettings.blog_style} {*column_{$xipblogsettings.blog_no_of_col}*}">
        {foreach from=$xipblogpost item=xipblgpst}
            {include file="module:xipblog/views/templates/front/item.tpl"}
        {/foreach}
    </div>
	{/if}
	</section>
{/block}
{include file="module:xipblog/views/templates/front/default/pagination.tpl"}
{block name="left_column"}
	{assign var="layout_column" value=$layout|replace:'layouts/':''|replace:'.tpl':''|strval}
	{if ($layout_column == 'layout-left-column')}
		<div id="left-column" class="sidebar col-xs-12 col-sm-12 col-md-3 pull-md-9">
			{if ($xipblog_column_use == 'own_ps')}
				{hook h="displayxipblogleft"}
			{else}
				{hook h="displayLeftColumn"}
			{/if}
		</div>
	{/if}
{/block}
{block name="right_column"}
	{assign var="layout_column" value=$layout|replace:'layouts/':''|replace:'.tpl':''|strval}
	{if ($layout_column == 'layout-right-column')}
		<div id="right-column" class="sidebar col-xs-12 col-sm-4 col-md-3">
			{if ($xipblog_column_use == 'own_ps')}
				{hook h="displayxipblogright"}
			{else}
				{hook h="displayRightColumn"}
			{/if}
		</div>
	{/if}
{/block}