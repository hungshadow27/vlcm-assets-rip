package com.tgame.shell.view.components.shuangxiu
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.ShuangXiu_SearchPlayerPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class ShuangXiuPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var head:Bitmap;
      
      private var playerName:FLabel;
      
      private var level:FLabel;
      
      private var setup:FLabel;
      
      private var party:FLabel;
      
      private var lookBtn:SecondButton;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var id:int;
      
      public function ShuangXiuPanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         var ft:FTextArea;
         super();
         skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 258;
         height = 205;
         titleText = LanResManager.getLanCommonTextWords("双修打坐");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.shuangxiu.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         this.head = new Bitmap();
         addChild(this.head);
         this.head.x = 15;
         this.head.y = 11;
         lb = new FLabel();
         with(lb)
         {
            x = 62;
            y = 14;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"昵称：");
         }
         addChild(lb);
         this.playerName = new FLabel();
         with(this.playerName)
         {
            x = 96;
            y = 14;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = "[999]" + LanResManager.getLanCommonTextWords("玩家名字六个");
         }
         addChild(this.playerName);
         this.level = new FLabel();
         with(this.level)
         {
            x = 210;
            y = 14;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "100";
         }
         addChild(this.level);
         lb = new FLabel();
         with(lb)
         {
            x = 62;
            y = 32;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"帮派和门派");
         }
         addChild(lb);
         this.setup = new FLabel();
         with(this.setup)
         {
            x = 96;
            y = 32;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮派名字六个");
         }
         addChild(this.setup);
         this.party = new FLabel();
         with(this.party)
         {
            x = 210;
            y = 32;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("三个字");
         }
         addChild(this.party);
         ft = new FTextArea();
         with(ft)
         {
            x = 14;
            y = 63;
            width = 235;
            height = 80;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"该玩家希望与您开始打坐双修",[StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML]);
         }
         addChild(ft);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanCommonTextWords("查看资料");
         addChild(this.lookBtn);
         this.lookBtn.x = 20;
         this.lookBtn.y = 150;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("同意");
         addChild(this.okBtn);
         this.okBtn.x = (width - this.okBtn.width) / 2;
         this.okBtn.y = 150;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 20;
         this.cancelBtn.y = 150;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lookBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_LOOK_INFO_BTN_CLICK,"",this.id));
               break;
            case this.okBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_OK_BTN_CLICK,"",this.id));
               POPWindowManager.closeWindow();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(ShuangXiu_SearchPlayerPanel.UI_SHUANGXIU_CANCEL_BTN_CLICK,"",this.id));
         POPWindowManager.closeWindow();
      }
      
      public function show(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String) : void
      {
         this.id = param1;
         this.head.bitmapData = StaticValue.getBitmapByClassName(param2).bitmapData;
         this.head.width = this.head.height = 40;
         this.playerName.text = param3;
         this.level.text = "[" + param4 + "]";
         this.setup.text = param5;
         this.party.text = param6;
      }
   }
}

