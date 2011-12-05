{strip}
<div id="bittopbarwrap">
	<div id="bittopbar">
	<ul id="nav" class="menu hor">
	{if $gBitUser->isRegistered()}
		<li class="m-home">
			<a class="head" accesskey="h" href="{$smarty.const.BIT_ROOT_URL}">{$gBitSystem->getConfig('site_menu_title')|default:$gBitSystem->getConfig('site_title')}</a>
			{include file="bitpackage:kernel/menu_global.tpl"}
		</li>
	{else}
		<li class="m-home">
			<a class="head" accesskey="h" href="{$smarty.const.BIT_ROOT_URL}">{$gBitSystem->getConfig('site_menu_title')|default:$gBitSystem->getConfig('site_title')} - Home</a>
		</li>
	{/if}

	<li{if $gContent->mContentId == 8} class="selected"{/if}><a class="head{if $gContent->mContentId == 8} selected{/if}" title="" href="{$smarty.const.BIT_ROOT_URL}wiki/index.php?page=Site">Site Configuration</a>
	</li>
	<li{if $gContent->mContentId == 80} class="selected"{/if}><a class="head{if $gContent->mContentId == 80} selected{/if}" title="" href="{$smarty.const.BIT_ROOT_URL}fisheye">Archive</a>
	</li>
	<li{if $gContent->mContentId == 9} class="selected"{/if}><a class="head{if $gContent->mContentId == 9} selected{/if}" title="" href="{$smarty.const.BIT_ROOT_URL}wiki/index.php?page=MainLinks">Links</a>
	</li>
	<li{if $gContent->mContentId == 40} class="selected"{/if}><a class="head{if $gContent->mContentId == 40} selected{/if}" title="" href="{$smarty.const.BIT_ROOT_URL}wiki/index.php?page=Contact">Contact Us</a>
	</li>

		{if $gBitUser->isAdmin()}
			<li class="m-admin{if $smarty.const.ACTIVE_PACKAGE eq 'kernel'} current{/if}">
				<a accesskey="A" class="{if $gBitSystem->isFeatureActive( 'site_top_bar_dropdown' )}head{else}item{/if}{if $smarty.const.ACTIVE_PACKAGE eq 'kernel'} selected{/if}" href="{$smarty.const.KERNEL_PKG_URL}admin/index.php">{tr}Administration{/tr}</a>
				{if $gBitSystem->isFeatureActive( 'site_top_bar_dropdown' )}
					<ul>
						{foreach key=key item=menu from=$adminMenu}
							<li>
								<a class="head" href="{$smarty.const.KERNEL_PKG_URL}admin/index.php">{tr}{$key|capitalize}{/tr}</a>
								{include file=`$menu.tpl`}
							</li>
						{/foreach}
					</ul>
				{/if}
			</li>
		{/if}
		</ul>
		<div class="clear"></div>
	</div>
</div>
{if $gBitSystem->isFeatureActive('site_top_bar_js') && $gBitSystem->isFeatureActive('site_top_bar_dropdown')}
	<script type="text/javascript"> /*<![CDATA[*/
		var listMenu = new FSMenu('listMenu', true, 'left', 'auto', '-999');
		{if $gBitSystem->isFeatureActive( 'site_top_bar_js_fade' )}
			listMenu.animations[listMenu.animations.length] = FSMenu.animFade;
		{/if}
		{if $gBitSystem->isFeatureActive( 'site_top_bar_js_swipe' )}
			listMenu.animations[listMenu.animations.length] = FSMenu.animSwipeDown;
		{/if}
		{if $gBitSystem->isFeatureActive( 'site_top_bar_js_clip' )}
			listMenu.animations[listMenu.animations.length] = FSMenu.animClipDown;
		{/if}
		addEvent(window, 'load', new Function('listMenu.activateMenu("nav")'));
	/*]]>*/ </script>
{/if}
{/strip}