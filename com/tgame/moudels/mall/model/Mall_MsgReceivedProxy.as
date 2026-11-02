package com.tgame.moudels.mall.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.shengwang.ShengWangGoodManager;
   import com.tgame.common.res.shengwang.ShengWangGoodRes;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.MallGoods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.mall.model.vo.MallLunJianGoodsVO;
   import com.tgame.moudels.mall.view.Mall_FreeCadeMediator;
   import com.tgame.moudels.mall.view.Mall_JiFenMediator;
   import com.tgame.moudels.mall.view.Mall_LabourMediator;
   import com.tgame.moudels.mall.view.Mall_LunJianMediator;
   import com.tgame.moudels.mall.view.Mall_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Mall_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Mall_MsgReceivedProxy";
      
      private var _msgSenderProxy:Mall_MsgSenderProxy;
      
      private var _mall_LabourMediator:Mall_LabourMediator;
      
      private var _mallMediator:Mall_Mediator;
      
      private var _mallFreeCard:Mall_FreeCadeMediator;
      
      private var _mallLunJianMediator:Mall_LunJianMediator;
      
      private var _mallJiFenMediator:Mall_JiFenMediator;
      
      public function Mall_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get msgSenderProxy() : Mall_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Mall_MsgSenderProxy.NAME) as Mall_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get mall_LabourMediator() : Mall_LabourMediator
      {
         if(!this._mall_LabourMediator)
         {
            this._mall_LabourMediator = facade.retrieveMediator(Mall_LabourMediator.NAME) as Mall_LabourMediator;
         }
         return this._mall_LabourMediator;
      }
      
      private function get mallMediator() : Mall_Mediator
      {
         if(!this._mallMediator)
         {
            this._mallMediator = facade.retrieveMediator(Mall_Mediator.NAME) as Mall_Mediator;
         }
         return this._mallMediator;
      }
      
      private function get mallFreeCard() : Mall_FreeCadeMediator
      {
         if(!this._mallFreeCard)
         {
            this._mallFreeCard = facade.retrieveMediator(Mall_FreeCadeMediator.NAME) as Mall_FreeCadeMediator;
         }
         return this._mallFreeCard;
      }
      
      private function get mallLunJianMediator() : Mall_LunJianMediator
      {
         if(!this._mallLunJianMediator)
         {
            this._mallLunJianMediator = facade.retrieveMediator(Mall_LunJianMediator.NAME) as Mall_LunJianMediator;
         }
         return this._mallLunJianMediator;
      }
      
      private function get mallJiFenMediator() : Mall_JiFenMediator
      {
         if(!this._mallJiFenMediator)
         {
            this._mallJiFenMediator = facade.retrieveMediator(Mall_JiFenMediator.NAME) as Mall_JiFenMediator;
         }
         return this._mallJiFenMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([12102,12104,12108,12110,12112,12114,12116,53252,53254,12122,12124,12128],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([12102,12104,12108,12110,12112,12114,12116,53252,53254,12122,12124,12128],NAME);
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
      
      public function received_12102(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:MallGoods = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readDouble();
         var _loc5_:int = _loc2_.readByte();
         ZLog.add("12102：收到  商城列表消息  数量=" + _loc5_);
         var _loc6_:Array = new Array();
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = new MallGoods(_loc8_,_loc9_);
            _loc10_.f_goods_price = _loc2_.readInt();
            _loc10_.f_goods_price_org = _loc2_.readInt();
            _loc10_.f_hot_mark = _loc2_.readByte();
            _loc10_.f_abate_mark = _loc2_.readByte();
            _loc6_.push(_loc10_);
            _loc7_++;
         }
         if(_loc3_ == 100)
         {
            this.mallFreeCard.updateMallPanel(_loc3_,_loc4_,_loc6_);
         }
         else
         {
            this.mallMediator.updateMallPanel(_loc3_,_loc4_,_loc6_);
         }
      }
      
      public function received_12104(param1:ByteArray) : void
      {
         var _loc5_:MallGoods = null;
         var _loc6_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Boolean = _loc2_.readBoolean();
         ZLog.add("12104： 返回是否购买" + _loc3_ + "成功  " + _loc4_);
         if(_loc4_)
         {
            if(Fun.isVisible(GameInstance.uiInstance.yn888shopPanel))
            {
               PipeManager.sendMsg(PipeConstants.REFRESH_YUENAN888SHOP,GameInstance.uiInstance.yn888shopPanel.reTypeID());
            }
            _loc5_ = this.mallMediator.getGoodsByID(_loc3_);
            if(_loc5_)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("恭喜您购得") + _loc5_.res.name + LanResManager.getLanCommonTextWords("物品"));
            }
            PipeManager.sendMsg(PipeConstants.BUY_GOOD_SUCCESS,_loc3_);
         }
         else
         {
            _loc6_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("购买商城道具失败：") + _loc6_);
         }
      }
      
      public function received_12108(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = -1;
         if(_loc5_ > 0)
         {
            _loc8_ = _loc5_ - _loc6_;
         }
         var _loc9_:Goods = new Goods(_loc3_);
         _loc9_.count = 0;
         this.mallMediator.mallPanel.showBuyPanel(_loc2_,_loc9_.getBigICOPath(),_loc9_.res.name,_loc4_,_loc9_.res.use_desc,GameInstance.mainCharData.moneyInfo.gold,GameInstance.mainCharData.moneyInfo.jinpiao,_loc8_,_loc7_);
      }
      
      public function received_12110(param1:ByteArray) : void
      {
         this.mallMediator.closeMysteryMallPanel();
      }
      
      public function received_12112(param1:ByteArray) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:MallGoods = null;
         var _loc12_:int = 0;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readDouble();
         var _loc6_:int = _loc2_.readByte();
         ZLog.add("12112：收到  商城列表消息  数量=" + _loc6_);
         var _loc7_:Array = new Array();
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc9_ = _loc2_.readInt();
            _loc10_ = _loc2_.readInt();
            _loc11_ = new MallGoods(_loc9_,_loc10_);
            _loc11_.f_goods_price = _loc2_.readInt();
            _loc11_.f_goods_price_org = _loc2_.readInt();
            _loc11_.f_hot_mark = _loc2_.readByte();
            _loc11_.f_abate_mark = _loc2_.readByte();
            _loc12_ = _loc2_.readByte();
            if(_loc12_ == 4)
            {
               _loc11_.f_type = _loc12_;
            }
            else
            {
               _loc11_.f_type = 0;
            }
            _loc7_.push(_loc11_);
            _loc8_++;
         }
         this.mallMediator.showMysteryMallPanel(_loc3_,_loc5_,_loc7_,_loc4_);
      }
      
      public function received_12114(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:MallGoods = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readDouble();
         var _loc5_:int = _loc2_.readByte();
         ZLog.add("12114：收到  商城列表消息  数量=" + _loc5_);
         var _loc6_:Array = new Array();
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = new MallGoods(_loc8_,_loc9_);
            _loc10_.f_goods_price = _loc2_.readInt();
            _loc10_.f_goods_price_org = _loc2_.readInt();
            _loc10_.f_hot_mark = _loc2_.readByte();
            _loc10_.f_abate_mark = _loc2_.readByte();
            _loc6_.push(_loc10_);
            _loc7_++;
         }
         this.mall_LabourMediator.updateMallPanel(_loc3_,_loc4_,_loc6_);
      }
      
      public function received_12116(param1:ByteArray) : void
      {
         var _loc5_:MallGoods = null;
         var _loc6_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Boolean = _loc2_.readBoolean();
         ZLog.add("12116： 返回是否购买" + _loc3_ + "成功  " + _loc4_);
         if(_loc4_)
         {
            _loc5_ = this.mallMediator.getGoodsByID(_loc3_);
            if(_loc5_)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("恭喜您购得") + _loc5_.res.name + LanResManager.getLanCommonTextWords("物品"));
            }
         }
         else
         {
            _loc6_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("购买商城道具失败：") + _loc6_);
         }
      }
      
      public function received_53252(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc6_:MallLunJianGoodsVO = null;
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         var _loc9_:ShengWangGoodRes = null;
         ZLog.add("53252：收到 请求论剑声望商品");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc5_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc6_ = new MallLunJianGoodsVO();
            _loc6_.mallID = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = new Goods(_loc7_);
            _loc6_.goods = _loc8_;
            _loc6_.shengWangType = param1.readByte();
            _loc6_.shengWang = param1.readInt();
            _loc9_ = ShengWangGoodManager.getShengWangGoods(_loc6_.mallID);
            if(_loc9_)
            {
               _loc6_.desc = _loc9_.desc;
               _loc6_.use_desc = _loc9_.use_desc;
            }
            else
            {
               _loc6_.desc = "";
            }
            _loc5_.push(_loc6_);
            _loc4_++;
         }
         this.mallLunJianMediator.setMallGoodsArr(_loc5_);
      }
      
      public function received_53254(param1:ByteArray) : void
      {
         ZLog.add("53254：收到 请求论剑声望商品");
         this.mallLunJianMediator.updateShengWangZhi();
      }
      
      public function received_12122(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:MallGoods = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readByte();
         ZLog.add("12122：收到  商城列表消息  数量=" + _loc5_);
         var _loc6_:Array = new Array();
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = new MallGoods(_loc8_,_loc9_);
            _loc10_.f_goods_price = _loc2_.readInt();
            _loc10_.f_goods_price_org = _loc2_.readInt();
            _loc10_.f_hot_mark = _loc2_.readByte();
            _loc10_.f_abate_mark = _loc2_.readByte();
            _loc6_.push(_loc10_);
            _loc7_++;
         }
         this.mallJiFenMediator.updateMallPanel(_loc3_,_loc4_,_loc6_);
      }
      
      public function received_12124(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:Boolean = _loc2_.readBoolean();
         ZLog.add("12124： 返回是否购买" + _loc4_ + "成功  " + _loc5_);
         this.mallJiFenMediator.setSilver(_loc3_);
      }
      
      public function received_12128(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = -1;
         if(_loc5_ > 0)
         {
            _loc7_ = _loc5_ - _loc6_;
         }
         var _loc8_:Goods = new Goods(_loc3_);
         _loc8_.count = 0;
         this.mallJiFenMediator.mallPanel.showBuyPanel(_loc2_,_loc8_.getBigICOPath(),_loc8_.res.name,_loc4_,_loc8_.res.use_desc,GameInstance.mainCharData.moneyInfo.gold,GameInstance.mainCharData.moneyInfo.jinpiao,_loc7_);
      }
   }
}

