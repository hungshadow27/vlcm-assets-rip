package com.tgame.moudels.liumaishenjian.model
{
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.liumaishenjian.info.LiumaishenjianVO;
   import com.tgame.moudels.liumaishenjian.view.Liumaishenjian_Mediator;
   import com.tgame.moudels.liumaishenjian.view.Liumaishenjian_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Liumaishenjian_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Liumaishenjian_MsgReceivedProxy";
      
      private var mainCharLiumaishenjianVO:LiumaishenjianVO;
      
      private var targetCharLiumaishenjianVO:LiumaishenjianVO;
      
      private var _Liumaishenjian_Mediator:Liumaishenjian_Mediator;
      
      private var _targetMediator:Liumaishenjian_TargetMediator;
      
      public function Liumaishenjian_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get liumaishenjian_Mediator() : Liumaishenjian_Mediator
      {
         if(!this._Liumaishenjian_Mediator)
         {
            this._Liumaishenjian_Mediator = facade.retrieveMediator(Liumaishenjian_Mediator.NAME) as Liumaishenjian_Mediator;
         }
         return this._Liumaishenjian_Mediator;
      }
      
      private function get targetPlaneMediator() : Liumaishenjian_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(Liumaishenjian_TargetMediator.NAME) as Liumaishenjian_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([54402,54404,54406,54408,54410],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([54402,54404,54406,54408,54410],NAME);
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
      
      public function received_54402(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Skill = null;
         ZLog.add("54402：六脉神剑面板信息接收");
         if(!this.mainCharLiumaishenjianVO)
         {
            this.mainCharLiumaishenjianVO = new LiumaishenjianVO();
         }
         this.mainCharLiumaishenjianVO.shenjianAry = new Array();
         this.mainCharLiumaishenjianVO.shenjianNum = param1.readByte();
         var _loc2_:int = 0;
         while(_loc2_ < this.mainCharLiumaishenjianVO.shenjianNum)
         {
            _loc6_ = new Object();
            _loc6_.id = param1.readByte();
            _loc6_.name = param1.readUTF();
            this.mainCharLiumaishenjianVO.shenjianAry.push(_loc6_);
            _loc2_++;
         }
         this.mainCharLiumaishenjianVO.isLingwu = param1.readByte();
         this.mainCharLiumaishenjianVO.nowLookingShenjianID = param1.readByte();
         this.mainCharLiumaishenjianVO.nowLookingChongshuNum = param1.readByte();
         this.mainCharLiumaishenjianVO.lingWuNum = param1.readByte();
         this.mainCharLiumaishenjianVO.nowLingwuShenjianID = param1.readByte();
         this.mainCharLiumaishenjianVO.nowLingwuShenjianNum = param1.readByte();
         this.liumaishenjian_Mediator.isLingwu = this.mainCharLiumaishenjianVO.isLingwu;
         this.liumaishenjian_Mediator.jianId = this.mainCharLiumaishenjianVO.nowLookingShenjianID;
         this.liumaishenjian_Mediator.chongId = this.mainCharLiumaishenjianVO.nowLookingChongshuNum;
         this.liumaishenjian_Mediator.linwuId = this.mainCharLiumaishenjianVO.lingWuNum;
         this.mainCharLiumaishenjianVO.shuxingNumAry = new Array();
         var _loc3_:Object = new Object();
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.mp = param1.readInt();
         _loc3_.cp = param1.readInt();
         this.mainCharLiumaishenjianVO.shuxingNumAry.push(_loc3_);
         this.mainCharLiumaishenjianVO.shuxingNumTotalAry = new Array();
         var _loc4_:Object = new Object();
         _loc4_.actMax = param1.readInt();
         _loc4_.defMax = param1.readInt();
         _loc4_.hpMax = param1.readInt();
         _loc4_.mpMax = param1.readInt();
         _loc4_.cpMax = param1.readInt();
         this.mainCharLiumaishenjianVO.shuxingNumTotalAry.push(_loc4_);
         this.liumaishenjian_Mediator.shuxingAay = this.mainCharLiumaishenjianVO.shuxingNumTotalAry;
         this.mainCharLiumaishenjianVO.miaoshuFta = param1.readUTF();
         this.mainCharLiumaishenjianVO.skillCount = param1.readByte();
         this.mainCharLiumaishenjianVO.skillList = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < this.mainCharLiumaishenjianVO.skillCount)
         {
            this.mainCharLiumaishenjianVO.skillID = param1.readInt();
            this.mainCharLiumaishenjianVO.skillisLearn = param1.readByte();
            _loc7_ = new Skill(this.mainCharLiumaishenjianVO.skillID);
            _loc7_.isLearn = this.mainCharLiumaishenjianVO.skillisLearn;
            this.mainCharLiumaishenjianVO.skillList.push(_loc7_);
            _loc5_++;
         }
         this.liumaishenjian_Mediator.initializeMainUI(this.mainCharLiumaishenjianVO);
      }
      
      public function received_54404(param1:ByteArray) : void
      {
         ZLog.add("54404：六脉神剑切换查询返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         this.liumaishenjian_Mediator.jianId = _loc2_;
         this.liumaishenjian_Mediator.chongId = _loc3_;
         this.liumaishenjian_Mediator.linwuId = _loc4_;
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         var _loc13_:int = param1.readInt();
         var _loc14_:int = param1.readInt();
         this.liumaishenjian_Mediator.btnUpDataLiumaishenjianLV(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_);
      }
      
      public function received_54406(param1:ByteArray) : void
      {
         ZLog.add("54406：六脉神剑升级查询返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         this.liumaishenjian_Mediator.upDataLiumaishenjianLV(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
      }
      
      public function received_54408(param1:ByteArray) : void
      {
         ZLog.add("54408：六脉神剑成功失败");
         var _loc2_:int = param1.readByte();
         this.liumaishenjian_Mediator.upDataLiumaishenjianLVComplete(_loc2_);
      }
      
      public function received_54410(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         var _loc8_:Skill = null;
         ZLog.add("54410：他人六脉神剑面板信息接收");
         var _loc2_:int = param1.readInt();
         if(!this.targetCharLiumaishenjianVO)
         {
            this.targetCharLiumaishenjianVO = new LiumaishenjianVO();
         }
         this.targetCharLiumaishenjianVO.shenjianAry = new Array();
         this.targetCharLiumaishenjianVO.shenjianNum = param1.readByte();
         var _loc3_:int = 0;
         while(_loc3_ < this.targetCharLiumaishenjianVO.shenjianNum)
         {
            _loc7_ = new Object();
            _loc7_.id = param1.readByte();
            _loc7_.name = param1.readUTF();
            this.targetCharLiumaishenjianVO.shenjianAry.push(_loc7_);
            _loc3_++;
         }
         this.targetCharLiumaishenjianVO.isLingwu = param1.readByte();
         this.targetCharLiumaishenjianVO.nowLookingShenjianID = param1.readByte();
         this.targetCharLiumaishenjianVO.nowLookingChongshuNum = param1.readByte();
         this.targetCharLiumaishenjianVO.lingWuNum = param1.readByte();
         this.targetCharLiumaishenjianVO.nowLingwuShenjianID = param1.readByte();
         this.targetCharLiumaishenjianVO.nowLingwuShenjianNum = param1.readByte();
         this.targetPlaneMediator.jianId = this.targetCharLiumaishenjianVO.nowLookingShenjianID;
         this.targetPlaneMediator.chongId = this.targetCharLiumaishenjianVO.nowLookingChongshuNum;
         this.targetPlaneMediator.lingwuId = this.targetCharLiumaishenjianVO.lingWuNum;
         this.targetCharLiumaishenjianVO.shuxingNumAry = new Array();
         var _loc4_:Object = new Object();
         _loc4_.act = param1.readInt();
         _loc4_.def = param1.readInt();
         _loc4_.hp = param1.readInt();
         _loc4_.mp = param1.readInt();
         _loc4_.cp = param1.readInt();
         this.targetCharLiumaishenjianVO.shuxingNumAry.push(_loc4_);
         this.targetCharLiumaishenjianVO.shuxingNumTotalAry = new Array();
         var _loc5_:Object = new Object();
         _loc5_.actMax = param1.readInt();
         _loc5_.defMax = param1.readInt();
         _loc5_.hpMax = param1.readInt();
         _loc5_.mpMax = param1.readInt();
         _loc5_.cpMax = param1.readInt();
         this.targetCharLiumaishenjianVO.shuxingNumTotalAry.push(_loc5_);
         this.targetPlaneMediator.shuxingAry = this.targetCharLiumaishenjianVO.shuxingNumTotalAry;
         this.targetCharLiumaishenjianVO.miaoshuFta = param1.readUTF();
         this.targetCharLiumaishenjianVO.skillCount = param1.readByte();
         this.targetCharLiumaishenjianVO.skillList = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < this.targetCharLiumaishenjianVO.skillCount)
         {
            this.targetCharLiumaishenjianVO.skillID = param1.readInt();
            this.targetCharLiumaishenjianVO.skillisLearn = param1.readByte();
            _loc8_ = new Skill(this.targetCharLiumaishenjianVO.skillID);
            _loc8_.isLearn = this.targetCharLiumaishenjianVO.skillisLearn;
            this.targetCharLiumaishenjianVO.skillList.push(_loc8_);
            _loc6_++;
         }
         this.targetPlaneMediator.initializeMainUI(_loc2_,this.targetCharLiumaishenjianVO);
      }
   }
}

