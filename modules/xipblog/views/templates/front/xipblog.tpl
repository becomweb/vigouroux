<div class="blog_posts_list home_blog_post_area {$xipbdp_designlayout} {*$hookName*}">
	<div class="home_blog_post container">
		<div class="page_title_area">
			{if isset($xipbdp_title)}
				<div class="h3 home_blog_title">
					{$xipbdp_title}
				</div>
			{/if}
		</div>
		<div class="row home_blog_post_inner carousel">
		{if (isset($xipblogposts) && !empty($xipblogposts))}
			{foreach from=$xipblogposts item=xipblgpst}
				{include file="module:xipblog/views/templates/front/item.tpl"}
			{/foreach}
		{else}
			<p>{l s='No Blog Post Found' mod='xipblog'}</p>
		{/if}
		</div>
	</div>
</div>