package com.tgame.moudels.synthesize.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.synthesize.Synthesize_ApplicationFacde;
   import com.tgame.moudels.synthesize.model.Synthesize_MsgSendProxy;
   import com.tgame.shell.view.components.huodong.HuXinYaoTiShengPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class HuXinYaoTiShengMediator extends Mediator
   {
      
      public static const NAME:String = "HuXinYaoTiShengMediator";
      
      private var index:int = 0;
      
      private var _weapon:Goods;
      
      private var _sendMsg:Synthesize_MsgSendProxy;
      
      public function HuXinYaoTiShengMediator()
      {
         super(NAME);
      }
      
      protected function get panel() : HuXinYaoTiShengPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.huXinYaoTiShengPanel);
         }
         return viewComponent as HuXinYaoTiShengPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Synthesize_ApplicationFacde.GOODS_CHANGED,Synthesize_ApplicationFacde.HUXINYAO_TISHEGN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Synthesize_ApplicationFacde.GOODS_CHANGED:
               break;
            case Synthesize_ApplicationFacde.HUXINYAO_TISHEGN:
               this._weapon = _loc2_ as Goods;
               this.index = (_loc2_ as Goods).position;
               this.sendMsg.send_57351(this.index);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(HuXinYaoTiShengPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.addEventListener(HuXinYaoTiShengPanel.TISHENG_CLICK,hanndel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(HuXinYaoTiShengPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.removeEventListener(HuXinYaoTiShengPanel.TISHENG_CLICK,hanndel);
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
            case HuXinYaoTiShengPanel.TISHENG_CLICK:
               this.sendMsg.send_57353(this.index);
         }
      }
      
      public function setUpdataItem(param1:int, param2:int, param3:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.huXinYaoTiShengPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_TISHENGPINZHI_PANEL);
         }
         var _loc4_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1,true);
         var _loc5_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2,true);
         var _loc6_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         this.panel.setUpdataDate(_loc4_,_loc5_,_loc6_);
      }
      
      public function updataComplete(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            this.index = param2;
            if(Fun.isVisible(GameInstance.uiInstance.huXinYaoTiShengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TISHENGPINZHI_PANEL);
            }
         }
         else if(Fun.isVisible(GameInstance.uiInstance.huXinYaoTiShengPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_TISHENGPINZHI_PANEL);
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

