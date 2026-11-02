package com.tgame.moudels.ynZhimengshangcheng.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynZhimengshangcheng.YNzhimengshangcheng_ApplicationFacade;
   import com.tgame.moudels.ynZhimengshangcheng.model.YNzhimengshangcheng_MsgSendProxy;
   import com.tgame.shell.view.components.ynSpecial.YNwangzhezhibangPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNwangzhezhibang_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNwangzhezhibang_Mediator";
      
      private var _senderProxy:YNzhimengshangcheng_MsgSendProxy;
      
      public function YNwangzhezhibang_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNzhimengshangcheng_ApplicationFacade.SHOW_YNWANGZHEZHIBANGHUODONGPANEL];
      }
      
      private function get senderProxy() : YNzhimengshangcheng_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNzhimengshangcheng_MsgSendProxy.NAME) as YNzhimengshangcheng_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YNzhimengshangcheng_ApplicationFacade.SHOW_YNWANGZHEZHIBANGHUODONGPANEL:
               this.senderProxy.send_81135();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNwangzhezhibangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynWzzbPanel);
         }
         return viewComponent as YNwangzhezhibangPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNwangzhezhibangPanel,function():void
         {
            panel.addEventListener(YNwangzhezhibangPanel.YN_WZZB_LINGQUZHUANGBEI_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNwangzhezhibangPanel,function():void
         {
            panel.removeEventListener(YNwangzhezhibangPanel.YN_WZZB_LINGQUZHUANGBEI_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNwangzhezhibangPanel.YN_WZZB_LINGQUZHUANGBEI_CLICK:
               this.senderProxy.send_81137();
         }
      }
      
      public function setData(param1:Array, param2:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         this.panel.setData(param1,param2);
      }
   }
}

