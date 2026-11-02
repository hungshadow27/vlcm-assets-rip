package com.tgame.moudels.ynLianhuanchongzhi.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynLianhuanchongzhi.YNlianhuanchongzhi_ApplicationFacade;
   import com.tgame.moudels.ynLianhuanchongzhi.model.YNlianhuanchongzhi_MsgSendProxy;
   import com.tgame.shell.view.components.YNlianhuanchongzhiPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNlianhuanchongzhi_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNlianhuanchongzhi_Mediator";
      
      private var _senderProxy:YNlianhuanchongzhi_MsgSendProxy;
      
      public function YNlianhuanchongzhi_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNlianhuanchongzhi_ApplicationFacade.YN_REQUEST_LIANHUANCHONGZHI_PANEL,YNlianhuanchongzhi_ApplicationFacade.YN_REQUEST_SHOUCICHONGZHI_PANEL,YNlianhuanchongzhi_ApplicationFacade.YN_REQUEST_SHOUCICHONGZHI2_PANEL];
      }
      
      private function get senderProxy() : YNlianhuanchongzhi_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNlianhuanchongzhi_MsgSendProxy.NAME) as YNlianhuanchongzhi_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case YNlianhuanchongzhi_ApplicationFacade.YN_REQUEST_LIANHUANCHONGZHI_PANEL:
               this.senderProxy.send_79651();
               break;
            case YNlianhuanchongzhi_ApplicationFacade.YN_REQUEST_SHOUCICHONGZHI_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynshoucichongzhi2Panel))
               {
                  GameInstance.uiInstance.ynshoucichongzhi2Panel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynshoucichongzhi2Panel.width / 2;
                  GameInstance.uiInstance.ynshoucichongzhi2Panel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynshoucichongzhi2Panel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynshoucichongzhi2Panel);
               }
               _loc3_ = _loc2_ as Object;
               GameInstance.uiInstance.ynshoucichongzhi2Panel.setData(_loc3_);
               break;
            case YNlianhuanchongzhi_ApplicationFacade.YN_REQUEST_SHOUCICHONGZHI2_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynshoucichongzhi3Panel))
               {
                  GameInstance.uiInstance.ynshoucichongzhi3Panel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynshoucichongzhi3Panel.width / 2;
                  GameInstance.uiInstance.ynshoucichongzhi3Panel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynshoucichongzhi3Panel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynshoucichongzhi3Panel);
               }
               _loc3_ = _loc2_ as Object;
               GameInstance.uiInstance.ynshoucichongzhi3Panel.setData(_loc3_);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNlianhuanchongzhiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynlianhuanchongzhiPanel);
         }
         return viewComponent as YNlianhuanchongzhiPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNlianhuanchongzhiPanel,function():void
         {
            panel.addEventListener(YNlianhuanchongzhiPanel.YN_LIANHUANCHONGZHI_LINGQU_DAY,onHandle);
            panel.addEventListener(YNlianhuanchongzhiPanel.YN_LIANHUANCHONGZHI_LINGQU_ZHONGJI,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNlianhuanchongzhiPanel,function():void
         {
            panel.removeEventListener(YNlianhuanchongzhiPanel.YN_LIANHUANCHONGZHI_LINGQU_DAY,onHandle);
            panel.removeEventListener(YNlianhuanchongzhiPanel.YN_LIANHUANCHONGZHI_LINGQU_ZHONGJI,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNlianhuanchongzhiPanel.YN_LIANHUANCHONGZHI_LINGQU_DAY:
               this.senderProxy.send_79653(param1.data);
               break;
            case YNlianhuanchongzhiPanel.YN_LIANHUANCHONGZHI_LINGQU_ZHONGJI:
               this.senderProxy.send_79655();
         }
      }
      
      public function setData(param1:String, param2:int, param3:int, param4:Array, param5:Array, param6:int, param7:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynlianhuanchongzhiPanel))
         {
            GameInstance.uiInstance.ynlianhuanchongzhiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynlianhuanchongzhiPanel.width / 2;
            GameInstance.uiInstance.ynlianhuanchongzhiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynlianhuanchongzhiPanel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynlianhuanchongzhiPanel);
         }
         GameInstance.uiInstance.ynlianhuanchongzhiPanel.setData(param1,param2,param3,param4,param5,param6,param7);
      }
   }
}

