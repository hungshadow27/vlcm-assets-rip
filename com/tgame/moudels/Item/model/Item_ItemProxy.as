package com.tgame.moudels.Item.model
{
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TCursorManager;
   import com.tgame.moudels.Item.view.Item_BackpackMediator;
   import com.zcp.manager.TimerManager;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Item_ItemProxy extends Proxy
   {
      
      public static const NAME:String = "Item_ItemProxy";
      
      private var _backPackMediator:Item_BackpackMediator;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var _allowSort:Boolean = true;
      
      public function Item_ItemProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      public function get sender() : Item_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._sender;
      }
      
      protected function get backPackMediator() : Item_BackpackMediator
      {
         if(this._backPackMediator == null)
         {
            this._backPackMediator = facade.retrieveMediator(Item_BackpackMediator.NAME) as Item_BackpackMediator;
         }
         return this._backPackMediator;
      }
      
      public function removeItem(param1:BaseItem) : void
      {
         if(!param1)
         {
            return;
         }
         TCursorManager.removeLockOnMouseStatus();
         TCursorManager.resumMouse();
         var _loc2_:Goods = param1 as Goods;
         this.sender.send_11181([_loc2_.position,0]);
      }
      
      public function splitItem(param1:BaseItem, param2:int) : void
      {
         this.sender.send_11183([param1.position,param2]);
      }
      
      public function sortBag(param1:int) : void
      {
         var type:int = param1;
         if(this._allowSort)
         {
            this.sender.send_11185(type);
            this._allowSort = false;
            TimerManager.createOneOffExactTimer(3,1,10,null,function():void
            {
               _allowSort = true;
            });
         }
      }
      
      public function activeBag(param1:int) : void
      {
         this.sender.send_11189(param1);
      }
   }
}

