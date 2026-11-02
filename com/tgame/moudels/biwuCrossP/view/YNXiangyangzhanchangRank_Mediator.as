package com.tgame.moudels.biwuCrossP.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.biwuCrossP.BiwuCrossP_ApplicationFacade;
   import com.tgame.moudels.biwuCrossP.model.BiwuCrossP_MsgSenderProxy;
   import com.tgame.shell.view.components.BossRefurbish.YNXiangyangzhanchangRankPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNXiangyangzhanchangRank_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNXiangyangzhanchangRank_Mediator";
      
      private var _senderProxy:BiwuCrossP_MsgSenderProxy;
      
      public function YNXiangyangzhanchangRank_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : BiwuCrossP_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(BiwuCrossP_MsgSenderProxy.NAME) as BiwuCrossP_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get ynXiangyangRank() : YNXiangyangzhanchangRankPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynXiangyangRankPanel);
         }
         return viewComponent as YNXiangyangzhanchangRankPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [BiwuCrossP_ApplicationFacade.YN_REQUEST_XIANGYANGZHANCHANGRANK_DATA];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case BiwuCrossP_ApplicationFacade.YN_REQUEST_XIANGYANGZHANCHANGRANK_DATA:
               this.senderProxy.send_55581();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNXiangyangzhanchangRankPanel,function():void
         {
            ynXiangyangRank.addEventListener(YNXiangyangzhanchangRankPanel.UI_XIANGYANGZHANCHANG_RANK_LINGJIANG,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNXiangyangzhanchangRankPanel,function():void
         {
            ynXiangyangRank.removeEventListener(YNXiangyangzhanchangRankPanel.UI_XIANGYANGZHANCHANG_RANK_LINGJIANG,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case YNXiangyangzhanchangRankPanel.UI_XIANGYANGZHANCHANG_RANK_LINGJIANG:
               this.senderProxy.send_55583();
         }
      }
      
      public function setData(param1:Array, param2:int, param3:int, param4:int) : void
      {
         if(!Fun.isVisible(this.ynXiangyangRank))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.ynXiangyangRank);
            this.ynXiangyangRank.x = (GameConfig.sceneWidth - this.ynXiangyangRank.width) / 2;
            this.ynXiangyangRank.y = (GameConfig.sceneHeight - this.ynXiangyangRank.height) / 2;
         }
         this.ynXiangyangRank.setList(param1,param2,param3,param4);
      }
   }
}

