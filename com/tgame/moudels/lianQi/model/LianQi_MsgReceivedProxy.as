package com.tgame.moudels.lianQi.model
{
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.lianQi.model.info.LianQiVO;
   import com.tgame.moudels.lianQi.view.LianQi_Mediator;
   import com.tgame.moudels.lianQi.view.LianQi_TargetMediator;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LianQi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "LianQi_MsgReceivedProxy";
      
      private var _mainPanelMediator:LianQi_Mediator;
      
      private var _targetMediator:LianQi_TargetMediator;
      
      public function LianQi_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : LianQi_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(LianQi_Mediator.NAME) as LianQi_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : LianQi_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(LianQi_TargetMediator.NAME) as LianQi_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70052,70054,70056,70058],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70052,70054,70056,70058],NAME);
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
      
      public function received_70052(param1:ByteArray) : void
      {
         ZLog.add("70052\t\t返回玩家炼气详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:LianQiVO = new LianQiVO();
         _loc3_.lookName = param1.readUTF();
         _loc3_.lookID = param1.readByte();
         _loc3_.nowID = param1.readByte();
         _loc3_.maxId = param1.readByte();
         _loc3_.act = param1.readInt();
         _loc3_.maxAct = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.maxDef = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.maxHp = param1.readInt();
         _loc3_.bj = param1.readInt();
         _loc3_.maxBj = param1.readInt();
         _loc3_.sb = param1.readInt();
         _loc3_.maxSb = param1.readInt();
         _loc3_.mp = param1.readInt();
         _loc3_.maxMp = param1.readInt();
         _loc3_.mapName = param1.readUTF();
         _loc3_.monsterName = param1.readUTF();
         _loc3_.monsterNum = param1.readInt() / 100;
         _loc3_.lianQiNum = param1.readByte();
         _loc3_.skillStatus = param1.readByte() == 1;
         _loc3_.menPai = param1.readByte();
         _loc3_.goodsId = param1.readInt();
         _loc3_.fenghuangdouxuan = param1.readByte() == 1;
         _loc3_.isHuanZhuang = param1.readByte() == 1;
         _loc3_.isHuanZhuang2 = param1.readByte() == 1;
         _loc3_.isDanTian = param1.readByte() == 1;
         if(_loc2_ == -1 && !LianQi_Mediator.isShowed && _loc3_.lianQiNum == 100 && _loc3_.nowID < _loc3_.maxId)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_LIANQI_FULL);
            LianQi_Mediator.isShowed = true;
         }
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.upDataPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_70054(param1:ByteArray) : void
      {
         ZLog.add("70054\t\t返回炼气突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mainPanelMediator.upDateTuPoPanel(_loc6_,_loc7_,_loc4_,_loc5_,_loc8_,_loc3_,_loc2_);
      }
      
      public function received_70056(param1:ByteArray) : void
      {
         ZLog.add("70056\t\t返回突破炼气结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateTuPoResult(_loc2_);
      }
      
      public function received_70058(param1:ByteArray) : void
      {
         ZLog.add("70058\t\t返回提升炼气所需信息");
         var _loc2_:int = param1.readInt();
         this.mainPanelMediator.showLianQiHuoQu(_loc2_);
      }
   }
}

