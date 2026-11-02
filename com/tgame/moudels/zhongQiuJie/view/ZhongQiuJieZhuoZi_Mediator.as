package com.tgame.moudels.zhongQiuJie.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhongQiuJie.ZhongQiuJie_ApplicationFacade;
   import com.tgame.moudels.zhongQiuJie.model.ZhongQiuJie_MsgSendProxy;
   import com.tgame.shell.view.components.zhongQiuJie.ZhongQiuJieDaskPanel;
   import com.tgame.shell.view.components.zhongQiuJie.ZhongQiuJiePanel;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhongQiuJieZhuoZi_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZhongQiuJieZhuoZi_Mediator";
      
      public var monsterId:int;
      
      private var _senderProxy:ZhongQiuJie_MsgSendProxy;
      
      public function ZhongQiuJieZhuoZi_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZhongQiuJie_ApplicationFacade.CLICK_ZHONGQIUJIE_ZHUOZI];
      }
      
      private function get senderProxy() : ZhongQiuJie_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ZhongQiuJie_MsgSendProxy.NAME) as ZhongQiuJie_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:SceneCharacter = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZhongQiuJie_ApplicationFacade.CLICK_ZHONGQIUJIE_ZHUOZI:
               _loc3_ = param1.getBody() as SceneCharacter;
               this.senderProxy.send_77501(_loc3_.id);
               this.monsterId = _loc3_.id;
               this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
               this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
               GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : ZhongQiuJieDaskPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhongQiuJieDaskPanel);
         }
         return viewComponent as ZhongQiuJieDaskPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhongQiuJieDaskPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(ZhongQiuJieDaskPanel.UI_ZHONGQIUJIE_DASK_USE,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhongQiuJiePanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(ZhongQiuJieDaskPanel.UI_ZHONGQIUJIE_DASK_USE,onHandle);
         });
      }
      
      public function setPanel(param1:int, param2:String, param3:int, param4:Boolean) : void
      {
         this.monsterId = param1;
         this.panel.setPanelData(param3,20,param2,param4);
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case ZhongQiuJieDaskPanel.UI_ZHONGQIUJIE_DASK_USE:
               this.senderProxy.send_77503(this.monsterId);
         }
      }
   }
}

