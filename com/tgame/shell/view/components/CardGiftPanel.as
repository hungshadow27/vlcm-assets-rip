package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.greensock.TweenLite;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.baoxiang.KapianVo;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.TimerManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import gs.TweenMax;
   
   public class CardGiftPanel extends FPanel
   {
      
      public static const UI_CARD_GIFT_REPLAY_GAME:String = "UI_CARD_GIFT_REPLAY_GAME";
      
      public static const UI_CARD_GIFT_REFRESH:String = "UI_CARD_GIFT_REFRESH";
      
      public static const UI_CARD_GIFT_SMALL_PANEL_LOOK_PUKE:String = "UI_CARD_GIFT_LOOK_PUKE";
      
      public static const UI_CARD_GIFT_SHOW_OVER_DATA:String = "UI_CARD_GIFT_SHOW_OVER_DATA";
      
      public static const UI_CARD_GOUMAI_CLICK:String = "UI_CARD_GOUMAI_CLICK";
      
      public static const UI_CARD_GIFT_GET_GIFT_ITEM:String = "UI_CARD_GIFT_GET_GIFT_ITEM";
      
      public static const UI_CARD_GIFT_BAG_PANEL_LOOK_PUKE:String = "UI_CARD_GIFT_BAG_PANEL_LOOK_PUKE";
      
      private static const CLOSE_AN:int = 180;
      
      private static const OPEN_AN:int = 0;
      
      private static const CENTER_X:int = 115;
      
      private static const CENTER_Y:int = 100;
      
      private static const CART_COUNT:int = 8;
      
      private static var hasLing:Boolean = false;
      
      private var itemw_arr:Array;
      
      private var itemwInfoX_arr:Array;
      
      private var itemwInfoY_arr:Array;
      
      private var deley:Number = 0.13;
      
      private var closeDeley:Number = 0.25;
      
      private var moveDeley:Number = 0.2;
      
      private var alphaDelay:Number = 0.25;
      
      private var CardSprite:Sprite;
      
      private var ft:FTextArea;
      
      private var BestQualityGoods0:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft4:FTextArea;
      
      private var qiankundaiTxt:FTextArea;
      
      private var xuanhuangshiTxt:FTextArea;
      
      private var RefreshNumTxt:FTextArea;
      
      private var RefreshBtn:SecondButton;
      
      private var StartBtn:SecondButton;
      
      private var goumaiBtn:SecondButton;
      
      private var huanjingPanel:CardGiftChoujiangPanel;
      
      private var meimengPanel:CardGiftChoujiangPanel;
      
      private var _yuan:yuan;
      
      private var fc:FCanvas;
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      public function CardGiftPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var _filterGlow:GlowFilter;
         this.itemw_arr = new Array();
         this.itemwInfoX_arr = new Array(0,115,230,230,230,115,0,0);
         this.itemwInfoY_arr = new Array(0,0,0,100,200,200,200,100);
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = true;
         width = 413;
         height = 555;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.qiankundai.ui";
         addChild(img);
         img.x = 10;
         img.y = 97;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         this.fc = new FCanvas();
         this.fc.x = 10;
         this.fc.y = 2;
         this.fc.width = 394;
         this.fc.height = 470;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc1 = new FCanvas();
         this.fc1.x = 12;
         this.fc1.y = 95;
         this.fc1.width = 390;
         this.fc1.height = 319;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc2 = new FCanvas();
         this.fc2.x = 12;
         this.fc2.y = 95;
         this.fc2.width = 390;
         this.fc2.height = 375;
         this.fc2.skin = "box";
         addChild(this.fc2);
         this._yuan = new yuan(43);
         this._yuan.x = width / 2;
         this._yuan.y = height / 2 - 25;
         addChild(this._yuan);
         this._yuan.name = String(this.getChildIndex(this._yuan));
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 400;
            height = 50;
            x = 20;
            y = 8;
            textColor = StaticValue.RED;
            text = LanResManager.getLanCommonTextWords("本局游戏有机会获得的极品有:");
         }
         addChild(this.ft);
         this.BestQualityGoods0 = new FTextArea();
         with(this.BestQualityGoods0)
         {
            width = 400;
            height = 50;
            x = 30;
            y = 28;
            textColor = StaticValue.YELLOW;
         }
         this.BestQualityGoods0.htmlText = "";
         _filterGlow = new GlowFilter(StaticValue.GREEN,1,5,5,2,5);
         this.BestQualityGoods0.filters = [_filterGlow];
         addChild(this.BestQualityGoods0);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            width = 400;
            height = 50;
            x = 20;
            y = 63;
            textColor = StaticValue.RED;
            text = LanResManager.getLanCommonTextWords("如果对当前的物品不满意，可以点击免费刷新按钮进行刷新。");
         }
         addChild(this.ft1);
         this.RefreshBtn = new SecondButton();
         this.RefreshBtn.label = LanResManager.getLanCommonTextWords("免费刷新") + "( )";
         addChild(this.RefreshBtn);
         this.RefreshBtn.x = this.panelWidth / 2 - this.RefreshBtn.width / 2;
         this.RefreshBtn.y = 390;
         this.RefreshBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.RefreshNumTxt = new FTextArea();
         with(this.RefreshNumTxt)
         {
            width = 140;
            height = 50;
            x = RefreshBtn.x + 98;
            y = 393;
            textColor = StaticValue.WHITE;
         }
         this.RefreshNumTxt.mouseEnabled = false;
         addChild(this.RefreshNumTxt);
         this.StartBtn = new SecondButton();
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开始游戏");
         addChild(this.StartBtn);
         this.StartBtn.x = 160;
         this.StartBtn.y = 480;
         this.StartBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.goumaiBtn = new SecondButton();
         this.goumaiBtn.label = LanResManager.getLanCommonTextWords("购买玄黄石");
         this.goumaiBtn.x = 220;
         this.goumaiBtn.y = 480;
         this.goumaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            width = 100;
            height = 20;
            x = 240;
            y = 423;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("乾坤袋") + ": ";
         }
         addChild(this.ft3);
         this.ft4 = new FTextArea();
         with(this.ft4)
         {
            width = 120;
            height = 20;
            x = 240;
            y = 445;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("玄黄石") + ": ";
         }
         addChild(this.ft4);
         this.qiankundaiTxt = new FTextArea();
         with(this.qiankundaiTxt)
         {
            width = 100;
            height = 20;
            x = 350;
            y = 423;
            textColor = StaticValue.WHITE;
            text = "0";
         }
         addChild(this.qiankundaiTxt);
         this.xuanhuangshiTxt = new FTextArea();
         with(this.xuanhuangshiTxt)
         {
            width = 100;
            height = 20;
            x = 350;
            y = 445;
            textColor = StaticValue.WHITE;
            text = "0";
         }
         addChild(this.xuanhuangshiTxt);
         this.CardSprite = new Sprite();
         this.CardSprite.x = 90;
         this.CardSprite.y = 110;
         addChild(this.CardSprite);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.RefreshBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(UI_CARD_GIFT_REFRESH));
               break;
            case this.StartBtn:
               if(this.StartBtn.label == LanResManager.getLanCommonTextWords("开始游戏"))
               {
                  this.changeToReady();
               }
               else if(this.StartBtn.label == LanResManager.getLanCommonTextWords("再来一局"))
               {
                  EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(UI_CARD_GIFT_REPLAY_GAME));
               }
               else if(this.StartBtn.label == LanResManager.getLanCommonTextWords("领取奖励"))
               {
                  EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(UI_CARD_GIFT_GET_GIFT_ITEM));
               }
               break;
            case this.goumaiBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(UI_CARD_GOUMAI_CLICK));
         }
      }
      
      private function CardItemChickHandler(param1:MouseEvent) : void
      {
         var _loc2_:KapianVo = param1.currentTarget as KapianVo;
         if(param1.currentTarget.rotationY == CLOSE_AN)
         {
            EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(UI_CARD_GIFT_SMALL_PANEL_LOOK_PUKE,"",_loc2_));
         }
      }
      
      private function rotationUpdate(param1:KapianVo) : void
      {
         param1.rotationY = (param1.rotationY % 360 + 360) % 360;
         if(param1.rotationY <= (CLOSE_AN - OPEN_AN) / 2)
         {
            param1.showItem();
         }
         else
         {
            param1.hiedItem();
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         var self:CardGiftPanel = null;
         var str:String = null;
         var e:FCloseEvent = param1;
         self = this;
         if(hasLing)
         {
            if(parent != null)
            {
               parent.removeChild(self);
            }
         }
         else
         {
            str = LanResManager.getLanCommonTextWords("关闭本界面可能给您造成不必要的损失，仍然要关闭并退出本游戏？");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  if(parent != null)
                  {
                     parent.removeChild(self);
                  }
               }
            });
         }
      }
      
      private function initData() : void
      {
         while(this.CardSprite.numChildren > 0)
         {
            this.CardSprite.removeChildAt(0);
         }
         this.itemw_arr.length = 0;
         this.RefreshBtn.enabled = false;
         this.StartBtn.enabled = false;
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开始游戏");
         this.hideTopInfo();
         hasLing = false;
      }
      
      private function hideTopInfo() : void
      {
         this.ft.visible = false;
         this.BestQualityGoods0.visible = false;
         this.ft1.visible = false;
      }
      
      private function showTopInfo() : void
      {
         this.ft.visible = true;
         this.BestQualityGoods0.visible = true;
         this.ft1.visible = true;
      }
      
      public function changeToDataReady(param1:Array, param2:int, param3:String) : void
      {
         var onUpdate:Function;
         var showData:Function = null;
         var obj:Object = null;
         var $goodsArr:Array = param1;
         var $lostCount:int = param2;
         var $jipinStr:String = param3;
         showData = function():void
         {
            var _loc2_:int = 0;
            var _loc3_:Goods = null;
            var _loc4_:int = 0;
            var _loc5_:KapianVo = null;
            while(CardSprite.numChildren > 0)
            {
               CardSprite.removeChildAt(0);
            }
            itemw_arr.length = 0;
            RefreshNumTxt.text = String($lostCount);
            var _loc1_:Array = $jipinStr.split(";");
            $jipinStr = "";
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               if(_loc1_[_loc2_] != "")
               {
                  if(_loc2_ == 2)
                  {
                     $jipinStr += _loc1_[_loc2_] + "   <br>";
                  }
                  else
                  {
                     $jipinStr += _loc1_[_loc2_] + "   ";
                  }
               }
               _loc2_++;
            }
            BestQualityGoods0.htmlText = $jipinStr;
            showTopInfo();
            _loc2_ = 0;
            while(_loc2_ < $goodsArr.length)
            {
               _loc3_ = $goodsArr[_loc2_].goods;
               _loc4_ = int($goodsArr[_loc2_].color);
               _loc5_ = new KapianVo(_loc3_);
               _loc5_.name = String(_loc2_);
               _loc5_.x = CENTER_X;
               _loc5_.y = CENTER_Y;
               _loc5_.toX = itemwInfoX_arr[_loc2_];
               _loc5_.toY = itemwInfoY_arr[_loc2_];
               _loc5_.addEventListener(MouseEvent.CLICK,CardItemChickHandler);
               _loc5_.buttonMode = true;
               _loc5_.mouseEnabled = false;
               CardSprite.addChildAt(_loc5_,0);
               itemw_arr.push(_loc5_);
               _loc2_++;
            }
            allStepToOpen();
         };
         var allStepToOpen:Function = function():void
         {
            var onComplete:Function = null;
            var openIndex:int = 0;
            var toOpen:Function = null;
            onComplete = function():void
            {
               if(curOpenIndex++ == itemw_arr.length - 1)
               {
                  thisComplete();
               }
            };
            toOpen = function():void
            {
               if(openIndex++ < itemw_arr.length)
               {
                  TweenMax.to(itemw_arr[openIndex - 1],deley,{
                     "x":itemwInfoX_arr[openIndex - 1],
                     "y":itemwInfoY_arr[openIndex - 1],
                     "onComplete":onComplete
                  });
                  TimerManager.createOneOffTimer(150,1,toOpen);
               }
            };
            var curOpenIndex:int = 0;
            openIndex = 0;
            toOpen();
         };
         var thisComplete:Function = function():void
         {
            mouseEnabled = true;
            RefreshBtn.visible = RefreshNumTxt.visible = true;
            RefreshBtn.enabled = Number(RefreshNumTxt.text) > 0;
            StartBtn.enabled = true;
            StartBtn.label = LanResManager.getLanCommonTextWords("开始游戏");
            showTopInfo();
         };
         this.initData();
         mouseEnabled = false;
         this.RefreshBtn.visible = this.RefreshNumTxt.visible = true;
         this.RefreshBtn.enabled = false;
         this.StartBtn.enabled = false;
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开始游戏");
         this.hideTopInfo();
         if(this.CardSprite.numChildren > 0)
         {
            onUpdate = function():void
            {
               var _loc3_:KapianVo = null;
               var _loc1_:int = CardSprite.numChildren;
               var _loc2_:int = 0;
               while(_loc2_ < _loc1_)
               {
                  _loc3_ = CardSprite.getChildAt(_loc2_) as KapianVo;
                  _loc3_.alpha = obj.per;
                  _loc2_++;
               }
            };
            obj = {"per":1};
            TweenLite.to(obj,this.alphaDelay,{
               "per":0,
               "onUpdate":onUpdate,
               "onComplete":showData
            });
         }
         else
         {
            showData();
         }
      }
      
      private function changeToReady() : void
      {
         var allToFront:Function = function():void
         {
            var onComplete:Function = null;
            onComplete = function():void
            {
               if(curFrontIndex++ == itemw_arr.length - 1)
               {
                  allToClose();
               }
            };
            var curFrontIndex:int = 0;
            var i:int = 0;
            while(i < itemw_arr.length)
            {
               TweenMax.to(itemw_arr[i],deley,{
                  "rotationY":CLOSE_AN,
                  "onComplete":onComplete,
                  "onUpdate":rotationUpdate,
                  "onUpdateParams":[itemw_arr[i]]
               });
               i++;
            }
         };
         var allToClose:Function = function():void
         {
            var onComplete:Function = null;
            onComplete = function():void
            {
               if(curCloseIndex++ == itemw_arr.length - 1)
               {
                  allStepToOpen();
               }
            };
            var curCloseIndex:int = 0;
            var i:int = 0;
            while(i < itemw_arr.length)
            {
               TweenMax.to(itemw_arr[i],closeDeley,{
                  "x":CENTER_X,
                  "y":CENTER_Y,
                  "onComplete":onComplete
               });
               i++;
            }
         };
         var allStepToOpen:Function = function():void
         {
            var onComplete:Function = null;
            var openIndex:int = 0;
            var toOpen:Function = null;
            onComplete = function():void
            {
               if(curOpenIndex++ == itemw_arr.length - 1)
               {
                  thisComplete();
               }
            };
            toOpen = function():void
            {
               if(openIndex++ < itemw_arr.length)
               {
                  TweenMax.to(itemw_arr[openIndex - 1],deley,{
                     "x":itemwInfoX_arr[openIndex - 1],
                     "y":itemwInfoY_arr[openIndex - 1],
                     "onComplete":onComplete
                  });
                  TimerManager.createOneOffTimer(150,1,toOpen);
               }
            };
            var curOpenIndex:int = 0;
            openIndex = 0;
            toOpen();
         };
         var thisComplete:Function = function():void
         {
            var _loc1_:KapianVo = null;
            mouseEnabled = true;
            RefreshBtn.visible = RefreshNumTxt.visible = false;
            RefreshBtn.enabled = false;
            StartBtn.enabled = false;
            StartBtn.label = LanResManager.getLanCommonTextWords("开始游戏");
            showTopInfo();
            for each(_loc1_ in itemw_arr)
            {
               _loc1_.mouseEnabled = true;
            }
         };
         this.mouseEnabled = false;
         this.RefreshBtn.visible = this.RefreshNumTxt.visible = false;
         this.RefreshBtn.enabled = false;
         this.StartBtn.enabled = false;
         this.StartBtn.label = LanResManager.getLanCommonTextWords("开始游戏");
         this.showTopInfo();
         allToFront();
      }
      
      public function changeToShowResult(param1:int, param2:Goods, param3:int, param4:int, param5:Boolean) : void
      {
         var index:int;
         var mCard:KapianVo = null;
         var toMove:Function = null;
         var thisComplete:Function = null;
         var cardIndex:int = param1;
         var g:Goods = param2;
         var bColor:int = param3;
         var $cardShowIndex:int = param4;
         var $hasLing:Boolean = param5;
         toMove = function():void
         {
            if(mCard.parent != null)
            {
               mCard.parent.setChildIndex(mCard,mCard.parent.numChildren - 1);
            }
            TweenMax.to(mCard,moveDeley,{
               "x":$cardShowIndex * 80,
               "y":-100,
               "onComplete":thisComplete
            });
         };
         thisComplete = function():void
         {
            mouseEnabled = true;
            RefreshBtn.visible = RefreshNumTxt.visible = false;
            RefreshBtn.enabled = false;
            StartBtn.enabled = hasLing;
            StartBtn.label = LanResManager.getLanCommonTextWords("再来一局");
            hideTopInfo();
            if($cardShowIndex == 4 - 1)
            {
               mouseEnabled = false;
               RefreshBtn.visible = RefreshNumTxt.visible = false;
               RefreshBtn.enabled = false;
               StartBtn.enabled = false;
               StartBtn.label = LanResManager.getLanCommonTextWords("再来一局");
               hideTopInfo();
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(UI_CARD_GIFT_SHOW_OVER_DATA));
            }
         };
         hasLing = $hasLing;
         mouseEnabled = true;
         this.RefreshBtn.visible = this.RefreshNumTxt.visible = false;
         this.RefreshBtn.enabled = false;
         this.StartBtn.enabled = false;
         this.StartBtn.label = LanResManager.getLanCommonTextWords("再来一局");
         this.hideTopInfo();
         mCard = this.CardSprite.getChildByName(String(cardIndex)) as KapianVo;
         mCard.setSelect(true);
         mCard.mouseEnabled = false;
         if(!mCard)
         {
            return;
         }
         index = this.itemw_arr.indexOf(mCard);
         if(index != -1)
         {
            this.itemw_arr.splice(index,1);
         }
         mCard.setItem(g);
         TweenMax.to(mCard,this.deley,{
            "rotationY":OPEN_AN,
            "onComplete":toMove,
            "onUpdate":this.rotationUpdate,
            "onUpdateParams":[mCard]
         });
      }
      
      public function changeToShowAllResult(param1:Array) : void
      {
         var onUpdate:Function = null;
         var i:int = 0;
         var arr:Array = param1;
         onUpdate = function(param1:KapianVo):void
         {
            rotationUpdate(param1);
            if(curIndex++ == itemw_arr.length - 1)
            {
               if(!hasLing)
               {
                  mouseEnabled = true;
                  RefreshBtn.visible = RefreshNumTxt.visible = false;
                  RefreshBtn.enabled = false;
                  StartBtn.enabled = true;
                  StartBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
                  hideTopInfo();
                  EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(UI_CARD_GIFT_GET_GIFT_ITEM));
               }
            }
         };
         var curIndex:int = 0;
         i = 0;
         while(i < this.itemw_arr.length)
         {
            this.itemw_arr[i].setItem(arr[i].goods);
            i++;
         }
         i = 0;
         while(i < this.itemw_arr.length)
         {
            TweenMax.to(this.itemw_arr[i],this.deley,{
               "rotationY":OPEN_AN,
               "onUpdate":onUpdate,
               "onUpdateParams":[this.itemw_arr[i]]
            });
            i++;
         }
      }
      
      public function changeToShowWeiling(param1:int, param2:int, param3:Array) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:int = 0;
         var _loc7_:KapianVo = null;
         this.initData();
         mouseEnabled = true;
         this.RefreshBtn.visible = this.RefreshNumTxt.visible = false;
         this.RefreshBtn.enabled = false;
         this.StartBtn.enabled = true;
         this.StartBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.hideTopInfo();
         var _loc4_:int = 0;
         while(_loc4_ < param3.length)
         {
            _loc5_ = param3[_loc4_].goods;
            _loc6_ = int(param3[_loc4_].color);
            _loc7_ = new KapianVo(_loc5_);
            _loc7_.x = _loc4_ * 80;
            _loc7_.y = -100;
            _loc7_.buttonMode = true;
            _loc7_.mouseEnabled = false;
            this.CardSprite.addChildAt(_loc7_,0);
            _loc4_++;
         }
      }
      
      public function setHunDunZhiQi(param1:int) : void
      {
         if(param1 <= 0)
         {
            if(this._yuan.parent)
            {
               this._yuan.parent.removeChild(this._yuan);
            }
         }
         else
         {
            if(this._yuan.parent != this)
            {
               this.addChildAt(this._yuan,Number(this._yuan.name));
            }
            this._yuan.update(param1);
         }
      }
      
      public function setQianKunDaiAndXuanHuangShi(param1:int, param2:int) : void
      {
         this.qiankundaiTxt.text = String(param1);
         this.xuanhuangshiTxt.text = String(param2);
      }
      
      public function showHuanjingPanel(param1:int, param2:String) : void
      {
         var $floatType:int = param1;
         var $title:String = param2;
         if(!this.huanjingPanel)
         {
            this.huanjingPanel = new CardGiftChoujiangPanel(false);
            this.huanjingPanel.addEventListener(Event.ADDED_TO_STAGE,function(param1:Event):void
            {
               mouseEnabled = false;
               RefreshBtn.visible = RefreshNumTxt.visible = false;
               RefreshBtn.enabled = false;
               StartBtn.enabled = false;
               StartBtn.label = LanResManager.getLanCommonTextWords("再来一局");
               hideTopInfo();
            });
            this.huanjingPanel.addEventListener(Event.REMOVED_FROM_STAGE,function(param1:Event):void
            {
               mouseEnabled = true;
               RefreshBtn.visible = RefreshNumTxt.visible = false;
               RefreshBtn.enabled = false;
               StartBtn.enabled = !Fun.isVisible(meimengPanel);
               StartBtn.label = LanResManager.getLanCommonTextWords("再来一局");
               hideTopInfo();
            });
            this.huanjingPanel.$parent = this;
         }
         this.huanjingPanel.visible = true;
         this.huanjingPanel.showHuanjingPanel($floatType,$title);
         GameInstance.uiInstance.uiContainer.addChild(this.huanjingPanel);
         this.huanjingPanel.x = (GameConfig.sceneWidth - this.huanjingPanel.width) / 2;
         this.huanjingPanel.y = (GameConfig.sceneHeight - this.huanjingPanel.height) / 2;
      }
      
      public function showMeimengPanel(param1:int, param2:String) : void
      {
         var $floatType:int = param1;
         var $title:String = param2;
         if(!this.meimengPanel)
         {
            this.meimengPanel = new CardGiftChoujiangPanel(true);
            this.meimengPanel.addEventListener(Event.ADDED_TO_STAGE,function(param1:Event):void
            {
               mouseEnabled = false;
               RefreshBtn.visible = RefreshNumTxt.visible = false;
               RefreshBtn.enabled = false;
               StartBtn.enabled = false;
               StartBtn.label = LanResManager.getLanCommonTextWords("再来一局");
               hideTopInfo();
            });
            this.meimengPanel.addEventListener(Event.REMOVED_FROM_STAGE,function(param1:Event):void
            {
               mouseEnabled = true;
               RefreshBtn.visible = RefreshNumTxt.visible = false;
               RefreshBtn.enabled = false;
               StartBtn.enabled = !Fun.isVisible(huanjingPanel);
               StartBtn.label = LanResManager.getLanCommonTextWords("再来一局");
               hideTopInfo();
            });
            this.meimengPanel.$parent = this;
         }
         this.meimengPanel.visible = true;
         this.meimengPanel.showHuanjingPanel($floatType,$title);
         GameInstance.uiInstance.uiContainer.addChild(this.meimengPanel);
         this.meimengPanel.x = (GameConfig.sceneWidth - this.meimengPanel.width) / 2;
         this.meimengPanel.y = (GameConfig.sceneHeight - this.meimengPanel.height) / 2;
      }
      
      public function setHuanjingOtherGiftComplete(param1:int, param2:Array, param3:Goods, param4:int) : void
      {
         this.huanjingPanel.setOtherGiftComplete(param1,param2,param3,param4);
      }
      
      public function setMeimengOtherGiftComplete(param1:int, param2:Array, param3:Goods, param4:int) : void
      {
         this.meimengPanel.setOtherGiftComplete(param1,param2,param3,param4);
      }
      
      public function setOtherGiftGetComplete(param1:int, param2:int) : void
      {
         hasLing = true;
         mouseEnabled = true;
         this.RefreshBtn.visible = this.RefreshNumTxt.visible = false;
         this.RefreshBtn.enabled = false;
         this.StartBtn.enabled = true;
         this.StartBtn.label = LanResManager.getLanCommonTextWords("再来一局");
         this.hideTopInfo();
      }
      
      public function setTitle(param1:String) : void
      {
         this.titleText = param1;
      }
      
      public function setGoodsName(param1:String) : void
      {
         this.ft3.text = param1 + ": ";
         this.ft3.x = this.ft4.x + this.ft4.textWidth - this.ft3.textWidth;
      }
      
      public function get opened() : Boolean
      {
         return Boolean(this.parent) || this.hasHuanjingOrMeimengOpened;
      }
      
      public function get hasHuanjingOrMeimengOpened() : Boolean
      {
         return Fun.isVisible(this.huanjingPanel) || Fun.isVisible(this.meimengPanel);
      }
   }
}

import br.com.stimuli.loading.loadingtypes.LoadingItem;
import com.fireice.panel.FCanvas;
import com.fireice.text.FTextArea;
import com.fireice.util.Tools;
import com.tgame.common.GameConfig;
import com.tgame.common.res.lan.LanResManager;
import com.tgame.common.ui.componets.*;
import com.zcp.manager.LoaderManager;
import com.zcp.manager.RslLoaderManager;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.*;

class yuan extends Sprite
{
   
   private var _r:int;
   
   private var _mask:Shape;
   
   private var _value:int;
   
   private var _guangquan:MovieClip;
   
   private var _qiBmSP:Sprite;
   
   private var tipCanvas:FCanvas;
   
   private var tip:FTextArea;
   
   public function yuan(param1:int)
   {
      var kuang:BitmapData;
      var kuangBm:Bitmap;
      var qi:BitmapData;
      var qiBm:Bitmap;
      var r:int = param1;
      super();
      this._r = r;
      kuang = RslLoaderManager.getInstance("ui.qiankundai.qiu.kuang",1,1);
      kuangBm = new Bitmap(kuang);
      kuangBm.width = kuangBm.height = 2 * this._r;
      kuangBm.x = kuangBm.y = -this._r;
      addChild(kuangBm);
      qi = RslLoaderManager.getInstance("ui.qiankundai.qiu.qi",1,1);
      qiBm = new Bitmap(qi);
      this._qiBmSP = new Sprite();
      this._qiBmSP.addChild(qiBm);
      this._qiBmSP.width = this._qiBmSP.height = 2 * this._r;
      this._qiBmSP.x = this._qiBmSP.y = -this._r;
      addChild(this._qiBmSP);
      LoaderManager.lazyLoad(function(param1:Event):void
      {
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         _guangquan = _loc2_.content as MovieClip;
         if(_guangquan != null)
         {
            _guangquan.width = _guangquan.height = 2 * _r;
            _guangquan.x = _guangquan.y = -_r;
            _guangquan.gotoAndStop(1);
            addChildAt(_guangquan,getChildIndex(_qiBmSP) + 1);
            update(_value);
         }
      },null,false,GameConfig.fileBaseFolder + "res/data/mc/qiankuandai/qiu.swf");
      this._mask = new Shape();
      this._mask.graphics.beginFill(0,0);
      this._mask.graphics.drawRect(0,0,2 * this._r,2 * this._r);
      this._mask.graphics.endFill();
      this._mask.x = -this._r;
      this._mask.y = -this._r;
      addChild(this._mask);
      this._qiBmSP.mask = this._mask;
      this.tipCanvas = new FCanvas();
      this.tipCanvas.skin = "backGroud";
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
      this.addEventListener(MouseEvent.MOUSE_OVER,this.onTip);
      this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);
   }
   
   private function onTip(param1:MouseEvent) : void
   {
      switch(param1.type)
      {
         case MouseEvent.MOUSE_OVER:
            this.addEventListener(MouseEvent.MOUSE_MOVE,this.onTip);
            this.addEventListener(MouseEvent.MOUSE_OUT,this.onTip);
            break;
         case MouseEvent.MOUSE_MOVE:
            this.showTip(this._value,100);
            break;
         case MouseEvent.MOUSE_OUT:
            if(this.tipCanvas.parent != null)
            {
               this.tipCanvas.parent.removeChild(this.tipCanvas);
            }
            this.removeEventListener(MouseEvent.MOUSE_MOVE,this.onTip);
            this.removeEventListener(MouseEvent.MOUSE_OUT,this.onTip);
      }
   }
   
   private function onRemove(param1:Event) : void
   {
      if(this._guangquan != null)
      {
         if(this._guangquan.parent != null)
         {
            this._guangquan.parent.removeChild(this._guangquan);
         }
         this._guangquan.gotoAndStop(1);
      }
   }
   
   private function showTip(param1:int, param2:int) : void
   {
      this.tip.htmlText = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前混沌之气") + ":" + param1 + "%</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当混沌之气达到满值时将有一定几率触发免费的超级大奖") + "</font><br>" + "</textformat>";
      this.tipCanvas.width = this.tip.width + 4;
      this.tipCanvas.height = this.tip.height + 6;
      this.tipCanvas.x = mouseX + 15;
      this.tipCanvas.y = mouseY + 25;
      if(Tools.currentStage.mouseX + this.tipCanvas.width > Tools.currentStage.stageWidth)
      {
         this.tipCanvas.x = Tools.currentStage.mouseX - this.tipCanvas.width;
      }
      else
      {
         this.tipCanvas.x = Tools.currentStage.mouseX + 10;
      }
      if(Tools.currentStage.mouseY + this.tipCanvas.height > Tools.currentStage.stageHeight)
      {
         this.tipCanvas.y = Tools.currentStage.mouseY - this.tipCanvas.height;
      }
      else
      {
         this.tipCanvas.y = Tools.currentStage.mouseY + 10;
      }
      if(this.tipCanvas.parent != Tools.currentStage)
      {
         Tools.currentStage.addChild(this.tipCanvas);
      }
   }
   
   public function update(param1:int) : void
   {
      this._value = param1;
      this._mask.height = 2 * this._r * (this._value / 100);
      this._mask.y = this._r - this._mask.height;
      if(this._guangquan != null)
      {
         if(this._value == 100)
         {
            if(this._guangquan.parent != this)
            {
               this.addChildAt(this._guangquan,this.getChildIndex(this._qiBmSP) + 1);
            }
            this._guangquan.gotoAndPlay(1);
         }
         else
         {
            if(this._guangquan.parent != null)
            {
               this._guangquan.parent.removeChild(this._guangquan);
            }
            this._guangquan.gotoAndStop(1);
         }
      }
   }
}
