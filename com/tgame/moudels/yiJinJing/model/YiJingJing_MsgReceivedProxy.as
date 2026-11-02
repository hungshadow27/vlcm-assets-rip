package com.tgame.moudels.yiJinJing.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yiJinJing.model.info.YiJinJingVO;
   import com.tgame.moudels.yiJinJing.view.YiJinJing_Mediator;
   import com.tgame.moudels.yiJinJing.view.YiJinJing_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YiJingJing_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YiJingJing_MsgReceivedProxy";
      
      private var mainCharYiJingJingVO:YiJinJingVO;
      
      private var targetCharYiJinJingVO:YiJinJingVO;
      
      private var _YiJinJing_Mediator:YiJinJing_Mediator;
      
      private var _targetMediator:YiJinJing_TargetPanelMediator;
      
      public function YiJingJing_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get yiJinJing_Mediator() : YiJinJing_Mediator
      {
         if(!this._YiJinJing_Mediator)
         {
            this._YiJinJing_Mediator = facade.retrieveMediator(YiJinJing_Mediator.NAME) as YiJinJing_Mediator;
         }
         return this._YiJinJing_Mediator;
      }
      
      private function get targetPlaneMediator() : YiJinJing_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(YiJinJing_TargetPanelMediator.NAME) as YiJinJing_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([51952,51954,51956,51958],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([51952,51954,51956,51958],NAME);
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
      
      public function received_51952(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("51952：易筋经面板信息接收");
         if(!this.mainCharYiJingJingVO)
         {
            this.mainCharYiJingJingVO = new YiJinJingVO();
         }
         this.mainCharYiJingJingVO.nowID = param1.readInt();
         this.mainCharYiJingJingVO.nowLookingID = param1.readInt();
         this.mainCharYiJingJingVO.nowLookingName = param1.readUTF();
         this.mainCharYiJingJingVO.isKnow = param1.readByte() == 0 ? false : true;
         this.mainCharYiJingJingVO.act = param1.readInt();
         this.mainCharYiJingJingVO.def = param1.readInt();
         this.mainCharYiJingJingVO.hp = param1.readInt();
         this.mainCharYiJingJingVO.mp = param1.readInt();
         this.mainCharYiJingJingVO.cp = param1.readInt();
         var _loc2_:int = param1.readByte();
         this.mainCharYiJingJingVO.otherSkillNameArr = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            _loc5_ = param1.readInt();
            this.mainCharYiJingJingVO.otherSkillNameArr.push([new Skill(_loc4_),_loc5_]);
            _loc3_++;
         }
         this.mainCharYiJingJingVO.skillID = param1.readInt();
         this.mainCharYiJingJingVO.isUseSkill = param1.readByte() == 0 ? false : true;
         this.mainCharYiJingJingVO.defTime = param1.readInt();
         this.mainCharYiJingJingVO.isZhongJi = param1.readByte() == 1;
         this.mainCharYiJingJingVO.baoliandeng = param1.readByte() == 1;
         this.mainCharYiJingJingVO.sanshengmu = param1.readByte() == 1;
         this.mainCharYiJingJingVO.skill = GameInstance.mainCharData.skillInfo.getSkillByID(this.mainCharYiJingJingVO.skillID);
         this.yiJinJing_Mediator.upDataPanel(this.mainCharYiJingJingVO);
      }
      
      public function received_51954(param1:ByteArray) : void
      {
         ZLog.add("51954：易筋经升级查询返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:String = param1.readUTF();
         this.yiJinJing_Mediator.upDataYiJinJignLV(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
      }
      
      public function received_51956(param1:ByteArray) : void
      {
         ZLog.add("51956：易筋经成功失败");
         var _loc2_:int = param1.readByte();
         this.yiJinJing_Mediator.upDataYiJinJignLVComplete(_loc2_);
      }
      
      public function received_51958(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         ZLog.add("51958：他人易筋经面板信息接收");
         var _loc2_:int = param1.readInt();
         if(!this.targetCharYiJinJingVO)
         {
            this.targetCharYiJinJingVO = new YiJinJingVO();
         }
         this.targetCharYiJinJingVO.nowID = this.targetCharYiJinJingVO.nowID;
         this.targetCharYiJinJingVO.nowLookingID = param1.readInt();
         this.targetCharYiJinJingVO.nowLookingName = param1.readUTF();
         this.targetCharYiJinJingVO.isKnow = true;
         this.targetCharYiJinJingVO.act = param1.readInt();
         this.targetCharYiJinJingVO.def = param1.readInt();
         this.targetCharYiJinJingVO.hp = param1.readInt();
         this.targetCharYiJinJingVO.mp = param1.readInt();
         this.targetCharYiJinJingVO.cp = param1.readInt();
         var _loc3_:int = param1.readByte();
         this.targetCharYiJinJingVO.otherSkillNameArr = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            this.targetCharYiJinJingVO.otherSkillNameArr.push([new Skill(_loc5_),_loc6_]);
            _loc4_++;
         }
         this.targetCharYiJinJingVO.skillID = param1.readInt();
         this.targetCharYiJinJingVO.isUseSkill = param1.readByte() == 0 ? false : true;
         this.targetCharYiJinJingVO.defTime = param1.readInt();
         this.targetCharYiJinJingVO.isZhongJi = param1.readByte() == 1;
         this.targetCharYiJinJingVO.baoliandeng = param1.readByte() == 1;
         this.targetCharYiJinJingVO.sanshengmu = param1.readByte() == 1;
         this.targetCharYiJinJingVO.skill = new Skill(this.targetCharYiJinJingVO.skillID);
         this.targetCharYiJinJingVO.skill.isLearn = this.targetCharYiJinJingVO.isUseSkill ? 1 : 0;
         this.targetPlaneMediator.upDataPanel(_loc2_,this.targetCharYiJinJingVO);
      }
   }
}

