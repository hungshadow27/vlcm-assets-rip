package com.tgame.moudels.xuantiejianfa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xuantiejianfa.model.info.XuanTieJianFaVO;
   import com.tgame.moudels.xuantiejianfa.view.XuanTieJianFa_Mediator;
   import com.tgame.moudels.xuantiejianfa.view.XuanTieJianFa_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XuanTieJianFa_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XuanTieJianFa_MsgReceivedProxy";
      
      private var _mianPanelMediator:XuanTieJianFa_Mediator;
      
      private var _targetMediator:XuanTieJianFa_TargetMediator;
      
      public function XuanTieJianFa_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : XuanTieJianFa_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(XuanTieJianFa_Mediator.NAME) as XuanTieJianFa_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : XuanTieJianFa_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XuanTieJianFa_TargetMediator.NAME) as XuanTieJianFa_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73102,73104,73106],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73102,73104,73106],NAME);
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
      
      public function received_73102(param1:ByteArray) : void
      {
         ZLog.add("73102：返回玩家玄铁剑法详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:XuanTieJianFaVO = new XuanTieJianFaVO();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.neili = param1.readDouble();
         _loc3_.tili = param1.readDouble();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_73104(param1:ByteArray) : void
      {
         ZLog.add("73104：返回玄铁剑法突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_73106(param1:ByteArray) : void
      {
         ZLog.add("73106: 返回突破玄铁剑法结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

