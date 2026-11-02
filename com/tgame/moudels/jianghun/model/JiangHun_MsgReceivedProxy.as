package com.tgame.moudels.jianghun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jianghun.view.JiangHun_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JiangHun_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "JiangHun_MsgReceivedProxy";
      
      private var _mainChar_Mediator:JiangHun_Mediator;
      
      public function JiangHun_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mainChar_Mediator() : JiangHun_Mediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(JiangHun_Mediator.NAME) as JiangHun_Mediator;
         }
         return this._mainChar_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([81642,81644,81782,81784,81812,82552,82554],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([81642,81644,81782,81784,81812,82552,82554],NAME);
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
      
      public function received_81642(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         ZLog.add("81642\t\t将魂信息返回");
         var _loc2_:Object = new Object();
         _loc2_.currP = param1.readInt();
         _loc2_.maxP = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = 0;
         _loc2_.arrWu = new Array();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.index = param1.readInt();
            _loc2_.arrWu.push(_loc5_);
            _loc4_++;
         }
         _loc2_.index = param1.readInt();
         _loc2_.miaoShu = param1.readUTF();
         _loc2_.isJiHuo = param1.readByte();
         if(_loc2_.isJiHuo)
         {
            _loc2_.currPro = param1.readInt();
            _loc2_.maxPro = param1.readInt();
            _loc2_.isChuZhan = param1.readByte();
            _loc2_.rank = param1.readInt();
            _loc2_.numBenCi = param1.readInt();
            _loc2_.numShengYu = param1.readInt();
            _loc2_.isXiaoHao = param1.readByte();
            _loc6_ = param1.readInt();
            _loc2_.arrSkill = new Array();
            _loc4_ = 0;
            while(_loc4_ < _loc6_)
            {
               _loc7_ = new Object();
               _loc7_.skillID = param1.readInt();
               _loc7_.isLearn = param1.readByte();
               _loc2_.arrSkill.push(_loc7_);
               _loc4_++;
            }
            _loc2_.isJieFeng1 = Boolean(param1.readByte());
            _loc2_.isJieFeng2 = Boolean(param1.readByte());
         }
         _loc2_.check1 = Boolean(param1.readByte());
         _loc2_.check2 = Boolean(param1.readByte());
         _loc2_.check3 = Boolean(param1.readByte());
         _loc2_.check4 = Boolean(param1.readByte());
         _loc2_.checkZhaoYun6 = Boolean(param1.readByte());
         _loc2_.checkZhangFei7 = Boolean(param1.readByte());
         _loc2_.checkGuanYu13 = Boolean(param1.readByte());
         _loc2_.checkZhangFei12 = Boolean(param1.readByte());
         _loc2_.checkZhangFei13 = Boolean(param1.readByte());
         _loc2_.checkHuangZhong13 = Boolean(param1.readByte());
         _loc2_.checkZhaoYun16 = Boolean(param1.readByte());
         _loc2_.checkZhaoYun17 = Boolean(param1.readByte());
         _loc2_.checkZhaoYun18 = Boolean(param1.readByte());
         _loc2_.checkHuangZhong16 = Boolean(param1.readByte());
         _loc2_.checkZhangFei16 = Boolean(param1.readByte());
         _loc2_.checkZhangFei23 = Boolean(param1.readByte());
         this.mainChar_Mediator.setJiangHunData(_loc2_);
      }
      
      public function received_81644(param1:ByteArray) : void
      {
         ZLog.add("81644\t\t将魂信息返回");
         var _loc2_:int = param1.readByte();
         this.mainChar_Mediator.setSucessed(_loc2_);
      }
      
      public function received_81782(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         ZLog.add("81782\t\t将魂信息返回");
         var _loc2_:Object = new Object();
         _loc2_.currP = param1.readInt();
         _loc2_.maxP = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = 0;
         _loc2_.arrWu = new Array();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.index = param1.readInt();
            _loc2_.arrWu.push(_loc5_);
            _loc4_++;
         }
         _loc2_.index = param1.readInt();
         _loc2_.miaoShu = param1.readUTF();
         _loc2_.isJiHuo = param1.readByte();
         if(_loc2_.isJiHuo)
         {
            _loc2_.currPro = param1.readInt();
            _loc2_.maxPro = param1.readInt();
            _loc2_.isChuZhan = param1.readByte();
            _loc2_.rank = param1.readInt();
            _loc2_.numBenCi = param1.readInt();
            _loc2_.numShengYu = param1.readInt();
            _loc2_.isXiaoHao = param1.readByte();
            _loc6_ = param1.readInt();
            _loc2_.arrSkill = new Array();
            _loc4_ = 0;
            while(_loc4_ < _loc6_)
            {
               _loc7_ = new Object();
               _loc7_.skillID = param1.readInt();
               _loc7_.isLearn = param1.readByte();
               _loc2_.arrSkill.push(_loc7_);
               _loc4_++;
            }
            _loc2_.numYin = param1.readByte();
            _loc2_.numYang = param1.readByte();
            _loc2_.isJieFeng1 = Boolean(param1.readByte());
            _loc2_.isJieFeng2 = Boolean(param1.readByte());
         }
         this.mainChar_Mediator.setJiangHunCNData(_loc2_);
      }
      
      public function received_81784(param1:ByteArray) : void
      {
         ZLog.add("81784\t\t将魂信息返回");
         var _loc2_:int = param1.readByte();
         this.mainChar_Mediator.setSucessedCN(_loc2_);
      }
      
      public function received_81812(param1:ByteArray) : void
      {
         ZLog.add("81812\t\t纯净专属积分商城信息返回");
         var _loc2_:Object = new Object();
         _loc2_.value = param1.readInt();
         _loc2_.arr = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < 6)
         {
            _loc2_.arr.push(param1.readByte());
            _loc3_++;
         }
      }
      
      public function received_82552(param1:ByteArray) : void
      {
         ZLog.add("82552:九劫星图");
         var _loc2_:Object = new Object();
         _loc2_.page = param1.readByte();
         _loc2_.addPercent = param1.readByte();
         _loc2_.addattack = param1.readInt();
         _loc2_.additionalattack = param1.readInt();
         _loc2_.currPro = param1.readByte();
         _loc2_.endPro = param1.readByte();
         _loc2_.goodsID = param1.readInt();
         _loc2_.goodsNum = param1.readInt();
         this.mainChar_Mediator.setJiuJieXingTuData(_loc2_);
      }
      
      public function received_82554(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("82554:九劫星图日常任务");
         var _loc2_:Object = new Object();
         var _loc3_:int = param1.readByte();
         _loc2_.arr = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.currNum = param1.readInt();
            _loc5_.maxNum = param1.readInt();
            _loc2_.arr.push(_loc5_);
            _loc4_++;
         }
         _loc2_.isRecieved = param1.readByte();
         this.mainChar_Mediator.setJiuJieXingTuTaskData(_loc2_);
      }
   }
}

