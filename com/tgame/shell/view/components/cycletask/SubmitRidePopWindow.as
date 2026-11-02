package com.tgame.shell.view.components.cycletask
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class SubmitRidePopWindow extends FPanel
   {
      
      public static const UI_CYCLETASK_RIDE_SUBMIT:String = "UI_CYCLETASK_RIDE_SUBMIT";
      
      public static const UI_CYCLETASK_RIDE_INTO:String = "UI_CYCLETASK_RIDE_INTO";
      
      private var rideList:FList;
      
      private var scroll:FVScorllBar;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var id:int;
      
      private var infoBtn:SecondButton;
      
      public function SubmitRidePopWindow()
      {
         var img:Bitmap;
         var ft:FTextArea;
         super();
         skin = "sceondPanel";
         showCloseButton = true;
         width = 208;
         height = 185;
         titleText = LanResManager.getLanTextWords(this,"任务坐骑提交");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.cycletask.submit.ride.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 12;
            width = 183;
            height = 35;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            text = LanResManager.getLanTextWords(this,0);
         }
         addChild(ft);
         this.rideList = new FList();
         this.rideList.skin = "list";
         this.rideList.itemRenderer = new CycTaskRideListRender();
         this.rideList.listWidth = 173;
         this.rideList.listHeight = 72;
         addChild(this.rideList);
         this.rideList.x = 8;
         this.rideList.y = 43;
         this.scroll = new FVScorllBar(this.rideList,72);
         addChild(this.scroll);
         this.scroll.x = 182;
         this.scroll.y = 43;
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("提交");
         addChild(this.okBtn);
         this.okBtn.x = 28;
         this.okBtn.y = 127;
         this.okBtn.enabled = false;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.infoBtn = new SecondButton();
         this.infoBtn.label = LanResManager.getLanCommonTextWords("查看");
         addChild(this.infoBtn);
         this.infoBtn.x = (width - this.infoBtn.width) / 2;
         this.infoBtn.y = 127;
         this.infoBtn.enabled = false;
         this.infoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 28;
         this.cancelBtn.y = 127;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public static function showSubmitRIdePanel(param1:XML) : DisplayObject
      {
         var _loc2_:SubmitRidePopWindow = new SubmitRidePopWindow();
         _loc2_.setRide(param1);
         POPWindowManager.showWindow(_loc2_,false);
         return _loc2_;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_CYCLETASK_RIDE_SUBMIT,"",int(this.rideList.selectItem.label)));
               this.okBtn.enabled = false;
               POPWindowManager.closeWindow();
               break;
            case this.infoBtn:
               dispatchEvent(new BaseEvent(UI_CYCLETASK_RIDE_INTO,"",int(this.rideList.selectItem.label)));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.okBtn.enabled = false;
         dispatchEvent(new BaseEvent(UI_CYCLETASK_RIDE_SUBMIT,"",-1));
         POPWindowManager.closeWindow();
      }
      
      private function setRide(param1:XML) : void
      {
         this.rideList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.rideList.setSelectItemByIndex(0);
            this.okBtn.enabled = true;
            this.infoBtn.enabled = true;
         }
         this.scroll.update();
      }
   }
}

