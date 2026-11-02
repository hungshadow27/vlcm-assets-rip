package com.tgame.moudels.xiantiangong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xiantiangong.model.info.XianTianGongVo;
   import com.tgame.moudels.xiantiangong.view.XianTianGong_Mediator;
   import com.tgame.moudels.xiantiangong.view.XianTianGong_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XianTianGong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XianTianGong_MsgReceivedProxy";
      
      private var _mianPanelMediator:XianTianGong_Mediator;
      
      private var _targetMediator:XianTianGong_TargetMediator;
      
      public function XianTianGong_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mianPanelMediator() : XianTianGong_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(XianTianGong_Mediator.NAME) as XianTianGong_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : XianTianGong_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XianTianGong_TargetMediator.NAME) as XianTianGong_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71202,71204,71206],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71202,71204,71206],NAME);
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
      
      public function received_71202(param1:ByteArray) : void
      {
         ZLog.add("71202：返回玩家先天功详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:XianTianGongVo = new XianTianGongVo();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.baoji = param1.readInt();
         _loc3_.shanbi = param1.readInt();
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
      
      public function received_71204(param1:ByteArray) : void
      {
         ZLog.add("71204：返回先天功突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_71206(param1:ByteArray) : void
      {
         ZLog.add("71206: 返回突破先天功结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

