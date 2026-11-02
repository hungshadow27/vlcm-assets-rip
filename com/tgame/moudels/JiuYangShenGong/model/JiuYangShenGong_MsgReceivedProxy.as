package com.tgame.moudels.JiuYangShenGong.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.JiuYangShenGong.JiuYangShenGongManager;
   import com.tgame.common.res.JiuYangShenGong.JiuYangShenGongRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.JiuYangShenGong.info.JiuYangVO;
   import com.tgame.moudels.JiuYangShenGong.view.JiuYangShenGong_LingwuPanelMediator;
   import com.tgame.moudels.JiuYangShenGong.view.JiuYangShenGong_PlaneMediator;
   import com.tgame.moudels.JiuYangShenGong.view.JiuYangShenGong_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JiuYangShenGong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "JiuYangShenGong_MsgReceivedProxy";
      
      private var _jiuyangshengongMainMediator:JiuYangShenGong_PlaneMediator;
      
      private var _lingwuPanelMediator:JiuYangShenGong_LingwuPanelMediator;
      
      private var _targetMediator:JiuYangShenGong_TargetPanelMediator;
      
      private var oldzhufu:int;
      
      public function JiuYangShenGong_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get jiuyangshengongMainMediator() : JiuYangShenGong_PlaneMediator
      {
         if(!this._jiuyangshengongMainMediator)
         {
            this._jiuyangshengongMainMediator = facade.retrieveMediator(JiuYangShenGong_PlaneMediator.NAME) as JiuYangShenGong_PlaneMediator;
         }
         return this._jiuyangshengongMainMediator;
      }
      
      private function get lingwuPlaneMediator() : JiuYangShenGong_LingwuPanelMediator
      {
         if(!this._lingwuPanelMediator)
         {
            this._lingwuPanelMediator = facade.retrieveMediator(JiuYangShenGong_LingwuPanelMediator.NAME) as JiuYangShenGong_LingwuPanelMediator;
         }
         return this._lingwuPanelMediator;
      }
      
      private function get targetPlaneMediator() : JiuYangShenGong_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(JiuYangShenGong_TargetPanelMediator.NAME) as JiuYangShenGong_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53822,53824,53826,53828,53832],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53822,53824,53826,53828,53832],NAME);
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
      
      public function received_53822(param1:ByteArray) : void
      {
         var _loc4_:JiuYangVO = null;
         ZLog.add("53822：接收九阳神功 悟道信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = new JiuYangVO();
            _loc4_.id = param1.readInt();
            _loc4_.name = param1.readUTF();
            _loc4_.isLingwu = param1.readByte();
            _loc4_.addAttack = param1.readInt();
            _loc4_.addDefend = param1.readInt();
            _loc4_.addLifeMax = param1.readInt();
            _loc4_.addNeiliMax = param1.readInt();
            _loc4_.addTiliMax = param1.readInt();
            _loc3_.push(_loc4_);
            _loc5_++;
         }
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readInt();
         this.jiuyangshengongMainMediator.refreshJianInfo(_loc3_,_loc7_,_loc6_);
         var _loc8_:Boolean = Boolean(param1.readByte());
         this.jiuyangshengongMainMediator.showJiuYangEffect(_loc8_);
         var _loc9_:Boolean = Boolean(param1.readByte());
         this.jiuyangshengongMainMediator.setJihuo(_loc9_);
      }
      
      public function received_53824(param1:ByteArray) : void
      {
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         ZLog.add("53824：悟道查询结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ != JiuYangShenGong_PlaneMediator.curLevel + 1)
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
         _loc10_ = JiuYangShenGong_PlaneMediator.curLevel == _loc5_ ? true : false;
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
         var _loc26_:JiuYangShenGongRes = JiuYangShenGongManager.getJiuYangShenGongRes(String(JiuYangShenGong_PlaneMediator.curLevel + 1));
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
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟赤炎烈阳");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟金炎灵阳");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟靛炎极阳");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟黑炎绝阳");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟青炎冥阳");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟白炎真阳");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟紫炎神阳");
               break;
            case 8:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟彩炎仙阳");
               break;
            case 9:
               _loc2_ = LanResManager.getLanCommonTextWords("已领悟苍炎圣阳");
               break;
            default:
               _loc2_ = LanResManager.getLanCommonTextWords("等级达到62级");
         }
         return _loc2_;
      }
      
      public function received_53826(param1:ByteArray) : void
      {
         ZLog.add("53826：领悟进阶结果");
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
      
      public function received_53828(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc7_:int = 0;
         var _loc13_:JiuYangShenGongRes = null;
         var _loc14_:Skill = null;
         var _loc15_:Object = null;
         ZLog.add("53828：查询他人九阳 悟道信息");
         var _loc2_:int = param1.readInt();
         if(_loc2_ != JiuYangShenGong_PlaneMediator.lookPlayerID)
         {
            return;
         }
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < _loc3_)
         {
            _loc13_ = JiuYangShenGongManager.getJiuYangShenGongRes(String(_loc8_ + 1));
            _loc5_ = new Object();
            _loc5_.id = param1.readInt();
            _loc5_.zhaoshi = param1.readUTF();
            _loc5_.lingwu = param1.readByte() == 0 ? false : true;
            if(_loc5_.lingwu)
            {
               _loc6_ = Math.max(_loc6_,_loc5_.id);
            }
            _loc5_.shuxing = [param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt()];
            _loc5_.miaoshu = _loc13_.main_desc;
            _loc14_ = new Skill(_loc13_.ico);
            _loc14_.isLearn = _loc5_.lingwu;
            _loc5_.ico = _loc14_;
            _loc5_.nanyidu = _loc13_.degree;
            _loc5_.nandu = _loc13_.degree_xj;
            _loc5_.fengdu = _loc13_.rich_level;
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
            _loc15_ = _loc4_[_loc9_];
            if(_loc9_ == _loc7_)
            {
               _loc15_.dangqian = true;
            }
            else
            {
               _loc15_.dangqian = false;
            }
            _loc9_++;
         }
         var _loc10_:int = param1.readByte();
         var _loc11_:int = param1.readInt();
         this.targetPlaneMediator.initTargetDuguPanel(_loc4_,_loc6_,_loc10_,_loc11_);
         var _loc12_:Boolean = Boolean(param1.readByte());
         this.targetPlaneMediator.setJihuo(_loc12_);
      }
      
      public function received_53832(param1:ByteArray) : void
      {
         ZLog.add("53832: 返回激活九阳神功隐藏属性响应");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.jiuyangshengongMainMediator.jihuoResult();
         }
      }
   }
}

