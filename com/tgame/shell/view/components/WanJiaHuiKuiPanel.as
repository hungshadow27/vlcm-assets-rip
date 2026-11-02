package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.radioBox.FRadioBox;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class WanJiaHuiKuiPanel extends FPanel
   {
      
      public static const UI_LAOWANJIAHUIKUI_CLICK:String = "UI_LAOWANJIAHUIKUI_CLICK";
      
      public static const UI_LAOWANJIAHUIKUIXUANZE_CLICK:String = "UI_LAOWANJIAHUIKUIXUANZE_CLICK";
      
      private var bx:FCanvas;
      
      private var kuangBg:FCanvas;
      
      private var ft:FTextArea;
      
      private var bit1:Bitmap;
      
      private var item1:ItemFace;
      
      private var bit2:Bitmap;
      
      private var item2:ItemFace;
      
      private var rad1:FRadioBox;
      
      private var rad2:FRadioBox;
      
      private var btn:SecondButton;
      
      private var btn2:SecondButton;
      
      private var types:int = 1;
      
      public function WanJiaHuiKuiPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         this.showCloseButton = true;
         width = 355;
         height = 364 - 40;
         this.titleText = LanResManager.getLanCommonTextWords("老玩家回馈");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bx = new FCanvas();
         this.bx.skin = "box_transparence";
         this.bx.x = 10;
         this.bx.y = 2;
         this.bx.width = 335;
         this.bx.height = 60;
         addChild(this.bx);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.filters = StaticValue.filter;
         this.ft.htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("傲剑两周年真情大派送，凡傲剑老玩家创建新角色登陆后均可领取以下奖励！") + "</font>";
         this.ft.width = 320;
         this.ft.height = 65;
         this.ft.x = 25;
         this.ft.y = 15;
         addChild(this.ft);
         this.kuangBg = new FCanvas();
         this.kuangBg.skin = "box";
         addChild(this.kuangBg);
         this.kuangBg.width = 335;
         this.kuangBg.height = 112;
         this.kuangBg.x = 10;
         this.kuangBg.y = 61;
         this.bit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.bit1);
         this.bit1.x = 25;
         this.bit1.y = 85;
         this.bit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.bit2);
         this.bit2.x = 25;
         this.bit2.y = 125;
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.GREEN;
         this.ft.htmlText = "<font size=\'14\'><b>" + LanResManager.getLanCommonTextWords("神级玄冥圣虎精魄（绑）× 1") + "</b></font>";
         this.ft.width = 320;
         this.ft.height = 65;
         this.ft.x = 95;
         this.ft.y = 90;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = "<font size=\'14\'><b>" + LanResManager.getLanCommonTextWords("商城礼金（绑）× 5000") + "</b></font>";
         this.ft.width = 320;
         this.ft.height = 65;
         this.ft.x = 95;
         this.ft.y = 135;
         addChild(this.ft);
         this.bx = new FCanvas();
         this.bx.skin = "box_transparence";
         this.bx.x = 10;
         this.bx.y = 172;
         this.bx.width = 335;
         this.bx.height = 73 + 3;
         addChild(this.bx);
         this.rad1 = new FRadioBox();
         addChild(this.rad1);
         this.rad1.border = true;
         this.rad1.textColor = StaticValue.BlUE20;
         this.rad1.selectState = true;
         this.rad1.text = LanResManager.getLanCommonTextWords("我是老玩家，我要领取奖励！");
         this.rad1.x = 29;
         this.rad1.y = 231 - 40;
         this.rad1.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.rad2 = new FRadioBox();
         addChild(this.rad2);
         this.rad2.border = true;
         this.rad2.textColor = StaticValue.BlUE20;
         this.rad2.text = LanResManager.getLanCommonTextWords("我是新玩家，路过");
         this.rad2.x = 29;
         this.rad2.y = 261 - 40;
         this.rad2.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.btn);
         this.btn.x = 145;
         this.btn.y = 295 - 40;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function onCloses(param1:FCloseEvent = null) : void
      {
         var e:FCloseEvent = param1;
         FAlert.show(LanResManager.getLanCommonTextWords("如果关闭面板将不能领取奖励，确认关闭？"),"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               onClose();
            }
         });
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.rad1:
               this.rad2.selectState = false;
               dispatchEvent(new BaseEvent(UI_LAOWANJIAHUIKUIXUANZE_CLICK,"",1));
               break;
            case this.rad2:
               this.rad1.selectState = false;
               dispatchEvent(new BaseEvent(UI_LAOWANJIAHUIKUIXUANZE_CLICK,"",2));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this.dispatchEvent(new BaseEvent(UI_LAOWANJIAHUIKUI_CLICK,"",this.types));
         }
      }
      
      public function setICO(param1:Goods, param2:Goods) : void
      {
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.item1 = new ItemFace(param1);
         this.item1.x = 25 + 2;
         this.item1.y = 85 + 2;
         addChild(this.item1);
         if(this.item2 != null && this.item2.parent != null)
         {
            this.item2.parent.removeChild(this.item2);
         }
         this.item2 = new ItemFace(param2);
         this.item2.x = 25 + 2;
         this.item2.y = 125 + 2;
         addChild(this.item2);
      }
      
      public function setType(param1:int = 1) : void
      {
         this.types = param1;
      }
   }
}

