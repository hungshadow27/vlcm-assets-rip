package com.tgame.moudels.rank.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.rank.Rank_ApplicationFacade;
   import com.tgame.moudels.rank.model.Rank_MsgSendProxy;
   import com.tgame.shell.view.components.RankingYNPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Rank_YNMediator extends Mediator
   {
      
      public static const NAME:String = "Rank_YNMediator";
      
      private var ar:Array = [];
      
      private var _senderProxy:Rank_MsgSendProxy;
      
      public function Rank_YNMediator()
      {
         super(NAME);
      }
      
      protected function get panel() : RankingYNPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.rankYNPanel);
         }
         return viewComponent as RankingYNPanel;
      }
      
      private function get senderProxy() : Rank_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Rank_MsgSendProxy.NAME) as Rank_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Rank_ApplicationFacade.REQUEST_YUENANRANKING_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Rank_ApplicationFacade.REQUEST_YUENANRANKING_PANEL:
               this.senderProxy.send_72981([1,1]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(RankingYNPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,handler);
            panel.addEventListener(RankingYNPanel.REQUEST_YN_XINFURANKING,handler);
            panel.addEventListener(RankingYNPanel.REQUEST_YN_RANKING_JIANGLI,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RankingYNPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            panel.removeEventListener(RankingYNPanel.REQUEST_YN_XINFURANKING,handler);
            panel.removeEventListener(RankingYNPanel.REQUEST_YN_RANKING_JIANGLI,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case RankingYNPanel.REQUEST_YN_XINFURANKING:
               _loc3_ = _loc2_.data as Array;
               this.ar = _loc3_;
               this.senderProxy.send_72981(_loc3_);
               break;
            case RankingYNPanel.REQUEST_YN_RANKING_JIANGLI:
               _loc4_ = int(_loc2_.data);
               this.senderProxy.send_72983(_loc4_);
         }
      }
      
      public function setListData(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int, param7:Array) : void
      {
         var _loc8_:XML = <list/>;
         var _loc9_:Object = new Object();
         for each(_loc9_ in param7)
         {
            _loc8_.appendChild(<node index={_loc9_.no} id={_loc9_.id} name={_loc9_.name} val={_loc9_.data}/>);
         }
         this.panel.setListData(param1,param2,param3,param4,param5,param6,_loc8_);
      }
      
      public function requestPanel() : void
      {
         this.senderProxy.send_72981(this.ar);
      }
   }
}

