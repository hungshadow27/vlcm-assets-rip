package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.baoxiang.KapianVo;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import gs.TweenMax;
   
   public class CardGiftChoujiangPanel extends FPanel
   {
      
      private static const H_COUNT:int = 5;
      
      public static var hasLing:Boolean = false;
      
      public var $parent:DisplayObject;
      
      private var itemContainer:Sprite;
      
      private var lingquBtn:SecondButton;
      
      private var cardList:Array;
      
      private var cardListGoods:Array;
      
      private var cuurCard:KapianVo;
      
      private var typeId:int;
      
      private var deley1:Number = 0.6;
      
      private var delay2:Number = 0.3;
      
      private var delay3:Number = 0.3;
      
      private var delay4:Number = 1.2;
      
      public function CardGiftChoujiangPanel(param1:Boolean)
      {
         var _loc2_:Bitmap = null;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 409;
         height = 547;
         _loc2_ = new Bitmap();
         if(param1)
         {
            _loc2_.name = "ui.qiankundai.choujiang.liang.ui";
         }
         else
         {
            _loc2_.name = "ui.qiankundai.choujiang.ui";
         }
         addChild(_loc2_);
         _loc2_.x = 10;
         _loc2_.y = 2;
         var _loc3_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc3_.push(_loc2_);
         this.DynamicManageImages = _loc3_;
         addEventListener(FCloseEvent.CLOSE,this.tryClose);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.lingquBtn = new SecondButton();
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("关闭");
         this.lingquBtn.x = 186;
         this.lingquBtn.y = 481;
         this.lingquBtn.enabled = false;
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.tryClose);
         addChild(this.lingquBtn);
      }
      
      private function tryClose(param1:* = null) : void
      {
         var self:CardGiftChoujiangPanel = null;
         var str:String = null;
         var e:* = param1;
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
      
      private function onCardClick(param1:MouseEvent) : void
      {
         this.cuurCard = param1.currentTarget as KapianVo;
         EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(CardGiftPanel.UI_CARD_GIFT_BAG_PANEL_LOOK_PUKE,"",this.typeId));
      }
      
      public function showHuanjingPanel(param1:int, param2:String) : void
      {
         var i:int;
         var card:KapianVo = null;
         var cardY:int = 0;
         var obj:Object = null;
         var onUpdate:Function = null;
         var onComplete:Function = null;
         var j:int = 0;
         var k:int = 0;
         var _good:Goods = null;
         var type:int = param1;
         var $title:String = param2;
         onUpdate = function():void
         {
            for each(card in cardList)
            {
               card.x = card.fromX + (card.toX - card.fromX) * obj.per;
               card.y = card.fromY + (card.toY - card.fromY) * obj.per;
            }
         };
         onComplete = function():void
         {
            obj.per = 1;
            onUpdate();
            mouseEnabled = true;
            lingquBtn.enabled = false;
         };
         this.typeId = type;
         this.setChoujianglTitle($title);
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         mouseEnabled = false;
         this.lingquBtn.enabled = false;
         hasLing = false;
         this.cardList = [];
         i = 0;
         while(i < H_COUNT)
         {
            j = 4;
            if(i == 0 || i == H_COUNT - 1)
            {
               j = 6;
            }
            k = 0;
            while(k < j)
            {
               _good = new Goods(SpecialGoodsID.PINE_NUTS_TEN_STAR_GOLD);
               card = new KapianVo(_good);
               card.hiedItem();
               card.buttonMode = true;
               card.x = 80 * i + 15 + card.width / 2;
               card.rotationY = 180;
               card.addEventListener(MouseEvent.CLICK,this.onCardClick);
               this.itemContainer.addChild(card);
               this.cardList.push(card);
               if(j == 4 && i != 2)
               {
                  cardY = k == 0 ? (cardY = 79 / 2 * (k + 1)) : (k == j - 1 ? int(79 * (k + 1) + 7 + 79 / 2) : int(79 * (k + 1) + 7));
               }
               else if(i == 2)
               {
                  cardY = k >= 2 ? (k > 2 ? int(77 * 5 + 5) : int(98 * (k + 1) + 5)) : int(90 * k + 5);
               }
               else
               {
                  cardY = 77 * k + 5;
               }
               card.fromX = card.x;
               card.fromY = card.y;
               card.toX = card.x;
               card.toY = cardY;
               k++;
            }
            i++;
         }
         obj = {"per":0};
         TweenMax.to(obj,this.deley1,{
            "per":1,
            "onUpdate":onUpdate,
            "onComplete":onComplete
         });
      }
      
      public function setOtherGiftComplete(param1:int, param2:Array, param3:Goods, param4:int) : void
      {
         var len:int;
         var i:int;
         var oldW:int;
         var obj:Object = null;
         var hasChanged:Boolean = false;
         var onUpdate:Function = null;
         var onComplete:Function = null;
         var tweenAll:Function = null;
         var card:KapianVo = null;
         var type:int = param1;
         var goodsArr:Array = param2;
         var g:Goods = param3;
         var bColor:int = param4;
         onUpdate = function():void
         {
            if(obj.per >= 0.5)
            {
               if(!hasChanged)
               {
                  hasChanged = true;
                  cuurCard.setItem(g);
                  cuurCard.showItem();
               }
            }
            cuurCard.rotationY = 180 - 180 * obj.per;
         };
         onComplete = function():void
         {
            obj.per = 1;
            onUpdate();
            TweenMax.to(cuurCard,delay3,{
               "x":width / 2,
               "y":height / 2 - cuurCard.height / 2 - 40,
               "onComplete":tweenAll
            });
         };
         tweenAll = function():void
         {
            var time:Number;
            var len:int = 0;
            var perMax:Number = NaN;
            var hasChangeDict:Dictionary = null;
            var onUpdateAll:Function = null;
            var onCompleteAll:Function = null;
            onUpdateAll = function():void
            {
               var _loc1_:KapianVo = null;
               var _loc2_:int = 0;
               var _loc3_:Number = NaN;
               _loc2_ = 0;
               while(_loc2_ < len)
               {
                  _loc1_ = cardList[_loc2_];
                  _loc3_ = obj.per - _loc2_ / (len - 1) * (perMax - 1);
                  if(_loc3_ < 0)
                  {
                     _loc3_ = 0;
                  }
                  if(_loc3_ > 1)
                  {
                     _loc3_ = 1;
                  }
                  if(_loc3_ >= 0.5)
                  {
                     if(!hasChangeDict[_loc2_])
                     {
                        hasChangeDict[_loc2_] = true;
                        _loc1_.setItem(goodsArr[_loc2_].goods);
                        _loc1_.showItem();
                     }
                  }
                  _loc1_.rotationY = 180 - 180 * _loc3_;
                  _loc2_++;
               }
            };
            onCompleteAll = function():void
            {
               obj.per = perMax;
               onUpdateAll();
               mouseEnabled = true;
               lingquBtn.enabled = true;
            };
            hasChanged = false;
            len = int(cardList.length);
            obj.per = 0;
            time = delay4;
            perMax = 5;
            hasChangeDict = new Dictionary();
            TweenMax.to(obj,time,{
               "per":perMax,
               "onUpdate":onUpdateAll,
               "onComplete":onCompleteAll
            });
         };
         if(this.typeId != type)
         {
            return;
         }
         if(!this.cuurCard)
         {
            return;
         }
         mouseEnabled = false;
         this.lingquBtn.enabled = false;
         hasLing = true;
         len = int(this.cardList.length);
         i = len - 1;
         while(i >= 0)
         {
            card = this.cardList[i] as KapianVo;
            card.mouseEnabled = false;
            if(this.cuurCard == card)
            {
               this.cardList.splice(i,1);
            }
            i--;
         }
         this.cuurCard.setSelect(true);
         if(this.cuurCard.parent != null)
         {
            this.cuurCard.parent.setChildIndex(this.cuurCard,this.cuurCard.parent.numChildren - 1);
         }
         obj = {"per":0};
         hasChanged = false;
         oldW = this.cuurCard.width;
         TweenMax.to(obj,this.delay2,{
            "per":1,
            "onUpdate":onUpdate,
            "onComplete":onComplete
         });
      }
      
      private function setChoujianglTitle(param1:String) : void
      {
         this.titleText = param1;
      }
   }
}

