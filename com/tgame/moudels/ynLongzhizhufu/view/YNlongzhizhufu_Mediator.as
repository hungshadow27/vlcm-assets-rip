package com.tgame.moudels.ynLongzhizhufu.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynLongzhizhufu.YNlongzhizhufu_ApplicationFacade;
   import com.tgame.moudels.ynLongzhizhufu.model.YNlongzhizhufu_MsgSendProxy;
   import com.tgame.shell.view.components.YNLongzhizhufuPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNlongzhizhufu_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNlongzhizhufu_Mediator";
      
      private var _senderProxy:YNlongzhizhufu_MsgSendProxy;
      
      public function YNlongzhizhufu_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNlongzhizhufu_ApplicationFacade.YN_REQUEST_LONGZHIZHUFU_PANEL];
      }
      
      private function get senderProxy() : YNlongzhizhufu_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNlongzhizhufu_MsgSendProxy.NAME) as YNlongzhizhufu_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YNlongzhizhufu_ApplicationFacade.YN_REQUEST_LONGZHIZHUFU_PANEL:
               this.senderProxy.send_74881();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNLongzhizhufuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynlongzhizhufuPanel);
         }
         return viewComponent as YNLongzhizhufuPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNLongzhizhufuPanel,function():void
         {
            panel.addEventListener(YNLongzhizhufuPanel.UI_YN_LONGZHIZHUFU_BUY,onHandle);
            panel.addEventListener(YNLongzhizhufuPanel.UI_YN_LONGZHIZHUFU_LINGQU,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNLongzhizhufuPanel,function():void
         {
            panel.removeEventListener(YNLongzhizhufuPanel.UI_YN_LONGZHIZHUFU_BUY,onHandle);
            panel.removeEventListener(YNLongzhizhufuPanel.UI_YN_LONGZHIZHUFU_LINGQU,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:uint = 0;
         switch(param1.type)
         {
            case YNLongzhizhufuPanel.UI_YN_LONGZHIZHUFU_BUY:
               _loc2_ = uint(param1.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_,0]);
               break;
            case YNLongzhizhufuPanel.UI_YN_LONGZHIZHUFU_LINGQU:
               this.senderProxy.send_74883(param1.data);
         }
      }
      
      public function setData(param1:Array, param2:Array, param3:int, param4:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
            this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         this.panel.setData(param1,param2,param3,param4);
      }
   }
}

