package com.tgame.moudels.xiaozhukuaipao.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xiaozhukuaipao.XiaoZhuKuaiPao_ApplicationFacade;
   import com.tgame.moudels.xiaozhukuaipao.model.XiaoZhuKuaiPao_MsgSendProxy;
   import com.tgame.shell.view.components.attribute.XiaoZhuKuaiPaoPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiaoZhuKuaiPao_Mediator extends Mediator
   {
      
      public static const NAME:String = "XiaoZhuKuaiPao_Mediator";
      
      private var _senderProxy:XiaoZhuKuaiPao_MsgSendProxy;
      
      public function XiaoZhuKuaiPao_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : XiaoZhuKuaiPao_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiaoZhuKuaiPao_MsgSendProxy.NAME) as XiaoZhuKuaiPao_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XiaoZhuKuaiPao_ApplicationFacade.GET_XIAOZHUKUAIPAO_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XiaoZhuKuaiPao_ApplicationFacade.GET_XIAOZHUKUAIPAO_PANEL:
               this.senderProxy.send_79561();
         }
      }
      
      public function get panel() : XiaoZhuKuaiPaoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xiaozhukuaipaoPanel);
         }
         return viewComponent as XiaoZhuKuaiPaoPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XiaoZhuKuaiPaoPanel,function():void
         {
            panel.addEventListener(XiaoZhuKuaiPaoPanel.UI_XIAOZHUKUAIPAO_GETJIANGLI,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XiaoZhuKuaiPaoPanel,function():void
         {
            panel.removeEventListener(XiaoZhuKuaiPaoPanel.UI_XIAOZHUKUAIPAO_GETJIANGLI,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:Array = null;
         switch(param1.type)
         {
            case XiaoZhuKuaiPaoPanel.UI_XIAOZHUKUAIPAO_GETJIANGLI:
               _loc2_ = param1.data as Array;
               this.senderProxy.send_79563(_loc2_);
         }
      }
      
      public function update(param1:Array, param2:Array) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance.xiaozhukuaipaoPanel))
         {
            GameInstance.uiInstance.xiaozhukuaipaoPanel.upData(param1,param2);
         }
      }
      
      public function updateItem(param1:Array) : void
      {
      }
      
      public function updateiSousuo(param1:Array) : void
      {
      }
   }
}

