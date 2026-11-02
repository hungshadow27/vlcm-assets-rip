package com.tgame.moudels.ynChongzhidafa.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynChongzhidafa.YNchongzhidafa_ApplicationFacade;
   import com.tgame.moudels.ynChongzhidafa.model.YNchongzhidafa_MsgSendProxy;
   import com.tgame.shell.view.components.ynSpecial.YNchongzhidafaPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNchongzhidafa_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNchongzhidafa_Mediator";
      
      private var _senderProxy:YNchongzhidafa_MsgSendProxy;
      
      private var ty:int = -1;
      
      public function YNchongzhidafa_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [undefined,YNchongzhidafa_ApplicationFacade.SHOW_YNCHONGZHIDAFAPANEL];
      }
      
      private function get senderProxy() : YNchongzhidafa_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNchongzhidafa_MsgSendProxy.NAME) as YNchongzhidafa_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YNchongzhidafa_ApplicationFacade.SHOW_YNCHONGZHIDAFAPANEL:
               this.senderProxy.send_80933();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNchongzhidafaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynChongzhidafaPanel);
         }
         return viewComponent as YNchongzhidafaPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNchongzhidafaPanel,function():void
         {
            panel.addEventListener(YNchongzhidafaPanel.UI_YN_CHONGZHIDAFA_LINGQU_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNchongzhidafaPanel,function():void
         {
            panel.removeEventListener(YNchongzhidafaPanel.UI_YN_CHONGZHIDAFA_LINGQU_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNchongzhidafaPanel.UI_YN_CHONGZHIDAFA_LINGQU_CLICK:
               this.senderProxy.send_80931(param1.data);
         }
      }
      
      public function setBtnEn(param1:Array) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         this.panel.setBtnEn(param1);
      }
   }
}

