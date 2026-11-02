package com.tgame.moudels.xuedaoxinfa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xuedaoxinfa.model.info.XueDaoXinFaVO;
   import com.tgame.moudels.xuedaoxinfa.view.XueDaoXinFa_Mediator;
   import com.tgame.moudels.xuedaoxinfa.view.XueDaoXinFa_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XueDaoXinFa_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XueDaoXinFa_MsgReceivedProxy";
      
      private var _mianPanelMediator:XueDaoXinFa_Mediator;
      
      private var _targetMediator:XueDaoXinFa_TargetMediator;
      
      public function XueDaoXinFa_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mianPanelMediator() : XueDaoXinFa_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(XueDaoXinFa_Mediator.NAME) as XueDaoXinFa_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : XueDaoXinFa_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XueDaoXinFa_TargetMediator.NAME) as XueDaoXinFa_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71352,71354,71356],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71352,71354,71356],NAME);
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
      
      public function received_71352(param1:ByteArray) : void
      {
         ZLog.add("71352：返回玩家血刀心法详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:XueDaoXinFaVO = new XueDaoXinFaVO();
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
         _loc3_.isZuoQi = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_71354(param1:ByteArray) : void
      {
         ZLog.add("71354：返回血刀心法突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_71356(param1:ByteArray) : void
      {
         ZLog.add("71356: 返回突破血刀心法结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

