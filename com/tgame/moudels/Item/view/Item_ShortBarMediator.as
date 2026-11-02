package com.tgame.moudels.Item.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemMenuStatus;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.moudels.Item.model.Item_TipProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.events.SceneEventAction_interactive;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_ShortBarMediator extends Mediator
   {
      
      public static const NAME:String = "Item_ShortBarMediator";
      
      private var showMenuItem:ItemFace;
      
      private var itemMenu:Menu;
      
      private var currentItemStatus:String = ItemMenuStatus.NORMAL;
      
      private var _itemTipProxy:Item_TipProxy;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var _backPackMeditor:Item_BackpackMediator;
      
      private var _tempDragItemFace:ItemFace;
      
      public function Item_ShortBarMediator()
      {
         super(NAME);
      }
      
      public function get itemTipProxy() : Item_TipProxy
      {
         if(this._itemTipProxy == null)
         {
            this._itemTipProxy = facade.retrieveProxy(Item_TipProxy.NAME) as Item_TipProxy;
         }
         return this._itemTipProxy;
      }
      
      public function get sender() : Item_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._sender;
      }
      
      public function get backPackMeditor() : Item_BackpackMediator
      {
         if(this._backPackMeditor == null)
         {
            this._backPackMeditor = facade.retrieveMediator(Item_BackpackMediator.NAME) as Item_BackpackMediator;
         }
         return this._backPackMeditor;
      }
      
      protected function get mainUI() : MainUI
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.mainUI);
         }
         return viewComponent as MainUI;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         GameInstance.scene.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp,false,30);
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            mainUI.addEventListener(MainUI.FUNCTION_SHORTCUT_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCITON_RIDE_SKILL_SHORTCUT_CLICK,mainUIHandle);
            mainUI.addEventListener(MainUI.FUNCTION_SHORTCU_DRAG_STRAT,onStartDrag);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            mainUI.removeEventListener(MainUI.FUNCTION_SHORTCUT_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCITON_RIDE_SKILL_SHORTCUT_CLICK,mainUIHandle);
            mainUI.removeEventListener(MainUI.FUNCTION_SHORTCU_DRAG_STRAT,onStartDrag);
         });
      }
      
      private function onMouseUp(param1:Event) : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            this.dragHandler(TCursorManager.currentItemFace,0);
         }
      }
      
      private function onSceneMouseUp(param1:BaseEvent) : void
      {
         switch(param1.action)
         {
            case SceneEventAction_interactive.MOUSE_UP:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG && TCursorManager.source == 1)
               {
                  this.dragHandler(TCursorManager.currentItemFace,0);
               }
         }
      }
      
      private function onStartDrag(param1:BaseEvent) : void
      {
         var _loc2_:ItemFace = param1.data as ItemFace;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
         {
            TCursorManager.currentItemFace = _loc2_;
            TCursorManager.showItem(_loc2_.itemBD);
            TCursorManager.source = 1;
            TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
            TCursorManager.lockOnMouseStatus();
         }
      }
      
      private function mainUIHandle(param1:Event = null) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case MainUI.FUNCTION_SHORTCUT_CLICK:
               this.onClickItem(_loc3_.data as Array);
               break;
            case MainUI.FUNCITON_RIDE_SKILL_SHORTCUT_CLICK:
               this.onClickRideItem(_loc3_.data as Array);
         }
      }
      
      private function onClickRideItem(param1:Array) : void
      {
         var _loc3_:ItemFace = null;
         var _loc4_:int = 0;
         var _loc2_:Array = param1 as Array;
         _loc3_ = _loc2_[0].target as ItemFace;
         this.backPackMeditor.useMouseShortKey(_loc3_.getBaseItem(),_loc2_[0]);
      }
      
      private function onClickItem(param1:Array) : void
      {
         var _loc3_:ItemFace = null;
         var _loc4_:int = 0;
         var _loc5_:ItemFace = null;
         var _loc2_:Array = param1 as Array;
         if(_loc2_[1] == null)
         {
            _loc3_ = _loc2_[0].target as ItemFace;
            if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
            {
               _loc5_ = TCursorManager.currentItemFace;
               if(!_loc5_ || !this.checkIsMove(_loc5_))
               {
                  return;
               }
               this.sender.send_10179([_loc5_.getBaseItem().position,_loc3_.getBaseItem().quickbarindex]);
               TCursorManager.removeLockOnMouseStatus();
               TCursorManager.resumMouse();
            }
            else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
            {
               if(!this.checkIsMove(_loc3_))
               {
                  return;
               }
               this.dragHandler(TCursorManager.currentItemFace,_loc3_.getBaseItem().quickbarindex);
               this.dragHandler(_loc3_,TCursorManager.currentItemFace.getBaseItem().quickbarindex);
            }
            else
            {
               this.backPackMeditor.useMouseShortKey(_loc3_.getBaseItem(),_loc2_[0]);
            }
         }
         else
         {
            _loc4_ = int(_loc2_[1]);
            if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
            {
               _loc3_ = TCursorManager.currentItemFace;
               if(!_loc3_ || !this.checkIsMove(_loc3_))
               {
                  return;
               }
               this.sender.send_10179([_loc3_.getBaseItem().position,ExchangePositionManager.getRealShortIndex(_loc2_[1])]);
               TCursorManager.removeLockOnMouseStatus();
               TCursorManager.resumMouse();
            }
            if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
            {
               _loc3_ = TCursorManager.currentItemFace;
               this.dragHandler(_loc3_,_loc4_);
            }
         }
      }
      
      private function dragHandler(param1:ItemFace, param2:int) : void
      {
         if(!param1 || param2 != 0 && !this.checkIsMove(param1))
         {
            return;
         }
         TCursorManager.removeLockOnMouseStatus();
         TCursorManager.resumMouse();
         var _loc3_:int = param2;
         if(param1.getBaseItem() is Skill)
         {
            if(TCursorManager.source != 4 && TCursorManager.source != 5 && TCursorManager.source != 9)
            {
               this.sender.send_10277([param1.getBaseItem().id,param2]);
            }
         }
         else if(param1.getBaseItem() is Goods)
         {
            this.sender.send_10179([param1.getBaseItem().position,param2]);
         }
      }
      
      private function checkIsMove(param1:ItemFace) : Boolean
      {
         var _loc3_:Skill = null;
         var _loc4_:Goods = null;
         var _loc2_:BaseItem = param1.getBaseItem();
         if(_loc2_ is Goods)
         {
            _loc4_ = _loc2_ as Goods;
            if(_loc4_.res.kind == GoodsKind.K3 || _loc4_.res.kind == GoodsKind.K29 || _loc4_.res.id_kind == OtherConst.QIUYUAN_HAOJIAO || _loc4_.res.id_kind == OtherConst.JINGONG_HAOJIAO || _loc4_.res.kind == GoodsKind.K33 || _loc4_.id == SpecialGoodsID.GOUHUNXIANJING_ID || _loc4_.id == SpecialGoodsID.GOUHUNXIANJING_ID)
            {
               return true;
            }
         }
         else if(_loc2_ is Skill)
         {
            _loc3_ = _loc2_ as Skill;
            if(_loc3_.res.useway == 1)
            {
               return true;
            }
         }
         return false;
      }
   }
}

