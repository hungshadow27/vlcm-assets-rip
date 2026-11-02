package com.tgame.moudels.amulet.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.amulet.model.Amult_MsgSenderProxy;
   import com.tgame.shell.view.components.huodong.DaoJuTiQuKaPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DaoJuTiQuKa_Mediator extends Mediator
   {
      
      public static const NAME:String = "DaoJuTiQuKa_Mediator";
      
      private var sheLiZi:Goods;
      
      private var index:int;
      
      private var _sendMsg:Amult_MsgSenderProxy;
      
      public function DaoJuTiQuKa_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : DaoJuTiQuKaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.daoJuTiQuKaPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as DaoJuTiQuKaPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(DaoJuTiQuKaPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            panel.addEventListener(DaoJuTiQuKaPanel.UI_GETCARD_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(DaoJuTiQuKaPanel.UI_ROSE_REFRESH_CLICK,mainCharEquipPuddingHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DaoJuTiQuKaPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            panel.removeEventListener(DaoJuTiQuKaPanel.UI_GETCARD_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(DaoJuTiQuKaPanel.UI_ROSE_REFRESH_CLICK,mainCharEquipPuddingHandle);
         });
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc4_:Goods = null;
         var _loc5_:int = 0;
         _loc2_ = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               _loc4_ = new Goods(SpecialGoodsID.DAOJUTIQUBAOHE_ID);
               _loc4_.count = 0;
               this.panel.setGoods(_loc4_);
               break;
            case DaoJuTiQuKaPanel.UI_ROSE_REFRESH_CLICK:
               this.sendMsg.send_52161();
               break;
            case DaoJuTiQuKaPanel.UI_GETCARD_CLICK:
               _loc5_ = _loc2_.data as int;
               this.sendMsg.send_52163(_loc5_);
         }
      }
      
      private function get sendMsg() : Amult_MsgSenderProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Amult_MsgSenderProxy.NAME) as Amult_MsgSenderProxy;
         }
         return this._sendMsg;
      }
      
      public function setTiquBaohe(param1:int) : void
      {
         var _loc2_:Goods = new Goods(SpecialGoodsID.DAOJUTIQUBAOHE_ID);
         _loc2_.count = param1;
         this.panel.setGoods(_loc2_);
      }
      
      public function setClose() : void
      {
         this.panel.onClose();
      }
   }
}

