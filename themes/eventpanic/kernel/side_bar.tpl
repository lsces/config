{strip}
{bitmodule}
	{if $gBitUser->isRegistered()}
		<h2><a class="head" accesskey="h" href="{$smarty.const.BIT_ROOT_URL}">Northway - Home</a></h2>
		{* include file="bitpackage:kernel/menu_global.tpl" *}
	{else}
		<h2><a class="head" accesskey="h" href="{$smarty.const.BIT_ROOT_URL}">Home</a></h2>
	{/if}
	<h2><a class="head{if $gContent->mContentId == 259} selected{/if}" title="" href="/wiki/index.php?page=Contact+Us">Contact Us</a></h2>
	<h2><a class="head{if $smarty.const.ACTIVE_PACKAGE eq 'events'} selected{/if}" title="" href="/events/index.php">Meeting List</a>&nbsp;--&nbsp;
	    <a class="head{if $smarty.const.ACTIVE_PACKAGE eq 'events'} selected{/if}" title="" href="/calendar/index.php?view_mode=month">Calendar</a></h2>
	<h2><a class="head{if $gContent->mContentId == 15} selected{/if}" title="" href="/fisheye/view.php?gallery_id=2">Meeting Agendas</a></h2>
	<h2><a class="head{if $gContent->mContentId == 20} selected{/if}" title="" href="/fisheye/view.php?gallery_id=3">Minutes of Meetings</a></h2>
	<h2><a class="head{if $gContent->mContentId == 599} selected{/if}" title="" href="/fisheye/view.php?gallery_id=45">Public Documents</a></h2>
	<h2><a class="head{if $gContent->mContentId == 260} selected{/if}" title="" href="/wiki/index.php?page=Your+Councillors">Your Councillors</a></h2>
	<h2><a class="head{if $gContent->mContentId == 314} selected{/if}" title="" href="/wiki/index.php?page=Parish+Council+Committees">Committees</a></h2>
	<h2><a class="head{if $smarty.const.ACTIVE_PACKAGE eq 'articles'} selected{/if}" title="" href="/articles/index.php">Local News</a></h2>
	<h2><a class="head{if $gContent->mContentId == 487} selected{/if}" title="" href="/wiki/index.php?page=Local+Travel+Information">Travel and Transport</a></h2>
	<h2><a class="head{if $gContent->mContentId == 263} selected{/if}" title="" href="/wiki/index.php?page=Useful+Links">Useful Links</a></h2>
	<hr>
	<h2><a class="head{if $gContent->mContentId == 6} selected{/if}" title="" href="/fisheye/view.php?gallery_id=1">Picture Gallery</a></h2>
	{if $gBitUser->isAdmin()}
		<hr>
		<h2><a class="head{if $smarty.const.ACTIVE_PACKAGE eq 'kernel'} selected{/if}" href="{$smarty.const.KERNEL_PKG_URL}admin/index.php">
				<strong>{tr}Administration{/tr}</strong>
		</a></h2>
	{/if}	
{/bitmodule}
{/strip}
