package com.tgame.moudels.ynZhimengshangcheng.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynZhimengshangcheng.view.YNwangzhezhibang_Mediator;
   import com.tgame.moudels.ynZhimengshangcheng.view.YNzhimengshangcheng_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNzhimengshangcheng_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNzhimengshangcheng_MsgReceivedProxy";
      
      private var _zhimengMediator:YNzhimengshangcheng_Mediator;
      
      private var _wzzbMediator:YNwangzhezhibang_Mediator;
      
      public function YNzhimengshangcheng_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([81132,81136],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([81132,81136],NAME);
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
      
      private function get zhimengMediator() : YNzhimengshangcheng_Mediator
      {
         if(!this._zhimengMediator)
         {
            this._zhimengMediator = facade.retrieveMediator(YNzhimengshangcheng_Mediator.NAME) as YNzhimengshangcheng_Mediator;
         }
         return this._zhimengMediator;
      }
      
      private function get wzzbMediator() : YNwangzhezhibang_Mediator
      {
         if(!this._wzzbMediator)
         {
            this._wzzbMediator = facade.retrieveMediator(YNwangzhezhibang_Mediator.NAME) as YNwangzhezhibang_Mediator;
         }
         return this._wzzbMediator;
      }
      
      public function received_81132(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         ZLog.add("81132：返回之梦钱庄面板信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = new Object();
            _loc6_.type = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = [];
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               _loc10_ = new Object();
               _loc10_.index = param1.readInt();
               _loc10_.gid = param1.readInt();
               _loc10_.price = param1.readInt();
               _loc8_.push(_loc10_);
               _loc9_++;
            }
            _loc6_.ar = _loc8_;
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         this.zhimengMediator.setData(_loc3_,_loc5_);
      }
      
      public function received_81136(param1:ByteArray) : void
      {
         ZLog.add("81136：返回王者之帮在线领取装备面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_.push(param1.readByte());
            _loc5_++;
         }
         this.wzzbMediator.setData(_loc4_,_loc2_);
      }
   }
}

