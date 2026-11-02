package com.tgame.shell.view.components.cisha
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   
   public class FuChouOKPanel extends FPanel
   {
      
      public static const UI_FUCHOUOK_PANEL_LINGQU:String = "UI_FUCHOUOK_PANEL_LINGQU";
      
      public static const UI_FUCHOUOK_PANEL_REFRESH:String = "UI_FUCHOUOK_PANEL_REFRESH";
      
      private var ft1:FTextArea;
      
      private var lingquBtn:SecondButton;
      
      private var refreshBtn:SecondButton;
      
      private var curItem:ItemFace = null;
      
      private var goodsTx:Bitmap;
      
      private var goodsArr:Array;
      
      private var goodsBg:Sprite;
      
      private var glowFilter:GlowFilter;
      
      public var shuomingPanel:CishaShuomingPanel;
      
      public function FuChouOKPanel()
      {
         this.goodsArr = [];
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = false;
         width = 325;
         height = 270;
         titleText = LanResManager.getLanCommonTextWords("复仇成功");
         this.ft1 = new FTextArea();
         this.ft1.x = 15;
         this.ft1.y = 10;
         this.ft1.width = 300;
         this.ft1.wordWrap = true;
         this.ft1.autoSize = TextFieldAutoSize.LEFT;
         this.ft1.textColor = StaticValue.GREEN;
         this.ft1.filters = StaticValue.filter;
         this.ft1.htmlText = "<textformat leading=\'6\'><font size=\'12\'>" + LanResManager.getLanCommonTextWords("手刃仇人，复仇成功的玩家，可以在以下道具中任选一样，作为你的奖励。") + "</font></textformat>";
         addChild(this.ft1);
         this.lingquBtn = new SecondButton();
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.lingquBtn);
         this.lingquBtn.x = 45;
         this.lingquBtn.y = 205;
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.refreshBtn = new SecondButton();
         this.refreshBtn.label = LanResManager.getLanCommonTextWords("1元宝刷新");
         addChild(this.refreshBtn);
         this.refreshBtn.x = 200;
         this.refreshBtn.y = 205;
         this.refreshBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         ToolTips.createToolTips(this.refreshBtn,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.BLUE_HTML\'>" + LanResManager.getLanCommonTextWords("点击后元宝刷新后，将扣除元宝，同时刷新复仇奖励") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.goodsBg = new Sprite();
         this.goodsBg.x = 25;
         this.goodsBg.y = 70;
         addChild(this.goodsBg);
         this.glowFilter = new GlowFilter(StaticValue.GREEN,1,3,3,4);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lingquBtn:
               if(this.curItem == null)
               {
                  return;
               }
               dispatchEvent(new BaseEvent(UI_FUCHOUOK_PANEL_LINGQU,"",int(this.curItem.name)));
               this.onClose();
               break;
            case this.refreshBtn:
               dispatchEvent(new BaseEvent(UI_FUCHOUOK_PANEL_REFRESH));
         }
      }
      
      private function onItemClick(param1:int) : Function
      {
         var n:int = param1;
         var fun:Function = function(param1:MouseEvent):void
         {
            goodsTx = new Bitmap();
            var _loc2_:int = n % 5;
            var _loc3_:int = n / 5;
            goodsTx.x = _loc2_ * 59;
            goodsTx.y = _loc3_ * 59;
            var _loc4_:int = 0;
            while(_loc4_ < goodsArr.length)
            {
               (goodsArr[_loc4_] as ItemFace).showFram = false;
               _loc4_++;
            }
            (goodsArr[n] as ItemFace).showFram = true;
            curItem = goodsArr[n];
         };
         return fun;
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
            _loc5_ = _loc4_ % 5;
            _loc6_ = _loc4_ / 5;
            _loc7_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.goodsBg.addChild(_loc7_);
            _loc7_.x = _loc5_ * 59;
            _loc7_.y = _loc6_ * 59;
            _loc3_ = new ItemFace(param1[_loc4_].good as Goods);
            _loc3_.addEventListener(MouseEvent.CLICK,this.onItemClick(_loc4_));
            _loc3_.name = param1[_loc4_].id;
            this.goodsBg.addChild(_loc3_);
            _loc3_.x = _loc5_ * 59 + 2;
            _loc3_.y = _loc6_ * 59 + 2;
            this.goodsArr.push(_loc3_);
            _loc4_++;
         }
         if(this.goodsArr.length > 0)
         {
            (this.goodsArr[0] as ItemFace).showFram = true;
            this.curItem = this.goodsArr[0];
         }
         else
         {
            this.curItem = null;
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function addCishaShuomingPanel(param1:int) : void
      {
         if(!this.shuomingPanel)
         {
            this.shuomingPanel = new CishaShuomingPanel();
         }
         else if(this.shuomingPanel.visible && this.shuomingPanel.parent != null)
         {
            this.shuomingPanel.visible = false;
            return;
         }
         GameInstance.uiInstance.uiContainer.addChild(this.shuomingPanel);
         this.shuomingPanel.visible = true;
         this.shuomingPanel.setType(param1);
         this.shuomingPanel.x = (GameConfig.sceneWidth - this.shuomingPanel.width) / 2;
         this.shuomingPanel.y = (GameConfig.sceneHeight - this.shuomingPanel.height) / 2;
      }
   }
}

