package com.tgame.moudels.qingdieshuangren.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.qingdieshuangren.model.info.QingDieShuangRenVO;
   import com.tgame.moudels.qingdieshuangren.view.QingDieShuangRen_Mediator;
   import com.tgame.moudels.qingdieshuangren.view.QingDieShuangRen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QingDieShuangRen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "QingDieShuangRen_MsgReceivedProxy";
      
      private var vo:QingDieShuangRenVO;
      
      private var _mainChar_Mediator:QingDieShuangRen_Mediator;
      
      private var _targetMediator:QingDieShuangRen_TargetPanelMediator;
      
      public function QingDieShuangRen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mainChar_Mediator() : QingDieShuangRen_Mediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(QingDieShuangRen_Mediator.NAME) as QingDieShuangRen_Mediator;
         }
         return this._mainChar_Mediator;
      }
      
      private function get targetPlaneMediator() : QingDieShuangRen_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(QingDieShuangRen_TargetPanelMediator.NAME) as QingDieShuangRen_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([79532,79534,79536],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([79532,79534,79536],NAME);
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
      
      public function received_79532(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         ZLog.add("79532\t\t青蝶双刃信息返回");
         _loc2_ = param1.readInt();
         this.vo = new QingDieShuangRenVO();
         this.vo.nowID = param1.readByte();
         this.vo.nowLookingID = param1.readByte();
         this.vo.nowLookingName = param1.readUTF();
         this.vo.isKnow = param1.readByte() == 1;
         this.vo.act = param1.readDouble();
         this.vo.def = param1.readDouble();
         this.vo.hp = param1.readDouble();
         this.vo.baoJi = param1.readDouble();
         this.vo.shanBi = param1.readDouble();
         this.vo.jiNengId = param1.readInt();
         this.vo.isCanUse = param1.readByte() == 1;
         this.vo.skill = new Skill(this.vo.jiNengId);
         this.vo.isHuanZHuang = param1.readByte() == 1;
         if(_loc2_ == -1)
         {
            this.mainChar_Mediator.upDataQingDieShuangRenPanel(this.vo);
         }
         else if(_loc2_ == GameInstance.lookPlayerID)
         {
            this.targetPlaneMediator.upDataQingDieShuangRenPanel(this.vo);
         }
      }
      
      public function received_79534(param1:ByteArray) : void
      {
         ZLog.add("79534\t\t青蝶双刃领悟查询结果");
         var _loc2_:String = "";
         var _loc3_:String = "";
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         this.mainChar_Mediator.upDataLingWuPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_79536(param1:ByteArray) : void
      {
         ZLog.add("79536\t\t青蝶双刃申请领悟结果");
         var _loc2_:int = param1.readByte();
         this.mainChar_Mediator.upDataQingDieShuangRenLVComplete(_loc2_);
      }
   }
}

