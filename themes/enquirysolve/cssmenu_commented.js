/*

CSS MENU v1.0beta (c) 2001-2003 Angus Turnbull, http://www.twinhelix.com
Altering this notice or redistributing this file is prohibited.

*/



// This is the full, commented script file, to use for reference purposes or if you feel
// like tweaking anything. I used the "CodeTrimmer" utility availble from my site
// (under 'Miscellaneous' scripts) to trim the comments out of this JS file.



// *** COMMON CROSS-BROWSER COMPATIBILITY CODE ***


// This is taken from the "Modular Layer API" available on my site.
// See that for the readme if you are extending this part of the script.

var isDOM=document.getElementById?1:0,
 isIE=document.all?1:0,
 isNS4=navigator.appName=='Netscape'&&!isDOM?1:0,
 isOp=self.opera?1:0,
 isDyn=isDOM||isIE||isNS4;

function getRef(i, p)
{
 p=!p?document:p.navigator?p.document:p;
 return isIE ? p.all[i] :
  isDOM ? (p.getElementById?p:p.ownerDocument).getElementById(i) :
  isNS4 ? p.layers[i] : null;
};

function getSty(i, p)
{
 var r=getRef(i, p);
 return r?isNS4?r:r.style:null;
};

if (!self.LayerObj) var LayerObj = new Function('i', 'p',
 'this.ref=getRef(i, p); this.sty=getSty(i, p); return this');
function getLyr(i, p) { return new LayerObj(i, p) };

function LyrFn(n, f)
{
 LayerObj.prototype[n] = new Function('var a=arguments,p=a[0],px=isNS4||isOp?0:"px"; ' +
  'with (this) { '+f+' }');
};
LyrFn('x','if (!isNaN(p)) sty.left=p+px; else return parseInt(sty.left)');
LyrFn('y','if (!isNaN(p)) sty.top=p+px; else return parseInt(sty.top)');

if (!self.page) var page = { win:self, minW:0, minH:0, MS:isIE&&!isOp };

page.elmPos=function(e,p)
{
 var x=0,y=0,w=p?p:this.win;
 e=e?(e.substr?(isNS4?w.document.anchors[e]:getRef(e,w)):e):p;
 if(isNS4){if(e&&(e!=p)){x=e.x;y=e.y};if(p){x+=p.pageX;y+=p.pageY}}
 else if (e && e.focus && e.href && this.MS && navigator.platform.indexOf('Mac')>-1)
 {
  e.onfocus = new Function('with(event){self.tmpX=clientX-offsetX;' +
   'self.tmpY=clientY-offsetY}');
  e.focus();x=tmpX;y=tmpY;e.blur()
 }
 else while(e){x+=e.offsetLeft;y+=e.offsetTop;e=e.offsetParent}
 return{x:x,y:y};
};

function hideSelect(){
document.VISITOR.VTITLE.style.visibility = "hidden";
}

function unhideSelect(){
document.VISITOR.VTITLE.style.visibility = "visible";
}

// *** CORE MENU OBJECT AND FUNCTIONS ***

function CSSMenu(myName)
{
 this.myName = myName;
 this.menus = new Array();
 this.visMenus = new Array();
 this.cssDisp = false;
 this.hideDelay = 500;
};


// This function is passed a layer object, and shows or hides it.
// If the 'cssDisp' property is set, it uses style.display rather than style.visibility.
CSSMenu.prototype.lyrVis = function(lyr, vis)
{
 if (this.cssDisp) lyr.sty.display = vis ? 'block' : 'none';
 else lyr.sty.visibility = vis ? 'visible' : 'hidden';
};


// Shows a menu. Pass name of menu to show, calling menuname, and optionally pass
// a reference to link in the page and offsets from that link to position the menu.
CSSMenu.prototype.show = function(mN, parMN, offR, offX, offY) { with (this)
{
 // Reset array of visible menus that should not be hidden.
 for (var m in visMenus) visMenus[m] = false;

 // Record a reference to the corresponding DIV in the page.
 if (mN)
 {
  var mR = menus[mN];
  // Create a new entry in the menus array, make references to actual div.
  if (!mR || !mR.lyr)
  {
   mR = menus[mN] = {
    lyr: getLyr(myName + '-' + mN),
    childMN: '',
    parMN: '',
    hideTimer: null
   };
   // Quit if the div cannot be found.
   if (!mR.lyr.ref) { mR.lyr = null; return }
   // Otherwise assign correct event handlers to the menu.
   mR.lyr.ref.onmouseover = new Function(myName+'.show("'+mN+'","'+parMN+'")');
   mR.lyr.ref.onmouseout = new Function(myName+'.hide("'+mN+'", 0)');
  }

  // Set the menu parent/child relationships correctly -- note that some will have no parent.
  mR.parMN = parMN;
  if (parMN) menus[parMN].childMN = mN;

  // Now populate our array of visible menunames, recursing back up the menu tree.
  var m = mN;
  while (m)
  {
   visMenus[m] = true;
   // And clear the hide timer for these menus, as they're in the "safe" tree.
   if (menus[m]) clearTimeout(menus[m].hideTimer);
   m = menus[m].parMN;
  }
  

  // Detect position of the passed "offR" page element, if present. Store as lX, lY.
  var lX = 0, lY = 0;
  if (offR) with (page.elmPos(offR, mR.parMN ? menus[mR.parMN].lyr.ref : 0)) lX = x, lY = y;

  // ...and position the layer if that's been successfully detected, then show it.
  if (mR.lyr) with (mR.lyr)
  {
   // Set menu positions as offsets from that link if possible, and show.
   if (typeof (lX+lY) == 'number') { x(lX + eval(offX)); y(lY +eval(offY)) }
   // You may wish to replace this line with a call to an animation/fading function etc.
   lyrVis(mR.lyr, 1);
  }
 }

 // Finally (or if no menuname is passed), hide all the menus not in the "safe" list
 // (but don't hide the current child of this menu, that's handled by its own timer).
 for (var m in menus) if (!visMenus[m] && m!=menus[mN].childMN) hide(m, 1);
 hideSelect();
 return;
}};


// Handle the mouseout for a specified menuname, either set a timer or trigger div hide.
// This calls itself twice.
CSSMenu.prototype.hide = function(mN, doHide) { with (this) with (menus[mN])
{
 // Either call: always clear this menu's hide timeout, we can reset it later if needed.
 clearTimeout(hideTimer);

 // First call: onmouseout, we reset the hide timer of this and all parent menus (recursive).
 if (!doHide)
 {
  hideTimer = setTimeout(myName+'.hide("'+mN+'", 1)', hideDelay);
  if (parMN) this.hide(parMN);
 }
 else
 {
  // Second call (after timeout has elapsed): Do the actual hide.
  // NS4 hack to detect mouse position and ignore spurious mouseouts.
  if (isNS4 && self.isMouseIn && isMouseIn(lyr.sty)) return;
  // If this menu's parent's child is set to this menu, clear it. (That makes sense! It does!)
  if (parMN) with (menus[parMN]) if (childMN == mN) childMN = '';
  // Call our visibility function, with a false second parameter to hide.
  if (lyr) lyrVis(lyr, 0);
 }
 unhideSelect();
 return;
}};











// This next block is only required for NS4 compatibility, you may freely delete it otherwise.
// This script will "run" in NS4, but I recommend you use my other menu script if you want NS4
// users to have an experience comparable to users of modern browsers (http://www.twinhelix.com)

if (isNS4)
{
 var csmMouseX, csmMouseY, csmOR=self.onresize, nsWinW=innerWidth, nsWinH=innerHeight;
 document.csmMM=document.onmousemove;

 self.onresize = function()
 {
  if (csmOR) csmOR();
  if (nsWinW!=innerWidth || nsWinH!=innerHeight) location.reload();
 };

 document.captureEvents(Event.MOUSEMOVE);
 document.onmousemove = function(e)
 {
  csmMouseX = e.pageX;
  csmMouseY = e.pageY;
  return document.csmMM?document.csmMM(e):document.routeEvent(e);
 };

 function isMouseIn(sty)
 {
  with (sty) return ((csmMouseX>left) && (csmMouseX<left+clip.width) &&
   (csmMouseY>top) && (csmMouseY<top+clip.height));
 };
}

var menu = new CSSMenu('menu');