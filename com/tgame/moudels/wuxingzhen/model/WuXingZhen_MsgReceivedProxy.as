package com.tgame.moudels.wuxingzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.wuxingzhen.view.WuXingZhen_Mediator;
   import com.tgame.moudels.wuxingzhen.view.WuXingZhen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WuXingZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "WuXingZhen_MsgReceivedProxy";
      
      private var _wuXingZhenMediator:WuXingZhen_Mediator;
      
      private var _targetWuXingZhenMediator:WuXingZhen_TargetPanelMediator;
      
      public function WuXingZhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      private function get wuXingZhenMediator() : WuXingZhen_Mediator
      {
         if(!this._wuXingZhenMediator)
         {
            this._wuXingZhenMediator = facade.retrieveMediator(WuXingZhen_Mediator.NAME) as WuXingZhen_Mediator;
         }
         return this._wuXingZhenMediator;
      }
      
      private function get targetWuXingZhenMediator() : WuXingZhen_TargetPanelMediator
      {
         if(!this._targetWuXingZhenMediator)
         {
            this._targetWuXingZhenMediator = facade.retrieveMediator(WuXingZhen_TargetPanelMediator.NAME) as WuXingZhen_TargetPanelMediator;
         }
         return this._targetWuXingZhenMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([59302,59304,59306],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([59302,59304,59306],NAME);
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
      
      public function received_59302(param1:ByteArray) : void
      {
         var _loc20_:Object = null;
         ZLog.add("59302：返回五行阵数据信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc20_ = new Object();
            _loc20_.id = param1.readByte();
            _loc20_.grade = param1.readByte();
            _loc20_.name = param1.readUTF();
            _loc20_.status = param1.readByte();
            _loc20_.shengming = param1.readInt();
            _loc20_.maxShengming = param1.readInt();
            _loc20_.neili = param1.readInt();
            _loc20_.maxNeili = param1.readInt();
            _loc20_.tili = param1.readInt();
            _loc20_.maxTili = param1.readInt();
            _loc20_.gongji = param1.readInt();
            _loc20_.maxGongji = param1.readInt();
            _loc20_.fangyu = param1.readInt();
            _loc20_.maxFangyu = param1.readInt();
            _loc5_.push(_loc20_);
            _loc6_++;
         }
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:Boolean = Boolean(param1.readByte() == 1);
         var _loc13_:Boolean = Boolean(param1.readByte() == 1);
         var _loc14_:Boolean = Boolean(param1.readByte() == 1);
         var _loc15_:Boolean = Boolean(param1.readByte() == 1);
         var _loc16_:Boolean = Boolean(param1.readByte() == 1);
         var _loc17_:Boolean = Boolean(param1.readByte() == 1);
         var _loc18_:Boolean = Boolean(param1.readByte() == 1);
         var _loc19_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.wuXingZhenMediator.setPanel(_loc3_,_loc5_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_);
            this.wuXingZhenMediator.setGouXuan(_loc15_,_loc16_,_loc17_,_loc18_,_loc19_);
         }
         else
         {
            this.targetWuXingZhenMediator.setPanel(_loc3_,_loc5_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_);
            this.targetWuXingZhenMediator.setGouXuan(_loc15_,_loc16_,_loc17_,_loc18_,_loc19_);
         }
      }
      
      public function received_59304(param1:ByteArray) : void
      {
         ZLog.add("59304：返回突破五行阵面板");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         this.wuXingZhenMediator.setTupoPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_59306(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         ZLog.add("59306：返回突破五行阵结果");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 2)
         {
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readInt();
            this.wuXingZhenMediator.setTupoPanel(_loc2_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
         }
         this.wuXingZhenMediator.setTupoResult(_loc3_);
      }
   }
}

