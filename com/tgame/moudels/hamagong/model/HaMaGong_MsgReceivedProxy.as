package com.tgame.moudels.hamagong.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.hamagong.info.HaMaGongVO;
   import com.tgame.moudels.hamagong.view.HaMaGong_Mediator;
   import com.tgame.moudels.hamagong.view.HaMaGong_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HaMaGong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "HaMaGong_MsgReceivedProxy";
      
      private var mainCharYiJingJingVO:HaMaGongVO;
      
      private var targetCharYiJinJingVO:HaMaGongVO;
      
      private var _hamagong_Mediator:HaMaGong_Mediator;
      
      private var _targetMediator:HaMaGong_TargetMediator;
      
      public function HaMaGong_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get hamagong_Mediator() : HaMaGong_Mediator
      {
         if(!this._hamagong_Mediator)
         {
            this._hamagong_Mediator = facade.retrieveMediator(HaMaGong_Mediator.NAME) as HaMaGong_Mediator;
         }
         return this._hamagong_Mediator;
      }
      
      private function get targetPlaneMediator() : HaMaGong_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(HaMaGong_TargetMediator.NAME) as HaMaGong_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([58802,58804,58806,58808],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([58802,58804,58806,58808],NAME);
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
      
      public function received_58802(param1:ByteArray) : void
      {
         ZLog.add("58802：蛤蟆功面板信息接收");
         if(!this.mainCharYiJingJingVO)
         {
            this.mainCharYiJingJingVO = new HaMaGongVO();
         }
         this.mainCharYiJingJingVO.nowID = param1.readInt();
         this.mainCharYiJingJingVO.nowLookingID = param1.readInt();
         this.mainCharYiJingJingVO.nowLookingName = param1.readUTF();
         this.mainCharYiJingJingVO.isKnow = param1.readByte() == 0 ? false : true;
         this.mainCharYiJingJingVO.act = param1.readInt();
         this.mainCharYiJingJingVO.skillID = param1.readInt();
         this.mainCharYiJingJingVO.isUseSkill = param1.readByte() == 0 ? false : true;
         this.mainCharYiJingJingVO.skill = GameInstance.mainCharData.skillInfo.getSkillByID(this.mainCharYiJingJingVO.skillID);
         this.mainCharYiJingJingVO.isUse = param1.readByte() == 0 ? false : true;
         this.mainCharYiJingJingVO.yuDuGong = param1.readByte() == 0 ? false : true;
         this.mainCharYiJingJingVO.chuanyi = param1.readByte() == 0 ? false : true;
         this.hamagong_Mediator.upDataPanel(this.mainCharYiJingJingVO);
      }
      
      public function received_58804(param1:ByteArray) : void
      {
         ZLog.add("58804：蛤蟆功升级查询返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         this.hamagong_Mediator.upDataYiJinJignLV(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
      }
      
      public function received_58806(param1:ByteArray) : void
      {
         ZLog.add("58806：蛤蟆功成功失败");
         var _loc2_:int = param1.readByte();
         this.hamagong_Mediator.upDataYiJinJignLVComplete(_loc2_);
      }
      
      public function received_58808(param1:ByteArray) : void
      {
         ZLog.add("58808：他人蛤蟆功面板信息接收");
         var _loc2_:int = param1.readInt();
         if(!this.targetCharYiJinJingVO)
         {
            this.targetCharYiJinJingVO = new HaMaGongVO();
         }
         this.targetCharYiJinJingVO.nowID = param1.readInt();
         this.targetCharYiJinJingVO.nowLookingID = param1.readInt();
         this.targetCharYiJinJingVO.nowLookingName = param1.readUTF();
         this.targetCharYiJinJingVO.isKnow = param1.readByte() == 0 ? false : true;
         this.targetCharYiJinJingVO.act = param1.readInt();
         this.targetCharYiJinJingVO.skillID = param1.readInt();
         this.targetCharYiJinJingVO.isUseSkill = param1.readByte() == 0 ? false : true;
         this.targetCharYiJinJingVO.skill = GameInstance.mainCharData.skillInfo.getSkillByID(this.targetCharYiJinJingVO.skillID);
         this.targetCharYiJinJingVO.isUse = param1.readByte() == 0 ? false : true;
         this.targetCharYiJinJingVO.yuDuGong = param1.readByte() == 0 ? false : true;
         this.targetCharYiJinJingVO.chuanyi = param1.readByte() == 0 ? false : true;
         this.targetPlaneMediator.upDataPanel(_loc2_,this.targetCharYiJinJingVO);
      }
   }
}

