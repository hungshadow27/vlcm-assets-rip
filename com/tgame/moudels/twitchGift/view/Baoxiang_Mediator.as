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
   
   public class Baoxiang_Mediator extends Mediator
   {
      
      public static const NAME:String = "Baoxiang_Mediator";
      
      private var Gid:int;
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function Baoxiang_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : LiandanluPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.cailiaoBaoxiangPanel);
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
            panel.addEventListener(LiandanluPanel.BAOXIANG_QUEREN_CLICK,baoxiangHandle);
            panel.addEventListener(LiandanluPanel.BAOXIANG_QIANGHUA_CLICK,baoxiangHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(LiandanluPanel,function():void
         {
            panel.removeEventListener(LiandanluPanel.BAOXIANG_QUEREN_CLICK,baoxiangHandle);
            panel.removeEventListener(LiandanluPanel.BAOXIANG_QIANGHUA_CLICK,baoxiangHandle);
         });
      }
      
      private function baoxiangHandle(param1:Event) : void
      {
         switch(param1.type)
         {
            case LiandanluPanel.BAOXIANG_QUEREN_CLICK:
               this.msgSenderProxy.send_55023([0,this.Gid]);
               this.panel.onClose();
               break;
            case LiandanluPanel.BAOXIANG_QIANGHUA_CLICK:
               this.msgSenderProxy.send_55023([1,this.Gid]);
         }
      }
      
      public function setData(param1:int, param2:int, param3:int) : void
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
         this.Gid = param1;
         this.panel.setBaoxiangChushihua();
         this.panel.setGoods(new Goods(param1));
         this.panel.setNum(param2);
         this.panel.setQianghua(param3);
      }
   }
}

