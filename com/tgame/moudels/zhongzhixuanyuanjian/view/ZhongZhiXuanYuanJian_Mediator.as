package com.tgame.moudels.zhongzhixuanyuanjian.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhongzhixuanyuanjian.ZhongZhiXuanYuanJian_ApplicationFacade;
   import com.tgame.moudels.zhongzhixuanyuanjian.model.ZhongZhiXuanYuanJian_MsgSendProxy;
   import com.tgame.shell.view.components.ZhongZhiXuanYuanJianPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhongZhiXuanYuanJian_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZhongZhiXuanYuanJian_Mediator";
      
      private var _senderProxy:ZhongZhiXuanYuanJian_MsgSendProxy;
      
      public function ZhongZhiXuanYuanJian_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      private function get senderProxy() : ZhongZhiXuanYuanJian_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ZhongZhiXuanYuanJian_MsgSendProxy.NAME) as ZhongZhiXuanYuanJian_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZhongZhiXuanYuanJian_ApplicationFacade.GET_ZHONGZHIXUANYUANJIAN_PANEL:
               this.senderProxy.send_73781();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : ZhongZhiXuanYuanJianPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhongzhixuanyuanjianPanel);
         }
         return viewComponent as ZhongZhiXuanYuanJianPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhongZhiXuanYuanJianPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(ZhongZhiXuanYuanJianPanel.UI_ZHONGZHIJIAN_QUEREN,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhongZhiXuanYuanJianPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(ZhongZhiXuanYuanJianPanel.UI_ZHONGZHIJIAN_QUEREN,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case ZhongZhiXuanYuanJianPanel.UI_ZHONGZHIJIAN_QUEREN:
               _loc3_ = _loc2_.data as int;
               this.senderProxy.send_73781(_loc3_);
         }
      }
   }
}

