package com.tgame.moudels.huyijuexing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.huyijuexing.HuYiJueXing_ApplicationFacade;
   import com.tgame.moudels.huyijuexing.model.HuYiJueXing_MsgSenderProxy;
   import com.tgame.shell.view.components.ShenbingJuexingXiangqianPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class HuYiJueXingXiangQian_Mediator extends Mediator
   {
      
      public static var shenbingType:int;
      
      public static const NAME:String = "HuYiJueXingXiangQian_Mediator";
      
      private var pageNow:int;
      
      private var pageMax:int;
      
      private var _senderProxy:HuYiJueXing_MsgSenderProxy;
      
      public function HuYiJueXingXiangQian_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : HuYiJueXing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(HuYiJueXing_MsgSenderProxy.NAME) as HuYiJueXing_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainHuyiJuexingXiangqianPlane() : ShenbingJuexingXiangqianPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shenbingJuexingXiangqianPanel);
         }
         return viewComponent as ShenbingJuexingXiangqianPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [HuYiJueXing_ApplicationFacade.SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         shenbingType = _loc2_ as int;
         switch(param1.getName())
         {
            case HuYiJueXing_ApplicationFacade.SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL:
               this.senderProxy.send_71407(shenbingType);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShenbingJuexingXiangqianPanel,function():void
         {
            mainHuyiJuexingXiangqianPlane.addEventListener(ShenbingJuexingXiangqianPanel.UI_PAGE_BTN_2_CLICK,handler);
            mainHuyiJuexingXiangqianPlane.addEventListener(ShenbingJuexingXiangqianPanel.UI_START_LAST_BTN_2_CLICK,handler);
            mainHuyiJuexingXiangqianPlane.addEventListener(ShenbingJuexingXiangqianPanel.UI_SHENBINGXIANGQIAN_DRAG,handler);
            mainHuyiJuexingXiangqianPlane.addEventListener(ShenbingJuexingXiangqianPanel.UI_SHENBINGXIANGQIAN_JIESHOU_DRAG,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShenbingJuexingXiangqianPanel,function():void
         {
            mainHuyiJuexingXiangqianPlane.removeEventListener(ShenbingJuexingXiangqianPanel.UI_PAGE_BTN_2_CLICK,handler);
            mainHuyiJuexingXiangqianPlane.removeEventListener(ShenbingJuexingXiangqianPanel.UI_START_LAST_BTN_2_CLICK,handler);
            mainHuyiJuexingXiangqianPlane.removeEventListener(ShenbingJuexingXiangqianPanel.UI_SHENBINGXIANGQIAN_DRAG,handler);
            mainHuyiJuexingXiangqianPlane.removeEventListener(ShenbingJuexingXiangqianPanel.UI_SHENBINGXIANGQIAN_JIESHOU_DRAG,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         var _loc4_:ItemFace = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case ShenbingJuexingXiangqianPanel.UI_PAGE_BTN_2_CLICK:
               _loc3_ = _loc2_.data as int;
               this.senderProxy.send_71409([shenbingType,this.pageNow,_loc3_]);
               break;
            case ShenbingJuexingXiangqianPanel.UI_START_LAST_BTN_2_CLICK:
               _loc3_ = _loc2_.data as int;
               if(_loc3_ == 1)
               {
                  this.senderProxy.send_71409([shenbingType,2,1]);
               }
               else
               {
                  this.senderProxy.send_71409([shenbingType,this.pageMax - 1,2]);
               }
               break;
            case ShenbingJuexingXiangqianPanel.UI_SHENBINGXIANGQIAN_DRAG:
               _loc4_ = _loc2_.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc4_;
                  TCursorManager.showItem(_loc4_.itemBD);
                  TCursorManager.source = 8;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case ShenbingJuexingXiangqianPanel.UI_SHENBINGXIANGQIAN_JIESHOU_DRAG:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  if(TCursorManager.source != 8)
                  {
                     return;
                  }
                  _loc5_ = _loc2_.data as Array;
                  _loc4_ = _loc5_[0].target as ItemFace;
                  _loc6_ = _loc5_[1] as int;
                  if(_loc4_ == null)
                  {
                     this.senderProxy.send_71411([shenbingType,this.pageNow,TCursorManager.currentItemFace.getBaseItem().id,0,_loc6_]);
                  }
                  else
                  {
                     this.senderProxy.send_71411([shenbingType,this.pageNow,TCursorManager.currentItemFace.getBaseItem().id,_loc4_.getBaseItem().id,_loc6_]);
                  }
               }
         }
      }
      
      public function setShenbingXiangqianInit(param1:Array, param2:Array, param3:int, param4:int, param5:int) : void
      {
         this.pageNow = param4;
         this.pageMax = param5;
         this.mainHuyiJuexingXiangqianPlane.setPageCount(param4,param5);
         this.mainHuyiJuexingXiangqianPlane.setFengKuang(param3);
         this.mainHuyiJuexingXiangqianPlane.setXunzhangKeXiangqian(param1);
         this.mainHuyiJuexingXiangqianPlane.setXunzhangXiangqian(param2);
      }
   }
}

