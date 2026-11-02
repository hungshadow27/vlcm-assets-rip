package com.tgame.moudels.jingleiqiang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jingleiqiang.model.info.JingLeiQiangVo;
   import com.tgame.moudels.jingleiqiang.view.JingLeiQiang_Mediator;
   import com.tgame.moudels.jingleiqiang.view.JingLeiQiang_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JingLeiQiang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "JingLeiQiang_MsgReceivedProxy";
      
      private var _mianPanelMediator:JingLeiQiang_Mediator;
      
      private var _targetMediator:JingLeiQiang_TargetMediator;
      
      public function JingLeiQiang_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : JingLeiQiang_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(JingLeiQiang_Mediator.NAME) as JingLeiQiang_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : JingLeiQiang_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(JingLeiQiang_TargetMediator.NAME) as JingLeiQiang_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74852,74854,74856],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74852,74854,74856],NAME);
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
      
      public function received_74852(param1:ByteArray) : void
      {
         ZLog.add("74852：返回玩家惊雷枪详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:JingLeiQiangVo = new JingLeiQiangVo();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.baoji = param1.readDouble();
         _loc3_.shanbi = param1.readDouble();
         _loc3_.skillid = param1.readInt();
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.isWaiXian = param1.readByte();
         _loc3_.isHuanZhuang = Boolean(param1.readByte());
         _loc3_.isDanTian = Boolean(param1.readByte());
         _loc3_.isZuoQI = Boolean(param1.readByte());
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_74854(param1:ByteArray) : void
      {
         ZLog.add("74854：返回惊雷枪突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_74856(param1:ByteArray) : void
      {
         ZLog.add("74856: 返回突破惊雷枪结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

