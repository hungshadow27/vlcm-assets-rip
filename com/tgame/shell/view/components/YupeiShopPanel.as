package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.couple.YupeiListRender;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.*;
   
   public class YupeiShopPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var giftContainer:FCanvas;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      public function YupeiShopPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 519;
         height = 403;
         titleText = LanResManager.getLanCommonTextWords("玉佩商店");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 150;
            y = 5;
            wordWrap = true;
            width = 415;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("倾城之恋，定情暖玉，一佩两瓣，三世情缘") + "</font></textformat>";
         }
         addChild(this.ft);
         this.giftContainer = new FCanvas();
         this.giftContainer.skin = "box";
         addChild(this.giftContainer);
         this.giftContainer.x = 10;
         this.giftContainer.y = 22;
         this.giftContainer.width = 500;
         this.giftContainer.height = 300;
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 13;
            y = 25;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,494,294);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new YupeiListRender();
         this.giftList.listWidth = 474;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.Scroll = new FVScorllBar(this.listContainer,294);
         addChild(this.Scroll);
         this.Scroll.x = 490;
         this.Scroll.y = 25;
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 323;
            wordWrap = true;
            width = 480;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("定情玉佩仅需购买一件即可") + "</font></textformat>";
         }
         addChild(this.ft);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
         this.Scroll.update();
      }
   }
}

