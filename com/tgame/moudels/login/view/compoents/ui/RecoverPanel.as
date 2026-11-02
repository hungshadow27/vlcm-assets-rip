package com.tgame.moudels.login.view.compoents.ui
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.moudels.login.view.compoents.LoginUI;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class RecoverPanel extends FPanel
   {
      
      private var rolesList:FList;
      
      private var scroll:FVScorllBar;
      
      private var recoverBtn:SecondButton;
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      private var shuomingLb:FTextArea;
      
      public function RecoverPanel()
      {
         var lb:FLabel;
         super();
         dragAble = true;
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 240;
         height = 330;
         this.titleText = LanResManager.getLanCommonTextWords("角色恢复");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.fc1 = new FCanvas();
         this.fc1.width = 228;
         this.fc1.height = 222;
         this.fc1.x = 6;
         this.fc1.y = 2;
         this.fc1.skin = "box";
         addChild(this.fc1);
         this.fc2 = new FCanvas();
         this.fc2.width = 228;
         this.fc2.height = 75;
         this.fc2.x = 6;
         this.fc2.y = 223;
         this.fc2.skin = "box";
         addChild(this.fc2);
         lb = new FLabel();
         with(lb)
         {
            x = 22;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("玩家名称");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 103;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 160;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("删除时间");
         }
         addChild(lb);
         this.rolesList = new FList();
         this.rolesList.doubleClickEnabled = true;
         this.rolesList.skin = "list";
         this.rolesList.listWidth = 205;
         this.rolesList.listHeight = 200;
         this.rolesList.itemRenderer = new RecoverRender();
         addChild(this.rolesList);
         this.rolesList.x = 10;
         this.rolesList.y = 22;
         this.scroll = new FVScorllBar(this.rolesList,200);
         addChild(this.scroll);
         this.scroll.x = 216;
         this.scroll.y = 22;
         this.shuomingLb = new FTextArea();
         this.shuomingLb.htmlText = "<textformat><font size=\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("声明:") + "\n" + LanResManager.getLanCommonTextWords("玩家只可以恢复在30天内删除的角色。") + "</font></textformat>";
         this.shuomingLb.x = 10;
         this.shuomingLb.y = 225;
         this.shuomingLb.height = 100;
         this.shuomingLb.width = 228;
         this.shuomingLb.wordWrap = true;
         this.shuomingLb.filters = StaticValue.filter;
         addChild(this.shuomingLb);
         this.recoverBtn = new SecondButton();
         this.recoverBtn.label = LanResManager.getLanCommonTextWords("确定恢复");
         this.recoverBtn.align = "center";
         this.recoverBtn.height = 22;
         this.recoverBtn.addEventListener(MouseEvent.CLICK,this.onRecoverClick);
         this.recoverBtn.x = 82;
         this.recoverBtn.y = 273;
         addChild(this.recoverBtn);
      }
      
      private function onRecoverClick(param1:MouseEvent) : void
      {
         var _loc2_:Object = this.rolesList.selectItem as Object;
         if(_loc2_ == null)
         {
            return;
         }
         FAlert.show(LanResManager.getLanCommonTextWords("确定恢复选中人物？"),"",2,this.altercallBack,false);
      }
      
      private function altercallBack(param1:FAlertEvent) : void
      {
         var _loc2_:Object = null;
         if(param1.eventData == FAlert.OK)
         {
            _loc2_ = this.rolesList.selectItem as Object;
            if(_loc2_ == null)
            {
               return;
            }
            parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SELECTCHAR_RECOVER_CHAR,"",_loc2_.id));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setRolesData(param1:XML) : void
      {
         this.rolesList.dataProvider = param1;
         this.scroll.update();
      }
      
      public function destory() : void
      {
         this.removeEvents();
      }
      
      private function removeEvents() : void
      {
      }
   }
}

