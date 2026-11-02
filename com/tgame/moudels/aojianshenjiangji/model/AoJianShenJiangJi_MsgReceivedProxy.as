package com.tgame.moudels.aojianshenjiangji.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.aojianshenjiangji.model.info.AoJianShenJiangJiVO;
   import com.tgame.moudels.aojianshenjiangji.view.AoJianShenJiangJi_Mediator;
   import com.tgame.moudels.aojianshenjiangji.view.AoJianShenJiangJi_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class AoJianShenJiangJi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "AoJianShenJiangJi_MsgReceivedProxy";
      
      private var _mainPanelMediator:AoJianShenJiangJi_Mediator;
      
      private var _targetMediator:AoJianShenJiangJi_TargetPanelMediator;
      
      public function AoJianShenJiangJi_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : AoJianShenJiangJi_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(AoJianShenJiangJi_Mediator.NAME) as AoJianShenJiangJi_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : AoJianShenJiangJi_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(AoJianShenJiangJi_TargetPanelMediator.NAME) as AoJianShenJiangJi_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74062],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74062],NAME);
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
      
      public function received_74062(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("74062：返回玩傲剑神将技详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:AoJianShenJiangJiVO = new AoJianShenJiangJiVO();
         var _loc4_:int = param1.readInt();
         if(_loc4_ == 0)
         {
            return;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = new Object();
            _loc6_.id = _loc5_;
            _loc6_.byte = param1.readByte();
            _loc6_.name = param1.readUTF();
            _loc3_.shenjiangArr.push(_loc6_);
            _loc5_++;
         }
         _loc3_.shenjiangByte = param1.readByte();
         _loc3_.taozhuangCount1 = param1.readInt();
         _loc3_.taozhuangFt1 = param1.readUTF();
         _loc3_.taozhuangCount2 = param1.readInt();
         _loc3_.taozhuangFt2 = param1.readUTF();
         _loc3_.taozhuangCount3 = param1.readInt();
         _loc3_.taozhuangFt3 = param1.readUTF();
         _loc3_.huanzhuang = Boolean(param1.readByte());
         _loc3_.isTuLongDao = Boolean(param1.readByte());
         _loc3_.isZhaoMin = Boolean(param1.readByte());
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
   }
}

