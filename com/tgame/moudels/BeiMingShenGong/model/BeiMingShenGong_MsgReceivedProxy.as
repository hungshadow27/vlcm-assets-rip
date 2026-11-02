package com.tgame.moudels.BeiMingShenGong.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.BeiMingShenGong.model.info.BeiMingShenGongVO;
   import com.tgame.moudels.BeiMingShenGong.view.BeiMingShenGong_Mediator;
   import com.tgame.moudels.BeiMingShenGong.view.BeiMingShenGong_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BeiMingShenGong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "BeiMingShenGong_MsgReceivedProxy";
      
      private var mainBeiMingShenGongVO:BeiMingShenGongVO;
      
      private var _mainChar_Mediator:BeiMingShenGong_Mediator;
      
      private var _targetMediator:BeiMingShenGong_TargetPanelMediator;
      
      public function BeiMingShenGong_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mainChar_Mediator() : BeiMingShenGong_Mediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(BeiMingShenGong_Mediator.NAME) as BeiMingShenGong_Mediator;
         }
         return this._mainChar_Mediator;
      }
      
      private function get targetPlaneMediator() : BeiMingShenGong_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(BeiMingShenGong_TargetPanelMediator.NAME) as BeiMingShenGong_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([56102,56104,56106,56108],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([56102,56104,56106,56108],NAME);
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
      
      public function received_56102(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         ZLog.add("56102：北冥神功 信息返回");
         _loc2_ = param1.readInt();
         this.mainBeiMingShenGongVO = new BeiMingShenGongVO();
         this.mainBeiMingShenGongVO.nowID = param1.readByte();
         this.mainBeiMingShenGongVO.nowLookingID = param1.readByte();
         this.mainBeiMingShenGongVO.nowLookingName = param1.readUTF();
         this.mainBeiMingShenGongVO.curMiaoShu = param1.readUTF();
         this.mainBeiMingShenGongVO.isKnow = param1.readByte() == 1;
         this.mainBeiMingShenGongVO.isUseJiNeng = param1.readByte() == 1;
         this.mainBeiMingShenGongVO.act = param1.readInt();
         this.mainBeiMingShenGongVO.def = param1.readInt();
         this.mainBeiMingShenGongVO.hp = param1.readInt();
         this.mainBeiMingShenGongVO.mp = param1.readInt();
         this.mainBeiMingShenGongVO.curJingMai = param1.readInt();
         this.mainBeiMingShenGongVO.maxJingMai = param1.readInt();
         this.mainBeiMingShenGongVO.jingMaiMiaoShu = param1.readUTF();
         this.mainBeiMingShenGongVO.curQiHai = param1.readInt();
         this.mainBeiMingShenGongVO.maxQiHai = param1.readInt();
         this.mainBeiMingShenGongVO.qiHaiMiaoShu = param1.readUTF();
         this.mainBeiMingShenGongVO.curDanTian = param1.readInt();
         this.mainBeiMingShenGongVO.maxDanTian = param1.readInt();
         this.mainBeiMingShenGongVO.danTianMiaoShu = param1.readUTF();
         this.mainBeiMingShenGongVO.curRouShen = param1.readInt();
         this.mainBeiMingShenGongVO.maxRouShen = param1.readInt();
         this.mainBeiMingShenGongVO.rouShenMiaoShu = param1.readUTF();
         this.mainBeiMingShenGongVO.jiNengId = param1.readInt();
         this.mainBeiMingShenGongVO.jiNengMiaoShu = param1.readUTF();
         this.mainBeiMingShenGongVO.miaoshu = param1.readUTF();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         this.mainBeiMingShenGongVO.isCanUse = param1.readByte() == 1;
         this.mainBeiMingShenGongVO.skill = GameInstance.mainCharData.skillInfo.getSkillByID(this.mainBeiMingShenGongVO.jiNengId);
         this.mainBeiMingShenGongVO.isUseDan = Boolean(param1.readByte() == 1);
         this.mainBeiMingShenGongVO.wuJiGongFa = Boolean(param1.readByte() == 1);
         this.mainBeiMingShenGongVO.isHuanZhuang = Boolean(param1.readByte() == 1);
         this.mainBeiMingShenGongVO.isWuQi = Boolean(param1.readByte() == 1);
         this.mainBeiMingShenGongVO.isDanTian = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mainChar_Mediator.upDataBeiMingShenGongPanel(this.mainBeiMingShenGongVO,_loc4_,_loc3_);
         }
         else if(_loc2_ == GameInstance.lookPlayerID)
         {
            this.targetPlaneMediator.upDataBeiMingShenGongPanel(this.mainBeiMingShenGongVO,_loc4_,_loc3_);
         }
      }
      
      public function received_56104(param1:ByteArray) : void
      {
         ZLog.add("56104：北冥神功领悟查询结果");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         this.mainChar_Mediator.upDataLingWuPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_56106(param1:ByteArray) : void
      {
         ZLog.add("56106：北冥神功申请领悟结果");
         var _loc2_:int = param1.readByte();
         this.mainChar_Mediator.upDataBeiMingShenGongLVComplete(_loc2_);
      }
      
      public function received_56108(param1:ByteArray) : void
      {
         ZLog.add("56108：北冥神功设置武功开启结果");
         var _loc2_:int = param1.readByte();
         this.mainChar_Mediator.upDataJiNengStatus(_loc2_);
      }
   }
}

