package com.tgame.moudels.ChristmasRank.model
{
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ChristmasRank.view.ChristmasRank_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChristmasRank_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ChristmasRank_MsgReceivedProxy";
      
      public function ChristmasRank_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([58152],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([58152],NAME);
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
      
      public function received_58152(param1:ByteArray) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:String = null;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:XML = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc13_:Number = NaN;
         var _loc14_:int = 0;
         var _loc15_:uint = 0;
         var _loc16_:String = null;
         var _loc17_:XML = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte() == 1);
         ZLog.add("58152:收到圣诞雪人伤害排行榜信息!");
         if(_loc3_)
         {
            _loc4_ = _loc2_.readDouble();
            _loc5_ = _loc2_.readFloat();
            _loc6_ = (_loc5_ * 100).toFixed(2) + "%";
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readByte();
            _loc9_ = <list/>;
            _loc10_ = 0;
            while(_loc10_ < _loc8_)
            {
               _loc11_ = _loc2_.readInt();
               _loc12_ = _loc2_.readUTF();
               _loc13_ = _loc2_.readFloat();
               _loc14_ = _loc10_ + 1;
               if(_loc10_ == 0)
               {
                  _loc15_ = uint(StaticValue.RED);
               }
               else if(_loc10_ == 1)
               {
                  _loc15_ = uint(StaticValue.GREEN);
               }
               else if(_loc10_ == 2)
               {
                  _loc15_ = uint(StaticValue.ORANGE);
               }
               else if(_loc10_ == 3)
               {
                  _loc15_ = uint(StaticValue.YELLOW);
               }
               else
               {
                  _loc15_ = uint(StaticValue.WHITE);
               }
               _loc16_ = (_loc13_ * 100).toFixed(2) + "%";
               _loc17_ = <node no={_loc14_} name={_loc12_} qf={_loc11_} shanghai={_loc16_} color={_loc15_}/>;
               _loc9_.appendChild(_loc17_);
               _loc10_++;
            }
            this.crMediator.showPanel([_loc4_,_loc6_,_loc7_,_loc9_]);
         }
         else
         {
            this.crMediator.hidePanel();
         }
      }
      
      private function get crMediator() : ChristmasRank_Mediator
      {
         return facade.retrieveMediator(ChristmasRank_Mediator.NAME) as ChristmasRank_Mediator;
      }
   }
}

