{strip}
<ul>
	{if $gBitSystem->isFeatureActive( 'messages_site_contact' )}
		<li><a class="item" href="{$smarty.const.MESSAGES_PKG_URL}contact.php"><span>{biticon iname=emblem-mail ilocation=menu iexplain="Contact Us"}</span></a></li>
	{/if}

	{if $gBitUser->isRegistered()}
		<li><a class="item" href="{$smarty.const.BLOGS_PKG_URL}"><span>Blogs</span></a></li>
		<li><a class="item" href="{$smarty.const.LIBERTY_PKG_URL}list_content.php"><span>List Content</span></a></li>
		<li><a class="item" href="{$smarty.const.USERS_PKG_URL}index.php"><span>List Users</span></a></li>
		<li><a class="item" href="{$smarty.const.USERS_PKG_URL}logout.php"><span>Logout</span></a></li>
	{/if}
</ul>
{/strip}
