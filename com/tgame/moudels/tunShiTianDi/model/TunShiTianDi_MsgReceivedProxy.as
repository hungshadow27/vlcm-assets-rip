package com.tgame.moudels.tunShiTianDi.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.tunShiTianDi.view.TunShiTianDiResult_Mediator;
   import com.tgame.moudels.tunShiTianDi.view.TunShiTianDi_Mediator;
   import com.tgame.moudels.tunShiTianDi.view.TunShiTianZhenRong_Mediator;
   import com.tgame.moudels.tunShiTianDi.view.info.ShuXingJiaChen;
   import com.tgame.moudels.tunShiTianDi.view.info.TunShiTianDiVo;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TunShiTianDi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TunShiTianDi_MsgReceivedProxy";
      
      private var _tunShiTianDiMediator:TunShiTianDi_Mediator;
      
      private var _zhenRongMediator:TunShiTianZhenRong_Mediator;
      
      private var _tunShiTianDiResult_Mediator:TunShiTianDiResult_Mediator;
      
      public function TunShiTianDi_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73952,73954,73972,73982,73984,73998,73986,73988,73996,73976],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73952,73954,73972,73982,73984,73998,73986,73988,73996,73976],NAME);
      }
      
      private function get tunShiTianDiMediator() : TunShiTianDi_Mediator
      {
         if(this._tunShiTianDiMediator == null)
         {
            this._tunShiTianDiMediator = facade.retrieveMediator(TunShiTianDi_Mediator.NAME) as TunShiTianDi_Mediator;
         }
         return this._tunShiTianDiMediator;
      }
      
      private function get zhenRongMediator() : TunShiTianZhenRong_Mediator
      {
         if(this._zhenRongMediator == null)
         {
            this._zhenRongMediator = facade.retrieveMediator(TunShiTianZhenRong_Mediator.NAME) as TunShiTianZhenRong_Mediator;
         }
         return this._zhenRongMediator;
      }
      
      private function get tunShiTianDiResult_Mediator() : TunShiTianDiResult_Mediator
      {
         if(this._tunShiTianDiResult_Mediator == null)
         {
            this._tunShiTianDiResult_Mediator = facade.retrieveMediator(TunShiTianDiResult_Mediator.NAME) as TunShiTianDiResult_Mediator;
         }
         return this._tunShiTianDiResult_Mediator;
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
      
      public function received_73952(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("73952\t\t返回吞食天地信息");
         var _loc2_:TunShiTianDiVo = new TunShiTianDiVo();
         _loc2_.paiMing = param1.readInt();
         _loc2_.jiFen = param1.readInt();
         _loc2_.sumCount = param1.readInt();
         _loc2_.winCount = param1.readInt();
         _loc2_.isWaiting = param1.readByte() == 1;
         var _loc3_:int = param1.readByte();
         _loc2_.playerArr = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.index = param1.readByte();
            _loc5_.pingTai = param1.readInt();
            _loc5_.quFu = param1.readInt();
            _loc5_.name = param1.readUTF();
            _loc5_.diZhiName = param1.readUTF();
            _loc5_.partyID = param1.readByte();
            _loc6_ = param1.readByte();
            _loc5_.equipArr = [];
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc5_.equipArr.push(param1.readInt());
               _loc7_++;
            }
            _loc2_.playerArr.push(_loc5_);
            _loc4_++;
         }
         this.tunShiTianDiMediator.setTunShiTianDiPanel(_loc2_);
      }
      
      public function received_73954(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("73954\t\t返回排行榜信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = param1.readByte();
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = new Object();
            _loc8_.paiMing = param1.readInt();
            _loc8_.name = param1.readUTF();
            _loc8_.diZhiName = param1.readUTF();
            _loc8_.pingTai = param1.readInt();
            _loc8_.jiFen = param1.readInt();
            _loc8_.shengLv = param1.readInt();
            _loc5_.push(_loc8_);
            _loc7_++;
         }
         this.tunShiTianDiMediator.setPaiHangBangPanel(_loc2_,_loc3_,_loc5_,_loc4_);
      }
      
      public function received_73972(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("73972\t\t显示玩家队伍角色选择信息");
         var _loc2_:Boolean = param1.readByte() == 1;
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc8_ = new Object();
            _loc8_.zhenYing = param1.readByte();
            _loc8_.name = param1.readUTF();
            _loc8_.zhiye = param1.readByte();
            _loc4_.push(_loc8_);
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         var _loc7_:Boolean = param1.readByte() > 0;
         this.zhenRongMediator.setPanel(_loc2_,_loc7_,_loc6_,_loc4_);
      }
      
      public function received_73976(param1:ByteArray) : void
      {
         ZLog.add("73976\t\t返回特定职业属性加成");
         var _loc2_:int = param1.readByte();
         var _loc3_:ShuXingJiaChen = new ShuXingJiaChen();
         _loc3_.ap = param1.readInt();
         _loc3_.dp = param1.readInt();
         _loc3_.cp = param1.readInt();
         _loc3_.ev = param1.readInt();
         _loc3_.sm = param1.readInt();
         _loc3_.mdx = param1.readInt();
         _loc3_.adx = param1.readInt();
         _loc3_.addAp = param1.readInt();
         _loc3_.addDp = param1.readInt();
         _loc3_.addCp = param1.readInt();
         _loc3_.addEv = param1.readInt();
         _loc3_.addSm = param1.readInt();
         _loc3_.addMdx = param1.readInt();
         _loc3_.addAdx = param1.readInt();
         this.zhenRongMediator.setAddValue(_loc3_);
      }
      
      public function received_73984(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("73984\t\t设置主界面技能等级");
         var _loc2_:Boolean = param1.readByte() == 1;
         GameInstance.uiInstance.mainUI.setSkillBarVisible(_loc2_);
         if(_loc2_)
         {
            _loc3_ = param1.readByte();
            _loc4_ = param1.readByte();
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            GameInstance.uiInstance.mainUI.setSkillBarType(_loc3_);
            GameInstance.uiInstance.mainUI.setSkillBarValue(_loc4_,_loc5_,_loc6_,_loc7_);
         }
      }
      
      public function received_73998(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         ZLog.add("73998\t\t设置比分显示吞食天地");
         var _loc2_:Boolean = param1.readByte() == 1;
         GameInstance.uiInstance.mainUI.showTunShiTianDiFenShu(_loc2_);
         if(_loc2_)
         {
            _loc3_ = param1.readInt();
            _loc4_ = param1.readInt();
            GameInstance.uiInstance.mainUI.setTunShiTianDiFenShu(_loc3_,_loc4_);
         }
      }
      
      public function received_73996(param1:ByteArray) : void
      {
      }
      
      public function received_73986(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         ZLog.add("73986\t\t显示比赛结果面板");
         var _loc2_:Boolean = param1.readByte() == 1;
         if(_loc2_)
         {
            _loc3_ = param1.readInt();
            _loc4_ = param1.readInt();
            _loc5_ = [];
            _loc6_ = param1.readByte();
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc11_ = new Object();
               _loc11_.index = param1.readByte();
               _loc11_.name = param1.readUTF();
               _loc11_.socre = param1.readInt();
               _loc5_.push(_loc11_);
               _loc7_++;
            }
            _loc8_ = [];
            _loc9_ = param1.readByte();
            _loc7_ = 0;
            while(_loc7_ < _loc9_)
            {
               _loc11_ = new Object();
               _loc11_.index = param1.readByte();
               _loc11_.name = param1.readUTF();
               _loc11_.socre = param1.readInt();
               _loc8_.push(_loc11_);
               _loc7_++;
            }
            _loc10_ = param1.readByte();
            this.tunShiTianDiResult_Mediator.showResultPanel(_loc2_);
            this.tunShiTianDiResult_Mediator.setResultPanel(_loc3_,_loc4_,_loc5_,_loc8_,_loc10_);
         }
         else
         {
            this.tunShiTianDiResult_Mediator.showResultPanel(_loc2_);
         }
      }
      
      public function received_73988(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         ZLog.add("73988\t\t吃积分倒计时");
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = _loc2_.readByte() == 1;
         if(_loc3_)
         {
            _loc4_ = _loc2_.readByte();
            SmallLoadingBar.showLoading(LanResManager.getLanCommonTextWords("争夺积分中"),_loc4_ * 1000);
         }
         else
         {
            SmallLoadingBar.close();
         }
      }
   }
}

