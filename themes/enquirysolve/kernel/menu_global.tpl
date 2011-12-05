{strip}
{if $gBitSystem->isFeatureActive( 'messages_site_contact' ) or $gBitUser->isRegistered() and $gBitSystem->isFeatureActive( 'site_top_bar_dropdown' )}
	<ul>
		{if $gBitSystem->isFeatureActive( 'messages_site_contact' )}
			<li><a class="item" href="{$smarty.const.MESSAGES_PKG_URL}contact.php">{biticon iname=emblem-mail ilocation=menu iexplain="Contact Us"}</a></li>
		{/if}

		{if $gBitUser->isRegistered()}
			<li><a class="item" href="{$smarty.const.LIBERTY_PKG_URL}list_content.php">List Content</a></li>
			<li><a class="item" href="{$smarty.const.USERS_PKG_URL}index.php">List Users</a></li>
		{/if}
	</ul>
{/if}
{/strip}
