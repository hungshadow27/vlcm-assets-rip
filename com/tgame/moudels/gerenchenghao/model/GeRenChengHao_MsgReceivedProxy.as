package com.tgame.moudels.gerenchenghao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.gerenchenghao.view.GeRenChengHao_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class GeRenChengHao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "GeRenChengHao_MsgReceivedProxy";
      
      private var _GeRenChengHaoMediator:GeRenChengHao_Mediator;
      
      public function GeRenChengHao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      private function get GeRenChengHaoMediator() : GeRenChengHao_Mediator
      {
         if(!this._GeRenChengHaoMediator)
         {
            this._GeRenChengHaoMediator = facade.retrieveMediator(GeRenChengHao_Mediator.NAME) as GeRenChengHao_Mediator;
         }
         return this._GeRenChengHaoMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73202,73206,73208,73210],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73202,73206,73208,73210],NAME);
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
      
      public function received_73202(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("73202\t\t 返回普通称号列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc7_ = new Object();
            _loc7_.id = _loc2_.readInt();
            _loc7_.name = _loc2_.readUTF();
            _loc7_.jihuo = Boolean(param1.readByte() == 1);
            _loc7_.gouxuan = _loc2_.readBoolean();
            _loc7_.biaoqianType = 1;
            _loc7_.weizhi = _loc5_;
            _loc4_.push(_loc7_);
            _loc5_++;
         }
         var _loc6_:int = param1.readByte();
         this.GeRenChengHaoMediator.setPutong(_loc4_,_loc6_);
      }
      
      public function received_73206(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("73206\t\t 返回专属称号列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if(_loc3_ != 0)
            {
               _loc6_ = new Object();
               _loc6_.id = _loc2_.readUTF();
               _loc6_.name = _loc2_.readUTF();
               _loc6_.jihuo = Boolean(param1.readByte() == 1);
               _loc6_.biaoqianType = 2;
               _loc6_.weizhi = _loc5_;
               _loc4_.push(_loc6_);
            }
            _loc5_++;
         }
         if(_loc3_ == 0)
         {
            this.GeRenChengHaoMediator.setBiaoQian();
         }
         else
         {
            this.GeRenChengHaoMediator.setZhuanshu(_loc4_,2);
         }
      }
      
      public function received_73208(param1:ByteArray) : void
      {
         ZLog.add("73208\t\t返回申请结果");
      }
      
      public function received_73210(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("73210\t\t 返回全平台专属列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ == 0)
         {
            _loc3_ = 1;
         }
         var _loc4_:int = _loc2_.readInt();
         if(_loc4_ == 0)
         {
            _loc4_ = 1;
         }
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            if(_loc5_ != 0)
            {
               _loc8_ = new Object();
               _loc8_.pingtai = _loc2_.readInt();
               _loc8_.name = _loc2_.readUTF();
               _loc8_.sex = _loc2_.readByte();
               _loc8_.id = _loc2_.readUTF();
               _loc8_.chenghao = _loc2_.readUTF();
               _loc8_.count = _loc2_.readInt();
               _loc8_.biaoqianType = 3;
               _loc8_.weizhi = _loc7_;
               _loc6_.push(_loc8_);
            }
            _loc7_++;
         }
         this.GeRenChengHaoMediator.setQuanTai(_loc6_,3,_loc3_,_loc4_);
      }
   }
}

