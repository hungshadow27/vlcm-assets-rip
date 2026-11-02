package com.tgame.moudels.wuxingquan.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.wuxingquan.view.Wuxingquan_LingwuPanelMediator;
   import com.tgame.moudels.wuxingquan.view.Wuxingquan_PlaneMediator;
   import com.tgame.moudels.wuxingquan.view.Wuxingquan_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Wuxingquan_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Wuxingquan_MsgReceivedProxy";
      
      private var _WuxingquanMainMediator:Wuxingquan_PlaneMediator;
      
      private var _lingwuPanelMediator:Wuxingquan_LingwuPanelMediator;
      
      private var _targetMediator:Wuxingquan_TargetPanelMediator;
      
      private var oldzhufu:int;
      
      public function Wuxingquan_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get WuxingquanMainMediator() : Wuxingquan_PlaneMediator
      {
         if(!this._WuxingquanMainMediator)
         {
            this._WuxingquanMainMediator = facade.retrieveMediator(Wuxingquan_PlaneMediator.NAME) as Wuxingquan_PlaneMediator;
         }
         return this._WuxingquanMainMediator;
      }
      
      private function get lingwuPlaneMediator() : Wuxingquan_LingwuPanelMediator
      {
         if(!this._lingwuPanelMediator)
         {
            this._lingwuPanelMediator = facade.retrieveMediator(Wuxingquan_LingwuPanelMediator.NAME) as Wuxingquan_LingwuPanelMediator;
         }
         return this._lingwuPanelMediator;
      }
      
      private function get targetPlaneMediator() : Wuxingquan_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(Wuxingquan_TargetPanelMediator.NAME) as Wuxingquan_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([54302,54304,54306,54308],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([54302,54304,54306,54308],NAME);
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
      
      public function received_54302(param1:ByteArray) : void
      {
         var _loc4_:Object = null;
         ZLog.add("54302：接收五行拳信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = new Object();
            _loc4_.id = param1.readInt();
            _loc4_.name = param1.readUTF();
            _loc4_.isLingwu = param1.readByte();
            _loc4_.addAttack = param1.readInt();
            _loc4_.addDefend = param1.readInt();
            _loc4_.addLifeMax = param1.readInt();
            _loc4_.addNeiliMax = param1.readInt();
            _loc4_.addTiliMax = param1.readInt();
            _loc4_.miaoshu = param1.readUTF();
            _loc4_.shuoming = param1.readUTF();
            _loc3_.push(_loc4_);
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         var _loc7_:Boolean = Boolean(param1.readByte());
         var _loc8_:Boolean = Boolean(param1.readByte());
         var _loc9_:Boolean = Boolean(param1.readByte());
         this.WuxingquanMainMediator.refreshWXInfo(_loc3_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_54304(param1:ByteArray) : void
      {
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc27_:Goods = null;
         ZLog.add("54304：五行拳查询结果");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc15_:Number = GameInstance.mainCharData.moneyInfo.copper;
         var _loc16_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc8_,true);
         _loc12_ = Wuxingquan_PlaneMediator.curLevel == _loc6_ ? true : false;
         _loc14_ = _loc9_ <= _loc16_ ? true : false;
         _loc13_ = _loc10_ <= _loc15_ ? true : false;
         var _loc17_:String = "";
         if(_loc8_ != 0)
         {
            _loc17_ = GoodsResManager.getGoodsRes(_loc8_).name;
         }
         var _loc18_:String = this.getQiantiId(_loc6_);
         var _loc19_:Boolean = _loc12_;
         var _loc20_:String = _loc17_;
         var _loc21_:int = _loc9_;
         var _loc22_:Boolean = _loc14_;
         var _loc23_:int = _loc10_;
         var _loc24_:Boolean = _loc13_;
         var _loc25_:int = _loc11_;
         this.lingwuPlaneMediator.xiaohaoTongbi = _loc10_;
         this.lingwuPlaneMediator.xiaohaoGoodsId = _loc8_;
         this.lingwuPlaneMediator.xiaohaoNeedNum = _loc21_;
         this.lingwuPlaneMediator.initLingwuPanel(_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_,_loc24_,_loc25_);
         var _loc26_:int = _loc4_ - this.oldzhufu;
         this.lingwuPlaneMediator.setWXQLingwuZhufuzhi(_loc4_,_loc5_,_loc26_);
         this.oldzhufu = _loc4_;
         if(_loc8_ != 0)
         {
            _loc27_ = new Goods(_loc8_);
            _loc27_.count = _loc16_;
            this.lingwuPlaneMediator.setWXQLingwuGoods(_loc27_);
         }
         else
         {
            this.lingwuPlaneMediator.setWXQLingwuGoods(null);
         }
         this.lingwuPlaneMediator.setWXQLingwuShuoming(_loc3_);
      }
      
      private function getQiantiId(param1:int) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case 0:
               _loc2_ = LanResManager.getLanCommonTextWords("等级达到级");
               break;
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("五形拳总纲");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("银蛇吐信");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("白鹤单息");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("金豹擂石");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("黑虎推山");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("青龙摆尾");
            default:
               _loc2_ = LanResManager.getLanCommonTextWords("等级达到67级");
         }
         return _loc2_;
      }
      
      public function received_54306(param1:ByteArray) : void
      {
         ZLog.add("54306：领悟进阶结果");
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
      
      public function received_54308(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc12_:Boolean = false;
         ZLog.add("54308：查询他人五行拳信息");
         var _loc2_:int = param1.readInt();
         if(_loc2_ != Wuxingquan_PlaneMediator.lookPlayerID)
         {
            return;
         }
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_)
         {
            _loc5_ = new Object();
            _loc5_.id = param1.readInt();
            _loc5_.name = param1.readUTF();
            _loc5_.zhuangtai = param1.readByte();
            _loc5_.shuxing = [param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt()];
            _loc5_.jieshao = param1.readUTF();
            _loc5_.miaoshu = param1.readUTF();
            _loc4_.push(_loc5_);
            if(_loc5_.zhuangtai == 1)
            {
               _loc6_++;
            }
            _loc7_++;
         }
         var _loc8_:int = param1.readInt();
         var _loc9_:Boolean = Boolean(param1.readByte());
         var _loc10_:Boolean = Boolean(param1.readByte());
         var _loc11_:Boolean = Boolean(param1.readByte());
         var _loc13_:Skill = new Skill(_loc8_);
         if(_loc6_ == 6)
         {
            _loc13_.isLearn = 1;
            _loc12_ = true;
         }
         else
         {
            _loc13_.isLearn = 0;
            _loc12_ = false;
         }
         this.targetPlaneMediator.initTargetWXQPanel(_loc4_,_loc13_,_loc12_,_loc9_,_loc10_,_loc11_);
      }
   }
}

