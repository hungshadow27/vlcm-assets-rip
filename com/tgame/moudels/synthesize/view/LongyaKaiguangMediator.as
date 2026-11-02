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
   
   public class LongyaKaiguangMediator extends Mediator
   {
      
      public static const NAME:String = "LongyaKaiguangMediator";
      
      private var index:int = 0;
      
      private var _weapon:Goods;
      
      private var _sendMsg:Synthesize_MsgSendProxy;
      
      public function LongyaKaiguangMediator()
      {
         super(NAME);
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
         return [Synthesize_ApplicationFacde.GOODS_CHANGED,Synthesize_ApplicationFacde.LONGYA_KAIGUANG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Synthesize_ApplicationFacde.GOODS_CHANGED:
               break;
            case Synthesize_ApplicationFacde.LONGYA_KAIGUANG:
               this._weapon = _loc2_ as Goods;
               this.sendMsg.send_53553((_loc2_ as Goods).position);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(HuyiKaiguangPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.addEventListener(HuyiKaiguangPanel.UI_LONGYA_OK_CLICK,hanndel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(HuyiKaiguangPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.removeEventListener(HuyiKaiguangPanel.UI_LONGYA_OK_CLICK,hanndel);
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
            case HuyiKaiguangPanel.UI_LONGYA_OK_CLICK:
               this.sendMsg.send_53555(this.index);
         }
      }
      
      public function setUpdataItem(param1:int, param2:Array, param3:int, param4:Object) : void
      {
         var _loc9_:Goods = null;
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
         var _loc5_:Array = new Array();
         var _loc6_:int = int(param2.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc9_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2[_loc7_].id,true);
            if(!_loc9_)
            {
               _loc9_ = param2[_loc7_];
            }
            _loc5_.push({
               "good":_loc9_,
               "count":param2[_loc7_].count
            });
            _loc7_++;
         }
         var _loc8_:String = "";
         if(this._weapon != null)
         {
            _loc8_ = this._weapon.res.name;
         }
         this.panel.setLongyaInitialize(_loc5_,param4,_loc8_);
      }
      
      public function longyaUpdataComplete(param1:int, param2:int) : void
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
      
      private function get sendMsg() : Synthesize_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Synthesize_MsgSendProxy.NAME) as Synthesize_MsgSendProxy;
         }
         return this._sendMsg;
      }
   }
}

