package com.tgame.moudels.yitiantulong.model
{
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yitiantulong.view.YiTianTuLong_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YiTianTuLong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YiTianTuLong_MsgReceivedProxy";
      
      private var _mainChar_Mediator:YiTianTuLong_Mediator;
      
      public function YiTianTuLong_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mainChar_Mediator() : YiTianTuLong_Mediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(YiTianTuLong_Mediator.NAME) as YiTianTuLong_Mediator;
         }
         return this._mainChar_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([79482,79484,79486,79496,79498,79488],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([79482,79484,79486,79496,79498,79488],NAME);
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
      
      public function received_79482(param1:ByteArray) : void
      {
         var _loc13_:Object = null;
         var _loc14_:uint = 0;
         ZLog.add("79482\t\t倚天屠龙信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:Boolean = Boolean(param1.readByte());
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:Array = [];
         var _loc10_:int = param1.readByte();
         var _loc11_:int = 0;
         while(_loc11_ < _loc10_)
         {
            _loc13_ = {};
            _loc13_.id = param1.readByte();
            _loc13_.count = param1.readInt();
            _loc13_.label = "场地" + _loc13_.id;
            if(_loc13_.count < 100)
            {
               _loc14_ = uint(StaticValue.GREEN_STRONG);
            }
            else if(_loc13_.count >= 100 && _loc13_.count < 150)
            {
               _loc14_ = uint(StaticValue.GREEN);
            }
            else if(_loc13_.count >= 150 && _loc13_.count < 200)
            {
               _loc14_ = uint(StaticValue.YELLOW);
            }
            else if(_loc13_.count >= 200 && _loc13_.count < 250)
            {
               _loc14_ = uint(StaticValue.RED);
            }
            else if(_loc13_.count >= 250)
            {
               _loc14_ = uint(StaticValue.RED);
            }
            _loc13_.color = _loc14_;
            _loc9_.push(_loc13_);
            _loc11_++;
         }
         var _loc12_:Boolean = Boolean(param1.readByte());
         this.mainChar_Mediator.setPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc9_,_loc8_,_loc12_);
      }
      
      public function received_79484(param1:ByteArray) : void
      {
         ZLog.add("79484\t\t倚天屠龙领悟查询结果");
         var _loc2_:int = param1.readInt();
         var _loc3_:Boolean = Boolean(param1.readByte());
         this.mainChar_Mediator.setZhuZao(_loc2_,_loc3_);
      }
      
      public function received_79488(param1:ByteArray) : void
      {
         ZLog.add("79488\t\t请求报名成功失败？");
         this.mainChar_Mediator.setChengGong();
      }
      
      public function received_79496(param1:ByteArray) : void
      {
         ZLog.add("79496\t需要的淬炼值");
         var _loc2_:int = param1.readInt();
         this.mainChar_Mediator.setCount(_loc2_);
      }
      
      public function received_79498(param1:ByteArray) : void
      {
         ZLog.add("79498\t   锻造/淬炼成功后关闭小面板");
         this.mainChar_Mediator.setClose();
      }
   }
}

