package com.tgame.moudels.baoshijianshang.model
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.baoshijianshang.view.BaoShiJianShang_BaoShiJianShangMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BaoShiJianShang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "BaoShiJianShang_MsgReceivedProxy";
      
      public function BaoShiJianShang_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([54002,54004,54006],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([54002,54004,54006],NAME);
      }
      
      private function get baoshijianshangmediator() : BaoShiJianShang_BaoShiJianShangMediator
      {
         return facade.retrieveMediator(BaoShiJianShang_BaoShiJianShangMediator.NAME) as BaoShiJianShang_BaoShiJianShangMediator;
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
      
      public function received_54002(param1:ByteArray) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc2_:int = param1.readInt();
         ZLog.add("宝石鉴赏押注剩余时间（int）（单位：毫秒）:" + _loc2_);
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = param1.readDouble();
            _loc7_ = param1.readByte();
            _loc8_ = new Object();
            _loc8_.beishu = _loc6_;
            _loc8_.type = _loc7_;
            _loc9_ = new Array();
            _loc10_ = 0;
            while(_loc10_ < _loc7_)
            {
               _loc11_ = param1.readInt();
               _loc12_ = param1.readUTF();
               _loc13_ = new Array();
               _loc13_ = _loc12_.split(";");
               _loc14_ = 0;
               while(_loc14_ < _loc13_.length)
               {
                  _loc9_.push(_loc13_[_loc14_]);
                  _loc14_++;
               }
               _loc9_.push(_loc11_);
               _loc10_++;
            }
            _loc8_.info = _loc9_;
            _loc4_.push(_loc8_);
            _loc5_++;
         }
         this.baoshijianshangmediator.setShowBaoShi(_loc4_);
         this.baoshijianshangmediator.setTimer(_loc2_);
         PipeManager.sendMsg(PipeConstants.UPDATE_BAOSHI_TIME,{"timer":_loc2_});
      }
      
      public function received_54004(param1:ByteArray) : void
      {
         var _loc2_:Boolean = Boolean(param1.readByte());
         ZLog.add("54004：宝石押注结果返回" + _loc2_);
         if(_loc2_)
         {
            this.baoshijianshangmediator.yaBaoSuccess();
         }
      }
      
      public function received_54006(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         ZLog.add("54006：宝石鉴赏结果返回 显示宝石" + _loc2_);
         this.baoshijianshangmediator.showBaoShiIco(_loc2_,_loc4_);
      }
   }
}

