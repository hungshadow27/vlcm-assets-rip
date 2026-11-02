package com.tgame.shell.view.components.shitu
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ShifuTuiJianPanel extends FPanel
   {
      
      public var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var listCanvas:FCanvas;
      
      private var playerList:FList;
      
      private var btn_baishi:SecondButton;
      
      private var btn_clean:SecondButton;
      
      public function ShifuTuiJianPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 315;
         height = 312;
         titleText = LanResManager.getLanCommonTextWords("师傅推荐");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 11;
            y = 8;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,"恭喜您的等级又提升了！根据您目前的升级情况，向您推荐几位名师。有师父的带领，您将获得更快的成长。");
         }
         addChild(this.ft);
         this.listCanvas = new FCanvas();
         this.listCanvas.skin = "box";
         this.listCanvas.width = 295;
         this.listCanvas.height = 171;
         addChild(this.listCanvas);
         this.listCanvas.y = 65;
         this.listCanvas.x = 10;
         this.playerList = new FList();
         this.playerList.skin = "list";
         this.playerList.itemRenderer = new ShifuTuiJianListRender();
         this.playerList.listWidth = 290;
         this.playerList.listHeight = 179;
         addChild(this.playerList);
         this.playerList.x = 11;
         this.playerList.y = 70;
         this.btn_baishi = new SecondButton();
         this.btn_baishi.label = LanResManager.getLanCommonTextWords("拜师");
         addChild(this.btn_baishi);
         this.btn_baishi.x = 92;
         this.btn_baishi.y = 244;
         this.btn_baishi.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.btn_clean = new SecondButton();
         this.btn_clean.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.btn_clean);
         this.btn_clean.x = this.btn_baishi.x + this.btn_baishi.width + 47;
         this.btn_clean.y = 244;
         this.btn_clean.addEventListener(MouseEvent.CLICK,this.onBtnClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function set dataProvider(param1:XML) : void
      {
         if(param1)
         {
            this.playerList.dataProvider = param1;
         }
         if(param1.children().length() > 0)
         {
            this.playerList.setSelectItemByIndex(0);
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         ShifuTuiJianListRender.$parent = param1;
         ShifuTuiJianListRender.panelNo = 1;
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn_baishi:
               if(this.playerList.selectItem != null)
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_SHITUTUIJIAN_BAISHI,"",int(this.playerList.selectItem.label)));
               }
               break;
            case this.btn_clean:
               this.onClose();
         }
      }
   }
}

