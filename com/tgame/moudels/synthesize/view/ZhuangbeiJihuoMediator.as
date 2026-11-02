package com.tgame.moudels.synthesize.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.synthesize.Synthesize_ApplicationFacde;
   import com.tgame.moudels.synthesize.model.Synthesize_MsgSendProxy;
   import com.tgame.shell.view.components.huodong.ZhuangbeiJihuoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhuangbeiJihuoMediator extends Mediator
   {
      
      public static const NAME:String = "ZhuangbeiJihuoMediator";
      
      private var index:int = 0;
      
      private var _sendMsg:Synthesize_MsgSendProxy;
      
      public function ZhuangbeiJihuoMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : ZhuangbeiJihuoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhuangbeiJihuoPanel);
         }
         return viewComponent as ZhuangbeiJihuoPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Synthesize_ApplicationFacde.GOODS_CHANGED,Synthesize_ApplicationFacde.JIHUO];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Synthesize_ApplicationFacde.GOODS_CHANGED:
               break;
            case Synthesize_ApplicationFacde.JIHUO:
               this.sendMsg.send_53549((_loc2_ as Goods).position);
         }
      }
      
      public function setUpdataItem(param1:int, param2:int, param3:Array, param4:int) : void
      {
         this.index = param4;
         if(param2 == 0)
         {
            if(Fun.isVisible(GameInstance.uiInstance._zhuangbeiJihuoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHUANGBEI_JIHUO_PANEL);
            }
            return;
         }
         if(!Fun.isVisible(GameInstance.uiInstance._zhuangbeiJihuoPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_ZHUANGBEI_JIHUO_PANEL);
         }
         var _loc5_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3[0].id,true);
         if(!_loc5_)
         {
            _loc5_ = param3[0];
         }
         if(param1 == SpecialGoodsID.ZHUANGBEI_JIHUO_ARRAY[0] || param1 == SpecialGoodsID.ZHUANGBEI_JIHUO_ARRAY[1])
         {
            this.panel.setInitialize(_loc5_,param3[0].count);
         }
      }
      
      public function huyiUpdataComplete(param1:int, param2:int) : void
      {
         if(param1 == 0)
         {
            this.index = param2;
         }
         else if(Fun.isVisible(GameInstance.uiInstance._zhuangbeiJihuoPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_ZHUANGBEI_JIHUO_PANEL);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhuangbeiJihuoPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.addEventListener(ZhuangbeiJihuoPanel.UI_ZHUANGBEI_JIHUO_OK_CLICK,hanndel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhuangbeiJihuoPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.removeEventListener(ZhuangbeiJihuoPanel.UI_ZHUANGBEI_JIHUO_OK_CLICK,hanndel);
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
            case ZhuangbeiJihuoPanel.UI_ZHUANGBEI_JIHUO_OK_CLICK:
               this.sendMsg.send_53551(this.index);
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

