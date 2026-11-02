package com.tgame.moudels.dugujiujian.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.dugujiujian.DugujiujianManager;
   import com.tgame.common.res.dugujiujian.DugujiujianRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.dugujiujian.info.JianVO;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_PlaneMediator;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_TargetPanelMediator;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Dugujiujian_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Dugujiujian_MsgReceivedProxy";
      
      private var isNo1Received10108:Boolean = true;
      
      private var _dugujiujianPlaneMediator:Dugujiujian_PlaneMediator;
      
      private var _lingwuPanelMediator:Dugujiujian_LingwuPanelMediator;
      
      private var _targetMediator:Dugujiujian_TargetPanelMediator;
      
      private var oldzhufu:int;
      
      public function Dugujiujian_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get dugujiujianPlaneMediator() : Dugujiujian_PlaneMediator
      {
         if(!this._dugujiujianPlaneMediator)
         {
            this._dugujiujianPlaneMediator = facade.retrieveMediator(Dugujiujian_PlaneMediator.NAME) as Dugujiujian_PlaneMediator;
         }
         return this._dugujiujianPlaneMediator;
      }
      
      private function get lingwuPlaneMediator() : Dugujiujian_LingwuPanelMediator
      {
         if(!this._lingwuPanelMediator)
         {
            this._lingwuPanelMediator = facade.retrieveMediator(Dugujiujian_LingwuPanelMediator.NAME) as Dugujiujian_LingwuPanelMediator;
         }
         return this._lingwuPanelMediator;
      }
      
      private function get targetPlaneMediator() : Dugujiujian_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(Dugujiujian_TargetPanelMediator.NAME) as Dugujiujian_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53262,53264,53266,53268,53270],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53262,53264,53266,53268,53270],NAME);
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
      
      public function received_53262(param1:ByteArray) : void
      {
         var _loc4_:JianVO = null;
         ZLog.add("53262：接收独孤悟道信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = new JianVO();
            _loc4_.id = param1.readInt();
            _loc4_.name = param1.readUTF();
            _loc4_.isLingwu = param1.readByte();
            _loc4_.addAttack = param1.readInt();
            _loc4_.addDefend = param1.readInt();
            _loc4_.addLifeMax = param1.readInt();
            _loc4_.addNeiliMax = param1.readInt();
            _loc4_.addTiliMax = param1.readInt();
            _loc4_.gongjijianpu = param1.readInt();
            _loc4_.fangyujianpu = param1.readInt();
            _loc4_.xueliangjianpu = param1.readInt();
            _loc3_.push(_loc4_);
            _loc5_++;
         }
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readInt();
         this.dugujiujianPlaneMediator.refreshJianInfo(_loc3_,_loc7_,_loc6_);
         var _loc8_:Boolean = Boolean(param1.readByte());
         this.dugujiujianPlaneMediator.showDuguEffect(_loc8_);
         var _loc9_:Boolean = Boolean(param1.readByte());
         var _loc10_:Boolean = param1.readByte() == 1;
         this.dugujiujianPlaneMediator.setJihuo(_loc9_,_loc10_);
      }
      
      public function received_53264(param1:ByteArray) : void
      {
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         ZLog.add("53264：悟道查询结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ != Dugujiujian_PlaneMediator.curLevel + 1)
         {
            return;
         }
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         _loc10_ = Dugujiujian_PlaneMediator.curLevel == _loc5_ ? true : false;
         var _loc13_:int = GameInstance.mainCharData.attributeInfo.gqNow;
         _loc11_ = _loc8_ <= _loc13_ ? true : false;
         var _loc14_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc6_,true);
         _loc12_ = _loc7_ <= _loc14_ ? true : false;
         var _loc15_:String = GoodsResManager.getGoodsRes(_loc6_).name;
         var _loc16_:String = this.getQiantiId(_loc5_);
         var _loc17_:Boolean = _loc10_;
         var _loc18_:String = _loc15_;
         var _loc19_:int = _loc7_;
         var _loc20_:Boolean = _loc12_;
         var _loc21_:int = _loc8_;
         var _loc22_:Boolean = _loc11_;
         var _loc23_:int = _loc9_;
         this.lingwuPlaneMediator.xiaohaoGoodsId = _loc6_;
         this.lingwuPlaneMediator.xiaohaoNeedNum = _loc19_;
         this.lingwuPlaneMediator.xiaohaoZhenqi = _loc8_;
         this.lingwuPlaneMediator.initLingwuPanel(_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_);
         var _loc24_:int = _loc3_ - this.oldzhufu;
         this.lingwuPlaneMediator.setJiujianLingwuZhufuzhi(_loc3_,_loc4_,_loc24_);
         this.oldzhufu = _loc3_;
         var _loc25_:Goods = new Goods(_loc6_);
         _loc25_.count = _loc14_;
         this.lingwuPlaneMediator.setJiujianLingwuGoods(_loc25_);
         var _loc26_:DugujiujianRes = DugujiujianManager.getDugujiujianRes(String(Dugujiujian_PlaneMediator.curLevel + 1));
         var _loc27_:String = _loc26_.sub_desc;
         this.lingwuPlaneMediator.setJiujianLingwuShuoming(_loc27_);
      }
      
      private function getQiantiId(param1:int) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case 0:
               _loc2_ = LanResManager.getLanCommonTextWords("等级达到62级");
               break;
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟总决式");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟破剑式");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟破刀式");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟破枪式");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟破鞭式");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟破索式");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟破掌式");
               break;
            case 8:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟破箭式");
               break;
            case 9:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟破气式");
               break;
            case 10:
               _loc2_ = LanResManager.getLanCommonTextWords("已领万破气式");
               break;
            default:
               _loc2_ = LanResManager.getLanCommonTextWords("等级达到62级");
         }
         return _loc2_;
      }
      
      public function received_53266(param1:ByteArray) : void
      {
         ZLog.add("53266：领悟进阶结果");
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
      
      public function received_53268(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc7_:int = 0;
         var _loc14_:DugujiujianRes = null;
         var _loc15_:Skill = null;
         var _loc16_:Object = null;
         ZLog.add("53268：查询他人独孤九剑 悟道信息");
         var _loc2_:int = param1.readInt();
         if(_loc2_ != Dugujiujian_PlaneMediator.lookPlayerID)
         {
            return;
         }
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < _loc3_)
         {
            _loc14_ = DugujiujianManager.getDugujiujianRes(String(_loc8_ + 1));
            _loc5_ = new Object();
            _loc5_.id = param1.readInt();
            _loc5_.zhaoshi = param1.readUTF();
            _loc5_.lingwu = param1.readByte() == 0 ? false : true;
            if(_loc5_.lingwu)
            {
               _loc6_ = Math.max(_loc6_,_loc5_.id);
            }
            _loc5_.shuxing = [param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt()];
            _loc5_.miaoshu = _loc14_.main_desc;
            _loc15_ = new Skill(_loc14_.ico);
            _loc15_.isLearn = _loc5_.lingwu;
            _loc5_.ico = _loc15_;
            _loc5_.nanyidu = _loc14_.degree;
            _loc5_.nandu = _loc14_.degree_xj;
            _loc5_.fengdu = _loc14_.rich_level;
            _loc5_.gongjijianpu = param1.readInt();
            _loc5_.fangyujianpu = param1.readInt();
            _loc5_.xueliangjianpu = param1.readInt();
            _loc4_.push(_loc5_);
            if(_loc5_.isLingwu == true)
            {
               _loc7_++;
            }
            _loc8_++;
         }
         var _loc9_:int = 0;
         while(_loc9_ < _loc4_.length)
         {
            _loc16_ = _loc4_[_loc9_];
            if(_loc9_ == _loc7_)
            {
               _loc16_.dangqian = true;
            }
            else
            {
               _loc16_.dangqian = false;
            }
            _loc9_++;
         }
         var _loc10_:int = param1.readByte();
         var _loc11_:int = param1.readInt();
         this.targetPlaneMediator.initTargetDuguPanel(_loc4_,_loc6_,_loc10_,_loc11_);
         var _loc12_:Boolean = Boolean(param1.readByte());
         var _loc13_:Boolean = param1.readByte() == 1;
         this.targetPlaneMediator.setJihuo(_loc12_,_loc13_);
      }
      
      public function received_53270(param1:ByteArray) : void
      {
         ZLog.add("53270: 返回激活独孤九剑隐藏属性响应");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.dugujiujianPlaneMediator.jihuoResult();
         }
      }
   }
}

