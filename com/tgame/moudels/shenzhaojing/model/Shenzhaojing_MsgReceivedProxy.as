package com.tgame.moudels.shenzhaojing.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.shenzhaojing.info.ShenzhaojingVO;
   import com.tgame.moudels.shenzhaojing.view.Shenzhaojing_PanelMediator;
   import com.tgame.moudels.shenzhaojing.view.Shenzhaojing_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shenzhaojing_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Shenzhaojing_MsgReceivedProxy";
      
      private var mainShenzhaojingVO:ShenzhaojingVO;
      
      private var targetShenzhaojingVO:ShenzhaojingVO;
      
      private var _Shenzhaojing_Mediator:Shenzhaojing_PanelMediator;
      
      private var _targetMediator:Shenzhaojing_TargetPanelMediator;
      
      public function Shenzhaojing_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get Shenzhaojing_Mediator() : Shenzhaojing_PanelMediator
      {
         if(!this._Shenzhaojing_Mediator)
         {
            this._Shenzhaojing_Mediator = facade.retrieveMediator(Shenzhaojing_PanelMediator.NAME) as Shenzhaojing_PanelMediator;
         }
         return this._Shenzhaojing_Mediator;
      }
      
      private function get targetPlaneMediator() : Shenzhaojing_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(Shenzhaojing_TargetPanelMediator.NAME) as Shenzhaojing_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([57202,57204,57206,57210,57212,57214,57216],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([57202,57204,57206,57210,57212,57214,57216],NAME);
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
      
      public function received_57202(param1:ByteArray) : void
      {
         ZLog.add("57202：神照经面板信息接收");
         var _loc2_:int = param1.readInt();
         this.mainShenzhaojingVO = new ShenzhaojingVO();
         this.mainShenzhaojingVO.szjText = param1.readUTF();
         this.mainShenzhaojingVO.nowLookingName = param1.readUTF();
         this.mainShenzhaojingVO.szjLwCsNum = param1.readInt();
         this.mainShenzhaojingVO.szjCkCsNum = param1.readInt();
         this.mainShenzhaojingVO.szjLwDsNum = param1.readInt();
         this.mainShenzhaojingVO.szjCkDsNum = param1.readInt();
         this.Shenzhaojing_Mediator.nowCkCsNum = this.mainShenzhaojingVO.szjCkCsNum;
         this.Shenzhaojing_Mediator.nowCkCsDsNum = this.mainShenzhaojingVO.szjCkDsNum;
         this.Shenzhaojing_Mediator.nowLwCsNum = this.mainShenzhaojingVO.szjLwCsNum;
         this.Shenzhaojing_Mediator.nowCkCsLwDsNum = this.mainShenzhaojingVO.szjLwDsNum;
         this.mainShenzhaojingVO.act = param1.readInt();
         this.mainShenzhaojingVO.def = param1.readInt();
         this.mainShenzhaojingVO.bj = param1.readInt();
         this.mainShenzhaojingVO.sb = param1.readInt();
         this.mainShenzhaojingVO.hp = param1.readInt();
         this.mainShenzhaojingVO.mp = param1.readInt();
         this.mainShenzhaojingVO.cp = param1.readInt();
         this.mainShenzhaojingVO.nowJinduNum = param1.readInt();
         this.mainShenzhaojingVO.maxJinduNum = param1.readInt();
         this.mainShenzhaojingVO.skillId = param1.readInt();
         this.mainShenzhaojingVO.skill = GameInstance.mainCharData.skillInfo.getSkillByID(this.mainShenzhaojingVO.skillId);
         this.mainShenzhaojingVO.skillText = param1.readUTF();
         this.mainShenzhaojingVO.skillIsLearn = param1.readByte() == 1;
         this.mainShenzhaojingVO.huanzhuang = param1.readByte() == 1;
         this.mainShenzhaojingVO.isDanTian = param1.readByte() == 1;
         this.Shenzhaojing_Mediator.initializeMainUI(this.mainShenzhaojingVO);
      }
      
      public function received_57204(param1:ByteArray) : void
      {
         ZLog.add("57204：神照经提升速度信息接收");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc6_,true);
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         this.Shenzhaojing_Mediator.initializeTisuPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_57206(param1:ByteArray) : void
      {
         ZLog.add("57206：神照经提升速度信息接收");
         var _loc2_:int = param1.readByte();
         this.Shenzhaojing_Mediator.updateTisuPanel(_loc2_);
      }
      
      public function received_57210(param1:ByteArray) : void
      {
         ZLog.add("57210：神照经突破面板信息接收");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.Shenzhaojing_Mediator.upDataShenzhaojingTupoPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_57212(param1:ByteArray) : void
      {
         ZLog.add("57212：神照经成功失败");
         var _loc2_:int = param1.readByte();
         this.Shenzhaojing_Mediator.upDataLiumaishenjianLVComplete(_loc2_);
      }
      
      public function received_57214(param1:ByteArray) : void
      {
         ZLog.add("57214：神照经切换查询返回");
         this.mainShenzhaojingVO.nowLookingName = param1.readUTF();
         this.mainShenzhaojingVO.szjLwCsNum = param1.readInt();
         this.mainShenzhaojingVO.szjCkCsNum = param1.readInt();
         this.mainShenzhaojingVO.szjLwDsNum = param1.readInt();
         this.mainShenzhaojingVO.szjCkDsNum = param1.readInt();
         this.Shenzhaojing_Mediator.nowCkCsNum = this.mainShenzhaojingVO.szjCkCsNum;
         this.Shenzhaojing_Mediator.nowCkCsDsNum = this.mainShenzhaojingVO.szjCkDsNum;
         this.Shenzhaojing_Mediator.nowLwCsNum = this.mainShenzhaojingVO.szjLwCsNum;
         this.Shenzhaojing_Mediator.nowCkCsLwDsNum = this.mainShenzhaojingVO.szjLwDsNum;
         this.mainShenzhaojingVO.act = param1.readInt();
         this.mainShenzhaojingVO.def = param1.readInt();
         this.mainShenzhaojingVO.bj = param1.readInt();
         this.mainShenzhaojingVO.sb = param1.readInt();
         this.mainShenzhaojingVO.hp = param1.readInt();
         this.mainShenzhaojingVO.mp = param1.readInt();
         this.mainShenzhaojingVO.cp = param1.readInt();
         this.mainShenzhaojingVO.nowJinduNum = param1.readInt();
         this.mainShenzhaojingVO.maxJinduNum = param1.readInt();
         this.Shenzhaojing_Mediator.initializeMainUI(this.mainShenzhaojingVO);
      }
      
      public function received_57216(param1:ByteArray) : void
      {
         ZLog.add("57216：神照经他人面板信息接收");
         var _loc2_:int = param1.readInt();
         this.targetShenzhaojingVO = new ShenzhaojingVO();
         this.targetShenzhaojingVO.szjText = param1.readUTF();
         this.targetShenzhaojingVO.nowLookingName = param1.readUTF();
         this.targetShenzhaojingVO.szjLwCsNum = param1.readInt();
         this.targetShenzhaojingVO.szjCkCsNum = param1.readInt();
         this.targetShenzhaojingVO.szjLwDsNum = param1.readInt();
         this.targetShenzhaojingVO.szjCkDsNum = param1.readInt();
         this.targetShenzhaojingVO.act = param1.readInt();
         this.targetShenzhaojingVO.def = param1.readInt();
         this.targetShenzhaojingVO.bj = param1.readInt();
         this.targetShenzhaojingVO.sb = param1.readInt();
         this.targetShenzhaojingVO.hp = param1.readInt();
         this.targetShenzhaojingVO.mp = param1.readInt();
         this.targetShenzhaojingVO.cp = param1.readInt();
         this.targetShenzhaojingVO.nowJinduNum = param1.readInt();
         this.targetShenzhaojingVO.maxJinduNum = param1.readInt();
         this.targetShenzhaojingVO.skillId = param1.readInt();
         this.targetShenzhaojingVO.skill = GameInstance.mainCharData.skillInfo.getSkillByID(this.targetShenzhaojingVO.skillId);
         this.targetShenzhaojingVO.skillText = param1.readUTF();
         this.targetShenzhaojingVO.skillIsLearn = param1.readByte() == 1;
         this.targetShenzhaojingVO.huanzhuang = param1.readByte() == 1;
         this.targetShenzhaojingVO.isDanTian = param1.readByte() == 1;
         this.targetPlaneMediator.initializeMainUI(_loc2_,this.targetShenzhaojingVO);
      }
   }
}

