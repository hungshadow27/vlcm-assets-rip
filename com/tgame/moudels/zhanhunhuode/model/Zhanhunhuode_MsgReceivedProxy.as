package com.tgame.moudels.zhanhunhuode.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.zhanhunhuode.view.Zhanhunhuode_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Zhanhunhuode_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Zhanhunhuode_MsgReceivedProxy";
      
      private var _zhanhunMediator:Zhanhunhuode_Mediator;
      
      public function Zhanhunhuode_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([55802,55804,55806,55808,55812,55814,55844,55846,55848],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([55802,55804,55806,55808,55812,55814,55844,55846,55848],NAME);
      }
      
      private function get zhanhunMediator() : Zhanhunhuode_Mediator
      {
         if(!this._zhanhunMediator)
         {
            this._zhanhunMediator = facade.retrieveMediator(Zhanhunhuode_Mediator.NAME) as Zhanhunhuode_Mediator;
         }
         return this._zhanhunMediator;
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
      
      public function received_55802(param1:ByteArray) : void
      {
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         ZLog.add("55802:返回战魂获取界面战魂列表");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc10_ = {};
            _loc10_.id = param1.readByte();
            _loc10_.name = param1.readUTF();
            _loc10_.tip = param1.readUTF();
            _loc10_.state = param1.readByte();
            _loc4_.push(_loc10_);
            _loc5_++;
         }
         var _loc6_:int = param1.readByte();
         var _loc7_:Array = [];
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc11_ = {};
            _loc11_.id = param1.readInt();
            _loc11_.goodid = param1.readInt();
            _loc11_.daojuid = param1.readInt();
            _loc11_.name = param1.readUTF();
            _loc11_.dengji = param1.readByte();
            _loc11_.type = param1.readByte();
            _loc11_.miaoshu = param1.readUTF();
            _loc11_.price = param1.readInt();
            _loc7_.push(_loc11_);
            _loc8_++;
         }
         var _loc9_:int = param1.readInt();
         this.zhanhunMediator.showZhanHunPanel();
         this.zhanhunMediator.setZhanHunData(_loc2_,_loc4_,_loc7_);
         this.zhanhunMediator.setBaoshi(_loc9_);
      }
      
      public function received_55804(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("55804:战魂拾取结果返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = {};
            _loc5_.id = param1.readInt();
            _loc5_.type = "pick";
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.zhanhunMediator.shiquZhanHun(_loc3_);
      }
      
      public function received_55806(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("55806:战魂卖出结果返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = {};
            _loc5_.id = param1.readInt();
            _loc5_.price = param1.readInt();
            _loc5_.type = "sell";
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.zhanhunMediator.maichuZhanhun(_loc3_);
      }
      
      public function received_55808(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("55808:返回点击NPC后获取的战魂");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc8_ = {};
            _loc8_.id = param1.readByte();
            _loc8_.state = param1.readByte();
            _loc3_.push(_loc8_);
            _loc4_++;
         }
         var _loc5_:int = param1.readByte();
         var _loc6_:String = param1.readUTF();
         var _loc7_:Object = {};
         _loc7_.id = param1.readInt();
         _loc7_.goodid = param1.readInt();
         _loc7_.daojuid = param1.readInt();
         _loc7_.name = param1.readUTF();
         _loc7_.dengji = param1.readByte();
         _loc7_.type = param1.readByte();
         _loc7_.miaoshu = param1.readUTF();
         _loc7_.price = param1.readInt();
         this.zhanhunMediator.AppendZhanhun([_loc7_],_loc3_,_loc5_);
      }
      
      public function received_55812(param1:ByteArray) : void
      {
         ZLog.add("55812:积分兑换返回结果");
      }
      
      public function received_55814(param1:ByteArray) : void
      {
         ZLog.add("55814:返回积分和铜币数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:Number = param1.readDouble();
         this.zhanhunMediator.setjifen(_loc2_);
         this.zhanhunMediator.settongbi(_loc3_);
      }
      
      public function received_55844(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("55844:返回战魂兑换面板战魂列表");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc9_ = {};
            _loc9_.goodid = param1.readInt();
            _loc9_.name = param1.readUTF();
            _loc9_.dengji = param1.readInt();
            _loc9_.count = param1.readInt();
            _loc9_.type = param1.readByte();
            _loc9_.miaoshu = param1.readUTF();
            _loc9_.price = param1.readInt();
            _loc6_.push(_loc9_);
            _loc7_++;
         }
         var _loc8_:int = param1.readInt();
         if(_loc2_ == 0)
         {
            this.zhanhunMediator.setZhanhun1(_loc6_,_loc8_);
            this.zhanhunMediator.setYeshu(_loc4_,_loc3_);
         }
         else
         {
            this.zhanhunMediator.setZhanhun2(_loc6_,_loc8_);
         }
      }
      
      public function received_55846(param1:ByteArray) : void
      {
         ZLog.add("55846: 返回兑换战魂宝石结果");
         var _loc2_:int = param1.readByte();
         this.zhanhunMediator.setDuihuanBaoshi(_loc2_);
      }
      
      public function received_55848(param1:ByteArray) : void
      {
         ZLog.add("55848: 返回兑换战魂结果");
         var _loc2_:int = param1.readByte();
         this.zhanhunMediator.setDuihuanZhanhun(_loc2_);
      }
   }
}

