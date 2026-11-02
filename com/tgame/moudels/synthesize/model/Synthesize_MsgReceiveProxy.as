package com.tgame.moudels.synthesize.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.synthesize.view.HuXinYaoTiShengMediator;
   import com.tgame.moudels.synthesize.view.HuYILingHuaMediator;
   import com.tgame.moudels.synthesize.view.HuYIUpdataMediator;
   import com.tgame.moudels.synthesize.view.HuYIXiLianMediator;
   import com.tgame.moudels.synthesize.view.HushenfuXilianMediator;
   import com.tgame.moudels.synthesize.view.LongyaKaiguangMediator;
   import com.tgame.moudels.synthesize.view.LongyinUpdateMediator;
   import com.tgame.moudels.synthesize.view.ShiShiKaiFengMediator;
   import com.tgame.moudels.synthesize.view.UI_MainCharSynthesizeMediator;
   import com.tgame.moudels.synthesize.view.UI_MainCharequipUpdataTypePanelMediator;
   import com.tgame.moudels.synthesize.view.XunZhangHeChengMediator;
   import com.tgame.moudels.synthesize.view.ZhuangbeiJihuoMediator;
   import com.tgame.moudels.synthesize.view.panelOperctor.BaseSynthesize;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Synthesize_MsgReceiveProxy extends Proxy
   {
      
      public static const NAME:String = "Synthesize_MsgReceiveProxy";
      
      private var _synthesizeMediator:UI_MainCharSynthesizeMediator;
      
      private var _equipUpDataTypeMediator:UI_MainCharequipUpdataTypePanelMediator;
      
      private var _huYiUpDataTypeMediator:HuYIUpdataMediator;
      
      private var _huYiLingHuaMediator:HuYILingHuaMediator;
      
      private var _huYiXiLianMediator:HuYIXiLianMediator;
      
      private var _hushenXiLianMediator:HushenfuXilianMediator;
      
      private var _longYinUpDataTypeMediator:LongyinUpdateMediator;
      
      private var _zhuangbeiJihuoMediator:ZhuangbeiJihuoMediator;
      
      private var _longyaKaiguangMediator:LongyaKaiguangMediator;
      
      private var _shiShiKaiFengMediator:ShiShiKaiFengMediator;
      
      private var _huXinYaoMediator:HuXinYaoTiShengMediator;
      
      private var _xunZhangHeChengMediator:XunZhangHeChengMediator;
      
      public function Synthesize_MsgReceiveProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      private function get xunZhangHeChengMediator() : XunZhangHeChengMediator
      {
         if(this._xunZhangHeChengMediator == null)
         {
            this._xunZhangHeChengMediator = facade.retrieveMediator(XunZhangHeChengMediator.NAME) as XunZhangHeChengMediator;
         }
         return this._xunZhangHeChengMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50118,50120,50176,50190,53526,53528,53530,53532,53534,53536,53538,53546,53548,53550,53552,53554,53556,53558,53560,53572,53574,57352,57354,58954,58956],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50118,50120,50176,50190,53526,53528,53530,53532,53534,53536,53538,53546,53548,53550,53552,53554,53556,53558,53560,53572,53574,57352,57354,58954,58956],NAME);
      }
      
      private function get synthesizeMediator() : UI_MainCharSynthesizeMediator
      {
         if(this._synthesizeMediator == null)
         {
            this._synthesizeMediator = facade.retrieveMediator(UI_MainCharSynthesizeMediator.NAME) as UI_MainCharSynthesizeMediator;
         }
         return this._synthesizeMediator;
      }
      
      private function get equipUpDataTypeMediator() : UI_MainCharequipUpdataTypePanelMediator
      {
         if(this._equipUpDataTypeMediator == null)
         {
            this._equipUpDataTypeMediator = facade.retrieveMediator(UI_MainCharequipUpdataTypePanelMediator.NAME) as UI_MainCharequipUpdataTypePanelMediator;
         }
         return this._equipUpDataTypeMediator;
      }
      
      private function get huYiUpDataTypeMediator() : HuYIUpdataMediator
      {
         if(this._huYiUpDataTypeMediator == null)
         {
            this._huYiUpDataTypeMediator = facade.retrieveMediator(HuYIUpdataMediator.NAME) as HuYIUpdataMediator;
         }
         return this._huYiUpDataTypeMediator;
      }
      
      private function get huYiLingHuaMediator() : HuYILingHuaMediator
      {
         if(this._huYiLingHuaMediator == null)
         {
            this._huYiLingHuaMediator = facade.retrieveMediator(HuYILingHuaMediator.NAME) as HuYILingHuaMediator;
         }
         return this._huYiLingHuaMediator;
      }
      
      private function get huYiXiLianMediator() : HuYIXiLianMediator
      {
         if(this._huYiXiLianMediator == null)
         {
            this._huYiXiLianMediator = facade.retrieveMediator(HuYIXiLianMediator.NAME) as HuYIXiLianMediator;
         }
         return this._huYiXiLianMediator;
      }
      
      private function get longYinUpDataTypeMediator() : LongyinUpdateMediator
      {
         if(this._longYinUpDataTypeMediator == null)
         {
            this._longYinUpDataTypeMediator = facade.retrieveMediator(LongyinUpdateMediator.NAME) as LongyinUpdateMediator;
         }
         return this._longYinUpDataTypeMediator;
      }
      
      private function get zhuangbeiJihuoMediator() : ZhuangbeiJihuoMediator
      {
         if(this._zhuangbeiJihuoMediator == null)
         {
            this._zhuangbeiJihuoMediator = facade.retrieveMediator(ZhuangbeiJihuoMediator.NAME) as ZhuangbeiJihuoMediator;
         }
         return this._zhuangbeiJihuoMediator;
      }
      
      private function get longyaKaiguangMediator() : LongyaKaiguangMediator
      {
         if(this._longyaKaiguangMediator == null)
         {
            this._longyaKaiguangMediator = facade.retrieveMediator(LongyaKaiguangMediator.NAME) as LongyaKaiguangMediator;
         }
         return this._longyaKaiguangMediator;
      }
      
      private function get hushenXiLianMediator() : HushenfuXilianMediator
      {
         if(this._hushenXiLianMediator == null)
         {
            this._hushenXiLianMediator = facade.retrieveMediator(HushenfuXilianMediator.NAME) as HushenfuXilianMediator;
         }
         return this._hushenXiLianMediator;
      }
      
      private function get shiShiKaiFengMediator() : ShiShiKaiFengMediator
      {
         if(this._shiShiKaiFengMediator == null)
         {
            this._shiShiKaiFengMediator = facade.retrieveMediator(ShiShiKaiFengMediator.NAME) as ShiShiKaiFengMediator;
         }
         return this._shiShiKaiFengMediator;
      }
      
      private function get huXinYaoMediator() : HuXinYaoTiShengMediator
      {
         if(this._huXinYaoMediator == null)
         {
            this._huXinYaoMediator = facade.retrieveMediator(HuXinYaoTiShengMediator.NAME) as HuXinYaoTiShengMediator;
         }
         return this._huXinYaoMediator;
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
      
      public function received_50118(param1:ByteArray) : void
      {
         SmallLoadingBar.close();
         BaseSynthesize.removeLoaderBuff();
         var _loc2_:int = param1.readByte();
         this.synthesizeMediator.upDataItem(_loc2_);
      }
      
      public function received_50120(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         SmallLoadingBar.close();
         BaseSynthesize.removeLoaderBuff();
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            _loc3_ = param1.readShort();
         }
         this.synthesizeMediator.upDataItem(_loc2_,"","",_loc3_);
      }
      
      public function received_50176(param1:ByteArray) : void
      {
         var t:Timer;
         var timerComplete:Function = null;
         var $data:ByteArray = param1;
         timerComplete = function(param1:TimerEvent):void
         {
            equipUpDataTypeMediator.removeLoaderBuff();
            param1.currentTarget.removeEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
         };
         var isOK:int = $data.readByte();
         var index:int = $data.readShort();
         var str:String = $data.readUTF();
         this.equipUpDataTypeMediator.setData(isOK,index,str);
         t = new Timer(300,1);
         t.start();
         t.addEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
      }
      
      public function received_50190(param1:ByteArray) : void
      {
         ZLog.add("50190：延时动画 ");
         SmallLoadingBar.showLoading(SynthesizeMsg.EquipUpdataTypeBarMsg,OtherConst.EQUIP_UPDATA_USE_LOAD_BUFF_TIME);
      }
      
      public function received_53526(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         SmallLoadingBar.close();
         BaseSynthesize.removeLoaderBuff();
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         if(_loc2_ == 0)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < 3)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readShort();
            if(_loc6_ == 0 || _loc7_ == 0)
            {
               _loc3_[_loc4_] = null;
            }
            else
            {
               _loc8_ = new Goods(_loc6_);
               _loc8_.count = _loc7_;
               _loc3_[_loc4_] = _loc8_;
            }
            _loc4_++;
         }
         var _loc5_:int = param1.readShort();
         _loc3_[_loc3_.length] = _loc5_;
         this.synthesizeMediator.upDataItem(_loc2_,"","",_loc3_);
      }
      
      public function received_53528(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Goods = null;
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         if(_loc2_ == 1)
         {
            _loc4_ = param1.readShort();
            _loc5_ = param1.readByte();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = new Goods(param1.readInt());
               _loc7_.count = param1.readShort();
               _loc3_.push(_loc7_);
               _loc6_++;
            }
         }
         this.huYiUpDataTypeMediator.setUpdataItem(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_53530(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.huYiUpDataTypeMediator.huyiUpdataComplete(_loc2_,_loc3_);
      }
      
      public function received_53532(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         ZLog.add("53532：灵化查询 返回 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         if(_loc2_ == 1)
         {
            _loc4_ = param1.readShort();
            _loc5_ = param1.readByte();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = param1.readInt();
               _loc8_ = new Goods(_loc7_);
               _loc8_.count = param1.readShort();
               _loc3_.push(_loc8_);
               _loc6_++;
            }
         }
         this.huYiLingHuaMediator.setUpdataItem(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_53534(param1:ByteArray) : void
      {
         ZLog.add("53534：灵化结果 返回 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.huYiLingHuaMediator.huyiLingHuaComplete(_loc2_,_loc3_);
      }
      
      public function received_53536(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         ZLog.add("53536：洗炼查询 返回 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         if(_loc2_ == 1)
         {
            _loc4_ = param1.readShort();
            _loc5_ = param1.readByte();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = param1.readInt();
               _loc8_ = new Goods(_loc7_);
               _loc8_.count = param1.readShort();
               _loc3_.push(_loc8_);
               _loc6_++;
            }
         }
         this.huYiXiLianMediator.setUpdataItem(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_53538(param1:ByteArray) : void
      {
         ZLog.add("53538：洗炼结果 返回 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.huYiXiLianMediator.huyiXiLianComplete(_loc2_,_loc3_);
      }
      
      public function received_53546(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Goods = null;
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         if(_loc2_ == 1)
         {
            _loc4_ = param1.readShort();
            _loc5_ = param1.readByte();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = new Goods(param1.readInt());
               _loc7_.count = param1.readShort();
               _loc3_.push(_loc7_);
               _loc6_++;
            }
         }
         this.longYinUpDataTypeMediator.setUpdateItem(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_53548(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.longYinUpDataTypeMediator.huyiUpdataComplete(_loc2_,_loc3_);
      }
      
      public function received_53550(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         if(_loc2_ == 1)
         {
            _loc4_ = param1.readShort();
            _loc5_ = param1.readByte();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc8_ = new Goods(param1.readInt());
               _loc8_.count = param1.readShort();
               _loc3_.push(_loc8_);
               _loc6_++;
            }
            _loc7_ = param1.readInt();
         }
         this.zhuangbeiJihuoMediator.setUpdataItem(_loc7_,_loc2_,_loc3_,_loc4_);
      }
      
      public function received_53552(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.zhuangbeiJihuoMediator.huyiUpdataComplete(_loc2_,_loc3_);
      }
      
      public function received_53554(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         if(_loc2_ == 1)
         {
            _loc5_ = param1.readShort();
            _loc6_ = param1.readByte();
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc8_ = new Goods(param1.readInt());
               _loc8_.count = param1.readShort();
               _loc3_.push(_loc8_);
               _loc7_++;
            }
         }
         var _loc4_:Object = {};
         _loc4_.gongji = param1.readDouble();
         _loc4_.fangyu = param1.readDouble();
         _loc4_.baoji = param1.readInt();
         _loc4_.shanbi = param1.readInt();
         _loc4_.shengming = param1.readDouble();
         _loc4_.neili = param1.readDouble();
         _loc4_.tili = param1.readInt();
         this.longyaKaiguangMediator.setUpdataItem(_loc2_,_loc3_,_loc5_,_loc4_);
      }
      
      public function received_53556(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.longyaKaiguangMediator.longyaUpdataComplete(_loc2_,_loc3_);
      }
      
      public function received_53558(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Goods = null;
         ZLog.add("53558：洗炼查询 返回 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         if(_loc2_ == 1)
         {
            _loc5_ = param1.readByte();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc8_ = param1.readInt();
               _loc9_ = new Goods(_loc8_);
               _loc9_.count = param1.readShort();
               _loc3_.push(_loc9_);
               _loc6_++;
            }
            _loc7_ = param1.readDouble();
         }
         var _loc4_:int = param1.readByte();
         this.hushenXiLianMediator.setUpdataItem(_loc2_,_loc3_,_loc7_,_loc4_);
      }
      
      public function received_53560(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         ZLog.add("53560：洗炼结果 返回 ");
         var _loc2_:Boolean = param1.readByte() == 0 ? false : true;
         var _loc3_:int = -1;
         if(_loc2_)
         {
            _loc3_ = param1.readShort();
            _loc5_ = param1.readByte();
            _loc6_ = param1.readInt();
         }
         var _loc4_:int = param1.readByte();
         this.hushenXiLianMediator.equipUpDataCommplete(_loc3_,_loc5_,_loc6_,_loc4_);
      }
      
      public function received_53572(param1:ByteArray) : void
      {
         ZLog.add("53572：史诗开封查询 返回 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readByte();
         var _loc5_:int = param1.readInt();
         this.shiShiKaiFengMediator.setUpdataItem(_loc2_,_loc3_,_loc5_,_loc4_);
      }
      
      public function received_53574(param1:ByteArray) : void
      {
         ZLog.add("53574：史诗开封结果 返回 ");
         var _loc2_:Boolean = param1.readByte() == 0 ? false : true;
         var _loc3_:int = -1;
         if(_loc2_)
         {
            _loc3_ = param1.readShort();
         }
         this.shiShiKaiFengMediator.updataComplete(_loc2_,_loc3_);
      }
      
      public function received_57352(param1:ByteArray) : void
      {
         ZLog.add("57352：护心药提示面板请求 返回 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.huXinYaoMediator.setUpdataItem(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_57354(param1:ByteArray) : void
      {
         ZLog.add("57354：护心药提示请求 返回 ");
         var _loc2_:Boolean = param1.readByte() == 0 ? false : true;
         var _loc3_:int = -1;
         if(_loc2_)
         {
            _loc3_ = param1.readShort();
         }
         this.huXinYaoMediator.updataComplete(_loc2_,_loc3_);
      }
      
      public function received_58954(param1:ByteArray) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Goods = null;
         var _loc10_:Goods = null;
         ZLog.add("58954：返回徽章拖入结果 返回 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:Boolean = param1.readByte() == 0 ? false : true;
         if(_loc3_)
         {
            _loc4_ = new Array();
            _loc5_ = param1.readShort();
            _loc6_ = new Array();
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc8_ = param1.readShort();
               _loc9_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc8_);
               if(_loc9_ != null)
               {
                  _loc10_ = new Goods(_loc9_.id);
                  _loc4_.push(_loc8_);
                  _loc6_.push(_loc10_);
               }
               _loc7_++;
            }
            this.xunZhangHeChengMediator.setItems(_loc4_,_loc6_);
         }
      }
      
      public function received_58956(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         ZLog.add("58956：返回合成徽章结果 ");
         var _loc2_:int = param1.readInt();
         var _loc3_:Boolean = param1.readByte() == 0 ? false : true;
         this.xunZhangHeChengMediator.setItems([],[]);
         if(_loc3_)
         {
            _loc4_ = param1.readInt();
            this.xunZhangHeChengMediator.setOKGood(_loc4_,1);
         }
      }
   }
}

