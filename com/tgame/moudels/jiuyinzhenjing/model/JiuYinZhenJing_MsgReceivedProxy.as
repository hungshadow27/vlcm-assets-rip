package com.tgame.moudels.jiuyinzhenjing.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jiuyinzhenjing.view.JiuYinZhenJing_LingwuPanelMediator;
   import com.tgame.moudels.jiuyinzhenjing.view.JiuYinZhenJing_PlaneMediator;
   import com.tgame.moudels.jiuyinzhenjing.view.JiuYinZhenJing_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JiuYinZhenJing_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "JiuYinZhenJing_MsgReceivedProxy";
      
      private var _JiuYinZhenJingMainMediator:JiuYinZhenJing_PlaneMediator;
      
      private var _lingwuPanelMediator:JiuYinZhenJing_LingwuPanelMediator;
      
      private var _targetMediator:JiuYinZhenJing_TargetPanelMediator;
      
      private var oldzhufu:int;
      
      public function JiuYinZhenJing_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get JiuYinZhenJingMainMediator() : JiuYinZhenJing_PlaneMediator
      {
         if(!this._JiuYinZhenJingMainMediator)
         {
            this._JiuYinZhenJingMainMediator = facade.retrieveMediator(JiuYinZhenJing_PlaneMediator.NAME) as JiuYinZhenJing_PlaneMediator;
         }
         return this._JiuYinZhenJingMainMediator;
      }
      
      private function get lingwuPlaneMediator() : JiuYinZhenJing_LingwuPanelMediator
      {
         if(!this._lingwuPanelMediator)
         {
            this._lingwuPanelMediator = facade.retrieveMediator(JiuYinZhenJing_LingwuPanelMediator.NAME) as JiuYinZhenJing_LingwuPanelMediator;
         }
         return this._lingwuPanelMediator;
      }
      
      private function get targetPlaneMediator() : JiuYinZhenJing_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(JiuYinZhenJing_TargetPanelMediator.NAME) as JiuYinZhenJing_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([54102,54104,54106,54108],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([54102,54104,54106,54108],NAME);
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
      
      public function received_54102(param1:ByteArray) : void
      {
         var _loc4_:Object = null;
         var _loc10_:Skill = null;
         ZLog.add("54102：接收九阴真经 悟道信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = new Object();
            _loc4_.id = param1.readInt();
            _loc4_.name = param1.readUTF();
            _loc10_ = new Skill(param1.readInt());
            _loc4_.ico = _loc10_;
            _loc4_.isLingwu = param1.readByte();
            _loc4_.ico.isLearn = _loc4_.isLingwu;
            _loc4_.addAttack = param1.readInt();
            _loc4_.addDefend = param1.readInt();
            _loc4_.addLifeMax = param1.readInt();
            _loc4_.addNeiliMax = param1.readInt();
            _loc4_.addTiliMax = param1.readInt();
            _loc4_.nanyidu = param1.readUTF();
            _loc4_.nandu = param1.readUTF();
            _loc4_.fengdu = param1.readUTF();
            _loc4_.miaosu = param1.readUTF();
            _loc3_.push(_loc4_);
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = param1.readByte();
         var _loc9_:Boolean = Boolean(param1.readByte());
         this.JiuYinZhenJingMainMediator.refreshJianInfo(_loc3_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_54104(param1:ByteArray) : void
      {
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         ZLog.add("54104：九阴悟道查询结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ != JiuYinZhenJing_PlaneMediator.curLevel + 1)
         {
            return;
         }
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:String = param1.readUTF();
         _loc10_ = JiuYinZhenJing_PlaneMediator.curLevel == _loc5_ ? true : false;
         var _loc13_:int = GameInstance.mainCharData.attributeInfo.gqNow;
         var _loc14_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc6_,true);
         _loc12_ = _loc7_ <= _loc14_ ? true : false;
         var _loc15_:String = GoodsResManager.getGoodsRes(_loc6_).name;
         var _loc16_:String = this.getQiantiId(_loc5_);
         var _loc17_:Boolean = _loc10_;
         var _loc18_:String = _loc15_;
         var _loc19_:int = _loc7_;
         var _loc20_:Boolean = _loc12_;
         var _loc21_:int = _loc8_;
         this.lingwuPlaneMediator.xiaohaoGoodsId = _loc6_;
         this.lingwuPlaneMediator.xiaohaoNeedNum = _loc19_;
         this.lingwuPlaneMediator.setJiuyinzhenjingTupoInitialize(_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_);
         var _loc22_:int = _loc3_ - this.oldzhufu;
         this.lingwuPlaneMediator.setJiujianLingwuZhufuzhi(_loc3_,_loc4_,_loc22_);
         this.oldzhufu = _loc3_;
         var _loc23_:Goods = new Goods(_loc6_);
         _loc23_.count = _loc14_;
         this.lingwuPlaneMediator.setJiujianLingwuGoods(_loc23_);
         this.lingwuPlaneMediator.setJiujianLingwuShuoming(_loc9_);
      }
      
      private function getQiantiId(param1:int) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case 0:
               _loc2_ = LanResManager.getLanCommonTextWords("等级达到64级");
               break;
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟伐体篇");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟锻骨篇");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟点穴篇");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟贯脉篇");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟炼精篇");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟驭气篇");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟移魂篇");
               break;
            case 8:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟定魄篇");
               break;
            case 9:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟通神篇");
               break;
            default:
               _loc2_ = LanResManager.getLanCommonTextWords("等级达到64级");
         }
         return _loc2_;
      }
      
      public function received_54106(param1:ByteArray) : void
      {
         ZLog.add("54106：领悟进阶结果");
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
      
      public function received_54108(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc7_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Skill = null;
         var _loc16_:Object = null;
         ZLog.add("54108：查询他人九阴 悟道信息");
         var _loc2_:int = param1.readInt();
         if(_loc2_ != JiuYinZhenJing_PlaneMediator.lookPlayerID)
         {
            return;
         }
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.id = param1.readInt();
            _loc5_.zhaoshi = param1.readUTF();
            _loc14_ = param1.readInt();
            _loc15_ = new Skill(_loc14_);
            _loc5_.ico = _loc15_;
            _loc5_.lingwu = param1.readByte() == 0 ? false : true;
            _loc5_.ico.isLearn = _loc5_.lingwu;
            if(_loc5_.lingwu)
            {
               _loc6_ = Math.max(_loc6_,_loc5_.id);
            }
            _loc5_.shuxing = [param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt()];
            _loc5_.nanyidu = param1.readUTF();
            _loc5_.nandu = param1.readUTF();
            _loc5_.fengdu = param1.readUTF();
            _loc5_.miaoshu = param1.readUTF();
            _loc15_.isLearn = _loc5_.lingwu;
            _loc5_.ico = _loc15_;
            _loc4_.push(_loc5_);
            if(_loc5_.lingwu == true)
            {
               _loc7_++;
            }
            _loc8_++;
         }
         var _loc9_:int = param1.readInt();
         var _loc10_:String = param1.readUTF();
         var _loc11_:int = param1.readByte();
         var _loc12_:int = 0;
         while(_loc12_ < _loc4_.length)
         {
            _loc16_ = _loc4_[_loc12_];
            if(_loc12_ == _loc7_)
            {
               _loc16_.dangqian = true;
            }
            else
            {
               _loc16_.dangqian = false;
            }
            _loc12_++;
         }
         var _loc13_:Boolean = Boolean(param1.readByte());
         this.targetPlaneMediator.initTargetDuguPanel(_loc4_,_loc9_,_loc10_,_loc11_,_loc7_,_loc13_);
      }
   }
}

