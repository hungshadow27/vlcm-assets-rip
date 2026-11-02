package com.tgame.moudels.amulet.model
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.amulet.view.AmultAddSheLiZi_Mediator;
   import com.tgame.moudels.amulet.view.Amult_Mediator;
   import com.tgame.moudels.amulet.view.BajiguiyuanhufuDakong_Mediator;
   import com.tgame.moudels.amulet.view.BaoShiDuanLian_Mediator;
   import com.tgame.moudels.amulet.view.DaoJuTiQuKa_Mediator;
   import com.tgame.moudels.amulet.view.RongXueDan_Mediator;
   import com.tgame.moudels.amulet.view.ShenLongAmult_Mediator;
   import com.tgame.moudels.amulet.view.ShenLongHuShenFuDaKong_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Amult_MsgReceivedProxy extends Proxy
   {
      
      public static var huShenFuIndex:int;
      
      public static const NAME:String = "Amult_MsgReceivedProxy";
      
      private var _amultMediator:Amult_Mediator;
      
      private var _amultAddSheLiZiMediator:AmultAddSheLiZi_Mediator;
      
      private var _shenLongAmultMediator:ShenLongAmult_Mediator;
      
      private var _rongXueDanMediator:RongXueDan_Mediator;
      
      private var _daoJuTiQuKa_Mediator:DaoJuTiQuKa_Mediator;
      
      private var _shenLongHuShenFuDaKongMediator:ShenLongHuShenFuDaKong_Mediator;
      
      private var _bajiguiyuanhufudakongMediator:BajiguiyuanhufuDakong_Mediator;
      
      private var _baoshiduanlianMediator:BaoShiDuanLian_Mediator;
      
      public function Amult_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([52102,52104,52106,52108,52110,52112,52114,52116,52118,52120,52122,52124,50182,52126,52128,52162,52164,83122,83124],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([52102,52104,52106,52108,52110,52112,52114,52116,52118,52120,52122,52124,50182,52126,52128,52162,52164,83122,83124],NAME);
      }
      
      private function get amult_Mediator() : Amult_Mediator
      {
         if(this._amultMediator == null)
         {
            this._amultMediator = facade.retrieveMediator(Amult_Mediator.NAME) as Amult_Mediator;
         }
         return this._amultMediator;
      }
      
      private function get amultAddSheLiZiMediator() : AmultAddSheLiZi_Mediator
      {
         if(this._amultAddSheLiZiMediator == null)
         {
            this._amultAddSheLiZiMediator = facade.retrieveMediator(AmultAddSheLiZi_Mediator.NAME) as AmultAddSheLiZi_Mediator;
         }
         return this._amultAddSheLiZiMediator;
      }
      
      private function get shenLongAmultMediator() : ShenLongAmult_Mediator
      {
         if(this._shenLongAmultMediator == null)
         {
            this._shenLongAmultMediator = facade.retrieveMediator(ShenLongAmult_Mediator.NAME) as ShenLongAmult_Mediator;
         }
         return this._shenLongAmultMediator;
      }
      
      private function get rongXueDanMediator() : RongXueDan_Mediator
      {
         if(this._rongXueDanMediator == null)
         {
            this._rongXueDanMediator = facade.retrieveMediator(RongXueDan_Mediator.NAME) as RongXueDan_Mediator;
         }
         return this._rongXueDanMediator;
      }
      
      private function get daoJuTiQuKa_Mediator() : DaoJuTiQuKa_Mediator
      {
         if(this._daoJuTiQuKa_Mediator == null)
         {
            this._daoJuTiQuKa_Mediator = facade.retrieveMediator(DaoJuTiQuKa_Mediator.NAME) as DaoJuTiQuKa_Mediator;
         }
         return this._daoJuTiQuKa_Mediator;
      }
      
      private function get shenLongHuShenFuDaKongMediator() : ShenLongHuShenFuDaKong_Mediator
      {
         if(this._shenLongHuShenFuDaKongMediator == null)
         {
            this._shenLongHuShenFuDaKongMediator = facade.retrieveMediator(ShenLongHuShenFuDaKong_Mediator.NAME) as ShenLongHuShenFuDaKong_Mediator;
         }
         return this._shenLongHuShenFuDaKongMediator;
      }
      
      private function get bajiguiyuanhufuDakongMediator() : BajiguiyuanhufuDakong_Mediator
      {
         if(this._bajiguiyuanhufudakongMediator == null)
         {
            this._bajiguiyuanhufudakongMediator = facade.retrieveMediator(BajiguiyuanhufuDakong_Mediator.NAME) as BajiguiyuanhufuDakong_Mediator;
         }
         return this._bajiguiyuanhufudakongMediator;
      }
      
      private function get baoshiduanlianMediator() : BaoShiDuanLian_Mediator
      {
         if(this._baoshiduanlianMediator == null)
         {
            this._baoshiduanlianMediator = facade.retrieveMediator(BaoShiDuanLian_Mediator.NAME) as BaoShiDuanLian_Mediator;
         }
         return this._baoshiduanlianMediator;
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
      
      public function received_52102(param1:ByteArray) : void
      {
         var _loc2_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Goods = null;
         var _loc8_:int = 0;
         _loc2_ = {};
         var _loc3_:int = param1.readShort();
         _loc2_.idArr = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = param1.readInt();
            _loc7_ = new Goods(_loc6_);
            _loc7_.roleID = -110;
            _loc7_.position = _loc5_;
            _loc7_.hushenfuIndex = huShenFuIndex;
            _loc8_ = param1.readInt();
            _loc2_.idArr.push([_loc7_,_loc5_ - ItemPositionRange.SHELIZI_RANGE.x]);
            _loc4_++;
         }
         _loc2_.max = param1.readShort();
         this.amultAddSheLiZiMediator.setGL(_loc2_);
      }
      
      public function received_52104(param1:ByteArray) : void
      {
         this.amultAddSheLiZiMediator.upDataComplete(param1.readByte(),LanResManager.getLanTextWords(this,"镶嵌失败"));
      }
      
      public function received_52106(param1:ByteArray) : void
      {
         this.amultAddSheLiZiMediator.upDataComplete(param1.readByte(),LanResManager.getLanTextWords(this,"镶嵌失败"));
      }
      
      public function received_52108(param1:ByteArray) : void
      {
         var _loc2_:Object = {};
         _loc2_.isUpData = param1.readByte();
         if(_loc2_.isUpData == 1)
         {
            _loc2_.id = param1.readInt();
            _loc2_.money = param1.readInt();
            _loc2_.juNengNum = param1.readShort();
            _loc2_.gl = param1.readInt() / 100;
            _loc2_.nextItem = param1.readInt();
            _loc2_.positionID = param1.readInt();
         }
         this.amult_Mediator.setGL(_loc2_,52108);
      }
      
      public function received_52110(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.amult_Mediator.upDataComplete(_loc2_,_loc3_,52110);
         SmallLoadingBar.close();
      }
      
      public function received_52112(param1:ByteArray) : void
      {
         var _loc2_:Object = {};
         _loc2_.isUpData = param1.readByte();
         if(_loc2_.isUpData == 1)
         {
            _loc2_.id = param1.readInt();
            _loc2_.money = param1.readInt();
            _loc2_.juNengNum = param1.readShort();
            _loc2_.gl = param1.readInt() / 100;
            _loc2_.nextItem = param1.readInt();
            _loc2_.positionID = param1.readInt();
         }
         this.amult_Mediator.setGL(_loc2_,52112);
      }
      
      public function received_52114(param1:ByteArray) : void
      {
         ZLog.add("52114：重置武功查询 ");
         var _loc2_:Object = {};
         _loc2_.isUpData = param1.readByte();
         if(_loc2_.isUpData == 1)
         {
            _loc2_.id = param1.readInt();
            _loc2_.jingLianShiNum = param1.readInt();
            _loc2_.money = param1.readInt();
            _loc2_.gl = param1.readInt() / 100;
         }
         this.amult_Mediator.setGL(_loc2_,52114);
      }
      
      public function received_52116(param1:ByteArray) : void
      {
         ZLog.add("52120：护身符进阶结果 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.amult_Mediator.upDataComplete(_loc2_,_loc3_,52116);
         SmallLoadingBar.close();
      }
      
      public function received_52118(param1:ByteArray) : void
      {
         ZLog.add("52118：重置武功类型 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.amult_Mediator.upDataComplete(_loc2_,_loc3_,52118);
         SmallLoadingBar.close();
      }
      
      public function received_52120(param1:ByteArray) : void
      {
         ZLog.add("52120：延时动画 ");
         SmallLoadingBar.showLoading(SynthesizeMsg.AmluteSmallLoadingBarMsg,OtherConst.EQUIP_UPDATA_USE_LOAD_BUFF_TIME);
      }
      
      public function received_52122(param1:ByteArray) : void
      {
         ZLog.add("52122：神龙护身符查询返回 ");
         var _loc2_:Object = {};
         _loc2_.isUpData = param1.readByte();
         if(_loc2_.isUpData == 1)
         {
            _loc2_.id = param1.readInt();
            _loc2_.money = param1.readInt();
            _loc2_.juNengNum = param1.readShort();
            _loc2_.gl = param1.readInt() / 100;
            _loc2_.nextItem = param1.readInt();
            _loc2_.positionID = param1.readInt();
         }
         this.shenLongAmultMediator.setGL(_loc2_);
      }
      
      public function received_52124(param1:ByteArray) : void
      {
         ZLog.add("52124：神龙护身符合成返回 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readShort();
         this.shenLongAmultMediator.upDataComplete(_loc2_,_loc3_);
         SmallLoadingBar.close();
      }
      
      public function received_50182(param1:ByteArray) : void
      {
         ZLog.add("50182：融雪丹合成返回 ");
         var _loc2_:int = param1.readByte();
         this.rongXueDanMediator.upDataComplete(_loc2_);
      }
      
      public function received_52126(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("52126：神龙护身符打孔查询返回 ");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 1)
         {
            _loc4_ = param1.readByte();
            _loc5_ = param1.readInt();
            if(_loc5_ == 729167)
            {
               this.bajiguiyuanhufuDakongMediator.setChangeItem(_loc2_,_loc4_,_loc5_);
            }
            else
            {
               this.shenLongHuShenFuDaKongMediator.setChangeItem(_loc2_,_loc4_,_loc5_);
            }
         }
      }
      
      public function received_52128(param1:ByteArray) : void
      {
         ZLog.add("52128：神龙护身符打孔确定返回 ");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         if(_loc3_ == 1)
         {
            if(_loc4_ == 729167)
            {
               this.bajiguiyuanhufuDakongMediator.itemChangeComplete(_loc2_,_loc4_);
            }
            else
            {
               this.shenLongHuShenFuDaKongMediator.itemChangeComplete(_loc2_,_loc4_);
            }
         }
      }
      
      public function received_52162(param1:ByteArray) : void
      {
         ZLog.add("52162：道具提取宝盒刷新返回 ");
         var _loc2_:int = param1.readShort();
         this.daoJuTiQuKa_Mediator.setTiquBaohe(_loc2_);
      }
      
      public function received_52164(param1:ByteArray) : void
      {
         ZLog.add("52164：道具提取宝盒结果返回 ");
         var _loc2_:int = param1.readByte();
         if(_loc2_)
         {
            this.daoJuTiQuKa_Mediator.setClose();
         }
      }
      
      public function received_83122(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("83122：神龙护身符打孔查询返回 ");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 1)
         {
            _loc4_ = param1.readByte();
            _loc5_ = param1.readInt();
            if(_loc5_ == 729843)
            {
               this.baoshiduanlianMediator.setChangeItem(_loc2_,_loc4_,_loc5_);
            }
            else
            {
               this.shenLongHuShenFuDaKongMediator.setChangeItem(_loc2_,_loc4_,_loc5_);
            }
         }
      }
      
      public function received_83124(param1:ByteArray) : void
      {
         ZLog.add("83124：神龙护身符打孔确定返回 ");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         if(_loc3_ == 1)
         {
            if(_loc4_ == 729843)
            {
               this.baoshiduanlianMediator.itemChangeComplete(_loc2_,_loc4_);
            }
            else
            {
               this.shenLongHuShenFuDaKongMediator.itemChangeComplete(_loc2_,_loc4_);
            }
         }
      }
   }
}

