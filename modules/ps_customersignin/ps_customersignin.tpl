<div id="_desktop_user_info">
    <div class="header_user_info">
      <div class="header_user_info__list">
        {if $logged}
          <a class="logout" href="{$logout_url}" rel="nofollow">
            {l s='Sign out' d='Shop.Theme.Actions'}
          </a>
          <a class="account" href="{$my_account_url}" title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow">
            <span>{$customerName}</span>
          </a>
        {else}
          <a href="{$my_account_url}" title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow">
            <span>{l s='My Account' d='Shop.Theme.Global'}</span>
          </a>
        {/if}
      </div>
  </div>
</div>
