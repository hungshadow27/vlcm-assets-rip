package com.tgame.moudels.cangjianxuantian.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.cangjianxuantian.model.info.CangJianXuanTianVO;
   import com.tgame.moudels.cangjianxuantian.view.CangJianXuanTian_Mediator;
   import com.tgame.moudels.cangjianxuantian.view.CangJianXuanTian_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class CangJianXuanTian_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "CangJianXuanTian_MsgReceivedProxy";
      
      private var vo:CangJianXuanTianVO;
      
      private var _mainChar_Mediator:CangJianXuanTian_Mediator;
      
      private var _targetMediator:CangJianXuanTian_TargetPanelMediator;
      
      public function CangJianXuanTian_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mainChar_Mediator() : CangJianXuanTian_Mediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(CangJianXuanTian_Mediator.NAME) as CangJianXuanTian_Mediator;
         }
         return this._mainChar_Mediator;
      }
      
      private function get targetPlaneMediator() : CangJianXuanTian_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(CangJianXuanTian_TargetPanelMediator.NAME) as CangJianXuanTian_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([79622,79624,79626],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([79622,79624,79626],NAME);
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
      
      public function received_79622(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         ZLog.add("79622\t\t藏剑玄天信息返回");
         _loc2_ = param1.readInt();
         this.vo = new CangJianXuanTianVO();
         this.vo.nowID = param1.readByte();
         this.vo.nowLookingID = param1.readByte();
         this.vo.nowLookingName = param1.readUTF();
         this.vo.curMiaoShu = param1.readUTF();
         this.vo.isKnow = param1.readByte() == 1;
         this.vo.act = param1.readInt();
         this.vo.def = param1.readInt();
         this.vo.hp = param1.readInt();
         this.vo.baoJi = param1.readInt();
         this.vo.shanBi = param1.readInt();
         this.vo.jiNengId = param1.readInt();
         this.vo.isCanUse = param1.readByte() == 1;
         this.vo.skill = new Skill(this.vo.jiNengId);
         this.vo.isHuanZHuang = param1.readByte() == 1;
         if(_loc2_ == -1)
         {
            this.mainChar_Mediator.upDataCangJianXuanTianPanel(this.vo);
         }
         else if(_loc2_ == GameInstance.lookPlayerID)
         {
            this.targetPlaneMediator.upDataCangJianXuanTianPanel(this.vo);
         }
      }
      
      public function received_79624(param1:ByteArray) : void
      {
         ZLog.add("79624\t\t藏剑玄天领悟查询结果");
         var _loc2_:String = "";
         var _loc3_:String = "";
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         this.mainChar_Mediator.upDataLingWuPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_);
      }
      
      public function received_79626(param1:ByteArray) : void
      {
         ZLog.add("79626\t\t藏剑玄天申请领悟结果");
         var _loc2_:int = param1.readByte();
         this.mainChar_Mediator.upDataCangJianXuanTianLVComplete(_loc2_);
      }
   }
}

