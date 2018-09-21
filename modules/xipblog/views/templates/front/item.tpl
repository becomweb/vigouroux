<article class="blog_post col-12 col-sm-6 col-lg-4">
    <div class="blog_post_content">
        <div class="blog_post_content_top">
            <div class="post_thumbnail">
                {if $xipblgpst.post_format == 'video'}
                    {assign var="postvideos" value=','|explode:$xipblgpst.video}
                    {if $postvideos|@count > 1 }
                        {include file="module:xipblog/views/templates/front/post-video.tpl" videos=$postvideos width='570' height="316" class="carousel"}
                    {else}
                        {include file="module:xipblog/views/templates/front/post-video.tpl" videos=$postvideos width='570' height="316" class=""}
                    {/if}
                {elseif $xipblgpst.post_format == 'audio'}
                    {assign var="postaudio" value=','|explode:$xipblgpst.audio}
                    {if $postaudio|@count > 1 }
                        {include file="module:xipblog/views/templates/front/post-audio.tpl" audios=$postaudio width='570' height="316" class="carousel"}
                    {else}
                        {include file="module:xipblog/views/templates/front/post-audio.tpl" audios=$postaudio width='570' height="316" class=""}
                    {/if}
                {elseif $xipblgpst.post_format == 'gallery'}
                    {if $xipblgpst.gallery_lists|@count > 1 }
                        {include file="module:xipblog/views/templates/front/post-gallery.tpl" gallery=$xipblgpst.gallery_lists imagesize="home_default" class="carousel"}
                    {else}
                        {include file="module:xipblog/views/templates/front/post-gallery.tpl" gallery=$xipblgpst.gallery_lists imagesize="home_default" class=""}
                    {/if}
                {else}
                    <img class="xipblog_img img-responsive" src="{$xipblgpst.post_img_home_default}" alt="{$xipblgpst.post_title}">
                    <div class="blog_mask">
                        <div class="blog_mask_content">
                            <a class="thumbnail_lightbox" href="{$xipblgpst.post_img_large}">
                                <i class="icon_plus"></i>
                            </a>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
        <div class="blog_post_content_bottom">
            <div class="post_title"><a href="{$xipblgpst.link}">{$xipblgpst.post_title|truncate:30:"..."}</a></div>
            <div class="post_content">
                {if isset($xipblgpst.post_excerpt) && !empty($xipblgpst.post_excerpt)}
                    <p>{$xipblgpst.post_excerpt|truncate:120:' ...'|escape:'html':'UTF-8'}</p>
                {else}
                    <p>{$xipblgpst.post_content|truncate:120:' ...'|escape:'html':'UTF-8'}</p>
                {/if}
            </div>
            <div class="content_more">
                <a class="read_more" href="{$xipblgpst.link}">{l s='Read more' mod='xipblog'}</a>
            </div>
            <div class="post_meta clearfix">
                <span class="meta_date">{$xipblgpst.post_date|date_format:"%D"}</span>
                <span class="comment_count"><i class="material-icons">comment</i> {$xipblgpst.comment_count}</span>
                <span class="meta_author">{$xipblgpst.post_author_arr.firstname} {$xipblgpst.post_author_arr.lastname|substr:0:1}.</span>
            </div>
        </div>
    </div>
</article>