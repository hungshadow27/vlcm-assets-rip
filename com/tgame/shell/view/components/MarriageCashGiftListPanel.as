package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.marriage.CashGiftListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class MarriageCashGiftListPanel extends FPanel
   {
      
      public static const UI_MARRIAGE_CASH_GIFT_LIST_GET:String = "UI_MARRIAGE_CASH_GIFT_LIST_GET";
      
      public static const UI_MARRIAGE_CASH_GIFT_LIST_PAGE:String = "UI_MARRIAGE_CASH_GIFT_LIST_PAGE";
      
      public static const UI_MARRIAGE_CASH_GIFT_LIST_SHOW_MENU:String = "UI_MARRIAGE_CASH_GIFT_LIST_SHOW_MENU";
      
      public var $parent:DisplayObject;
      
      private var list:FList;
      
      private var preBtn:SmallButton;
      
      private var nextBtn:SmallButton;
      
      private var pageCount:FTextArea;
      
      private var title:FTextArea;
      
      private var playerCount:FLabel;
      
      private var giftTotal:FLabel;
      
      private var surplus:FLabel;
      
      private var getBtn:SecondButton;
      
      public function MarriageCashGiftListPanel()
      {
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var fb:FLabel;
         var len:int;
         var bg:Bitmap = null;
         var ico:Bitmap = null;
         var i:int = 0;
         super();
         dragAble = true;
         this.skin = "sceondPanel_btn";
         this.showCloseButton = true;
         width = 271;
         height = 443;
         this.titleText = LanResManager.getLanCommonTextWords("红包列表");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.marriage.cashGift.list.ui";
         addChild(bg);
         bg.x = 6;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         tf = new TextFormat();
         fb = new FLabel();
         with(fb)
         {
            x = 35;
            y = 8;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("宾客名称");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 135;
            y = 8;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 8;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("红包数额");
         }
         addChild(fb);
         len = 10;
         i = 0;
         while(i < len)
         {
            ico = StaticValue.getBitmapByClassName("ui.ico.money.copper");
            addChild(ico);
            ico.x = 176;
            ico.y = 28 + i * 21;
            i++;
         }
         this.list = new FList();
         this.list.skin = "list";
         this.list.itemRenderer = new CashGiftListRender();
         this.list.listWidth = 254;
         addChild(this.list);
         this.list.x = 7;
         this.list.y = 25;
         this.list.addEventListener(MouseEvent.CLICK,this.onList);
         this.preBtn = new SmallButton();
         this.preBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.preBtn);
         this.preBtn.x = 78;
         this.preBtn.y = 241;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onPage);
         tf.align = "center";
         this.pageCount = new FTextArea();
         with(this.pageCount)
         {
            x = preBtn.x + preBtn.width;
            y = 243;
            width = 40;
            height = 16;
            defaultTextFormat = StaticValue.format;
            background = true;
            backgroundColor = 0;
            textColor = StaticValue.WHITE;
            text = "10/10";
         }
         addChild(this.pageCount);
         this.nextBtn = new SmallButton();
         this.nextBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.nextBtn);
         this.nextBtn.x = this.pageCount.x + 40;
         this.nextBtn.y = 241;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onPage);
         this.title = new FTextArea();
         with(this.title)
         {
            x = 6;
            y = 264;
            width = 256;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.title);
         fb = new FLabel();
         with(fb)
         {
            x = 12;
            y = 288;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("总参与人次") + "：";
         }
         addChild(fb);
         this.playerCount = new FLabel();
         with(this.playerCount)
         {
            x = 92;
            y = 289;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "00000";
         }
         addChild(this.playerCount);
         fb = new FLabel();
         with(fb)
         {
            x = 12;
            y = 310;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("总红包收益") + "：";
         }
         addChild(fb);
         this.giftTotal = new FLabel();
         with(this.giftTotal)
         {
            x = 92;
            y = 310;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "00000";
         }
         addChild(this.giftTotal);
         fb = new FLabel();
         with(fb)
         {
            x = 12;
            y = 332;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("剩余未领取") + "：";
         }
         addChild(fb);
         this.surplus = new FLabel();
         with(this.surplus)
         {
            x = 92;
            y = 332;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "00000";
         }
         addChild(this.surplus);
         fb = new FLabel();
         with(fb)
         {
            x = 10;
            y = 358;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("婚宴结束后结婚双方可各自领走一半红包");
         }
         addChild(fb);
         this.getBtn = new SecondButton();
         this.getBtn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.getBtn);
         this.getBtn.x = (this.panelWidth - this.getBtn.width) / 2;
         this.getBtn.y = 387;
         this.getBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_MARRIAGE_CASH_GIFT_LIST_GET));
      }
      
      private function onPage(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn:
               dispatchEvent(new BaseEvent(UI_MARRIAGE_CASH_GIFT_LIST_PAGE,"",0));
               break;
            case this.nextBtn:
               dispatchEvent(new BaseEvent(UI_MARRIAGE_CASH_GIFT_LIST_PAGE,"",1));
         }
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(this.list.selectItem != null)
         {
            dispatchEvent(new BaseEvent(UI_MARRIAGE_CASH_GIFT_LIST_SHOW_MENU,"",[this.list.selectItem,param1]));
         }
      }
      
      public function setData(param1:XML, param2:int, param3:int) : void
      {
         this.pageCount.text = param2 + "/" + param3;
         this.preBtn.enabled = this.nextBtn.enabled = true;
         if(param2 == 1)
         {
            this.preBtn.enabled = false;
         }
         if(param2 == param3)
         {
            this.nextBtn.enabled = false;
         }
         this.list.dataProvider = param1;
      }
      
      public function setName(param1:String) : void
      {
         this.title.text = param1;
      }
      
      public function setPlayCount(param1:int) : void
      {
         this.playerCount.text = param1.toString();
      }
      
      public function setGiftCount(param1:Number) : void
      {
         this.giftTotal.text = param1.toString();
      }
      
      public function setSurplus(param1:Number) : void
      {
         this.surplus.text = param1.toString();
      }
   }
}

