package com.tgame.moudels.tulongdao.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.tulongdao.model.info.TuLongDaoVO;
   import com.tgame.moudels.tulongdao.view.TuLongDaoFuBen_Mediator;
   import com.tgame.moudels.tulongdao.view.TuLongDao_Mediator;
   import com.tgame.moudels.tulongdao.view.TuLongDao_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TuLongDao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TuLongDao_MsgReceivedProxy";
      
      private var vo:TuLongDaoVO;
      
      private var _fuBen_Mediator:TuLongDaoFuBen_Mediator;
      
      private var _mainChar_Mediator:TuLongDao_Mediator;
      
      private var _targetMediator:TuLongDao_TargetPanelMediator;
      
      public function TuLongDao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get fuBen_Mediator() : TuLongDaoFuBen_Mediator
      {
         if(!this._fuBen_Mediator)
         {
            this._fuBen_Mediator = facade.retrieveMediator(TuLongDaoFuBen_Mediator.NAME) as TuLongDaoFuBen_Mediator;
         }
         return this._fuBen_Mediator;
      }
      
      public function get mainChar_Mediator() : TuLongDao_Mediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(TuLongDao_Mediator.NAME) as TuLongDao_Mediator;
         }
         return this._mainChar_Mediator;
      }
      
      private function get targetPlaneMediator() : TuLongDao_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(TuLongDao_TargetPanelMediator.NAME) as TuLongDao_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74752,74754,74756,74770],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74752,74754,74756,74770],NAME);
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
      
      public function received_74752(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("74752\t\t屠龙刀信息返回");
         var _loc2_:int = param1.readInt();
         this.vo = new TuLongDaoVO();
         this.vo.MiaoShu = param1.readUTF();
         var _loc3_:* = param1.readByte();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.biaoshi = param1.readByte();
            _loc5_.dengji = param1.readInt();
            _loc5_.dangqianzhi = param1.readInt();
            _loc5_.zuidazhi = param1.readInt();
            _loc5_.guanzhu = Boolean(param1.readByte());
            _loc5_.jinjie = Boolean(param1.readByte());
            _loc5_.shuxingbyte1 = param1.readInt();
            _loc5_.shuxing1 = param1.readDouble();
            _loc5_.shuxingbyte2 = param1.readInt();
            _loc5_.shuxing2 = param1.readDouble();
            _loc5_.shuxingbyte3 = param1.readInt();
            _loc5_.shuxing3 = param1.readDouble();
            this.vo.TuLongArr.push(_loc5_);
            _loc4_++;
         }
         this.vo.nowID = param1.readInt();
         this.vo.tulongCount = param1.readInt();
         this.vo.xianShiBtn = Boolean(param1.readByte());
         this.vo.isWaiXian = Boolean(param1.readByte());
         this.vo.isJiHuo = Boolean(param1.readByte());
         this.vo.check1 = Boolean(param1.readByte());
         if(_loc2_ == -1)
         {
            this.mainChar_Mediator.upDataTuLongDaoPanel(this.vo);
         }
         else if(_loc2_ == GameInstance.lookPlayerID)
         {
            this.targetPlaneMediator.upDataTuLongDaoPanel(this.vo);
         }
      }
      
      public function received_74754(param1:ByteArray) : void
      {
         ZLog.add("74754\t\t屠龙刀领悟查询结果");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readByte();
         this.mainChar_Mediator.upDataLingWuPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_,_loc9_);
      }
      
      public function received_74756(param1:ByteArray) : void
      {
         ZLog.add("74756\t\t屠龙刀申请领悟结果");
         var _loc2_:int = param1.readByte();
         this.mainChar_Mediator.upDataTuLongDaoLVComplete(_loc2_);
      }
      
      public function received_74770(param1:ByteArray) : void
      {
         ZLog.add("74770\t\t进入屠龙刀副本时显示提示");
         var _loc2_:int = param1.readByte();
         this.fuBen_Mediator.showPanel(_loc2_);
      }
   }
}

