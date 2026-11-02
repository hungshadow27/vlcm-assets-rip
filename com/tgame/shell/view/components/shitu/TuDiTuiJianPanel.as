package com.tgame.shell.view.components.shitu
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class TuDiTuiJianPanel extends FPanel
   {
      
      public var _parent:DisplayObject;
      
      private var text_ft:FTextArea;
      
      private var listCanvas:FCanvas;
      
      private var playerList:FList;
      
      private var btn_shoutu:SecondButton;
      
      private var btn_clean:SecondButton;
      
      private var listScroll:FVScorllBar;
      
      public function TuDiTuiJianPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 315;
         height = 312;
         titleText = LanResManager.getLanCommonTextWords("徒弟推荐");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.text_ft = new FTextArea();
         with(this.text_ft)
         {
            x = 20;
            y = 8;
            width = 260;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.text_ft);
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
         this.playerList.listWidth = 274;
         this.playerList.listHeight = 179;
         addChild(this.playerList);
         this.playerList.x = 11;
         this.playerList.y = 70;
         this.listScroll = new FVScorllBar(this.playerList,166);
         addChild(this.listScroll);
         this.listScroll.x = 288;
         this.listScroll.y = 67;
         this.btn_shoutu = new SecondButton();
         this.btn_shoutu.label = LanResManager.getLanCommonTextWords("收徒");
         addChild(this.btn_shoutu);
         this.btn_shoutu.x = 72;
         this.btn_shoutu.y = 244;
         this.btn_shoutu.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.btn_clean = new SecondButton();
         this.btn_clean.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.btn_clean);
         this.btn_clean.x = this.btn_shoutu.x + this.btn_shoutu.width + 27;
         this.btn_clean.y = 244;
         this.btn_clean.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.setTudiNum(9,10);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         ShifuTuiJianListRender.$parent = param1;
         ShifuTuiJianListRender.panelNo = 2;
      }
      
      public function set dataProvider(param1:XML) : void
      {
         if(param1)
         {
            this.playerList.dataProvider = param1;
            if(param1.children().length() > 0)
            {
               this.playerList.setSelectItemByIndex(0);
            }
         }
         this.listScroll.update();
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn_shoutu:
               if(this.playerList.selectItem != null)
               {
                  this._parent.dispatchEvent(new BaseEvent(FriendPanel.UI_TUDITUIJIAN_SHOUTU,"",int(this.playerList.selectItem.label)));
               }
               break;
            case this.btn_clean:
               this.onClose();
         }
      }
      
      public function setTudiNum(param1:int, param2:int) : void
      {
         this.text_ft.htmlText = LanResManager.getLanTextWords(this,"您目前的带徒数量为向您推荐几位很有潜力的新徒弟在您的带领下他",[param1,param2]);
      }
   }
}

