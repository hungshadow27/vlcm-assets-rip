package com.tgame.shell.view.components.ride
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.greensock.TweenLite;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.RideFeedPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class DuiHuanZuoQiPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var bmp:Bitmap;
      
      private var spr:Sprite;
      
      private var type:int = 1;
      
      private var shenMc1:MovieClip;
      
      private var shenMc2:MovieClip;
      
      private var shenMc3:MovieClip;
      
      private var shenMc4:MovieClip;
      
      private var moMc1:MovieClip;
      
      private var moMc2:MovieClip;
      
      private var moMc3:MovieClip;
      
      private var moMc4:MovieClip;
      
      private var selectMc:MovieClip;
      
      private var spr1:Sprite;
      
      private var spr2:Sprite;
      
      private var spr3:Sprite;
      
      private var spr4:Sprite;
      
      private var selectIndex:int = 1;
      
      public function DuiHuanZuoQiPanel()
      {
         var _mask:Sprite;
         var bg:DisplayObject = null;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         width = 635;
         height = 238 - 33;
         titleText = LanResManager.getLanCommonTextWords("请选择坐骑");
         _mask = new Sprite();
         with(_mask.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,190,200);
            endFill();
         }
         addChild(_mask);
         _mask.x = 0;
         _mask.y = 0;
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/mount/selectbg.swf");
         bg.x = 10;
         bg.y = 3;
         addChild(bg);
         this.spr = new Sprite();
         this.spr.y = -38;
         addChild(this.spr);
         this.spr1 = new Sprite();
         this.spr1.name = "1";
         this.spr1.mouseChildren = false;
         addChild(this.spr1);
         this.spr1.x = -30;
         this.spr1.y = -30;
         this.spr1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr1.mask = _mask;
         _mask = new Sprite();
         with(_mask.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,190,200);
            endFill();
         }
         addChild(_mask);
         _mask.x = 150;
         _mask.y = 0;
         this.spr2 = new Sprite();
         this.spr2.name = "2";
         this.spr2.mouseChildren = false;
         addChild(this.spr2);
         this.spr2.x = 120;
         this.spr2.y = -30;
         this.spr2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr2.mask = _mask;
         _mask = new Sprite();
         with(_mask.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,180,200);
            endFill();
         }
         addChild(_mask);
         _mask.x = 300;
         _mask.y = -20;
         this.spr3 = new Sprite();
         this.spr3.name = "3";
         this.spr3.mouseChildren = false;
         addChild(this.spr3);
         this.spr3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr3.x = 280;
         this.spr3.y = -40;
         this.spr3.mask = _mask;
         _mask = new Sprite();
         with(_mask.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,180,200);
            endFill();
         }
         addChild(_mask);
         _mask.x = 460;
         _mask.y = 0;
         this.spr4 = new Sprite();
         this.spr4.name = "4";
         this.spr4.mouseChildren = false;
         addChild(this.spr4);
         this.spr4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr4.x = 430;
         this.spr4.y = -50;
         this.spr4.mask = _mask;
      }
      
      public function onClick(param1:MouseEvent) : void
      {
         var i:int = 0;
         var str:String = null;
         var loadUrl:String = null;
         var e:MouseEvent = param1;
         if(e.target is DisplayObject)
         {
            i = parseInt((e.target as DisplayObject).name);
            this.selectIndex = i;
            if(this.selectMc == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/select.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  selectMc = _loc2_.content as MovieClip;
                  if(selectMc)
                  {
                     spr.addChild(selectMc);
                     selectMc.play();
                     switch(i)
                     {
                        case 1:
                           spr.x = spr1.x + 10;
                           break;
                        case 2:
                           spr.x = spr2.x + 10;
                           break;
                        case 3:
                           spr.x = spr3.x + 10;
                           break;
                        case 4:
                           spr.x = spr4.x;
                     }
                  }
               },null,false,loadUrl);
            }
            else
            {
               if(this.selectMc.parent != null)
               {
                  this.selectMc.parent.removeChild(this.selectMc);
                  this.selectMc.stop();
               }
               this.spr.addChild(this.selectMc);
               this.selectMc.play();
               switch(i)
               {
                  case 1:
                     this.spr.x = this.spr1.x + 10;
                     break;
                  case 2:
                     this.spr.x = this.spr2.x + 10;
                     break;
                  case 3:
                     this.spr.x = this.spr3.x + 10;
                     break;
                  case 4:
                     this.spr.x = this.spr4.x;
               }
            }
            str = "                  " + LanResManager.getLanCommonTextWords("一念成神，一念成魔！") + "<br><font color=\'" + StaticValue.RED_HTML + "\'></font><br>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("确认召唤");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消召唤");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  $parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_NIEPAN_DUIHUANZUOQI,"",[type,i]));
               }
            },true);
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         var _loc2_:int = 1;
         while(_loc2_ < 5)
         {
            while(this["spr" + _loc2_].numChildren != 0)
            {
               this["spr" + _loc2_].removeChildAt(0);
            }
            _loc2_++;
         }
         while(this.spr.numChildren != 0)
         {
            this.spr.removeChildAt(0);
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
         POPWindowManager.closeWindow();
      }
      
      public function setData(param1:int) : void
      {
         this.type = param1;
         this.setMc();
      }
      
      public function setMc() : void
      {
         var i:int = 0;
         var loadUrl:String = null;
         var num:int = 1;
         while(num < 5)
         {
            while(this["spr" + num].numChildren != 0)
            {
               this["spr" + num].removeChildAt(0);
            }
            num++;
         }
         if(this.type == 0)
         {
            i = 1;
            if(this.shenMc1 == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/" + this.type.toString() + i.toString() + ".swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  shenMc1 = _loc2_.content as MovieClip;
                  if(shenMc1)
                  {
                     spr1.addChild(shenMc1);
                     shenMc1.play();
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.spr1.addChild(this.shenMc1);
               this.shenMc1.play();
            }
            i++;
            if(this.shenMc2 == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/" + this.type.toString() + i.toString() + ".swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  shenMc2 = _loc2_.content as MovieClip;
                  if(shenMc2)
                  {
                     spr2.addChild(shenMc2);
                     shenMc2.play();
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.spr2.addChild(this.shenMc2);
               this.shenMc2.play();
            }
            i++;
            if(this.shenMc3 == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/" + this.type.toString() + i.toString() + ".swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  shenMc3 = _loc2_.content as MovieClip;
                  if(shenMc3)
                  {
                     spr3.addChild(shenMc3);
                     shenMc3.play();
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.spr3.addChild(this.shenMc3);
               this.shenMc3.play();
            }
            i++;
            if(this.shenMc4 == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/" + this.type.toString() + i.toString() + ".swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  shenMc4 = _loc2_.content as MovieClip;
                  if(shenMc4)
                  {
                     spr4.addChild(shenMc4);
                     shenMc4.play();
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.spr4.addChild(this.shenMc4);
               this.shenMc4.play();
            }
         }
         else
         {
            i = 1;
            if(this.moMc1 == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/" + this.type.toString() + i.toString() + ".swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  moMc1 = _loc2_.content as MovieClip;
                  if(moMc1)
                  {
                     spr1.addChild(moMc1);
                     moMc1.play();
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.spr1.addChild(this.moMc1);
               this.moMc1.play();
            }
            i++;
            if(this.moMc2 == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/" + this.type.toString() + i.toString() + ".swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  moMc2 = _loc2_.content as MovieClip;
                  if(moMc2)
                  {
                     spr2.addChild(moMc2);
                     moMc2.play();
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.spr2.addChild(this.moMc2);
               this.moMc2.play();
            }
            i++;
            if(this.moMc3 == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/" + this.type.toString() + i.toString() + ".swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  moMc3 = _loc2_.content as MovieClip;
                  if(moMc3)
                  {
                     spr3.addChild(moMc3);
                     moMc3.play();
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.spr3.addChild(this.moMc3);
               this.moMc3.play();
            }
            i++;
            if(this.moMc4 == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/" + this.type.toString() + i.toString() + ".swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  moMc4 = _loc2_.content as MovieClip;
                  if(moMc4)
                  {
                     spr4.addChild(moMc4);
                     moMc4.play();
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.spr4.addChild(this.moMc4);
               this.moMc4.play();
            }
         }
      }
      
      public function setResult(param1:Boolean, param2:int) : void
      {
         var onComplete:Function;
         var disObj:DisplayObject = null;
         var result:Boolean = param1;
         var id:int = param2;
         if(result)
         {
            onComplete = function():void
            {
               if(Boolean(disObj) && disObj.parent != null)
               {
                  disObj.parent.removeChild(disObj);
               }
               onClose();
            };
            disObj = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/mount/mount" + this.type.toString() + this.selectIndex.toString() + ".swf");
            disObj.scaleX = 0.5;
            disObj.scaleY = 0.5;
            disObj.x = this["spr" + this.selectIndex].x;
            disObj.y = this["spr" + this.selectIndex].y;
            addChild(disObj);
            TweenLite.to(disObj,3,{
               "scaleX":1,
               "scaleY":1,
               "onComplete":onComplete
            });
         }
      }
   }
}

