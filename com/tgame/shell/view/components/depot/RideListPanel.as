package com.tgame.shell.view.components.depot
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.shell.view.components.RideDepotPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class RideListPanel extends FPanel
   {
      
      public static const UI_RIDE_LIST_DEPOT:String = "UI_RIDE_LIST_DEPOT";
      
      public static const UI_RIDE_LIST_SHOP:String = "UI_RIDE_LIST_SHOP";
      
      public var $parent:DisplayObject;
      
      private var _type:String;
      
      private var rideList:FList;
      
      private var scroll:FVScorllBar;
      
      private var lookBtn:SecondButton;
      
      private var showBtn:SecondButton;
      
      private var saveBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function RideListPanel()
      {
         super();
         skin = "sceondPanel_btn";
         showCloseButton = true;
         width = 166;
         height = 188;
         titleText = LanResManager.getLanCommonTextWords("随身坐骑");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.rideList = new FList();
         this.rideList.skin = "list";
         this.rideList.itemRenderer = new RideListItemRender();
         this.rideList.listWidth = 134;
         this.rideList.listHeight = 122;
         addChild(this.rideList);
         this.rideList.x = 6;
         this.rideList.y = 0;
         this.scroll = new FVScorllBar(this.rideList,122);
         addChild(this.scroll);
         this.scroll.x = 140;
         this.scroll.y = 0;
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanCommonTextWords("查看");
         addChild(this.lookBtn);
         this.lookBtn.x = 6;
         this.lookBtn.y = 132;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.showBtn = new SecondButton();
         this.showBtn.label = LanResManager.getLanTextWords(this,"上架");
         addChild(this.showBtn);
         this.showBtn.x = (width - this.showBtn.width) / 2 + 9;
         this.showBtn.y = 132;
         this.showBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.saveBtn = new SecondButton();
         this.saveBtn.label = LanResManager.getLanTextWords(this,"存入");
         addChild(this.saveBtn);
         this.saveBtn.x = (width - this.saveBtn.width) / 2 + 9;
         this.saveBtn.y = 132;
         this.saveBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - 6 - this.cancelBtn.width;
         this.cancelBtn.y = 132;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lookBtn:
               this.$parent.dispatchEvent(new BaseEvent("UI_RIDELISTPANEL_LOOKBTN_CLICK","0",int(this.rideList.selectItem.label)));
               break;
            case this.showBtn:
               this.$parent.dispatchEvent(new BaseEvent("UI_RIDELISTPANEL_RIDE_SHOWBTN_CLICK","0",int(this.rideList.selectItem.label)));
               break;
            case this.saveBtn:
               this.$parent.dispatchEvent(new BaseEvent(RideDepotPanel.UI_RIDEDEPOT_SAVEBTN_CLICK,"",int(this.rideList.selectItem.label)));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         if(param1 == UI_RIDE_LIST_DEPOT)
         {
            this.showBtn.visible = false;
            this.saveBtn.visible = true;
         }
         if(param1 == UI_RIDE_LIST_SHOP)
         {
            this.showBtn.visible = true;
            this.saveBtn.visible = false;
         }
      }
      
      public function setRideList(param1:XML) : void
      {
         this.rideList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.rideList.setSelectItemByIndex(0);
            this.lookBtn.enabled = this.showBtn.enabled = this.saveBtn.enabled = true;
         }
         else
         {
            this.lookBtn.enabled = this.showBtn.enabled = this.saveBtn.enabled = false;
         }
         this.scroll.update();
      }
   }
}

