package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.depot.RideDepotExpandPanel;
   import com.tgame.shell.view.components.depot.RideDepotListRender;
   import com.tgame.shell.view.components.depot.RideListPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class RideDepotPanel extends FPanel
   {
      
      public static const UI_RIDEDEPOT_DEPOTBTN_CLICK:String = "UI_RIDEDEPOT_DEPOTBTN_CLICK";
      
      public static const UI_RIDEDEPOT_LOOKBTN_CLICK:String = "UI_RIDELISTPANEL_LOOKBTN_CLICK";
      
      public static const UI_RIDEDEPOT_SAVEBTN_CLICK:String = "UI_RIDEDEPOT_SAVEBTN_CLICK";
      
      public static const UI_RIDEDEPOT_GETBTN_CLICK:String = "UI_RIDEDEPOT_GETBTN_CLICK";
      
      public static const UI_RIDEDEPOT_RIDELISTBTN_CLICK:String = "UI_RIDEDEPOT_RIDELISTBTN_CLICK";
      
      public static const UI_RIDEDEPOT_ADDSLOT_CLICK:String = "UI_RIDEDEPOT_ADDSLOT_CLICK";
      
      public static const UI_RIDEDEPOT_ADDSLOT:String = "UI_RIDE_SLOTS_EXPANED";
      
      private var count:FLabel;
      
      private var rideList:FList;
      
      private var depotBtn:SecondButton;
      
      private var lookBtn:SecondButton;
      
      private var getBtn:SecondButton;
      
      private var rideListBtn:SecondButton;
      
      private var rideListPanel:RideListPanel;
      
      public function RideDepotPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var lb:FLabel;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 256;
         height = 363;
         titleText = LanResManager.getLanCommonTextWords("坐骑仓库");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.char.ride.depot.ui";
         addChild(img);
         img.x = 10;
         img.y = 20;
         v = new Vector.<Bitmap>();
         v.push(img);
         DynamicManageImages = v;
         lb = new FLabel();
         with(lb)
         {
            x = 93;
            y = 2;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"坐骑数量");
         }
         addChild(lb);
         this.count = new FLabel();
         with(this.count)
         {
            x = 197;
            y = 2;
            textColor = StaticValue.WHITE;
            text = "1/5";
         }
         addChild(this.count);
         this.rideList = new FList();
         this.rideList.skin = "list";
         this.rideList.listWidth = 231;
         this.rideList.listHeight = 233;
         this.rideList.itemRenderer = new RideDepotListRender();
         addChild(this.rideList);
         this.rideList.x = 13;
         this.rideList.y = 23;
         this.rideList.addEventListener(MouseEvent.CLICK,this.onList);
         this.depotBtn = new SecondButton();
         this.depotBtn.label = LanResManager.getLanTextWords(this,"物品仓库");
         addChild(this.depotBtn);
         this.depotBtn.x = 15;
         this.depotBtn.y = 264;
         this.depotBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rideListBtn = new SecondButton();
         this.rideListBtn.label = LanResManager.getLanTextWords(this,"随身坐骑列表");
         addChild(this.rideListBtn);
         this.rideListBtn.x = width - this.rideListBtn.width - 15;
         this.rideListBtn.y = 264;
         this.rideListBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanCommonTextWords("查看");
         addChild(this.lookBtn);
         this.lookBtn.x = 35;
         this.lookBtn.y = 293;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.getBtn = new SecondButton();
         this.getBtn.label = LanResManager.getLanCommonTextWords("取出");
         addChild(this.getBtn);
         this.getBtn.x = width - this.getBtn.width - 35;
         this.getBtn.y = 293;
         this.getBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.depotBtn:
               dispatchEvent(new BaseEvent(UI_RIDEDEPOT_DEPOTBTN_CLICK));
               break;
            case this.rideListBtn:
               dispatchEvent(new BaseEvent(UI_RIDEDEPOT_RIDELISTBTN_CLICK));
               break;
            case this.lookBtn:
               dispatchEvent(new BaseEvent(UI_RIDEDEPOT_LOOKBTN_CLICK,"",int(this.rideList.selectItem.label)));
               break;
            case this.getBtn:
               dispatchEvent(new BaseEvent(UI_RIDEDEPOT_GETBTN_CLICK,"",int(this.rideList.selectItem.label)));
         }
      }
      
      private function onList(param1:MouseEvent) : void
      {
         if(this.rideList.selectItem.label == "0")
         {
            this.lookBtn.enabled = this.getBtn.enabled = false;
         }
         else if(this.rideList.selectItem.label == "-1")
         {
            this.lookBtn.enabled = this.getBtn.enabled = false;
            dispatchEvent(new BaseEvent(UI_RIDEDEPOT_ADDSLOT_CLICK));
         }
         else
         {
            this.lookBtn.enabled = this.getBtn.enabled = true;
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         this.hideRideListPanel();
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setRideList(param1:XML) : void
      {
         this.rideList.dataProvider = param1;
         this.rideList.setSelectItemByIndex(0);
         if(this.rideList.selectItem.label == "0" || this.rideList.selectItem.label == "-1")
         {
            this.lookBtn.enabled = this.getBtn.enabled = false;
         }
         else
         {
            this.lookBtn.enabled = this.getBtn.enabled = true;
         }
      }
      
      public function setCount(param1:int, param2:int) : void
      {
         this.count.text = param1 + "/" + param2;
      }
      
      public function showRideListPanel(param1:XML) : void
      {
         if(this.rideListPanel == null)
         {
            this.rideListPanel = new RideListPanel();
            this.rideListPanel.type = RideListPanel.UI_RIDE_LIST_DEPOT;
            this.rideListPanel.$parent = this;
         }
         this.rideListPanel.visible = true;
         addChild(this.rideListPanel);
         this.rideListPanel.x = -this.rideListPanel.width - 10;
         this.rideListPanel.y = 0;
         this.rideListPanel.setRideList(param1);
      }
      
      public function hideRideListPanel() : void
      {
         if(this.rideListPanel != null && this.rideListPanel.parent != null)
         {
            this.rideListPanel.parent.removeChild(this.rideListPanel);
         }
      }
      
      public function showAddSlot(param1:int, param2:Goods, param3:Boolean = true) : void
      {
         var _loc4_:RideDepotExpandPanel = new RideDepotExpandPanel();
         _loc4_.$parent = this;
         _loc4_.show(param1,param2,param3);
         POPWindowManager.showWindow(_loc4_);
      }
   }
}

