package com.tgame.moudels.shendiaoxialv.model
{
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.shendiaoxialv.view.ShenDiaoXiaLv_Mediator;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShenDiaoXiaLv_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ShenDiaoXiaLv_MsgReceivedProxy";
      
      private var _ShenDiaoXiaLvMediator:ShenDiaoXiaLv_Mediator;
      
      public function ShenDiaoXiaLv_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      private function get ShenDiaoxialvMediator() : ShenDiaoXiaLv_Mediator
      {
         if(!this._ShenDiaoXiaLvMediator)
         {
            this._ShenDiaoXiaLvMediator = facade.retrieveMediator(ShenDiaoXiaLv_Mediator.NAME) as ShenDiaoXiaLv_Mediator;
         }
         return this._ShenDiaoXiaLvMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61022,61024,61026,61028,61030],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61022,61024,61026,61028,61030],NAME);
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
      
      public function received_61022(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc9_ = new Object();
            _loc9_.xian = _loc2_.readByte();
            _loc9_.name = _loc2_.readUTF();
            _loc9_.int1 = _loc2_.readInt();
            _loc9_.int2 = _loc2_.readInt();
            _loc9_.bo = _loc2_.readByte();
            _loc4_.push(_loc9_);
            _loc5_++;
         }
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readInt();
         this.ShenDiaoxialvMediator.setPanel(_loc4_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_61024(param1:ByteArray) : void
      {
         ZLog.add("61024\t\t返回领取神雕之羽结果");
      }
      
      public function received_61026(param1:ByteArray) : void
      {
         ZLog.add("61026\t\t返回领取侠侣碎片结果");
      }
      
      public function received_61028(param1:ByteArray) : void
      {
         ZLog.add("61028\t\t返回申请结果");
      }
      
      public function received_61030(param1:ByteArray) : void
      {
         ZLog.add("61030\t\t返回活动向导");
         var _loc2_:Boolean = param1.readByte() == 1;
         if(_loc2_)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_SHENDIAOXIALV);
         }
      }
   }
}

