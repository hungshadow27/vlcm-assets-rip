package com.tgame.moudels.synthesize.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.synthesize.Synthesize_ApplicationFacde;
   import com.tgame.moudels.synthesize.model.Synthesize_MsgSendProxy;
   import com.tgame.shell.view.components.huodong.HuyiKaiguangPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class LongyinUpdateMediator extends Mediator
   {
      
      public static const NAME:String = "LongyinUpdateMediator";
      
      private var index:int = 0;
      
      private var _sendMsg:Synthesize_MsgSendProxy;
      
      public function LongyinUpdateMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get sendMsg() : Synthesize_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Synthesize_MsgSendProxy.NAME) as Synthesize_MsgSendProxy;
         }
         return this._sendMsg;
      }
      
      protected function get panel() : HuyiKaiguangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.huyiKaiguangPanel);
         }
         return viewComponent as HuyiKaiguangPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Synthesize_ApplicationFacde.LONGYINKAIGUANG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Synthesize_ApplicationFacde.LONGYINKAIGUANG:
               this.sendMsg.send_53545((_loc2_ as Goods).position);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(HuyiKaiguangPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.addEventListener(HuyiKaiguangPanel.UI_LONGYINKAIGUANG_OK_CLICK,hanndel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(HuyiKaiguangPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.removeEventListener(HuyiKaiguangPanel.UI_LONGYINKAIGUANG_OK_CLICK,hanndel);
         });
      }
      
      private function panelClose(param1:Event) : void
      {
         this.index = 0;
      }
      
      private function hanndel(param1:Event = null) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case HuyiKaiguangPanel.UI_LONGYINKAIGUANG_OK_CLICK:
               this.sendMsg.send_53547(this.index);
         }
      }
      
      public function setUpdateItem(param1:int, param2:Array, param3:int) : void
      {
         this.index = param3;
         if(param1 == 0)
         {
            if(Fun.isVisible(GameInstance.uiInstance._huyiKaiguangPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUYI_KAIGUANG_PANEL);
            }
            return;
         }
         if(!Fun.isVisible(GameInstance.uiInstance._huyiKaiguangPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_HUYI_KAIGUANG_PANEL);
         }
         var _loc4_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2[0].id,true);
         if(!_loc4_)
         {
            _loc4_ = param2[0];
         }
         var _loc5_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2[1].id,true);
         if(!_loc5_)
         {
            _loc5_ = param2[1];
         }
         this.panel.setLongyinInitialize(_loc4_,param2[0].count,_loc5_,param2[1].count);
      }
      
      public function huyiUpdataComplete(param1:int, param2:int) : void
      {
         if(param1 == 0)
         {
            this.index = param2;
         }
         else if(Fun.isVisible(GameInstance.uiInstance._huyiKaiguangPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_HUYI_KAIGUANG_PANEL);
         }
      }
   }
}

