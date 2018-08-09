{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
    {* Condition ajoutee pour ne pas generer les items de niveau 3 - voir specifications *}
    {if $nodes|count && $depth < 2}
      <ul class="top-menu{if $depth == 1 && $node.image_urls} has-thumbnails{/if}" {if $depth == 0}id="top-menu"{/if} data-depth="{$depth}">
        {foreach from=$nodes item=node}
            <li class="{$node.type}{if $node.current} current {/if}" id="{$node.page_identifier}">
            {assign var=_counter value=$_counter+1}
              <a
                class="{if $depth >= 0}dropdown-item{/if}{if $depth === 1} dropdown-submenu{/if} {if $node.children|count}with-ul{/if}"
                href="{$node.url}" data-depth="{$depth}"
                {if $node.open_in_new_window} target="_blank" {/if}
              >
                {$node.label}
                {if $node.children|count}
                  {* Cannot use page identifier as we can have the same page several times *}
                  {assign var=_expand_id value=10|mt_rand:100000}
                    <label for="label_sub_menu_{$_expand_id}" class="navbar-toggler hidden-lg-up">
                      <i class="font-down-open-big add"></i>
                      <i class="font-up-open-big remove"></i>
                    </label>
                {/if}
              </a>
              {if $node.children|count}
              <input id="label_sub_menu_{$_expand_id}" class="no-style input-toggler" type="checkbox">
              <div {if $depth === 0} class="popover sub-menu js-sub-menu submenu"{else} class="submenu"{/if} id="top_sub_menu_{$_expand_id}">
              {if $depth === 0}
              	<div class="inner-wrapper">
              {/if}
                {menu nodes=$node.children depth=$node.depth parent=$node}
                {if $node.image_urls}
                <div class="menu-thumbnails">
                  {foreach from=$node.image_urls item=image_url}
                    <div class="thumbnail">
                        <div class="thumbnail-img">
                            <img class="img img-responsive" src="{$image_url}" alt="{l s='Caterory'}">
                        </div>
                    </div>
                  {/foreach}
                </div>
                {/if}
                {if $depth === 0}
                </div>
                {/if}
              </div>
              {/if}
            </li>
        {/foreach}
      </ul>
    {/if}
{/function}

<div class="main-menu col-md-10 js-top-menu position-static hidden-md-down" id="_desktop_top_menu">
    {menu nodes=$menu.children}
</div>
