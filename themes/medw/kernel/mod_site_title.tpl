{strip}
{if $popupPage}
	{* include file="bitpackage:kernel/poptop.tpl" *}
{else}
	<div id="bittop">
		<hr style="width:98%;text-align:center;height:2px;border:1px;color:#ffffff;background-color:#ffffff;" />
		<div id="logo">
		  <a href="{$smarty.const.BIT_BASE_URI}/wiki/index.php">
		  	<img src="{$smarty.const.CONFIG_PKG_URL}images/logo2.jpg">
		  </a>
		</div>
		<div id="hc1" class="haccordion">
		  <ul>
		    <li>
		      <div class="hpanel">
		    	<a href="{$smarty.const.BIT_BASE_URI}/wiki/index.php?page=DivisionMaster">
		    	  <img src="{$smarty.const.BIT_BASE_URI}/config/themes/newmedw/images/divisionmaster.jpg" style="float:left; width:320px; height:200px" />
		    	</a>
		      </div>
		    </li>
		    <li>
		      <div class="hpanel">
		    	<a href="{$smarty.const.BIT_BASE_URI}/wiki/index.php?page=Mill-in-a-box">
		    	  <img src="{$smarty.const.BIT_BASE_URI}/config/themes/newmedw/images/millinabox.jpg" style="float:left; width:320px; height:200px" />
		    	</a>
		      </div>
		    </li>
		    <li>
		      <div class="hpanel">
		    	<a href="{$smarty.const.BIT_BASE_URI}/wiki/index.php?page=Product+Index">
		    	  <img src="{$smarty.const.BIT_BASE_URI}/config/themes/newmedw/images/electronickits.jpg" style="float:left; width:320px; height:200px" />
		    	</a>
		      </div>
		    </li>
		    <li>
		      <div class="hpanel">
		    	<a href="{$smarty.const.BIT_BASE_URI}/wiki/index.php?page=Projects">
		    	  <img src="{$smarty.const.BIT_BASE_URI}/config/themes/newmedw/images/projects.jpg" style="float:left; width:320px; height:200px" />
		    	</a>
		      </div>
		    </li>
		    <li>
		      <div class="hpanel">
		    	<a href="{$smarty.const.BIT_BASE_URI}/fisheye/view.php?gallery_id=15">
		    	  <img src="{$smarty.const.BIT_BASE_URI}/config/themes/newmedw/images/library.jpg" style="float:left; width:320px; height:200px" />
		    	</a>
		      </div>
		    </li>
		    <li>
		      <div class="hpanel">
		    	<a href="{$smarty.const.BIT_BASE_URI}/wiki/index.php?page=Contact">
		    	  <img src="{$smarty.const.BIT_BASE_URI}/config/themes/newmedw/images/aboutus.jpg" style="float:left; width:320px; height:200px" />
		    	</a>
		      </div>
		    </li>
		  </ul>
		</div>
		<div id="logo2">
			<div class="hdr_login">
				{if $gBitUser->isRegistered()}
					{tr}Welcome{/tr}, <strong>{displayname hash=$gBitUser->mInfo}</strong>
					<br />
					<a href="{$smarty.const.USERS_PKG_URL}my.php">{tr}My Account{/tr}</a>
					&bull; <a href="{$smarty.const.USERS_PKG_URL}logout.php">{tr}logout{/tr}</a>
				{else}
					<a href="{$smarty.const.USERS_PKG_URL}login.php">{tr}login{/tr}</a>
					{if $gBitSystem->isFeatureActive( 'users_allow_register' )}
						&bull; <a href="{$smarty.const.USERS_PKG_URL}register.php">{tr}register{/tr}</a>
					{/if}
				{/if}
			</div>
			{if $gBitSystem->isPackageActive( 'search' )}
				<div class="hdr_search">
					{form method="get" ipackage=search ifile="index.php"}
							<input id="fuser" name="highlight" size="18" type="text" accesskey="s" value="{tr}search{/tr}" onfocus="this.value=''" />
							<br />
							{html_options options=$contentTypes name="content_type_guid" selected=$perms[user].level}
							<br />
							<input type="submit" name="search" value="{tr}go{/tr}" />
					{/form}
				</div>
			{/if}

		</div>
		<br style="clear:both;height:2px;"/>
		<hr style="width:98%;text-align:center;height:2px;border:1px;color:#ffffff;background-color:#ffffff;" />
	</div>
{/if}
{/strip}