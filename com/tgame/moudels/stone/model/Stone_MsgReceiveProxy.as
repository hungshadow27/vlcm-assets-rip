package com.tgame.moudels.stone.model
{
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.stone.view.HuiZhangHeCheng;
   import com.tgame.moudels.stone.view.UI_MainCharEasyEquipAddStoneMediator;
   import com.tgame.moudels.stone.view.UI_MainCharSixStoneToSevenStoneMediator;
   import com.tgame.moudels.stone.view.UI_MainCharStoneMediator;
   import com.tgame.moudels.stone.view.UI_XunzhangXiangqianMediator;
   import com.tgame.shell.view.components.StonePanel;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Stone_MsgReceiveProxy extends Proxy
   {
      
      public static const NAME:String = "Stone_MsgReceiveProxy";
      
      private var _stoneMediator:UI_MainCharStoneMediator;
      
      private var _huiZhangMediator:HuiZhangHeCheng;
      
      private var _easyStoneMediator:UI_MainCharEasyEquipAddStoneMediator;
      
      private var _sixStoneToSevenStone:UI_MainCharSixStoneToSevenStoneMediator;
      
      private var _xunzhangXiangqian:UI_XunzhangXiangqianMediator;
      
      public function Stone_MsgReceiveProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50198,50196,50194,50162,50164,50166,50170,53544,53570],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50198,50196,50194,50162,50164,50166,50170,53544,53570],NAME);
      }
      
      private function get stoneMediator() : UI_MainCharStoneMediator
      {
         if(this._stoneMediator == null)
         {
            this._stoneMediator = facade.retrieveMediator(UI_MainCharStoneMediator.NAME) as UI_MainCharStoneMediator;
         }
         return this._stoneMediator;
      }
      
      private function get huiZhangMediator() : HuiZhangHeCheng
      {
         if(this._huiZhangMediator == null)
         {
            this._huiZhangMediator = facade.retrieveMediator(HuiZhangHeCheng.NAME) as HuiZhangHeCheng;
         }
         return this._huiZhangMediator;
      }
      
      private function get easyStoneMediator() : UI_MainCharEasyEquipAddStoneMediator
      {
         if(this._easyStoneMediator == null)
         {
            this._easyStoneMediator = facade.retrieveMediator(UI_MainCharEasyEquipAddStoneMediator.NAME) as UI_MainCharEasyEquipAddStoneMediator;
         }
         return this._easyStoneMediator;
      }
      
      private function get sixStoneToSevenStone() : UI_MainCharSixStoneToSevenStoneMediator
      {
         if(this._sixStoneToSevenStone == null)
         {
            this._sixStoneToSevenStone = facade.retrieveMediator(UI_MainCharSixStoneToSevenStoneMediator.NAME) as UI_MainCharSixStoneToSevenStoneMediator;
         }
         return this._sixStoneToSevenStone;
      }
      
      private function get xunzhangXiangqianMediator() : UI_XunzhangXiangqianMediator
      {
         if(this._xunzhangXiangqian == null)
         {
            this._xunzhangXiangqian = facade.retrieveMediator(UI_XunzhangXiangqianMediator.NAME) as UI_XunzhangXiangqianMediator;
         }
         return this._xunzhangXiangqian;
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
      
      public function received_50194(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         SmallLoadingBar.close();
         this.stoneMediator.removeLoaderBuff();
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
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
         this.stoneMediator.upDataItem(StonePanel.UI_STONE_PANEL_MAKE_SHOW,_loc2_,_loc3_);
      }
      
      public function received_50196(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 9)
         {
            this.stoneMediator.upDataItem(StonePanel.UI_STONE_PANEL_INLAY_SHOW,_loc2_);
         }
         if(_loc3_ == 11 || _loc3_ == 23)
         {
            this.easyStoneMediator.upDataItem(StonePanel.UI_STONE_PANEL_INLAY_SHOW,_loc2_,null,_loc3_);
         }
         if(_loc3_ == 22)
         {
            this.easyStoneMediator.upDataItem_caidan_xiangqian(StonePanel.UI_STONE_PANEL_INLAY_SHOW,_loc2_);
         }
      }
      
      public function received_50198(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 10)
         {
            this.stoneMediator.upDataItem(StonePanel.UI_STONE_PANEL_ABRUPTION_SHOW,_loc2_);
         }
         if(_loc3_ == 11 || _loc3_ == 23)
         {
            this.easyStoneMediator.upDataItem(StonePanel.UI_STONE_PANEL_ABRUPTION_SHOW,_loc2_,null,_loc3_);
         }
         if(_loc3_ == 22)
         {
            this.easyStoneMediator.upDataItem_caidan_xiangqian(StonePanel.UI_STONE_PANEL_ABRUPTION_SHOW,_loc2_);
         }
      }
      
      public function received_50162(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         this.stoneMediator.isChangeStoneType(_loc2_,_loc3_);
      }
      
      public function received_50164(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.stoneMediator.upDataItem(StonePanel.UI_STONE_PANEL_TIME_MAKE_SHOW,_loc2_,{
            "index":_loc3_,
            "type":false
         });
      }
      
      public function received_50166(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.stoneMediator.upDataItem(StonePanel.UI_STONE_PANEL_TIME_MAKE_SHOW,_loc2_,{
            "index":_loc3_,
            "type":true
         });
      }
      
      public function received_50170(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         this.sixStoneToSevenStone.upDataItem(_loc2_ == 0 ? false : true);
      }
      
      public function received_53544(param1:ByteArray) : void
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         if(_loc4_ == 1)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = new Goods(_loc6_);
            _loc8_.count = _loc7_;
            _loc5_ = [_loc8_];
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            if(_loc7_ > 0)
            {
               _loc8_ = new Goods(_loc6_);
               _loc8_.count = _loc7_;
               _loc5_.push(_loc8_);
            }
         }
         this.huiZhangMediator.heChengComplete(_loc4_,_loc3_,_loc2_,_loc5_);
      }
      
      public function received_53570(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Goods = null;
         ZLog.add("53570：藏宝阁勋章镶嵌查询返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = param1.readInt();
            _loc7_ = new Goods(_loc6_);
            _loc4_.push(_loc7_);
            _loc5_++;
         }
         this.xunzhangXiangqianMediator.setItem(_loc2_,_loc4_);
      }
   }
}

