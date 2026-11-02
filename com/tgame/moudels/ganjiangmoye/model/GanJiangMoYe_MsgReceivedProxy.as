package com.tgame.moudels.ganjiangmoye.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ganjiangmoye.view.GanJiangMoYe_Mediator;
   import com.tgame.moudels.ganjiangmoye.view.GanJiangMoYe_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class GanJiangMoYe_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "GanJiangMoYe_MsgReceivedProxy";
      
      private var _GanJiangMoYeMediator:GanJiangMoYe_Mediator;
      
      private var _GanJiangMoYeTargetMediator:GanJiangMoYe_TargetMediator;
      
      public function GanJiangMoYe_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      private function get GanJiangmoyeMediator() : GanJiangMoYe_Mediator
      {
         if(!this._GanJiangMoYeMediator)
         {
            this._GanJiangMoYeMediator = facade.retrieveMediator(GanJiangMoYe_Mediator.NAME) as GanJiangMoYe_Mediator;
         }
         return this._GanJiangMoYeMediator;
      }
      
      private function get GanJiangmoyeTargetMediator() : GanJiangMoYe_TargetMediator
      {
         if(!this._GanJiangMoYeTargetMediator)
         {
            this._GanJiangMoYeTargetMediator = facade.retrieveMediator(GanJiangMoYe_TargetMediator.NAME) as GanJiangMoYe_TargetMediator;
         }
         return this._GanJiangMoYeTargetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61014,61016,61018],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61014,61016,61018],NAME);
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
      
      public function received_61014(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         if(_loc4_ == 0)
         {
            return;
         }
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readInt();
         var _loc10_:int = _loc2_.readInt();
         var _loc11_:int = _loc2_.readInt();
         var _loc12_:int = _loc2_.readInt();
         var _loc13_:int = _loc2_.readInt();
         var _loc14_:int = _loc2_.readInt();
         var _loc15_:int = _loc2_.readInt();
         var _loc16_:int = _loc2_.readInt();
         var _loc17_:int = param1.readInt();
         var _loc18_:Boolean = Boolean(param1.readByte() == 1);
         var _loc19_:Boolean = Boolean(param1.readByte() == 1);
         var _loc20_:Boolean = Boolean(param1.readByte() == 1);
         var _loc21_:Boolean = Boolean(param1.readByte() == 1);
         var _loc22_:Boolean = Boolean(param1.readByte() == 1);
         var _loc23_:Boolean = false;
         var _loc24_:Boolean = false;
         if(_loc3_ == -1)
         {
            this.GanJiangmoyeMediator.setPanel(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_);
            this.GanJiangmoyeMediator.gouxuan(_loc23_,_loc24_);
         }
         else if(_loc3_ == GameInstance.lookPlayerID)
         {
            this.GanJiangmoyeTargetMediator.setPanel(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_);
            this.GanJiangmoyeTargetMediator.gouxuan(_loc23_,_loc24_);
         }
      }
      
      public function received_61016(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         this.GanJiangmoyeMediator.setHuanHua(_loc3_,_loc4_);
      }
      
      public function received_61018(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readInt();
         var _loc10_:int = _loc2_.readInt();
         var _loc11_:int = _loc2_.readInt();
         this.GanJiangmoyeMediator.setQiangHua(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_);
         this.GanJiangmoyeMediator.sucess_zhuzao(_loc3_);
      }
   }
}

