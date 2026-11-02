package com.tgame.moudels.woDeMenPai.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.vo.character.Player;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.woDeMenPai.view.MenPai;
   import com.tgame.moudels.woDeMenPai.view.WoDeChuanGong_Mediator;
   import com.tgame.moudels.woDeMenPai.view.WoDeMenPai_Mediator;
   import com.tgame.moudels.woDeMenPai.view.WoDeMenPai_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WoDeMenPai_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "WoDeMenPai_MsgReceivedProxy";
      
      private var _mianPanelMediator:WoDeMenPai_Mediator;
      
      private var _chuanGongMediator:WoDeChuanGong_Mediator;
      
      private var _targetMediator:WoDeMenPai_TargetMediator;
      
      public function WoDeMenPai_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : WoDeMenPai_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(WoDeMenPai_Mediator.NAME) as WoDeMenPai_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      public function get chuanGongMediator() : WoDeChuanGong_Mediator
      {
         if(!this._chuanGongMediator)
         {
            this._chuanGongMediator = facade.retrieveMediator(WoDeChuanGong_Mediator.NAME) as WoDeChuanGong_Mediator;
         }
         return this._chuanGongMediator;
      }
      
      private function get targetPlaneMediator() : WoDeMenPai_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(WoDeMenPai_TargetMediator.NAME) as WoDeMenPai_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72102,72104,72110,72152,72154,72112],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72102,72104,72110,72152,72154,72112],NAME);
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
      
      public function received_72102(param1:ByteArray) : void
      {
         var _loc4_:MenPai = null;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         ZLog.add("72102\t\t返回玩家门派信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Boolean = Boolean(param1.readByte());
         if(_loc3_)
         {
            _loc4_ = new MenPai();
            _loc4_.name = param1.readUTF();
            _loc4_.zuShiName = param1.readUTF();
            _loc4_.grade = param1.readInt();
            _loc4_.gongXianZhi = param1.readDouble();
            _loc4_.createDate = new Date();
            _loc4_.createDate.setTime(param1.readDouble());
            _loc4_.canFuHuo = param1.readByte() == 1;
            _loc4_.numOfDiZi = param1.readByte();
            _loc4_.diZiDataArr = [];
            _loc5_ = 0;
            while(_loc5_ < _loc4_.numOfDiZi)
            {
               _loc6_ = new Object();
               _loc6_.id = param1.readInt();
               _loc6_.name = param1.readUTF();
               _loc6_.grade = param1.readInt();
               _loc6_.wuGong = param1.readDouble();
               _loc6_.wuGongMax = param1.readInt();
               _loc6_.isDead = param1.readByte() == 0;
               _loc6_.isChuZhan = param1.readByte() == 1;
               _loc6_.headImg = param1.readByte();
               _loc4_.diZiDataArr.push(_loc6_);
               _loc5_++;
            }
            _loc4_.goodsId = param1.readInt();
            _loc4_.menPai = param1.readByte();
         }
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.upDataPanel(_loc4_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc4_);
         }
      }
      
      public function received_72104(param1:ByteArray) : void
      {
         ZLog.add("72104\t\t返回门派创建结果");
         var _loc2_:Boolean = param1.readByte() == 1;
         if(_loc2_)
         {
            this.mianPanelMediator.setResult();
         }
      }
      
      public function received_72110(param1:ByteArray) : void
      {
         ZLog.add("72110\t\t返回切换弟子结果");
         var _loc2_:Boolean = param1.readByte() == 1;
         if(_loc2_)
         {
            if(GameInstance.mainCharData.isDiZi)
            {
               GameInstance.uiInstance.mainUI.setTrackVisible(true);
            }
            else
            {
               GameInstance.uiInstance.mainUI.setTrackVisible(false);
            }
            PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI);
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
            PipeManager.sendMsg(PipeConstants.SHOW_LOCK_CHAR,[]);
            NewPlayerGuideStaticFun.removeAllImageInstanceGuide();
            GameInstance.uiInstance.mainUI.functionContainer.guideBar.removeAllBtn();
            GameInstance.mainChar.data = new Player(GameInstance.mainChar);
            GameState.isMainCharChanged = true;
         }
      }
      
      public function received_72152(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         ZLog.add("72152\t\t返回玩家传功信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc7_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < _loc4_)
         {
            _loc5_.push(param1.readInt());
            _loc8_++;
         }
         var _loc9_:int = param1.readInt();
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            _loc6_.push(param1.readInt());
            _loc8_++;
         }
         var _loc10_:int = param1.readInt();
         _loc8_ = 0;
         while(_loc8_ < _loc10_)
         {
            _loc7_.push(param1.readInt());
            _loc8_++;
         }
         this.chuanGongMediator.setData(_loc3_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_72154(param1:ByteArray) : void
      {
         ZLog.add("72154\t\t返回玩家传功结果");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.chuanGongMediator.setResult(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_72112(param1:ByteArray) : void
      {
         ZLog.add("72112\t\t主角或弟子死亡复活提示");
         var _loc2_:Boolean = param1.readByte() == 1;
         GameInstance.uiInstance.mainUI.showFuHuoBtn(_loc2_);
      }
   }
}

