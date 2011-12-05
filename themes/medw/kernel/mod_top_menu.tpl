{strip}
<div id="bitbartop">
	<ul id="nav">
		<li>
			<a href="/wiki/index.php"><b class="">MEDW - Visitor</b></a>
		</li>

		<li class="sub"><a href="/wiki/index.php?page=Contact"><b class="">Contact Us</b></a>
		</li>
		<li class="sub"><a href="/wiki/index.php?page=Welcome"><b class="">Products Directory</b></a>
		    <ul style="display: none;">
			<li><a class="sub" href="/wiki/index.php?page=BreakoutBoard"><i class="">Breakout Boards</i></a>
				<ul>
					<li><a class="fly" href="/wiki/index.php?page=MEDW0010+Breakout+Board"><em class="">MEDW0010 Breakout Board</em></a></li>
					<li><a class="fly" href="/wiki/index.php?page=CNC4PC+Breakout+Boards"><em class="">CNC4PC Breakout Boards</em></a></li>
					<li><a class="fly" href="/wiki/index.php?page=MEDW+55V+3A+Stepper+Driver"><em class="">MEDW 3A Stepper Driver</em></a></li>
				</ul>
			</li>
			<li><a class="sub" href="/wiki/index.php?page=CNC+Component+Shop"><i class="">CNC Component Shop</i></a></li>
			<li><a class="sub" href="/wiki/index.php?page=DivisionMaster"><i class="">DivisionMaster</i></a></li>
			<li><a class="sub" href="/wiki/index.php?page=ELS+Price+List"><i class="">Electronic Lead Screw</i></a></li>
			<li><a class="sub" href="/wiki/index.php?page=ShumatechEuropeanPrices"><i class="">Shumatech DRO</i></a>
				<ul>
					<li><a class="fly" href="/wiki/index.php?page=Shumatech+DRO350+Prices"><em class="">DRO350 Readout</em></a></li>
					<li><a class="fly" href="/wiki/index.php?page=Shumatech+DPU550+Prices"><em class="">DPU550 Daughterboard</em></a></li>
					<li><a class="fly" href="/wiki/index.php?page=Shumatech+DRO550+Prices"><em class="">DRO550 Additional Parts</em></a></li>
				</ul>
			</li>
			<li><a class="sub" href="/wiki/index.php?page=Mach-in-a-box"><i class="">Mach-in-a-box</i></a></li>
			<li><a class="sub" href="/wiki/index.php?page=MicroMill"><i class="">MicroMill</i></a>
				<ul>
					<li><a class="fly" href="/wiki/index.php?page=Mill-in-a-box"><em class="">Mill-in-a-Box</em></a></li>
					<li><a class="fly" href="/wiki/index.php?page=MicroMill"><em class="">Other MicroMill Packages</em></a></li>
					<li><a class="fly" href="/wiki/index.php?page=Kress+High+Speed+Spindles"><em class="">High Speed Spindle</em></a></li>
					<li><a class="fly" href="/wiki/index.php?page=VariableSpeedSpindle"><em class="">Variable Speed Spindle</em></a></li>
					<li><a class="fly" href="/wiki/index.php?page=Taig+Mill+Spares"><em class="">Taig Mill Spares</em></a></li>
					<li><a class="fly" href="/wiki/index.php?page=Cutters"><em class="">Small Cutters</em></a></li>
				</ul>
			</li>
			<li><a class="sub" href="/wiki/index.php?page=Tachometer"><i class="">Tachometer</i></a></li>
			<li><a class="sub" href="/wiki/index.php?page=YADRO+UK+Prices"><i class="">YADRO</i></a></li>
		    </ul>
		</li>
		<li class="sub"><a href="/fisheye/view.php?content_id=236"><b class="">Information Directory</b></a>
			<ul>
				<li><a class="sub" href="/fisheye/view.php?content_id=235"><i class="">User Manuals</i></a></li>
				<li><a class="sub" href="/fisheye/view.php?content_id=237"><i class="">Construction Guide</i></a></li>
				<li><a class="sub" href="/fisheye/view.php?content_id=1078"><i class="">Installation Examples</a></i>
					<ul>
						<li><a class="fly" href="/fisheye/view.php?content_id=1079"><em class="">DRO350</em></a>
						</li><li><a class="fly" href="/fisheye/view.php?content_id=1087"><em class="">Rotary Table</em></a>
						</li>
					</ul></li>
				<li><a class="sub" href="/fisheye/view.php?content_id=238"><i class="">CNC Information</i></a>
					<ul>
						<li><a class="fly" href="/fisheye/view.php?content_id=240"><em class="">Ballscrews</em></a>
						</li><li><a class="fly" href="/fisheye/view.php?content_id=239"><em class="">CNC4PC Products</em></a>
						</li><li><a class="fly" href="/fisheye/view.php?content_id=241"><em class="">Controllers</em></a>
						</li><li><a class="fly" href="/fisheye/view.php?content_id=242"><em class="">Hormann Designs</em></a>
						</li><li><a class="fly" href="/fisheye/view.php?content_id=243"><em class="">gCode Information</em></a>
						</li>
					</ul></li>
			</ul>
		</li>
		<li class="sub"><a href="/wiki/index.php?page=Projects"><b class="">Projects</b></a>
		</li>
		<li class="sub"><a href="/wiki/index.php?page=MainLinks"><b class="">Links</b></a>
		</li>

		{if $gBitUser->isAdmin()}
			<li class="sub">
				<a href="{$smarty.const.KERNEL_PKG_URL}admin/index.php">
					<b class="">{tr}Administration{/tr}</b>
				</a>
				{if $gBitSystem->isFeatureActive( 'site_top_bar_dropdown' )}
					<ul>
						{foreach key=key item=menu from=$adminMenu}
							{if $key eq 'kernel' or $key eq 'liberty' or $key eq 'languages' or $key eq 'users' or $key eq 'themes'}
								<li>
									<a href="{$smarty.const.KERNEL_PKG_URL}admin/index.php">
										<i class="">{tr}{$key|capitalize}{/tr}</i>
									</a>
									{include file=`$menu.tpl`}
								</li>
							{/if}
						{/foreach}
						{foreach key=key item=menu from=$adminMenu}
							{if $key neq 'kernel' and $key neq 'liberty' and $key neq 'languages' and $key neq 'users' and $key neq 'themes'}
								<li>
									<a href="{$smarty.const.KERNEL_PKG_URL}admin/index.php">
										<i class="">{tr}{$key|capitalize}{/tr}</i>
									</a>
									{include file=`$menu.tpl`}
								</li>
							{/if}
						{/foreach}
					</ul>
				{/if}
			</li>
		{/if}
	</ul>
</div>
{/strip}
