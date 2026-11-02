package com.tgame.moudels.xiaoyaoyufeng.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xiaoyaoyufeng.XiaoYaoYuFeng_ApplicationFacade;
   import com.tgame.moudels.xiaoyaoyufeng.model.XiaoYaoYuFeng_MsgSenderProxy;
   import com.tgame.shell.view.components.XiaoYaoYuFengSheZhiFPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiaoYaoYuFengJiNengSheZhi_Mediator extends Mediator
   {
      
      public static const NAME:String = "XiaoYaoYuFengJiNengSheZhi_Mediator";
      
      private var page:int;
      
      private var _senderProxy:XiaoYaoYuFeng_MsgSenderProxy;
      
      public function XiaoYaoYuFengJiNengSheZhi_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : XiaoYaoYuFeng_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiaoYaoYuFeng_MsgSenderProxy.NAME) as XiaoYaoYuFeng_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainXiaoYaoYuFengSheZhiPlane() : XiaoYaoYuFengSheZhiFPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xiaoYaoYuFengJiNengSheZhiPanel);
         }
         return viewComponent as XiaoYaoYuFengSheZhiFPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XiaoYaoYuFeng_ApplicationFacade.SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XiaoYaoYuFeng_ApplicationFacade.SHOW_XIAOYAOYUFENGJINENGSHEZHI_PANEL:
               this.senderProxy.send_70007();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XiaoYaoYuFengSheZhiFPanel,function():void
         {
            mainXiaoYaoYuFengSheZhiPlane.addEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_PREVIOUS_CLICK,handler);
            mainXiaoYaoYuFengSheZhiPlane.addEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_NEXT_CLICK,handler);
            mainXiaoYaoYuFengSheZhiPlane.addEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_OK_CLICK,handler);
            mainXiaoYaoYuFengSheZhiPlane.addEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_ZISHENSKILL_DRAG,handler);
            mainXiaoYaoYuFengSheZhiPlane.addEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGDOWN,handler);
            mainXiaoYaoYuFengSheZhiPlane.addEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGUP,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XiaoYaoYuFengSheZhiFPanel,function():void
         {
            mainXiaoYaoYuFengSheZhiPlane.removeEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_PREVIOUS_CLICK,handler);
            mainXiaoYaoYuFengSheZhiPlane.removeEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_NEXT_CLICK,handler);
            mainXiaoYaoYuFengSheZhiPlane.removeEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_OK_CLICK,handler);
            mainXiaoYaoYuFengSheZhiPlane.removeEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_ZISHENSKILL_DRAG,handler);
            mainXiaoYaoYuFengSheZhiPlane.removeEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGDOWN,handler);
            mainXiaoYaoYuFengSheZhiPlane.removeEventListener(XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGUP,handler);
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
            case XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_PREVIOUS_CLICK:
               this.senderProxy.send_70009([this.page,1]);
               break;
            case XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_NEXT_CLICK:
               this.senderProxy.send_70009([this.page,2]);
               break;
            case XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_OK_CLICK:
               _loc3_ = _loc2_.data as int;
               this.senderProxy.send_70015(_loc3_);
               break;
            case XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_ZISHENSKILL_DRAG:
               _loc4_ = _loc2_.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc4_;
                  TCursorManager.showItem(_loc4_.itemBD);
                  TCursorManager.source = 5;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGDOWN:
               _loc4_ = _loc2_.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc4_;
                  TCursorManager.showItem(_loc4_.itemBD);
                  TCursorManager.source = 4;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case XiaoYaoYuFengSheZhiFPanel.UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGUP:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  _loc5_ = _loc2_.data as Array;
                  _loc4_ = _loc5_[0].target as ItemFace;
                  _loc6_ = _loc5_[1] as int;
                  if(_loc4_ == null)
                  {
                     this.senderProxy.send_70011([TCursorManager.currentItemFace.getBaseItem().id,TCursorManager.currentItemFace.getBaseItem().position,0,_loc6_]);
                  }
                  else
                  {
                     this.senderProxy.send_70011([TCursorManager.currentItemFace.getBaseItem().id,TCursorManager.currentItemFace.getBaseItem().position,_loc4_.getBaseItem().id,_loc6_]);
                  }
               }
         }
      }
      
      public function setZishenSkill(param1:Array, param2:int, param3:int) : void
      {
         this.page = param2;
         this.mainXiaoYaoYuFengSheZhiPlane.setInitialize(param1,param2,param3);
      }
      
      public function setShiyongSkill(param1:Array) : void
      {
         this.mainXiaoYaoYuFengSheZhiPlane.setShiYongSkill(param1);
      }
   }
}

