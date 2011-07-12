{strip}
<div id="mainmenu">
<div class="underlinemenu">
<div id="menu">
<ul class="menu">
	{if $gBitUser->isRegistered()}
	<li class="m-home">
		<a class="head" accesskey="h" href="{$smarty.const.BIT_ROOT_URL}" class="parent"><span>Home</span></a>
		<div> {include file="bitpackage:kernel/menu_global.tpl"} </div>
	</li>
	{else}
	<li class="m-home">
		<a class="head" accesskey="h" href="{$smarty.const.BIT_ROOT_URL}"><span>Visitor Home</span></a>
		<div><ul>
			<li><a title="" href="/users/login.php"><span>Login</span></a></li>
			<li><a title="" href="/wiki/index.php?page=Contact"><span>Contact Us</span></a></li>
	    </ul></div>
	</li>
	{/if}
	<li{if $gContent->mContentId == 25} class="selected"{/if}><a class="head{if $gContent->mContentId == 25} selected{/if}" title="" href="/wiki/index.php?page=Contact" class="parent"><span>Contact Us</span></a>
	</li>
	<li><a title="" href="/contact/list.php?role_id=0" class="parent"><span>Find</span></a>
	    <div><ul>
		<li><a title="" href="/contact/list.php?role_id=5"><span>Find DJ</span></a></li>
		<li><a title="" href="/contact/list.php?role_id=6"><span>Find Photographer</span></a></li>
	    </ul></div>
	</li>

	{if $gBitUser->isAdmin()}
		<li class="m-admin{if $smarty.const.ACTIVE_PACKAGE eq 'kernel'} current{/if}">
			<a accesskey="A" class="{if $gBitSystem->isFeatureActive( 'site_top_bar_dropdown' )}head{else}item{/if}{if $smarty.const.ACTIVE_PACKAGE eq 'kernel'} selected{/if}" href="{$smarty.const.KERNEL_PKG_URL}admin/index.php">
				<span><strong>{tr}Administration{/tr}</strong></span>
			</a>
			{if $gBitSystem->isFeatureActive( 'site_top_bar_dropdown' )}
				<div><ul>
					{foreach key=key item=menu from=$adminMenu}
						{if $key eq 'kernel' or $key eq 'liberty' or $key eq 'languages' or $key eq 'users' or $key eq 'themes'}
							<li>
								<a class="head" style="cursor:default" href="{$smarty.const.KERNEL_PKG_URL}admin/index.php">
									<span><strong>{tr}{$key|capitalize}{/tr}</strong></span>
								</a>
								<div> {include file=`$menu.tpl`} </div>
							</li>
						{/if}
					{/foreach}
					{foreach key=key item=menu from=$adminMenu}
						{if $key neq 'kernel' and $key neq 'liberty' and $key neq 'languages' and $key neq 'users' and $key neq 'themes'}
							<li>
								<a class="head" style="cursor:default" href="{$smarty.const.KERNEL_PKG_URL}admin/index.php">
									<span>{tr}{$key|capitalize}{/tr}</span>
								</a>
								<div> {include file=`$menu.tpl`} </div>
							</li>
						{/if}
					{/foreach}
				</ul></div>
			{/if}
		</li>
	{/if}	
</ul>
</div>
</div>
</div>
{/strip}
