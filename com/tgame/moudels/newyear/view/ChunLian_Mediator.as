package com.tgame.moudels.newyear.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.newyear.model.NewYear_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.NewYearPanel;
   import com.tgame.shell.view.components.newyear.NewYear_TiJiaoDuiLianPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ChunLian_Mediator extends Mediator
   {
      
      public static const NAME:String = "ChunLian_Mediator";
      
      private var xlArr:Array = [];
      
      private var duiliantijiaoPanel:NewYear_TiJiaoDuiLianPanel;
      
      private var duilianArr:Array = [];
      
      private var _msgSenderProxy:NewYear_MsgSenderProxy;
      
      public function ChunLian_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : NewYear_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(NewYear_MsgSenderProxy.NAME) as NewYear_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get newyearPanel() : NewYearPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.newyearPanel);
         }
         return viewComponent as NewYearPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(NewYearPanel,function():void
         {
            newyearPanel.addEventListener(Event.ADDED_TO_STAGE,onHandler);
            newyearPanel.addEventListener(NewYearPanel.UI_LINGQUXUNZHANG_BTN,onHandler);
            newyearPanel.addEventListener(NewYearPanel.UI_TIJIAODUILIAN_BTN,onHandler);
            newyearPanel.addEventListener(NewYearPanel.UI_CHUNLIANPANEL_DRAG_ENTER,onHandler);
            newyearPanel.addEventListener(NewYearPanel.UI_CHUNLIANPANEL_TIJIAODUILIAN_CLICK,onHandler);
            newyearPanel.addEventListener(NewYearPanel.UI_CHUNLIANPANEL_TOKEN_CLICK,onHandler);
            newyearPanel.addEventListener(NewYearPanel.UI_CHUNLIANPANEL_TOKEN_PUT,onHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(NewYearPanel,function():void
         {
            newyearPanel.removeEventListener(Event.ADDED_TO_STAGE,onHandler);
            newyearPanel.removeEventListener(NewYearPanel.UI_LINGQUXUNZHANG_BTN,onHandler);
            newyearPanel.removeEventListener(NewYearPanel.UI_TIJIAODUILIAN_BTN,onHandler);
            newyearPanel.removeEventListener(NewYearPanel.UI_CHUNLIANPANEL_DRAG_ENTER,onHandler);
            newyearPanel.removeEventListener(NewYearPanel.UI_CHUNLIANPANEL_TIJIAODUILIAN_CLICK,onHandler);
            newyearPanel.removeEventListener(NewYearPanel.UI_CHUNLIANPANEL_TOKEN_CLICK,onHandler);
            newyearPanel.removeEventListener(NewYearPanel.UI_CHUNLIANPANEL_TOKEN_PUT,onHandler);
         });
      }
      
      public function onHandler(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:ItemFace = null;
         var _loc4_:int = 0;
         if(param1 is BaseEvent)
         {
            _loc2_ = (param1 as BaseEvent).data;
         }
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case NewYearPanel.UI_LINGQUXUNZHANG_BTN:
               if(GameInstance.mainCharData.goodsInfo.isBagFull())
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"包裹已满，无法领取！",false);
                  NoticeManager.notify(NoticeManager.FOOT,"包裹已满，无法领取！",false);
                  NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_BACKPACK_FULL);
                  return;
               }
               this.msgSenderProxy.send_72603();
               break;
            case NewYearPanel.UI_TIJIAODUILIAN_BTN:
            case NewYearPanel.UI_CHUNLIANPANEL_DRAG_ENTER:
               break;
            case NewYearPanel.UI_CHUNLIANPANEL_TIJIAODUILIAN_CLICK:
               this.msgSenderProxy.send_72605();
               break;
            case NewYearPanel.UI_CHUNLIANPANEL_TOKEN_CLICK:
               _loc3_ = _loc2_ as ItemFace;
               _loc4_ = this.duilianArr.indexOf(_loc3_.getItem());
               if(_loc4_ != -1)
               {
                  this.duilianArr.splice(_loc4_,1);
               }
               if(this.duiliantijiaoPanel != null)
               {
                  this.duiliantijiaoPanel.setItem(this.duilianArr);
               }
               break;
            case NewYearPanel.UI_CHUNLIANPANEL_TOKEN_PUT:
               this.changeMouseStatus();
         }
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.chickItemToPanelFun = function(param1:ItemFace):void
         {
            var _loc2_:Goods = null;
            var _loc3_:int = 0;
            if(duilianArr.length < 7)
            {
               _loc2_ = param1.getItem() as Goods;
               _loc3_ = duilianArr.indexOf(_loc2_);
               if(_loc3_ == -1)
               {
                  duilianArr.push(_loc2_);
               }
               if(duiliantijiaoPanel != null)
               {
                  duiliantijiaoPanel.setItem(duilianArr);
               }
            }
            else
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"最多可放入7个文字",false);
               NoticeManager.notify(NoticeManager.FOOT,"最多可放入7个文字",false);
            }
         };
         TCursorManager.showCursor(TCursorManager.CURSOR_XUANZELINGPAI,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
         PipeManager.sendMsg(PipeConstants.USE_BAG,0);
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
            PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         }
      }
      
      public function setChunlianPanel(param1:int, param2:Array, param3:Boolean, param4:Boolean) : void
      {
         if(param1 == 2)
         {
            if(!Fun.isVisible(GameInstance.uiInstance.newyearPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NEWYEAR_PANEL);
            }
            this.newyearPanel.setMC();
         }
         this.newyearPanel.setInit(param2,param3,param4);
         this.xlArr = String(param2[6]).split(",");
         if(int(param2[7]) == 1000 && !param4)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"春节红包已经达到1000元，可以领取本活动勋章！",false);
            NoticeManager.notify(NoticeManager.FOOT,"春节红包已经达到1000元，可以领取本活动勋章！",false);
         }
      }
      
      public function closeTijiaoPanel(param1:int) : void
      {
         if(param1 == 1)
         {
            this.newyearPanel.closeTijiaoPanel();
            this.newyearPanel.setXL(this.xlArr);
         }
         else
         {
            this.duilianArr = [];
            this.newyearPanel.setTijiaoNull();
            this.resumMouseStatus();
         }
      }
   }
}

