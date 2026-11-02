package com.tgame.moudels.shiJieBei.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.shiJieBei.model.info.ShiJieBeiVO;
   import com.tgame.moudels.shiJieBei.view.ShiJieBei_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShiJieBei_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ShiJieBei_MsgReceivedProxy";
      
      private var _shiJieBei_Mediator:ShiJieBei_Mediator;
      
      public function ShiJieBei_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get shiJieBei_Mediator() : ShiJieBei_Mediator
      {
         if(!this._shiJieBei_Mediator)
         {
            this._shiJieBei_Mediator = facade.retrieveMediator(ShiJieBei_Mediator.NAME) as ShiJieBei_Mediator;
         }
         return this._shiJieBei_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73802,73812],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73802,73812],NAME);
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
      
      public function received_73802(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         var _loc10_:String = null;
         ZLog.add("73802\t\t返回世界杯排行榜信息");
         var _loc2_:ShiJieBeiVO = new ShiJieBeiVO();
         _loc2_.guoJiaArr = [];
         var _loc3_:int = param1.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc9_ = new Object();
            _loc9_.name = param1.readUTF();
            _loc9_.isOut = param1.readByte() == 0;
            _loc9_.id = param1.readByte();
            _loc2_.guoJiaArr.push(_loc9_);
            _loc4_++;
         }
         _loc2_.xiaZhu8Qiang = [];
         var _loc5_:int = param1.readByte();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc10_ = param1.readUTF();
            _loc2_.xiaZhu8Qiang.push(_loc10_);
            _loc4_++;
         }
         _loc2_.xiaZhu4Qiang = [];
         var _loc6_:int = param1.readByte();
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc10_ = param1.readUTF();
            _loc2_.xiaZhu4Qiang.push(_loc10_);
            _loc4_++;
         }
         _loc2_.xiaZhu2Qiang = [];
         var _loc7_:int = param1.readByte();
         _loc4_ = 0;
         while(_loc4_ < _loc7_)
         {
            _loc10_ = param1.readUTF();
            _loc2_.xiaZhu2Qiang.push(_loc10_);
            _loc4_++;
         }
         var _loc8_:int = param1.readByte();
         if(_loc8_ == 1)
         {
            _loc2_.xiaZhu1Qiang = param1.readUTF();
         }
         else
         {
            _loc2_.xiaZhu1Qiang = "";
         }
         _loc2_.qianLiangMing1 = param1.readByte();
         _loc2_.qianLiangMing2 = param1.readByte();
         _loc2_.guanJunId = param1.readByte();
         _loc2_.canXiaZhu8Qiang = param1.readByte() == 1;
         _loc2_.canXiaZhu4Qiang = param1.readByte() == 1;
         _loc2_.canXiaZhu2Qiang = param1.readByte() == 1;
         _loc2_.canXiaZhu1Qiang = param1.readByte() == 1;
         _loc2_.xiaZhuXiaoHao8 = param1.readInt();
         _loc2_.xiaZhuXiaoHao4 = param1.readInt();
         _loc2_.xiaZhuXiaoHao2 = param1.readInt();
         _loc2_.xiaZhuXiaoHao1 = param1.readInt();
         this.shiJieBei_Mediator.setGuanJunPanel(_loc2_);
      }
      
      public function received_73812(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("73812\t\t返回竞猜场次信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.id = param1.readByte();
            _loc5_.guoJiaName1 = param1.readUTF();
            _loc5_.guoJiaId1 = param1.readByte();
            _loc5_.guoJiaName2 = param1.readUTF();
            _loc5_.guoJiaId2 = param1.readByte();
            _loc5_.shaiZhi = param1.readUTF();
            _loc5_.time = param1.readUTF();
            _loc5_.xiaZhu = param1.readInt();
            _loc5_.status = param1.readInt();
            _loc5_.jieguo = param1.readByte();
            _loc5_.lingqu = param1.readByte();
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.shiJieBei_Mediator.setJiangCaiPanel(_loc3_);
      }
   }
}

