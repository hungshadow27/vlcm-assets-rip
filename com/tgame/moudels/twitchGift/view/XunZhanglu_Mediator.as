package com.tgame.moudels.twitchGift.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.huodong.XunZhangluPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XunZhanglu_Mediator extends Mediator
   {
      
      public static const NAME:String = "XunZhanglu_Mediator";
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function XunZhanglu_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : XunZhangluPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xunzhangluPanel);
         }
         return viewComponent as XunZhangluPanel;
      }
      
      private function get msgSenderProxy() : TwitchGift_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(TwitchGift_MsgSendProxy.NAME) as TwitchGift_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XunZhangluPanel,function():void
         {
            panel.addEventListener(XunZhangluPanel.OK_BTN_CLICK,_handler);
            panel.addEventListener(XunZhangluPanel.UDPATE_BTN_CLICK,_handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XunZhangluPanel,function():void
         {
            panel.removeEventListener(XunZhangluPanel.OK_BTN_CLICK,_handler);
            panel.removeEventListener(XunZhangluPanel.UDPATE_BTN_CLICK,_handler);
         });
      }
      
      private function _handler(param1:BaseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case XunZhangluPanel.OK_BTN_CLICK:
               _loc2_ = int(param1.data);
               this.msgSenderProxy.send_55015([0,_loc2_]);
               this.panel.onClose();
               break;
            case XunZhangluPanel.UDPATE_BTN_CLICK:
               this.msgSenderProxy.send_55015([1]);
         }
      }
      
      public function showPanel(param1:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
            this.panel.visible = true;
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
            TSoundManager.addPanelCloseSound(this.panel);
         }
         this.panel.setGoods(new Goods(param1));
      }
   }
}

