package com.tgame.shell.view.components.ride
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.RideFeedPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.*;
   import gs.TweenMax;
   
   public class NiePanCanvas extends Sprite
   {
      
      public static const UI_NIEPANTUPO_CLOSE_CLICK:String = "UI_NIEPANTUPO_CLOSE_CLICK";
      
      public var $parent:DisplayObject;
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var ball1:MovieClip;
      
      private var ball2:MovieClip;
      
      private var startBtn:SecondButton;
      
      private var text:FTextArea;
      
      private var ziDongBtn:SecondButton;
      
      private var xiaoChuBtn2:SecondButton;
      
      private var xiaoChuBtn1:SecondButton;
      
      private var zuoQiPanel:DuiHuanZuoQiPanel;
      
      private var now1:int = 0;
      
      private var now2:int = 0;
      
      private var max1:int = 10000;
      
      private var max2:int = 10000;
      
      private var canDuiHuan1:Boolean = false;
      
      private var canDuiHuan2:Boolean = false;
      
      private var tupoCanvas:NiePanTupoCanvas;
      
      private var left:MovieClip;
      
      private var right:MovieClip;
      
      private var fullMc:MovieClip;
      
      private var tipMc:DisplayObject;
      
      private var tupoBo:Boolean = false;
      
      public function NiePanCanvas()
      {
         var $mask:Sprite;
         var box:FCanvas = null;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         box = new FCanvas();
         addChild(box);
         box.skin = "box";
         box.width = 328;
         box.height = 85;
         box.x = 0;
         box.y = 155;
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this._mask = new Shape();
         with(this._mask)
         {
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,174,110);
            graphics.endFill();
         }
         this._mask.x = 4;
         this._mask.y = 30;
         addChild(this._mask);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.text = new FTextArea();
         with(this.text)
         {
            width = 310;
            height = 40;
            x = 8;
            y = -10;
            filters = StaticValue.filter;
            textColor = StaticValue.RED;
            wordWrap = true;
            htmlText = "<textformat leading=\'10\'>" + LanResManager.getLanCommonTextWords("只有级及以上魔兽才可以进行涅槃") + "</textformat>";
         }
         addChild(this.text);
         this.text = new FTextArea();
         with(this.text)
         {
            width = 310;
            height = 90;
            x = 8;
            y = 160;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
         }
         this.text.htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanCommonTextWords("拥有魔兽的玩家可以在本页面进行魔兽涅槃，涅槃后的坐骑") + LanResManager.getLanCommonTextWords("将恢复上古时期的全面记忆，从而唤醒被封印的能量，解除") + LanResManager.getLanCommonTextWords("封印也许会唤醒神圣记忆，也有可能唤醒黑暗记忆，黑暗记") + LanResManager.getLanCommonTextWords("忆的能量一直是一个谜。") + "</textformat>";
         addChild(this.text);
         this.tipMc = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/mount/tipmc.swf");
         this.tipMc.x = 2;
         this.tipMc.y = 253 + 2;
         this.tipMc.visible = false;
         addChild(this.tipMc);
         this.ball1 = StaticValue.getMCByClassName("ui.ride.niepan.shen") as MovieClip;
         addChild(this.ball1);
         this.ball1.x = 40;
         this.ball1.y = 230 + 10;
         this.ball1.gotoAndStop(0);
         this.ball1.addEventListener(MouseEvent.MOUSE_OVER,this.onBallTip);
         this.ball1.addEventListener(MouseEvent.MOUSE_OUT,this.onBallTip);
         this.ball1.addEventListener(MouseEvent.CLICK,this.onBallClick);
         this.ball1.name = "1";
         this.ball2 = StaticValue.getMCByClassName("ui.ride.niepan.hei") as MovieClip;
         addChild(this.ball2);
         this.ball2.x = 200;
         this.ball2.y = 230 + 10;
         this.ball2.gotoAndStop(100);
         this.ball2.addEventListener(MouseEvent.MOUSE_OVER,this.onBallTip);
         this.ball2.addEventListener(MouseEvent.MOUSE_OUT,this.onBallTip);
         this.ball2.addEventListener(MouseEvent.CLICK,this.onBallClick);
         this.ball2.name = "2";
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("涅槃");
         addChild(this.startBtn);
         this.startBtn.x = 135;
         this.startBtn.y = 250 + 10;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.xiaoChuBtn1 = new SecondButton();
         this.xiaoChuBtn1.label = LanResManager.getLanCommonTextWords("转移神圣记忆");
         addChild(this.xiaoChuBtn1);
         this.xiaoChuBtn1.x = 35 + 80;
         this.xiaoChuBtn1.y = 310;
         this.xiaoChuBtn1.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击转移神圣记忆可以将神圣记忆转换为黑暗记忆。") + "</font>";
         this.xiaoChuBtn1.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.xiaoChuBtn2 = new SecondButton();
         this.xiaoChuBtn2.label = LanResManager.getLanCommonTextWords("转移黑暗记忆");
         addChild(this.xiaoChuBtn2);
         this.xiaoChuBtn2.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击转移黑暗记忆可以将黑暗记忆转换为神圣记忆。") + "</font>";
         this.xiaoChuBtn2.x = 195;
         this.xiaoChuBtn2.y = 310 + 10;
         this.xiaoChuBtn2.visible = false;
         this.xiaoChuBtn2.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.tupoCanvas = new NiePanTupoCanvas();
         addChild(this.tupoCanvas);
         this.tupoCanvas.x = 10;
         this.tupoCanvas.y = 250;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 0;
         $mask.y = 355;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,400,300);
            endFill();
         }
         this.tupoCanvas.mask = $mask;
         addEventListener(UI_NIEPANTUPO_CLOSE_CLICK,this.onCloseTupo);
      }
      
      private function onBallClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.ball1:
               if(this.canDuiHuan1)
               {
                  this.showDuiHuanPanel();
                  this.zuoQiPanel.setData(0);
               }
               break;
            case this.ball2:
               if(this.canDuiHuan2)
               {
                  this.showDuiHuanPanel();
                  this.zuoQiPanel.setData(1);
               }
         }
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         switch(e.target)
         {
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_NIEPAN_CLICK));
               break;
            case this.xiaoChuBtn1:
               str = LanResManager.getLanCommonTextWords(" 确定要消除神圣记忆吗?") + "<br><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("消除神圣记忆可以增加黑暗记忆。(点能力值)") + "</font><br>";
               FAlert.show(str,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     $parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_NIEPAN_XIAOCHUJIYI,"",0));
                  }
               },true);
               break;
            case this.xiaoChuBtn2:
               str = LanResManager.getLanTextWords(this," 确定要消除黑暗记忆吗?") + "<br><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("消除黑暗记忆可以增加神圣记忆。(点能力值)") + "</font><br>";
               FAlert.show(str,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     $parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_NIEPAN_XIAOCHUJIYI,"",1));
                  }
               },true);
         }
      }
      
      private function onBallTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               if(param1.target == this.ball1)
               {
                  this.ball1.addEventListener(MouseEvent.MOUSE_MOVE,this.onBallTip);
               }
               else if(param1.target == this.ball2)
               {
                  this.ball2.addEventListener(MouseEvent.MOUSE_MOVE,this.onBallTip);
               }
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = (param1.target as DisplayObject).name;
               if(_loc2_ == "1")
               {
                  _loc3_ = LanResManager.getLanCommonTextWords("神圣的记忆承载了千万神圣的精魂，消除世间的黑暗是它们的使命。当前记忆：") + this["now" + _loc2_] + "/" + this["max" + _loc2_] + LanResManager.getLanCommonTextWords("点击注满的能量球，可以选择唤醒神兽。");
               }
               else
               {
                  _loc3_ = LanResManager.getLanCommonTextWords("黑暗的记忆黑暗兵团消失前残留的意念，主导着万物听从黑暗的差遣。当前记忆：") + this["now" + _loc2_] + "/" + this["max" + _loc2_] + LanResManager.getLanCommonTextWords("点击注满的能量球，可以选择唤醒血兽。");
               }
               this.showTip(_loc3_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               if(param1.target == this.ball1)
               {
                  this.ball1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onBallTip);
               }
               else if(param1.target == this.ball2)
               {
                  this.ball2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onBallTip);
               }
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         var _loc2_:int = 320;
         var _loc3_:int = 170 + 30;
         var _loc4_:Rectangle = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
         if(_loc4_.width > _loc2_ || _loc4_.height > _loc3_)
         {
            _loc5_ = _loc2_ / _loc4_.width;
            _loc6_ = _loc3_ / _loc4_.height;
            if(_loc5_ > _loc6_)
            {
               this._avatar.scaleX = this._avatar.scaleY = _loc6_;
            }
            else
            {
               this._avatar.scaleX = this._avatar.scaleY = _loc5_;
            }
         }
         this._avatar.y = -20 + (_loc3_ - this._avatar.height) / 2;
         this._avatar.x = -30 + (_loc2_ - this._avatar.width) / 2;
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean) : void
      {
         this.now1 = param1;
         this.max1 = param2;
         this.now2 = param3;
         this.max2 = param4;
         this.canDuiHuan1 = param5;
         this.canDuiHuan2 = param6;
         this.ball1.gotoAndStop(int(param1 / param2 * 100));
         this.ball2.gotoAndStop(int(param3 / param4 * 100));
         this.showFullMc();
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         this.tupoBo = param1;
         if(param1)
         {
            if(this.tupoCanvas.y == 250)
            {
               this.xiaoChuBtn1.enabled = !param1;
               this.xiaoChuBtn2.enabled = !param1;
               this.startBtn.enabled = !param1;
               TweenMax.to(this.tupoCanvas,1,{"y":355});
            }
         }
         else if(this.tupoCanvas.y == 355)
         {
            this.xiaoChuBtn1.enabled = !param1;
            this.xiaoChuBtn2.enabled = !param1;
            this.startBtn.enabled = !param1;
            TweenMax.to(this.tupoCanvas,1,{"y":250});
            this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN,"",false));
         }
      }
      
      public function closeTupoPanel() : void
      {
         this.tupoBo = false;
         this.xiaoChuBtn1.enabled = true;
         this.xiaoChuBtn2.enabled = true;
         this.startBtn.enabled = true;
         this.tupoCanvas.y = 250;
         this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN,"",false));
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.tupoCanvas.y == 355 && this.tupoBo)
         {
            return true;
         }
         return false;
      }
      
      public function setGoods(param1:Goods, param2:Boolean, param3:int = 1) : void
      {
         this.tupoCanvas.setGoods(param1,param2,param3);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.tupoCanvas.setTuPoBtn(param1);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.tupoCanvas._parent2 = param1;
         this.tupoCanvas._parent3 = this;
      }
      
      public function setDuiHuanResult(param1:Boolean, param2:int) : void
      {
         this.zuoQiPanel.setResult(param1,param2);
      }
      
      public function showFullMc() : void
      {
         var loadUrl:String = null;
         this.tipMc.visible = false;
         if(this.now1 != this.max1 && this.now2 != this.max2)
         {
            return;
         }
         if(this.now1 == this.max1)
         {
            this.tipMc.x = 6;
            this.tipMc.y = 206;
         }
         else if(this.now2 == this.max2)
         {
            this.tipMc.x = 165;
            this.tipMc.y = 206;
         }
         this.tipMc.visible = true;
         if(this.fullMc == null)
         {
            loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/full.swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               fullMc = _loc2_.content as MovieClip;
               if(fullMc)
               {
                  if(now1 == max1)
                  {
                     fullMc.x = 10;
                     fullMc.y = 200 + 10;
                  }
                  else if(now2 == max2)
                  {
                     fullMc.x = 170;
                     fullMc.y = 200 + 10;
                  }
                  addChild(fullMc);
                  fullMc.play();
               }
            },null,false,loadUrl);
         }
         else
         {
            if(this.fullMc != null && this.fullMc.parent != null)
            {
               this.fullMc.parent.removeChild(this.fullMc);
               this.fullMc.stop();
            }
            if(this.now1 == this.max1)
            {
               this.fullMc.x = 8;
               this.fullMc.y = 198 + 10;
            }
            else if(this.now2 == this.max2)
            {
               this.fullMc.x = 168;
               this.fullMc.y = 198 + 10;
            }
            addChild(this.fullMc);
            this.fullMc.gotoAndPlay(0);
         }
      }
      
      public function showNiePanZhuanYi(param1:int) : void
      {
         var loadUrl:String = null;
         var type:int = param1;
         if(type == 0)
         {
            if(this.left == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/left.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  left = _loc2_.content as MovieClip;
                  if(left)
                  {
                     left.x = 30;
                     left.y = 140 + 10;
                     addChild(left);
                     left.play();
                  }
               },null,false,loadUrl);
            }
            else
            {
               if(this.left != null && this.left.parent != null)
               {
                  this.left.parent.removeChild(this.left);
                  this.left.stop();
               }
               addChild(this.left);
               this.left.gotoAndPlay(0);
            }
         }
         else if(this.right == null)
         {
            loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/mount/right.swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               right = _loc2_.content as MovieClip;
               if(right)
               {
                  right.x = 30;
                  right.y = 140 + 10;
                  addChild(right);
                  right.play();
               }
            },null,false,loadUrl);
         }
         else
         {
            if(this.right != null && this.right.parent != null)
            {
               this.right.parent.removeChild(this.right);
               this.right.stop();
            }
            addChild(this.right);
            this.right.gotoAndPlay(0);
         }
      }
      
      public function showDuiHuanPanel() : void
      {
         if(this.zuoQiPanel == null)
         {
            this.zuoQiPanel = new DuiHuanZuoQiPanel();
            this.zuoQiPanel.$parent = this.$parent;
         }
         this.zuoQiPanel.x = (GameConfig.sceneWidth - this.zuoQiPanel.width) / 2;
         this.zuoQiPanel.y = (GameConfig.sceneHeight - this.zuoQiPanel.height) / 2 - 300;
         POPWindowManager.showWindow(this.zuoQiPanel);
      }
      
      public function setDuiHuanPanel(param1:int, param2:Array) : void
      {
         this.zuoQiPanel.setData(param1);
      }
   }
}

