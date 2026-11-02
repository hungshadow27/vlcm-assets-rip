package com.tgame.moudels.feast.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.feast.view.FeastMarriageCashGiftList_Mediator;
   import com.tgame.moudels.feast.view.FeastMarriageDine_Mediator;
   import com.tgame.moudels.feast.view.FeastMarriageGiveCashGift_Mediator;
   import com.tgame.moudels.feast.view.FeastMarriageWedding_Mediator;
   import com.tgame.moudels.feast.view.FeastTeam_Mediator;
   import com.tgame.moudels.login.view.*;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Feast_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Attribute_MsgReceivedProxy";
      
      private var _hunyanID:int = 0;
      
      private var _hunyanName:String = "";
      
      private var _guimo:int = 1;
      
      private var _monsterID:int = 0;
      
      private var _shenyuFenshu:Number = 0;
      
      private var _exp:int = 0;
      
      private var _zhenqi:int = 0;
      
      private var _todayLeiji:int = 0;
      
      private var _msgSenderProxy:Feast_MsgSenderProxy;
      
      private var _feastMeditor:FeastMarriageWedding_Mediator;
      
      private var _feastMarriageGiveCashGift_Mediator:FeastMarriageGiveCashGift_Mediator;
      
      private var _feastMarriageDine_Mediator:FeastMarriageDine_Mediator;
      
      private var _feastMarriageCashGiftList_Mediator:FeastMarriageCashGiftList_Mediator;
      
      private var _teamMeditor:FeastTeam_Mediator;
      
      public function Feast_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get msgSenderProxy() : Feast_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Feast_MsgSenderProxy.NAME) as Feast_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get feastMeditor() : FeastMarriageWedding_Mediator
      {
         if(!this._feastMeditor)
         {
            this._feastMeditor = facade.retrieveMediator(FeastMarriageWedding_Mediator.NAME) as FeastMarriageWedding_Mediator;
         }
         return this._feastMeditor;
      }
      
      private function get feastMarriageGiveCashGift_Mediator() : FeastMarriageGiveCashGift_Mediator
      {
         if(!this._feastMarriageGiveCashGift_Mediator)
         {
            this._feastMarriageGiveCashGift_Mediator = facade.retrieveMediator(FeastMarriageGiveCashGift_Mediator.NAME) as FeastMarriageGiveCashGift_Mediator;
         }
         return this._feastMarriageGiveCashGift_Mediator;
      }
      
      private function get feastMarriageDine_Mediator() : FeastMarriageDine_Mediator
      {
         if(!this._feastMarriageDine_Mediator)
         {
            this._feastMarriageDine_Mediator = facade.retrieveMediator(FeastMarriageDine_Mediator.NAME) as FeastMarriageDine_Mediator;
         }
         return this._feastMarriageDine_Mediator;
      }
      
      private function get feastMarriageCashGiftList_Mediator() : FeastMarriageCashGiftList_Mediator
      {
         if(!this._feastMarriageCashGiftList_Mediator)
         {
            this._feastMarriageCashGiftList_Mediator = facade.retrieveMediator(FeastMarriageCashGiftList_Mediator.NAME) as FeastMarriageCashGiftList_Mediator;
         }
         return this._feastMarriageCashGiftList_Mediator;
      }
      
      private function get teamMeditor() : FeastTeam_Mediator
      {
         if(!this._teamMeditor)
         {
            this._teamMeditor = facade.retrieveMediator(FeastTeam_Mediator.NAME) as FeastTeam_Mediator;
         }
         return this._teamMeditor;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([52248,52250,52252,52254,52256,52258,52260,52262],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([52248,52250,52252,52254,52256,52258,52260,52262],NAME);
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
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_52248(param1:ByteArray) : void
      {
         var $data:ByteArray = param1;
         var buf:ByteArray = $data;
         var intResult:int = $data.readByte();
         var intDay:int = $data.readInt();
         var intType:int = $data.readByte();
         var intLine:int = $data.readByte();
         var strType:String = "";
         if(intType == 1)
         {
            strType = LanResManager.getLanCommonTextWords("普通");
         }
         else if(intType == 2)
         {
            strType = LanResManager.getLanCommonTextWords("富贵");
         }
         else if(intType == 3)
         {
            strType = LanResManager.getLanCommonTextWords("豪门");
         }
         if(intResult == 0)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_NEW_EAT,[intDay,strType,String(intLine),function():void
            {
            }]);
         }
         else if(intResult == 1)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_NEW_MONEY,function():void
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_CASH_GIFT_LIS_PLANE);
               msgSenderProxy.send_52251(1);
            });
         }
      }
      
      public function received_52250(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
      }
      
      public function received_52252(param1:ByteArray) : void
      {
         var _loc13_:Object = null;
         var _loc14_:Boolean = false;
         var _loc15_:int = 0;
         var _loc2_:ByteArray = param1;
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:Number = param1.readDouble();
         var _loc6_:Number = param1.readDouble();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readByte();
         var _loc9_:int = param1.readByte();
         var _loc10_:int = param1.readByte();
         var _loc11_:Array = new Array();
         var _loc12_:int = 0;
         while(_loc12_ < _loc10_)
         {
            _loc13_ = new Object();
            _loc14_ = false;
            _loc13_.xuhao = _loc2_.readByte();
            _loc13_.userID = _loc2_.readInt();
            _loc13_.userName = _loc2_.readUTF();
            _loc13_.lv = _loc2_.readInt();
            _loc15_ = _loc2_.readByte();
            _loc14_ = _loc15_ == 1;
            if(_loc14_)
            {
               _loc13_.isLine = 1;
            }
            else
            {
               _loc13_.isLine = 0;
            }
            _loc13_.copper = _loc2_.readDouble();
            _loc11_.push(_loc13_);
            _loc12_++;
         }
         this.feastMarriageCashGiftList_Mediator.updateHongbaoList(_loc8_,_loc9_,_loc11_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_52254(param1:ByteArray) : void
      {
         var hunyanID:int = 0;
         var monsterID:int = 0;
         var hunyanName:String = null;
         var shenyuFenshu:Number = NaN;
         var exp:int = 0;
         var zhenqi:int = 0;
         var minTongqian:int = 0;
         var $data:ByteArray = param1;
         hunyanID = $data.readInt();
         var intGuimo:int = $data.readByte();
         monsterID = $data.readInt();
         hunyanName = $data.readUTF();
         var intResult:int = $data.readByte();
         var sceneid:int = $data.readInt();
         var x:int = $data.readInt();
         var y:int = $data.readInt();
         var dis:int = $data.readInt();
         var strSeachPath:String = String(sceneid) + "," + String(x) + "," + String(y) + "," + String(dis);
         var callBack:MoveCallBack = new MoveCallBack();
         this._hunyanID = hunyanID;
         this._guimo = intGuimo;
         this._hunyanName = hunyanName;
         this._monsterID = monsterID;
         if(intResult == 1)
         {
            if(monsterID > 0)
            {
               shenyuFenshu = $data.readDouble();
               exp = $data.readInt();
               zhenqi = $data.readInt();
               this._todayLeiji = $data.readInt();
               this._shenyuFenshu = shenyuFenshu;
               this._exp = exp;
               this._zhenqi = zhenqi;
               callBack.onMoveArrived = function(param1:SceneCharacter, param2:MapTile):void
               {
                  feastMarriageDine_Mediator.updateUI(hunyanID,hunyanName,monsterID,shenyuFenshu,exp,zhenqi);
               };
               MainCharSeachPathManager.mainCharWalk(strSeachPath,false,callBack);
            }
         }
         else
         {
            this._shenyuFenshu = $data.readDouble();
            this._exp = $data.readInt();
            this._zhenqi = $data.readInt();
            this._todayLeiji = $data.readInt();
            minTongqian = $data.readInt();
            if(monsterID != -1)
            {
               callBack.onMoveArrived = function(param1:SceneCharacter, param2:MapTile):void
               {
                  feastMarriageGiveCashGift_Mediator.updateUI(_hunyanID,_hunyanName,_todayLeiji,_guimo,minTongqian);
               };
               MainCharSeachPathManager.mainCharWalk(strSeachPath,false,callBack);
            }
            else
            {
               this.feastMarriageGiveCashGift_Mediator.updateUI(this._hunyanID,this._hunyanName,this._todayLeiji,this._guimo,minTongqian);
            }
         }
      }
      
      public function received_52256(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 0)
         {
            if(this._monsterID != -1)
            {
               this.feastMarriageDine_Mediator.updateUI(this._hunyanID,this._hunyanName,this._monsterID,this._shenyuFenshu,this._exp,this._zhenqi);
            }
         }
      }
      
      public function received_52258(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 0)
         {
         }
      }
      
      public function received_52260(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
      }
      
      public function received_52262(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         var _loc9_:Date = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:int = param1.readByte();
         var _loc6_:Array = new Array();
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc8_ = new Object();
            _loc8_.number = _loc2_.readByte();
            _loc8_.guimo = _loc2_.readByte();
            if(_loc8_.guimo == 1)
            {
               _loc8_.guimo = LanResManager.getLanCommonTextWords("普通");
            }
            else if(_loc8_.guimo == 2)
            {
               _loc8_.guimo = LanResManager.getLanCommonTextWords("富贵");
            }
            else if(_loc8_.guimo == 3)
            {
               _loc8_.guimo = LanResManager.getLanCommonTextWords("豪门");
            }
            _loc8_.time = _loc2_.readDouble();
            _loc9_ = new Date();
            _loc9_.setTime(_loc8_.time);
            _loc10_ = "";
            _loc11_ = String(_loc9_.getHours());
            if(_loc9_.getMinutes() < 10)
            {
               _loc10_ = "0" + String(_loc9_.getMinutes());
            }
            else
            {
               _loc10_ = String(_loc9_.getMinutes());
            }
            _loc8_.time = _loc9_.getDate() + "-" + (_loc9_.getMonth() + 1) + "  " + _loc11_ + ":" + _loc10_;
            _loc8_.fettle = _loc2_.readByte();
            if(_loc8_.fettle == 0)
            {
               _loc8_.fettle = LanResManager.getLanCommonTextWords("未开始");
            }
            else if(_loc8_.fettle == 1)
            {
               _loc8_.fettle = LanResManager.getLanCommonTextWords("进行中");
            }
            else if(_loc8_.fettle == 2)
            {
               _loc8_.fettle = LanResManager.getLanCommonTextWords("已结束");
            }
            _loc8_.xinlang = _loc2_.readUTF();
            _loc8_.xinniang = _loc2_.readUTF();
            _loc8_.line = _loc2_.readByte();
            _loc6_.push(_loc8_);
            _loc7_++;
         }
         this.teamMeditor.updateHunyanList(_loc4_,_loc3_,_loc6_);
      }
   }
}

