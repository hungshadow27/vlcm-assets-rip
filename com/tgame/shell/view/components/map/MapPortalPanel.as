package com.tgame.shell.view.components.map
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.PopMapPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class MapPortalPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var id:int;
      
      private var content:FTextArea;
      
      private var tip:FLabel;
      
      private var okBtn:SecondButton;
      
      private var btn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function MapPortalPanel()
      {
         var img:Bitmap;
         var ft:FTextArea;
         super();
         skin = "sceondPanel";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 243;
         height = 206;
         titleText = LanResManager.getLanCommonTextWords("地图传送");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.map.portal.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 4;
            width = 70;
            height = 125;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         ft.htmlText = LanResManager.getLanTextWords(this,"地图名称");
         addChild(ft);
         this.content = new FTextArea();
         with(this.content)
         {
            x = 70;
            y = 4;
            width = 165;
            wordWrap = false;
            height = 125;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.content);
         this.tip = new FLabel();
         with(this.tip)
         {
            x = 12;
            y = 124;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
         }
         this.tip.text = LanResManager.getLanTextWords(this,"您希望花费3元宝");
         addChild(this.tip);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"元宝传送");
         addChild(this.okBtn);
         this.okBtn.x = 15;
         this.okBtn.y = 148;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanTextWords(this,"徒步前往");
         addChild(this.btn);
         this.btn.x = (this.panelWidth - this.btn.width) / 2 + 25;
         this.btn.y = 148;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 15;
         this.cancelBtn.y = 148;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(PopMapPanel.UI_MAP_WORLDMAP_PORTAL_OK,"",this.id));
               this.onClose();
               break;
            case this.btn:
               this.$parent.dispatchEvent(new BaseEvent(PopMapPanel.UI_MAP_WORLDMAP_WALK_OK,"",this.id));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function setMapInfo(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:int) : void
      {
         this.id = param1;
         this.content.htmlText = "<textformat leading=\'4\'>" + param2 + "<br>" + param3 + "<br>" + param4 + "<br>" + param5 + "<br>" + param6 + "<br>" + param7 + "<br>" + param8 + "</textformat>";
         if(GameInstance.mainCharData.attributeInfo.isVIP)
         {
            this.tip.text = LanResManager.getLanTextWords(this,"VIP用户无需元宝即可传送到此地");
         }
         else
         {
            this.tip.text = LanResManager.getLanTextWords(this,"快速传送到此地吗",[param9]);
         }
      }
   }
}

