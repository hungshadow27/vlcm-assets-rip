package com.tgame.moudels.yn2014zhongqiu.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yn2014zhongqiu.YN2014Zhongqiu_ApplicationFacade;
   import com.tgame.moudels.yn2014zhongqiu.model.YN2014Zhongqiu_MsgSendProxy;
   import com.tgame.shell.view.components.YNZhongqiuLingjiangPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YN2014Zhongqiu_Mediator extends Mediator
   {
      
      public static const NAME:String = "YN2014Zhongqiu_Mediator";
      
      private var _senderProxy:YN2014Zhongqiu_MsgSendProxy;
      
      private var ty:int = -1;
      
      public function YN2014Zhongqiu_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YN2014Zhongqiu_ApplicationFacade.REQUEST_YUENAN2014ZHONGQIU_PANEL];
      }
      
      private function get senderProxy() : YN2014Zhongqiu_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YN2014Zhongqiu_MsgSendProxy.NAME) as YN2014Zhongqiu_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YN2014Zhongqiu_ApplicationFacade.REQUEST_YUENAN2014ZHONGQIU_PANEL:
               this.ty = int(_loc2_);
               this.senderProxy.send_74601();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNZhongqiuLingjiangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yn2014zhongqiuPanel);
         }
         return viewComponent as YNZhongqiuLingjiangPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNZhongqiuLingjiangPanel,function():void
         {
            panel.addEventListener(YNZhongqiuLingjiangPanel.UI_YN_ZHONGQIULINGJIANG_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNZhongqiuLingjiangPanel,function():void
         {
            panel.removeEventListener(YNZhongqiuLingjiangPanel.UI_YN_ZHONGQIULINGJIANG_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNZhongqiuLingjiangPanel.UI_YN_ZHONGQIULINGJIANG_CLICK:
               PipeManager.sendMsg(PipeConstants.SEND_53095,[13,param1.data]);
         }
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.yn2014zhongqiuPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_YUENAN2014ZHONGQIU_PANEL);
         }
         this.panel.setData(param1,param2,param3,param4);
         this.panel.setType(this.ty);
      }
   }
}

