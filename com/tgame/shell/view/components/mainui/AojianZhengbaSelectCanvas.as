package com.tgame.shell.view.components.mainui
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.moudels.login.view.compoents.ui.ZhengbaLineListRender;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class AojianZhengbaSelectCanvas extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var lineList:FList;
      
      private var scroll:FVScorllBar;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function AojianZhengbaSelectCanvas()
      {
         var fb:FLabel;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 256;
         height = 405;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         fb = new FLabel();
         with(fb)
         {
            x = 11;
            y = 8;
            filters = StaticValue.filter;
            textColor = StaticValue.RED;
            text = LanResManager.getLanCommonTextWords("傲剑争霸开启时间：19:00—19:30");
         }
         addChild(fb);
         this.lineList = new FList();
         this.lineList.skin = "list";
         this.lineList.itemRenderer = new ZhengbaLineListRender();
         this.lineList.listWidth = 194;
         addChild(this.lineList);
         this.lineList.x = 29;
         this.lineList.y = 35;
         this.scroll = new FVScorllBar(this.lineList,326);
         addChild(this.scroll);
         this.scroll.x = 225;
         this.scroll.y = 20;
         this.okBtn = new SecondButton();
         addChild(this.okBtn);
         this.okBtn.label = LanResManager.getLanCommonTextWords("进入");
         this.okBtn.x = 48;
         this.okBtn.y = 340;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         addChild(this.cancelBtn);
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("跨服包裹");
         this.cancelBtn.x = 145;
         this.cancelBtn.y = 340;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick1);
      }
      
      private function onClose(param1:*) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_AOJIANZHENGBA_LINE_SELECT,"",this.lineList.selectItem));
         this.onClose(null);
      }
      
      private function onClick1(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_KUAFUBAOGUO));
      }
      
      public function set dataProvider(param1:XML) : void
      {
         this.lineList.dataProvider = param1;
         this.lineList.setSelectItemByIndex(0);
         this.scroll.update();
      }
   }
}

