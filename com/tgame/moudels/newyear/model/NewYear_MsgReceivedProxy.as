package com.tgame.moudels.newyear.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.newyear.view.ChunLian_Mediator;
   import com.tgame.moudels.newyear.view.NewYear_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class NewYear_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "NewYear_MsgReceivedProxy";
      
      public function NewYear_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72602,72604,72606,72612,72616,72618,72614],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72602,72604,72606,72612,72616,72618,72614],NAME);
      }
      
      private function get newyearmediator() : NewYear_Mediator
      {
         return facade.retrieveMediator(NewYear_Mediator.NAME) as NewYear_Mediator;
      }
      
      private function get chunlianMediator() : ChunLian_Mediator
      {
         return facade.retrieveMediator(ChunLian_Mediator.NAME) as ChunLian_Mediator;
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
      
      public function received_72602(param1:ByteArray) : void
      {
         var _loc9_:int = 0;
         ZLog.add("72602：返回春联送好礼 界面");
         var _loc2_:Array = new Array();
         var _loc3_:int = param1.readByte();
         var _loc4_:Number = param1.readInt();
         _loc2_.push(_loc4_);
         var _loc5_:int = param1.readInt();
         _loc2_.push(_loc5_);
         var _loc6_:int = param1.readInt();
         _loc2_.push(_loc6_);
         var _loc7_:int = param1.readInt();
         _loc2_.push(_loc7_);
         var _loc8_:String = "";
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc8_ += param1.readUTF() + ",";
            _loc9_++;
         }
         _loc8_ = _loc8_.substr(0,_loc8_.length - 1);
         _loc2_.push(_loc8_);
         var _loc10_:int = param1.readInt();
         _loc2_.push(_loc10_);
         var _loc11_:String = "";
         _loc9_ = 0;
         while(_loc9_ < _loc10_)
         {
            _loc11_ += param1.readInt() + ",";
            _loc9_++;
         }
         _loc11_ = _loc11_.substr(0,_loc11_.length - 1);
         _loc2_.push(_loc11_);
         var _loc12_:int = param1.readInt();
         _loc2_.push(_loc12_);
         var _loc13_:int = param1.readByte();
         var _loc14_:int = param1.readByte();
         this.chunlianMediator.setChunlianPanel(_loc3_,_loc2_,_loc13_ == 1,_loc14_ == 1);
      }
      
      public function received_72604(param1:ByteArray) : void
      {
         ZLog.add("72604：返回领取 勋章结果");
         var _loc2_:int = param1.readByte();
      }
      
      public function received_72606(param1:ByteArray) : void
      {
         ZLog.add("72606：返回提交 对联 结果");
         var _loc2_:int = param1.readByte();
      }
      
      public function received_72612(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         ZLog.add("72612：返回签到信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = param1.readByte();
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         var _loc5_:Boolean = Boolean(param1.readByte());
         this.newyearmediator.openQianDaoPanel(_loc3_,_loc5_);
      }
      
      public function received_72614(param1:ByteArray) : void
      {
         var _loc5_:String = null;
         ZLog.add("72614：返回获奖信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = param1.readUTF();
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.newyearmediator.upDateHuojiang(_loc3_);
      }
      
      public function received_72616(param1:ByteArray) : void
      {
         ZLog.add("72616：抽奖结果返回");
         var _loc2_:Boolean = Boolean(param1.readByte());
         this.newyearmediator.chouJiangJieGuo(_loc2_);
      }
      
      public function received_72618(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         ZLog.add("72618：勋章信息返回或更新");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = param1.readInt();
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.newyearmediator.updataXunZhang(_loc3_);
      }
   }
}

