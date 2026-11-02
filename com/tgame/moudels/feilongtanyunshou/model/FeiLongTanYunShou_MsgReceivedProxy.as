package com.tgame.moudels.feilongtanyunshou.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.feilongtanyunshou.model.info.FeiLongTanYunShouVO;
   import com.tgame.moudels.feilongtanyunshou.view.FeiLongTanYunShou_Mediator;
   import com.tgame.moudels.feilongtanyunshou.view.FeiLongTanYunShou_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class FeiLongTanYunShou_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "FeiLongTanYunShou_MsgReceivedProxy";
      
      private var mainCharYiJingJingVO:FeiLongTanYunShouVO;
      
      private var targetCharYiJinJingVO:FeiLongTanYunShouVO;
      
      private var _feiLongTanYunShou_Mediator:FeiLongTanYunShou_Mediator;
      
      private var _targetMediator:FeiLongTanYunShou_TargetPanelMediator;
      
      public function FeiLongTanYunShou_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get feiLongTanYunShou_Mediator() : FeiLongTanYunShou_Mediator
      {
         if(!this._feiLongTanYunShou_Mediator)
         {
            this._feiLongTanYunShou_Mediator = facade.retrieveMediator(FeiLongTanYunShou_Mediator.NAME) as FeiLongTanYunShou_Mediator;
         }
         return this._feiLongTanYunShou_Mediator;
      }
      
      private function get targetPlaneMediator() : FeiLongTanYunShou_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(FeiLongTanYunShou_TargetPanelMediator.NAME) as FeiLongTanYunShou_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53952,53954,53956,53958,53964],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53952,53954,53956,53958,53964],NAME);
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
      
      public function received_53952(param1:ByteArray) : void
      {
         ZLog.add("53952：飞龙探月手面板信息接收");
         if(!this.mainCharYiJingJingVO)
         {
            this.mainCharYiJingJingVO = new FeiLongTanYunShouVO();
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
         this.mainCharYiJingJingVO.skillID = param1.readInt();
         this.mainCharYiJingJingVO.MiaoShu = param1.readUTF();
         this.mainCharYiJingJingVO.isUseSkill = param1.readByte() == 0 ? false : true;
         this.mainCharYiJingJingVO.skill = GameInstance.mainCharData.skillInfo.getSkillByID(this.mainCharYiJingJingVO.skillID);
         this.mainCharYiJingJingVO.jihuoJindu = param1.readInt();
         this.mainCharYiJingJingVO.addJihuoGongji = param1.readInt();
         this.mainCharYiJingJingVO.addJihuoFangyu = param1.readInt();
         this.mainCharYiJingJingVO.addJihuoShengming = param1.readInt();
         this.mainCharYiJingJingVO.zhongJi = param1.readByte() == 1;
         this.mainCharYiJingJingVO.lkzx = param1.readByte();
         param1.readInt();
         param1.readInt();
         param1.readInt();
         param1.readInt();
         param1.readInt();
         this.mainCharYiJingJingVO.isDanTian = param1.readByte();
         this.mainCharYiJingJingVO.YN_Qixuan = Boolean(param1.readByte());
         this.mainCharYiJingJingVO.YN_QixuanState = Boolean(param1.readByte());
         this.feiLongTanYunShou_Mediator.upDataFeilongJindu(this.mainCharYiJingJingVO);
         this.feiLongTanYunShou_Mediator.upDataPanel(this.mainCharYiJingJingVO);
      }
      
      public function received_53954(param1:ByteArray) : void
      {
         ZLog.add("53954：飞龙探月手升级查询返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         this.feiLongTanYunShou_Mediator.upDataYiJinJignLV(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
      }
      
      public function received_53956(param1:ByteArray) : void
      {
         ZLog.add("53956：飞龙探月手成功失败");
         var _loc2_:int = param1.readByte();
         this.feiLongTanYunShou_Mediator.upDataYiJinJignLVComplete(_loc2_);
      }
      
      public function received_53958(param1:ByteArray) : void
      {
         ZLog.add("53958：他人飞龙探月手面板信息接收");
         var _loc2_:int = param1.readInt();
         if(!this.targetCharYiJinJingVO)
         {
            this.targetCharYiJinJingVO = new FeiLongTanYunShouVO();
         }
         this.targetCharYiJinJingVO.nowID = param1.readInt();
         this.targetCharYiJinJingVO.nowLookingName = param1.readUTF();
         this.targetCharYiJinJingVO.isKnow = true;
         this.targetCharYiJinJingVO.act = param1.readInt();
         this.targetCharYiJinJingVO.def = param1.readInt();
         this.targetCharYiJinJingVO.hp = param1.readInt();
         this.targetCharYiJinJingVO.mp = param1.readInt();
         this.targetCharYiJinJingVO.cp = param1.readInt();
         this.targetCharYiJinJingVO.skillID = param1.readInt();
         this.targetCharYiJinJingVO.MiaoShu = param1.readUTF();
         this.targetCharYiJinJingVO.isUseSkill = param1.readByte() == 0 ? false : true;
         this.targetCharYiJinJingVO.skill = new Skill(this.targetCharYiJinJingVO.skillID);
         this.targetCharYiJinJingVO.nowLookingID = this.targetCharYiJinJingVO.nowID;
         this.targetCharYiJinJingVO.jihuoJindu = param1.readInt();
         this.targetCharYiJinJingVO.addJihuoGongji = param1.readInt();
         this.targetCharYiJinJingVO.addJihuoFangyu = param1.readInt();
         this.targetCharYiJinJingVO.addJihuoShengming = param1.readInt();
         this.targetCharYiJinJingVO.zhongJi = param1.readByte() == 1;
         this.targetCharYiJinJingVO.lkzx = param1.readByte();
         this.targetCharYiJinJingVO.isDanTian = param1.readByte();
         this.targetPlaneMediator.upDataPanel(_loc2_,this.targetCharYiJinJingVO);
         this.targetPlaneMediator.upDataFeilongJindu(this.targetCharYiJinJingVO);
      }
      
      public function received_53964(param1:ByteArray) : void
      {
         ZLog.add("53956：飞龙探月手开启成功失败");
         var _loc2_:int = param1.readByte();
         this.feiLongTanYunShou_Mediator.KaiQiFeilongTanYueShou(_loc2_);
      }
   }
}

