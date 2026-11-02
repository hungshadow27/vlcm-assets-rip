package com.tgame.moudels.ChuanGongWuXue.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ChuanGongWuXue.view.ChuanGongWuXue_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChuanGongWuXue_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ChuanGongWuXue_MsgReceivedProxy";
      
      private var _ChuanGongwuXue_Mediator:ChuanGongWuXue_Mediator;
      
      public function ChuanGongWuXue_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      private function get ChuanGongwuXue_Mediator() : ChuanGongWuXue_Mediator
      {
         if(!this._ChuanGongwuXue_Mediator)
         {
            this._ChuanGongwuXue_Mediator = facade.retrieveMediator(ChuanGongWuXue_Mediator.NAME) as ChuanGongWuXue_Mediator;
         }
         return this._ChuanGongwuXue_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72132,72134],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72132,72134],NAME);
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
      
      public function received_72132(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("72132\t\t返回传功面板信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc6_.id = _loc2_.readInt();
            _loc6_.name = _loc2_.readUTF();
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.ChuanGongwuXue_Mediator.setPanel(_loc4_);
      }
      
      public function received_72134(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc13_:Object = null;
         ZLog.add("72134\t\t返回弟子武学面板信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc13_ = new Object();
            _loc13_.id = _loc2_.readInt();
            _loc13_.learn = Boolean(_loc2_.readByte() == 1);
            _loc13_.dengji = _loc2_.readInt();
            _loc13_.jiacheng = _loc2_.readInt();
            _loc13_.nowExp = _loc2_.readInt();
            _loc13_.maxExp = _loc2_.readInt();
            _loc5_.push(_loc13_);
            _loc6_++;
         }
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc13_ = new Object();
            _loc13_.id = _loc2_.readInt();
            _loc13_.learn = Boolean(_loc2_.readByte() == 1);
            _loc13_.dengji = _loc2_.readInt();
            _loc13_.jiacheng = _loc2_.readInt();
            _loc13_.nowExp = _loc2_.readInt();
            _loc13_.maxExp = _loc2_.readInt();
            _loc8_.push(_loc13_);
            _loc6_++;
         }
         var _loc9_:int = _loc2_.readInt();
         var _loc10_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc9_)
         {
            _loc13_ = new Object();
            _loc13_.id = _loc2_.readInt();
            _loc13_.learn = Boolean(_loc2_.readByte() == 1);
            _loc13_.dengji = _loc2_.readInt();
            _loc13_.jiacheng = _loc2_.readInt();
            _loc13_.nowExp = _loc2_.readInt();
            _loc13_.maxExp = _loc2_.readInt();
            _loc10_.push(_loc13_);
            _loc6_++;
         }
         var _loc11_:int = _loc2_.readInt();
         var _loc12_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc11_)
         {
            _loc13_ = new Object();
            _loc13_.type = _loc2_.readByte();
            _loc13_.id = _loc2_.readInt();
            _loc12_.push(_loc13_);
            _loc6_++;
         }
         this.ChuanGongwuXue_Mediator.setPanelDizi(_loc3_,_loc5_,_loc8_,_loc10_,_loc12_);
      }
   }
}

