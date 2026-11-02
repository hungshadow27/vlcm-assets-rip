package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class HuoDongZhuangbeiTilianPanel extends FPanel
   {
      
      public static const UI_ZHUANGBEITILIAN_CLICK:String = "UI_ZHUANGBEITILIAN_CLICK";
      
      public static const UI_ZHUANGBEIFANGRU_CLICK:String = "UI_ZHUANGBEIFANGRU_CLICK";
      
      private var ft:FTextArea;
      
      private var btn1:SmallButton;
      
      private var djBit1:Bitmap;
      
      private var djBit2:Bitmap;
      
      private var jtBit:Bitmap;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var btn:SecondButton;
      
      private var menuContainer:FCanvas;
      
      private var ifItem1:ItemFace;
      
      private var ifItem2:ItemFace;
      
      private var _modal:Boolean;
      
      public function HuoDongZhuangbeiTilianPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 252;
         height = 318;
         titleText = LanResManager.getLanCommonTextWords("装备提炼");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.setUI();
         dragAble = false;
         this.modal = true;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         Tools.currentStage.addEventListener(Event.RESIZE,this.onReSize);
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         Tools.currentStage.removeEventListener(Event.RESIZE,this.onReSize);
      }
      
      private function onReSize(param1:Event = null) : void
      {
         this.modal = this._modal;
      }
      
      private function set modal(param1:Boolean) : void
      {
         graphics.clear();
         x = Tools.currentStage.stageWidth / 2 - width / 2;
         y = Tools.currentStage.stageHeight / 2 - height / 2;
         this._modal = param1;
         if(param1)
         {
            graphics.beginFill(0,0.5);
            graphics.drawRect(-x,-y,Tools.currentStage.stageWidth,Tools.currentStage.stageHeight);
            graphics.endFill();
         }
         else
         {
            graphics.clear();
         }
      }
      
      public function setUI() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 15;
         this.ft.width = 218;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.wordWrap = true;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("请确认放入的装备！") + "<br/><b><font color=\'#ff0000\'>" + LanResManager.getLanCommonTextWords("装备兑换礼金后，原装备及其内部镶嵌的战魂、宝石都将消失") + "</font></b>，" + LanResManager.getLanCommonTextWords("您会获得一定数量的礼金");
         addChild(this.ft);
         this.menuContainer = new FCanvas();
         this.menuContainer.skin = "backGroud";
         addChild(this.menuContainer);
         this.menuContainer.width = 232;
         this.menuContainer.height = 80;
         this.menuContainer.x = 10;
         this.menuContainer.y = 70 + 15;
         this.btn1 = new SmallButton();
         this.djBit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit1.x = 50 - 2;
         this.djBit1.y = 102 - 10 + 15;
         addChild(this.djBit1);
         this.djBit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit2.x = 170 - 2;
         this.djBit2.y = 102 - 10 + 15;
         addChild(this.djBit2);
         this.jtBit = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.4");
         this.jtBit.rotation = -90;
         this.jtBit.x = 89 - 2;
         this.jtBit.y = 129 - 10 + 15;
         addChild(this.jtBit);
         this.ft2 = new FTextArea();
         this.ft2.x = 15;
         this.ft2.y = 173 - 5;
         this.ft2.width = 220;
         this.ft2.wordWrap = true;
         this.ft2.autoSize = TextFieldAutoSize.LEFT;
         this.ft2.textColor = StaticValue.RED;
         this.ft2.htmlText = LanResManager.getLanCommonTextWords("注意") + "：" + "<br />" + LanResManager.getLanCommonTextWords("60级以上5星以上的紫色装备才能兑换礼金") + "，" + LanResManager.getLanCommonTextWords("装备的等级与星级越高") + "，" + LanResManager.getLanCommonTextWords("兑换的礼金越多");
         addChild(this.ft2);
         this.btn = new SecondButton();
         this.btn.x = 90;
         this.btn.y = 252;
         this.btn.label = LanResManager.getLanCommonTextWords("兑换礼金");
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               if(this.btn.label == LanResManager.getLanCommonTextWords("兑换礼金"))
               {
                  this.dispatchEvent(new BaseEvent(UI_ZHUANGBEITILIAN_CLICK));
               }
               else
               {
                  this.onClose();
               }
         }
      }
      
      public function setGoods1(param1:Goods = null) : void
      {
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         if(param1 == null)
         {
            return;
         }
         this.ifItem1 = new ItemFace(param1);
         this.ifItem1.x = 50 - 2 + 2;
         this.ifItem1.y = 102 - 10 + 2 + 15;
         addChild(this.ifItem1);
      }
      
      public function setGoodsHui1(param1:Boolean) : void
      {
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            if(param1)
            {
               this.ifItem1.filters = [];
               this.ifItem1.mouseEnabled = true;
            }
            else
            {
               this.ifItem1.filters = Tools.blackWhiteFilter;
               this.ifItem1.mouseEnabled = false;
            }
         }
      }
      
      public function setGoods2(param1:Goods = null) : void
      {
         if(this.ifItem2 != null && this.ifItem2.parent != null)
         {
            this.ifItem2.parent.removeChild(this.ifItem2);
         }
         if(param1 == null)
         {
            return;
         }
         this.ifItem2 = new ItemFace(param1);
         this.ifItem2.x = 170 - 2 + 2;
         this.ifItem2.y = 102 - 10 + 2 + 15;
         addChild(this.ifItem2);
      }
      
      public function setBtnEnable(param1:Boolean) : void
      {
         if(param1)
         {
            this.btn.label = LanResManager.getLanCommonTextWords("兑换礼金");
         }
         else
         {
            this.btn.label = LanResManager.getLanCommonTextWords("关闭面板");
         }
      }
   }
}

