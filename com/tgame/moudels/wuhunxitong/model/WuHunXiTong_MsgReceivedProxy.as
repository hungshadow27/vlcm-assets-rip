package com.tgame.moudels.wuhunxitong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.wuhunxitong.view.WuHunXiTong_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WuHunXiTong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "WuHunXiTong_MsgReceivedProxy";
      
      private var _mediator:WuHunXiTong_Mediator;
      
      public function WuHunXiTong_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([79662,79664,83212],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([79662,79664,83212],NAME);
      }
      
      private function get mediator() : WuHunXiTong_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(WuHunXiTong_Mediator.NAME) as WuHunXiTong_Mediator;
         }
         return this._mediator;
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
      
      public function received_79662(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("79662：返回武魂列表");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.id = param1.readByte();
            _loc5_.isHuoDe = Boolean(param1.readByte());
            _loc5_.name = param1.readUTF();
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.mediator.update(_loc3_);
      }
      
      public function received_79664(param1:ByteArray) : void
      {
         var _loc11_:int = 0;
         var _loc17_:int = 0;
         ZLog.add("79664：返回武魂详细信息");
         var _loc2_:Object = new Object();
         _loc2_.id = param1.readByte();
         _loc2_.isHuoDe = Boolean(param1.readByte());
         var _loc3_:Object = new Object();
         _loc3_.qinglong = param1.readInt();
         _loc3_.Maxqinglong = param1.readInt();
         _loc3_.baihu = param1.readInt();
         _loc3_.Maxbaihu = param1.readInt();
         _loc3_.zhuque = param1.readInt();
         _loc3_.Maxzhuque = param1.readInt();
         _loc3_.xuanwu = param1.readInt();
         _loc3_.Maxxuanwu = param1.readInt();
         _loc2_.lv = param1.readInt();
         _loc2_.now = param1.readInt();
         _loc2_.max = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:Boolean = Boolean(param1.readByte());
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:* = param1.readInt();
         var _loc10_:Array = [];
         _loc11_ = 0;
         while(_loc11_ < _loc9_)
         {
            _loc17_ = param1.readInt();
            _loc10_.push(_loc17_);
            _loc11_++;
         }
         var _loc12_:int = param1.readInt();
         var _loc13_:* = param1.readInt();
         var _loc14_:Array = [];
         _loc11_ = 0;
         while(_loc11_ < _loc13_)
         {
            _loc17_ = param1.readInt();
            _loc14_.push(_loc17_);
            _loc11_++;
         }
         var _loc15_:int = param1.readByte();
         var _loc16_:int = param1.readInt();
         this.mediator.setPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc10_,_loc12_,_loc14_);
         this.mediator.upDataAvatar(_loc15_,_loc16_);
      }
      
      public function received_83212(param1:ByteArray) : void
      {
         var _loc5_:String = null;
         ZLog.add("83212：返回乐透面板");
         var _loc2_:Object = new Object();
         _loc2_.times = param1.readInt();
         _loc2_.arr = new Array();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readUTF();
            _loc2_.arr.push(_loc5_);
            _loc4_++;
         }
         this.mediator.setLeTouData(_loc2_);
      }
   }
}

