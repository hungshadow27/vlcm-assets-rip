package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.filters.GlowFilter;
   
   public class Party_task_PrisePanel extends FPanel
   {
      
      public static const UI_PARTYTASK_COMPELERENWU_CLICK:String = "UI_PARTYTASK_COMPELERENWU_CLICK";
      
      public var bgImg:Bitmap;
      
      private var v:Vector.<Bitmap>;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var goodsBg:Sprite;
      
      private var btnComplete:SecondButton;
      
      private var btnCancel:SecondButton;
      
      private var curGoodId:int = -1;
      
      private var goodsTx:Bitmap;
      
      private var goodsArr:Array;
      
      private var pathBg:Sprite;
      
      private var glowFilter:GlowFilter;
      
      public function Party_task_PrisePanel()
      {
         var ft:FTextArea;
         this.goodsArr = [];
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 321 + 5;
         height = 223 + 13;
         this.titleText = LanResManager.getLanCommonTextWords("运镖任务奖励");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.party.task.jiangli.ui";
         this.bgImg.x = 11;
         this.bgImg.y = 20;
         addChild(this.bgImg);
         this.v = new Vector.<Bitmap>();
         this.v.push(this.bgImg);
         this.DynamicManageImages = this.v;
         ft = new FTextArea();
         with(ft)
         {
            x = 12;
            y = 3;
            width = 200;
            height = 20;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("请在下列物品中任选一种作为奖励") + "：";
         }
         addChild(ft);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 12;
            y = 127;
            width = 142;
            height = 38;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("经验奖励") + "：<br>" + LanResManager.getLanCommonTextWords("铜钱") + "：";
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 155;
            y = 127;
            width = 142;
            height = 38;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("帮会贡献") + "：<br>" + LanResManager.getLanCommonTextWords("真气") + "：";
         }
         addChild(this.ft2);
         this.btnComplete = new SecondButton();
         with(this.btnComplete)
         {
            x = 60;
            y = 170;
            label = LanResManager.getLanCommonTextWords("完成任务");
            addEventListener(MouseEvent.CLICK,onCompleteClick);
         }
         addChild(this.btnComplete);
         this.btnCancel = new SecondButton();
         with(this.btnCancel)
         {
            x = 197;
            y = 170;
            label = LanResManager.getLanCommonTextWords("取消");
            addEventListener(MouseEvent.CLICK,onCancelClick);
         }
         addChild(this.btnCancel);
         this.goodsBg = new Sprite();
         this.goodsBg.x = 20;
         this.goodsBg.y = 28;
         addChild(this.goodsBg);
         this.glowFilter = new GlowFilter(StaticValue.GREEN,1,3,3,4);
      }
      
      private function onItemClick(param1:int) : Function
      {
         var n:int = param1;
         var fun:Function = function(param1:MouseEvent):void
         {
            goodsTx = new Bitmap();
            var _loc2_:int = n % 6;
            var _loc3_:int = n / 6;
            goodsTx.x = _loc2_ * 49;
            goodsTx.y = _loc3_ * 49;
            var _loc4_:int = 0;
            while(_loc4_ < goodsArr.length)
            {
               (goodsArr[_loc4_] as ItemFace).showFram = false;
               _loc4_++;
            }
            (goodsArr[n] as ItemFace).showFram = true;
            curGoodId = (goodsArr[n] as ItemFace).getBaseItem().id;
         };
         return fun;
      }
      
      private function onCompleteClick(param1:MouseEvent) : void
      {
         if(this.curGoodId < 0)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_PARTYTASK_COMPELERENWU_CLICK,"",this.curGoodId));
         this.onClose();
      }
      
      private function onCancelClick(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function selectAGood() : void
      {
      }
      
      public function initGoodsList(param1:Array) : void
      {
         var _loc3_:ItemFace = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Bitmap = null;
         this.goodsArr = [];
         while(this.goodsBg.numChildren)
         {
            this.goodsBg.removeChildAt(0);
         }
         var _loc2_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = _loc4_ % 6;
            _loc6_ = _loc4_ / 6;
            _loc7_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.goodsBg.addChild(_loc7_);
            _loc7_.x = _loc5_ * 49;
            _loc7_.y = _loc6_ * 49;
            _loc3_ = new ItemFace(param1[_loc4_] as Goods);
            _loc3_.addEventListener(MouseEvent.CLICK,this.onItemClick(_loc4_));
            _loc3_.name = _loc4_.toString();
            this.goodsBg.addChild(_loc3_);
            _loc3_.x = _loc5_ * 49 + 2;
            _loc3_.y = _loc6_ * 49 + 2;
            this.goodsArr.push(_loc3_);
            _loc4_++;
         }
         if(this.goodsArr.length > 0)
         {
            (this.goodsArr[0] as ItemFace).showFram = true;
            this.curGoodId = (this.goodsArr[0] as ItemFace).getBaseItem().id;
         }
         else
         {
            this.curGoodId = -1;
         }
      }
      
      public function setPrise(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("经验奖励") + "：" + param1 + "<br>" + LanResManager.getLanCommonTextWords("铜钱") + "：" + param2;
         this.ft2.htmlText = LanResManager.getLanCommonTextWords("帮会贡献") + "：" + param3 + "<br>" + LanResManager.getLanCommonTextWords("真气") + "：" + param4;
      }
   }
}

