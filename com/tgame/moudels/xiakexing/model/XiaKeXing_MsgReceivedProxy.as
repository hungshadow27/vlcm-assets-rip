package com.tgame.moudels.xiakexing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xiakexing.model.info.XiaKeXingVO;
   import com.tgame.moudels.xiakexing.view.XiaKeXing_Mediator;
   import com.tgame.moudels.xiakexing.view.XiaKeXing_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiaKeXing_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XiaKeXing_MsgReceivedProxy";
      
      private var _mianPanelMediator:XiaKeXing_Mediator;
      
      private var _targetMediator:XiaKeXing_TargetMediator;
      
      public function XiaKeXing_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : XiaKeXing_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(XiaKeXing_Mediator.NAME) as XiaKeXing_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : XiaKeXing_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XiaKeXing_TargetMediator.NAME) as XiaKeXing_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73562,73564],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73562,73564],NAME);
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
      
      public function received_73562(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("73562：返回玩家侠客行详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:XiaKeXingVO = new XiaKeXingVO();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.baoji = param1.readDouble();
         _loc3_.shanbi = param1.readDouble();
         _loc3_.neili = param1.readDouble();
         _loc3_.tili = param1.readDouble();
         _loc3_.skillid = param1.readInt();
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = new Object();
            _loc7_.name = param1.readUTF();
            _loc7_.nowExp = param1.readInt();
            _loc7_.maxExp = param1.readInt();
            _loc7_.tip = param1.readUTF();
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         _loc3_.shengji = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_,_loc5_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_,_loc5_);
         }
      }
      
      public function received_73564(param1:ByteArray) : void
      {
         ZLog.add("73564: 返回突破侠客行结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.mianPanelMediator.setYanhua();
         }
      }
   }
}

