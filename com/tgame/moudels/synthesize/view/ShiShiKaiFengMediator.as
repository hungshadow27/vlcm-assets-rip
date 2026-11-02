package com.tgame.moudels.synthesize.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.synthesize.Synthesize_ApplicationFacde;
   import com.tgame.moudels.synthesize.model.Synthesize_MsgSendProxy;
   import com.tgame.shell.view.components.equippudding.EquipKaiFengPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShiShiKaiFengMediator extends Mediator
   {
      
      public static const NAME:String = "ShiShiKaiFengMediator";
      
      private var index:int = 0;
      
      private var _weapon:Goods;
      
      private var dianjiGo:Goods;
      
      private var _sendMsg:Synthesize_MsgSendProxy;
      
      public function ShiShiKaiFengMediator()
      {
         super(NAME);
      }
      
      protected function get panel() : EquipKaiFengPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shiShiKaiFengPanel);
         }
         return viewComponent as EquipKaiFengPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Synthesize_ApplicationFacde.GOODS_CHANGED,Synthesize_ApplicationFacde.SHISHIKAIFENG,Synthesize_ApplicationFacde.ZUOQI_DAZAO,Synthesize_ApplicationFacde.DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Object = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Synthesize_ApplicationFacde.GOODS_CHANGED:
               break;
            case Synthesize_ApplicationFacde.SHISHIKAIFENG:
               this._weapon = _loc2_ as Goods;
               this.index = (_loc2_ as Goods).position;
               this.sendMsg.send_53571(this.index);
               break;
            case Synthesize_ApplicationFacde.ZUOQI_DAZAO:
               this._weapon = _loc2_ as Goods;
               this.index = (_loc2_ as Goods).position;
               _loc3_ = new Object();
               _loc3_.type = 1;
               _loc3_.ar = [2,this.index,-1];
               PipeManager.sendMsg(PipeConstants.ZUOQI_ZHUANGBEI_DAZAO,_loc3_);
               break;
            case Synthesize_ApplicationFacde.DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN:
               this.setZQEquip(_loc2_.id,_loc2_.clid,_loc2_.count,_loc2_.text1,_loc2_.text2);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(EquipKaiFengPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.addEventListener(EquipKaiFengPanel.UI_SHISHIKAIFENG_CLICK,hanndel);
            panel.addEventListener(EquipKaiFengPanel.UI_ITEM_DRAG_ENTER,hanndel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(EquipKaiFengPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            panel.removeEventListener(EquipKaiFengPanel.UI_SHISHIKAIFENG_CLICK,hanndel);
            panel.addEventListener(EquipKaiFengPanel.UI_ITEM_DRAG_ENTER,hanndel);
         });
      }
      
      private function panelClose(param1:Event) : void
      {
         this.index = 0;
      }
      
      private function hanndel(param1:Event = null) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case EquipKaiFengPanel.UI_SHISHIKAIFENG_CLICK:
               if(_loc2_.data == 1)
               {
                  this.sendMsg.send_53573(this.index);
               }
               else if(this._weapon != null)
               {
                  _loc3_ = new Object();
                  _loc3_.type = 2;
                  _loc4_ = -1;
                  if(this.dianjiGo != null)
                  {
                     _loc4_ = this.dianjiGo.position;
                  }
                  _loc3_.ar = [2,this.index,1,_loc4_];
                  PipeManager.sendMsg(PipeConstants.ZUOQI_ZHUANGBEI_DAZAO,_loc3_);
                  this.closePanel();
               }
               break;
            case EquipKaiFengPanel.UI_ITEM_DRAG_ENTER:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  if(TCursorManager.currentItemFace.getBaseItem() != null)
                  {
                     _loc3_ = new Object();
                     _loc3_.type = 1;
                     this.dianjiGo = TCursorManager.currentItemFace.getBaseItem() as Goods;
                     _loc3_.ar = [2,this.index,this.dianjiGo.position];
                     PipeManager.sendMsg(PipeConstants.ZUOQI_ZHUANGBEI_DAZAO,_loc3_);
                  }
               }
         }
      }
      
      public function setUpdataItem(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.shiShiKaiFengPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_SHISHIKAIFENG_PANEL);
         }
         var _loc5_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1,true);
         this.panel.setGoods(this._weapon,_loc5_,param2,param3,param4);
      }
      
      public function setZQEquip(param1:int, param2:int, param3:int, param4:String, param5:String) : void
      {
         var _loc7_:Goods = null;
         if(!Fun.isVisible(GameInstance.uiInstance.shiShiKaiFengPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_SHISHIKAIFENG_PANEL);
         }
         var _loc6_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1,true);
         if(param2 != -1)
         {
            _loc7_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2,true);
         }
         else
         {
            _loc7_ = null;
         }
         this.panel.setGoods1(_loc6_,_loc7_,param3,param4,param5);
      }
      
      public function updataComplete(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            this.index = param2;
            if(Fun.isVisible(GameInstance.uiInstance.shiShiKaiFengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHISHIKAIFENG_PANEL);
            }
         }
         else if(Fun.isVisible(GameInstance.uiInstance.shiShiKaiFengPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_SHISHIKAIFENG_PANEL);
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
      
      public function closePanel() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._shiShiKaiFengPanel))
         {
            GameInstance.uiInstance._shiShiKaiFengPanel.parent.removeChild(GameInstance.uiInstance._shiShiKaiFengPanel);
         }
      }
   }
}

