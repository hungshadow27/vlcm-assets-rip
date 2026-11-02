package com.tgame.moudels.duixueren.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.duixueren.view.DuiXueRen_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DuiXueRen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "DuiXueRen_MsgReceivedProxy";
      
      private var _mediator:DuiXueRen_Mediator;
      
      public function DuiXueRen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([80322,80326,80328,80332,80334,80338],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([80322,80326,80328,80332,80334,80338],NAME);
      }
      
      private function get mediator() : DuiXueRen_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(DuiXueRen_Mediator.NAME) as DuiXueRen_Mediator;
         }
         return this._mediator;
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
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_80322(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("80322：返回堆雪人数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc6_.num = param1.readInt();
            _loc6_.goodsID = param1.readInt();
            _loc6_.goodsNum = param1.readInt();
            _loc6_.hasConversion = param1.readByte();
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.mediator.setDuiXueRenData(_loc2_,_loc4_);
      }
      
      public function received_80326(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         ZLog.add("80326：返回全名在线数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = new Array();
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc6_.indexTimer = param1.readByte();
            _loc6_.isDraw = param1.readByte();
            _loc6_.hasDraw = param1.readByte();
            _loc6_.indexGoods = param1.readInt();
            _loc6_.indexGoods = _loc5_;
            _loc6_.isRecieved = param1.readByte();
            _loc7_ = new Array();
            _loc8_ = param1.readInt();
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc10_ = new Object();
               _loc10_.goodsID = param1.readInt();
               _loc10_.goodsNum = param1.readInt();
               _loc7_.push(_loc10_);
               _loc9_++;
            }
            _loc6_.arr = _loc7_;
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.mediator.setQuanMingZaiXianData(_loc2_,_loc4_);
      }
      
      public function received_80328(param1:ByteArray) : void
      {
         ZLog.add("80328：返回全名在线抽奖");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         this.mediator.setQuanMingZaiXianResult(_loc2_,_loc3_);
      }
      
      public function received_80332(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         var _loc9_:int = 0;
         ZLog.add("80332：返回全民抽奖数据");
         var _loc2_:int = param1.readByte();
         var _loc3_:Object = new Object();
         _loc3_.jinPiaoCount = param1.readByte();
         _loc3_.yuanBaoCount = param1.readByte();
         _loc3_.jinTiaoCount = param1.readByte();
         _loc3_.jinPiao = param1.readDouble();
         _loc3_.yuanBao = param1.readInt();
         _loc3_.jinTiao = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc8_ = new Object();
            _loc8_.goodsID = param1.readInt();
            _loc8_.goodsNum = param1.readInt();
            _loc8_.goodsIndex = param1.readByte();
            _loc5_.push(_loc8_);
            _loc6_++;
         }
         var _loc7_:int = param1.readByte();
         if(_loc7_)
         {
            _loc9_ = param1.readByte();
         }
         this.mediator.setQuanMinChouJiangData(_loc2_,_loc3_,_loc5_,_loc7_,_loc9_);
      }
      
      public function received_80334(param1:ByteArray) : void
      {
         ZLog.add("80334：返回全民抽奖抽奖");
         var _loc2_:int = param1.readInt();
         var _loc3_:Object = new Object();
         _loc3_.jinPiaoCount = param1.readByte();
         _loc3_.yuanBaoCount = param1.readByte();
         _loc3_.jinTiaoCount = param1.readByte();
         _loc3_.jinPiao = param1.readDouble();
         _loc3_.yuanBao = param1.readInt();
         _loc3_.jinTiao = param1.readInt();
         this.mediator.setTurnData(_loc3_,_loc2_);
      }
      
      public function received_80338(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("80338：返回排行榜数据");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = new Object();
            _loc6_.rank = param1.readInt();
            _loc6_.name = param1.readUTF();
            _loc6_.num = param1.readInt();
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         var _loc5_:Object = new Object();
         _loc5_.currPage = param1.readByte();
         _loc5_.maxPage = param1.readByte();
         _loc5_.type = param1.readByte();
         _loc5_.rank = param1.readInt();
         _loc5_.score = param1.readInt();
         this.mediator.setJiaoNangDaLuanDouRankData(_loc3_,_loc5_);
      }
   }
}

