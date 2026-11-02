package com.tgame.moudels.zixiashengong.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.zixiashengong.info.ZiXiaVO;
   import com.tgame.moudels.zixiashengong.view.ZiXia_LingwuPanelMediator;
   import com.tgame.moudels.zixiashengong.view.ZiXia_PlaneMediator;
   import com.tgame.moudels.zixiashengong.view.ZiXia_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZiXia_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ZiXia_MsgReceivedProxy";
      
      private var _zixiaMainMediator:ZiXia_PlaneMediator;
      
      private var _lingwuPanelMediator:ZiXia_LingwuPanelMediator;
      
      private var _targetMediator:ZiXia_TargetPanelMediator;
      
      private var oldzhufu:int;
      
      public function ZiXia_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get zixiaMainMediator() : ZiXia_PlaneMediator
      {
         if(!this._zixiaMainMediator)
         {
            this._zixiaMainMediator = facade.retrieveMediator(ZiXia_PlaneMediator.NAME) as ZiXia_PlaneMediator;
         }
         return this._zixiaMainMediator;
      }
      
      private function get lingwuPlaneMediator() : ZiXia_LingwuPanelMediator
      {
         if(!this._lingwuPanelMediator)
         {
            this._lingwuPanelMediator = facade.retrieveMediator(ZiXia_LingwuPanelMediator.NAME) as ZiXia_LingwuPanelMediator;
         }
         return this._lingwuPanelMediator;
      }
      
      private function get targetPlaneMediator() : ZiXia_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(ZiXia_TargetPanelMediator.NAME) as ZiXia_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([57382,57384,57386,57388],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([57382,57384,57386,57388],NAME);
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
      
      public function received_57382(param1:ByteArray) : void
      {
         var _loc4_:ZiXiaVO = null;
         var _loc5_:int = 0;
         var _loc9_:Boolean = false;
         ZLog.add("57382：接收紫霞神功 信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = new ZiXiaVO();
            _loc4_.id = param1.readInt();
            _loc4_.name = param1.readUTF();
            _loc4_.isLingwu = param1.readByte();
            _loc4_.shuxing[0] = param1.readInt();
            _loc4_.shuxing[1] = param1.readInt();
            _loc4_.shuxing[2] = param1.readInt();
            _loc4_.shuxing[3] = param1.readInt();
            _loc4_.shuxing[4] = param1.readInt();
            _loc3_.push(_loc4_);
            _loc5_++;
         }
         var _loc6_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < 5)
         {
            _loc6_[_loc5_] = param1.readInt();
            _loc5_++;
         }
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readInt();
         _loc9_ = Boolean(param1.readByte());
         var _loc10_:Boolean = Boolean(param1.readByte());
         _loc9_ = Boolean(param1.readByte());
         this.zixiaMainMediator.ZixiaEffectShow(_loc9_);
         var _loc11_:Boolean = Boolean(param1.readByte() == 1);
         var _loc12_:Boolean = Boolean(param1.readByte() == 1);
         var _loc13_:int = param1.readInt();
         var _loc14_:Boolean = Boolean(param1.readByte() == 1);
         var _loc15_:Boolean = Boolean(param1.readByte() == 1);
         this.zixiaMainMediator.refreshJianInfo(_loc11_,_loc6_,_loc3_,_loc8_,_loc7_,_loc12_,_loc13_);
         this.zixiaMainMediator.setZuoQi(_loc14_,_loc15_);
         this.lingwuPlaneMediator.yingcangLingwuPanel();
      }
      
      public function received_57384(param1:ByteArray) : void
      {
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         ZLog.add("57384：悟道查询结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ != ZiXia_PlaneMediator.curLevel + 1)
         {
            return;
         }
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         _loc9_ = ZiXia_PlaneMediator.curLevel == _loc5_ ? true : false;
         var _loc11_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc6_,true);
         _loc10_ = _loc7_ <= _loc11_ ? true : false;
         var _loc12_:String = GoodsResManager.getGoodsRes(_loc6_).name;
         var _loc13_:String = this.getQiantiId(_loc5_);
         var _loc14_:Boolean = _loc9_;
         var _loc15_:String = _loc12_;
         var _loc16_:int = _loc7_;
         var _loc17_:Boolean = _loc10_;
         var _loc18_:int = _loc8_;
         this.lingwuPlaneMediator.xiaohaoGoodsId = _loc6_;
         this.lingwuPlaneMediator.xiaohaoNeedNum = _loc16_;
         this.lingwuPlaneMediator.initLingwuPanel(_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_);
         var _loc19_:int = _loc3_ - this.oldzhufu;
         if(_loc19_ < 0)
         {
            _loc19_ = 0;
         }
         this.lingwuPlaneMediator.setZixiaLingwuZhufuzhi(_loc3_,_loc4_,_loc19_);
         this.oldzhufu = _loc3_;
         var _loc20_:Goods = new Goods(_loc6_);
         _loc20_.count = _loc11_;
         this.lingwuPlaneMediator.setZixiaLingwuGoods(_loc20_);
      }
      
      private function getQiantiId(param1:int) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case 0:
               _loc2_ = LanResManager.getLanCommonTextWords("等级达到50级");
               break;
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟纯阳");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟云吞");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟绵云");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟断风");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟捉影");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟雨集");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟冥思");
               break;
            case 8:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟孤剑");
               break;
            case 9:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟乘霞");
               break;
            case 10:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟凝神");
               break;
            case 11:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟韬光");
               break;
            case 12:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟紫气");
               break;
            default:
               _loc2_ = LanResManager.getLanCommonTextWords("等级达到50级");
         }
         return _loc2_;
      }
      
      public function received_57386(param1:ByteArray) : void
      {
         ZLog.add("57386：领悟进阶结果");
         var _loc2_:Boolean = Boolean(param1.readByte());
         if(_loc2_)
         {
            this.lingwuPlaneMediator.lingwuSuccess();
         }
         else
         {
            this.lingwuPlaneMediator.lingwuFail();
         }
      }
      
      public function received_57388(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:String = null;
         var _loc30_:String = null;
         var _loc31_:String = null;
         var _loc32_:String = null;
         var _loc33_:Object = null;
         ZLog.add("57388：查询他人紫霞 悟道信息");
         var _loc2_:int = param1.readInt();
         if(_loc2_ != ZiXia_PlaneMediator.lookPlayerID)
         {
            return;
         }
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = "";
         var _loc10_:int = 0;
         var _loc11_:Array = [];
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:Array = [];
         _loc18_ = 0;
         while(_loc18_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.id = param1.readInt();
            _loc5_.zhaoshi = param1.readUTF();
            _loc28_ = param1.readByte();
            if(_loc28_ == 0)
            {
               _loc5_.lingwu = false;
            }
            else
            {
               _loc5_.lingwu = true;
            }
            if(_loc5_.lingwu)
            {
               _loc6_ = Math.max(_loc6_,_loc5_.id);
            }
            _loc12_ = param1.readInt();
            _loc13_ = param1.readInt();
            _loc14_ = param1.readInt();
            _loc15_ = param1.readInt();
            _loc16_ = param1.readInt();
            _loc11_ = [_loc12_,_loc13_,_loc14_,_loc15_,_loc16_];
            _loc10_ = 0;
            _loc19_ = 0;
            while(_loc19_ < 5)
            {
               _loc8_ = int(_loc11_[_loc19_]);
               if(_loc19_ == 0)
               {
                  _loc9_ = LanResManager.getLanCommonTextWords("加攻击：");
               }
               else if(_loc19_ == 1)
               {
                  _loc9_ = LanResManager.getLanCommonTextWords("加防御：");
               }
               else if(_loc19_ == 2)
               {
                  _loc9_ = LanResManager.getLanCommonTextWords("加生命：");
               }
               else if(_loc19_ == 3)
               {
                  _loc9_ = LanResManager.getLanCommonTextWords("加内力：");
               }
               else
               {
                  _loc9_ = LanResManager.getLanCommonTextWords("加体力：");
               }
               if(_loc8_ != 0)
               {
                  _loc17_[_loc10_] = _loc9_ + _loc8_;
                  _loc10_++;
               }
               _loc19_++;
            }
            _loc29_ = _loc17_[0];
            _loc30_ = _loc17_[1];
            _loc31_ = _loc17_[2];
            _loc32_ = _loc17_[3];
            _loc5_.shuxing = [_loc29_,_loc30_,_loc31_,_loc32_];
            _loc4_.push(_loc5_);
            if(_loc5_.lingwu == true)
            {
               _loc7_++;
            }
            _loc18_++;
         }
         _loc19_ = 0;
         while(_loc19_ < _loc4_.length)
         {
            _loc33_ = _loc4_[_loc19_];
            if(_loc19_ == _loc7_)
            {
               _loc33_.dangqian = true;
            }
            else
            {
               _loc33_.dangqian = false;
            }
            _loc19_++;
         }
         var _loc20_:Array = [];
         _loc18_ = 0;
         while(_loc18_ < 5)
         {
            _loc20_[_loc18_] = param1.readInt();
            _loc18_++;
         }
         var _loc21_:int = param1.readByte();
         var _loc22_:int = param1.readInt();
         var _loc23_:Boolean = Boolean(param1.readByte() == 1);
         var _loc24_:Boolean = Boolean(param1.readByte() == 1);
         var _loc25_:int = param1.readInt();
         var _loc26_:Boolean = Boolean(param1.readByte() == 1);
         var _loc27_:Boolean = Boolean(param1.readByte() == 1);
         this.targetPlaneMediator.initTargetDuguPanel(_loc23_,_loc20_,_loc4_,_loc6_,_loc21_,_loc22_,_loc24_,_loc25_);
         this.targetPlaneMediator.setZuoQi(_loc26_,_loc27_);
      }
   }
}

