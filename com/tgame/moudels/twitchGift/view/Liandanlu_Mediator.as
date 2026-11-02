package com.tgame.moudels.twitchGift.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.huodong.LiandanluPanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Liandanlu_Mediator extends Mediator
   {
      
      public static const NAME:String = "Liandanlu_Mediator";
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function Liandanlu_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : LiandanluPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.liandanluPanel);
         }
         return viewComponent as LiandanluPanel;
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
         UIEventsRegisterManager.addUIRegisterEvent(LiandanluPanel,function():void
         {
            panel.addEventListener(LiandanluPanel.LIANDANLU_QUEREN_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(LiandanluPanel.LIANDANLU_SHUAXIN_CLICK,qianChuiBaiLianHandle);
            panel.addEventListener(LiandanluPanel.LIANDANLU_ZHENHUO_SHUAXIN_CLICK,qianChuiBaiLianHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(LiandanluPanel,function():void
         {
            panel.removeEventListener(LiandanluPanel.LIANDANLU_QUEREN_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(LiandanluPanel.LIANDANLU_SHUAXIN_CLICK,qianChuiBaiLianHandle);
            panel.removeEventListener(LiandanluPanel.LIANDANLU_ZHENHUO_SHUAXIN_CLICK,qianChuiBaiLianHandle);
         });
      }
      
      private function qianChuiBaiLianHandle(param1:Event) : void
      {
         switch(param1.type)
         {
            case LiandanluPanel.LIANDANLU_QUEREN_CLICK:
               this.msgSenderProxy.send_55003(0);
               this.panel.onClose();
               break;
            case LiandanluPanel.LIANDANLU_SHUAXIN_CLICK:
               this.msgSenderProxy.send_55003(1);
               break;
            case LiandanluPanel.LIANDANLU_ZHENHUO_SHUAXIN_CLICK:
               this.msgSenderProxy.send_55003(2);
         }
      }
      
      public function setData(param1:int, param2:int) : void
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
         this.panel.setChushihua();
         this.panel.setGoods(new Goods(param1));
         this.panel.setNum(param2);
      }
   }
}

