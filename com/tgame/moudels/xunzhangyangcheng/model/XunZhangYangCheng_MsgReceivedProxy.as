package com.tgame.moudels.xunzhangyangcheng.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xunzhangyangcheng.view.XunZhangYangCheng_Mediator;
   import com.tgame.moudels.xunzhangyangcheng.view.XunZhangYangCheng_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XunZhangYangCheng_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XunZhangYangCheng_MsgReceivedProxy";
      
      private var _xunZhangYangCheng_Mediator:XunZhangYangCheng_Mediator;
      
      private var _targetMediator:XunZhangYangCheng_TargetMediator;
      
      public function XunZhangYangCheng_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61462,61466],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61462,61466],NAME);
      }
      
      private function get xunZhangYangChengMediator() : XunZhangYangCheng_Mediator
      {
         if(this._xunZhangYangCheng_Mediator == null)
         {
            this._xunZhangYangCheng_Mediator = facade.retrieveMediator(XunZhangYangCheng_Mediator.NAME) as XunZhangYangCheng_Mediator;
         }
         return this._xunZhangYangCheng_Mediator;
      }
      
      private function get targetPlaneMediator() : XunZhangYangCheng_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XunZhangYangCheng_TargetMediator.NAME) as XunZhangYangCheng_TargetMediator;
         }
         return this._targetMediator;
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
      
      public function received_61462(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("61462：返回勋章养成面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.id = param1.readInt();
            _loc5_.position = param1.readInt();
            _loc4_.push(_loc5_);
            _loc6_++;
         }
         if(_loc2_ == -1)
         {
            this.xunZhangYangChengMediator.setXunZhang(_loc4_);
         }
         else
         {
            this.targetPlaneMediator.setXunZhang(_loc4_);
         }
      }
      
      public function received_61466(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Goods = null;
         ZLog.add("61466：返回一键养成");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readShort();
            _loc5_ = param1.readInt();
            _loc6_ = param1.readByte();
            _loc7_ = param1.readByte();
            _loc8_ = param1.readByte();
            GameInstance.mainCharData.goodsInfo.deleteGoodsByPosition(_loc4_);
            _loc9_ = new Goods(_loc5_,_loc4_);
            _loc9_.bind = _loc8_;
            _loc9_.roleID = GameInstance.mainChar.id;
            _loc9_.position = _loc4_;
            GameInstance.mainCharData.goodsInfo.goodsBodyArr.push(_loc9_);
            _loc3_++;
         }
         this.xunZhangYangChengMediator.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
      }
   }
}

