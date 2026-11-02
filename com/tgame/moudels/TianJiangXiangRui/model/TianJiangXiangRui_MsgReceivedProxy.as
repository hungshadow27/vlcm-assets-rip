package com.tgame.moudels.TianJiangXiangRui.model
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.TianJiangXiangRui.view.TianJiangXiangRui_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianJiangXiangRui_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TianJiangXiangRui_MsgReceivedProxy";
      
      private var _tianJiangXiangRui_Mediator:TianJiangXiangRui_Mediator;
      
      public function TianJiangXiangRui_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get tianJiangXiangRui_Mediator() : TianJiangXiangRui_Mediator
      {
         if(!this._tianJiangXiangRui_Mediator)
         {
            this._tianJiangXiangRui_Mediator = facade.retrieveMediator(TianJiangXiangRui_Mediator.NAME) as TianJiangXiangRui_Mediator;
         }
         return this._tianJiangXiangRui_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61402,61404],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61402,61404],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号 " + _loc2_ + "不存在");
         }
      }
      
      public function received_61402(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("61402\t\t返回天降祥瑞详细信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.name = param1.readUTF();
            _loc5_.minGrade = param1.readInt();
            _loc5_.maxGrade = param1.readInt();
            _loc5_.id = param1.readInt();
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.tianJiangXiangRui_Mediator.showPanel(_loc3_);
      }
      
      public function received_61404(param1:ByteArray) : void
      {
         ZLog.add("61404\t\t返回掉落物品数据");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(new Goods(param1.readInt()));
            _loc4_++;
         }
         this.tianJiangXiangRui_Mediator.showGoodsPanel(_loc3_);
      }
   }
}

