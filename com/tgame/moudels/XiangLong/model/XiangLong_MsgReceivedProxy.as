package com.tgame.moudels.XiangLong.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.XiangLong.info.XiangLongMainPanelVO;
   import com.tgame.moudels.XiangLong.view.XiangLong_LingwuPanelMediator;
   import com.tgame.moudels.XiangLong.view.XiangLong_PlaneMediator;
   import com.tgame.moudels.XiangLong.view.XiangLong_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiangLong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XiangLong_MsgReceivedProxy";
      
      private var _XiangLongMainMediator:XiangLong_PlaneMediator;
      
      private var _lingwuPanelMediator:XiangLong_LingwuPanelMediator;
      
      private var _targetMediator:XiangLong_TargetPanelMediator;
      
      private var oldzhufu:int;
      
      public function XiangLong_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get XiangLongMainMediator() : XiangLong_PlaneMediator
      {
         if(!this._XiangLongMainMediator)
         {
            this._XiangLongMainMediator = facade.retrieveMediator(XiangLong_PlaneMediator.NAME) as XiangLong_PlaneMediator;
         }
         return this._XiangLongMainMediator;
      }
      
      private function get lingwuPlaneMediator() : XiangLong_LingwuPanelMediator
      {
         if(!this._lingwuPanelMediator)
         {
            this._lingwuPanelMediator = facade.retrieveMediator(XiangLong_LingwuPanelMediator.NAME) as XiangLong_LingwuPanelMediator;
         }
         return this._lingwuPanelMediator;
      }
      
      private function get targetPlaneMediator() : XiangLong_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XiangLong_TargetPanelMediator.NAME) as XiangLong_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([51902,51904,51906,51908,51912],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([51902,51904,51906,51908,51912],NAME);
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
      
      public function received_51902(param1:ByteArray) : void
      {
         ZLog.add("51902：降龙十八掌 面板信息接收");
         XiangLong_PlaneMediator.clearVO();
         var _loc2_:XiangLongMainPanelVO = XiangLong_PlaneMediator.xianglongVO;
         _loc2_.curLearnLevel = param1.readInt();
         _loc2_.curShowLevel = param1.readInt();
         _loc2_.curLevelName = param1.readUTF();
         _loc2_.effectID = param1.readInt();
         _loc2_.isLingwu = param1.readByte();
         _loc2_.addAttack = param1.readInt();
         _loc2_.addDefend = param1.readInt();
         _loc2_.addLifeMax = param1.readInt();
         _loc2_.addNeiliMax = param1.readInt();
         _loc2_.addTiliMax = param1.readInt();
         _loc2_.addCrystal = param1.readInt();
         _loc2_.addFlee = param1.readInt();
         _loc2_.addWuxue1 = param1.readInt();
         _loc2_.addWuxue2 = param1.readInt();
         _loc2_.addWuxue3 = param1.readInt();
         _loc2_.addWuxueTip1 = param1.readUTF();
         _loc2_.addWuxueTip2 = param1.readUTF();
         _loc2_.addWuxueTip3 = param1.readUTF();
         _loc2_.addWuxueTip4 = param1.readUTF();
         _loc2_.setJiaCheng();
         var _loc3_:int = param1.readInt();
         _loc2_.skill = GameInstance.mainCharData.skillInfo.getSkillByID(_loc3_);
         _loc2_.unlockNum = param1.readByte();
         var _loc4_:int = param1.readInt();
         _loc2_.mixSkill1 = _loc4_ ? GameInstance.mainCharData.skillInfo.getSkillByID(_loc4_) : null;
         _loc4_ = param1.readInt();
         _loc2_.mixSkill2 = _loc4_ ? GameInstance.mainCharData.skillInfo.getSkillByID(_loc4_) : null;
         _loc4_ = param1.readInt();
         _loc2_.mixSkill3 = _loc4_ ? GameInstance.mainCharData.skillInfo.getSkillByID(_loc4_) : null;
         _loc4_ = param1.readInt();
         _loc2_.mixSkill4 = _loc4_ ? GameInstance.mainCharData.skillInfo.getSkillByID(_loc4_) : null;
         _loc2_.jihuoJindu = param1.readInt();
         _loc2_.addJihuoGongji = param1.readInt();
         _loc2_.addJihuoFangyu = param1.readInt();
         _loc2_.addJihuoShengming = param1.readInt();
         _loc2_.isLongshengong = Boolean(param1.readByte() == 1);
         _loc2_.isDouble = param1.readByte() == 1;
         _loc2_.isZuoQi = Boolean(param1.readByte() == 1);
         _loc2_.isHuanZhuang1 = Boolean(param1.readByte() == 1);
         _loc2_.isHuanZhuang2 = Boolean(param1.readByte() == 1);
         this.XiangLongMainMediator.initializeMainUI();
      }
      
      public function received_51912(param1:ByteArray) : void
      {
         ZLog.add("51912：顶级丹信息");
         var _loc2_:int = param1.readInt();
         this.XiangLongMainMediator.setPanelUpdate(_loc2_);
      }
      
      public function received_51904(param1:ByteArray) : void
      {
         var _loc12_:Boolean = false;
         var _loc14_:Boolean = false;
         ZLog.add("51904：降龙十八掌 领悟面板 数据接收");
         var _loc2_:int = param1.readInt();
         if(_loc2_ != XiangLong_PlaneMediator.xianglongVO.curLearnLevel + 1)
         {
            return;
         }
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:String = param1.readUTF();
         _loc7_ = _loc6_ ? _loc7_ : LanResManager.getLanCommonTextWords("人物等级到达70级");
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:String = GoodsResManager.getGoodsRes(_loc8_).name;
         var _loc11_:int = param1.readInt();
         _loc12_ = XiangLong_PlaneMediator.xianglongVO.curLearnLevel == _loc6_ ? true : false;
         var _loc13_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc8_,true);
         _loc14_ = _loc9_ <= _loc13_ ? true : false;
         var _loc15_:Goods = new Goods(_loc8_);
         _loc15_.count = _loc13_;
         this.lingwuPlaneMediator.xiaohaoGoodsId = _loc8_;
         this.lingwuPlaneMediator.xiaohaoNeedNum = _loc9_;
         this.lingwuPlaneMediator.setShuoming(_loc3_);
         this.lingwuPlaneMediator.setXiangLongShiBaZahangZhufuzhi(_loc4_,_loc5_,_loc4_ - this.oldzhufu);
         this.lingwuPlaneMediator.setXiangLongShiBaZahangGoods(_loc15_,_loc14_);
         this.lingwuPlaneMediator.initializeUI(_loc7_,_loc12_,_loc10_,_loc9_,_loc14_,_loc11_);
         this.oldzhufu = _loc4_;
      }
      
      public function received_51906(param1:ByteArray) : void
      {
         ZLog.add("51906：降龙十八掌 领悟 结果 接收");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.lingwuPlaneMediator.lingwuSuccess();
            this.oldzhufu = 0;
         }
         else
         {
            this.lingwuPlaneMediator.lingwuFail(_loc2_);
         }
      }
      
      public function received_51908(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         ZLog.add("51908：他人 降龙十八掌 面板 数据接收");
         XiangLong_TargetPanelMediator.clearVO();
         var _loc2_:XiangLongMainPanelVO = XiangLong_TargetPanelMediator.xianglongVO;
         var _loc3_:int = param1.readInt();
         if(_loc3_ != XiangLong_PlaneMediator.lookPlayerID)
         {
            return;
         }
         _loc2_.curLearnLevel = param1.readInt();
         _loc2_.curShowLevel = _loc2_.curLearnLevel == 0 ? 1 : _loc2_.curLearnLevel;
         _loc2_.curLevelName = param1.readUTF();
         _loc2_.effectID = param1.readInt();
         _loc2_.addAttack = param1.readInt();
         _loc2_.addDefend = param1.readInt();
         _loc2_.addLifeMax = param1.readInt();
         _loc2_.addNeiliMax = param1.readInt();
         _loc2_.addTiliMax = param1.readInt();
         _loc2_.addCrystal = param1.readInt();
         _loc2_.addFlee = param1.readInt();
         _loc2_.addWuxue1 = param1.readInt();
         _loc2_.addWuxue2 = param1.readInt();
         _loc2_.addWuxue3 = param1.readInt();
         _loc2_.addWuxueTip1 = param1.readUTF();
         _loc2_.addWuxueTip2 = param1.readUTF();
         _loc2_.addWuxueTip3 = param1.readUTF();
         _loc2_.addWuxueTip4 = param1.readUTF();
         _loc2_.setJiaCheng();
         var _loc4_:int = param1.readInt();
         _loc2_.skill = new Skill(_loc4_);
         _loc2_.skill.level = param1.readByte();
         _loc2_.skill.isLearn = 1;
         _loc2_.unlockNum = param1.readByte();
         _loc5_ = param1.readInt();
         _loc2_.mixSkill1 = _loc5_ ? new Skill(_loc5_) : null;
         var _loc6_:int = param1.readShort();
         if(_loc2_.mixSkill1)
         {
            _loc2_.mixSkill1.level = _loc6_;
            _loc2_.mixSkill1.isLearn = 1;
         }
         _loc5_ = param1.readInt();
         _loc2_.mixSkill2 = _loc5_ ? new Skill(_loc5_) : null;
         var _loc7_:int = param1.readShort();
         if(_loc2_.mixSkill2)
         {
            _loc2_.mixSkill2.level = _loc7_;
            _loc2_.mixSkill2.isLearn = 1;
         }
         _loc5_ = param1.readInt();
         _loc2_.mixSkill3 = _loc5_ ? new Skill(_loc5_) : null;
         var _loc8_:int = param1.readShort();
         if(_loc2_.mixSkill3)
         {
            _loc2_.mixSkill3.level = _loc8_;
            _loc2_.mixSkill3.isLearn = 1;
         }
         _loc5_ = param1.readInt();
         _loc2_.mixSkill4 = _loc5_ ? new Skill(_loc5_) : null;
         var _loc9_:int = param1.readShort();
         if(_loc2_.mixSkill4)
         {
            _loc2_.mixSkill4.level = _loc9_;
            _loc2_.mixSkill4.isLearn = 1;
         }
         _loc2_.jihuoJindu = param1.readInt();
         _loc2_.addJihuoGongji = param1.readInt();
         _loc2_.addJihuoFangyu = param1.readInt();
         _loc2_.addJihuoShengming = param1.readInt();
         var _loc10_:int = param1.readInt();
         _loc2_.skill2 = new Skill(_loc10_);
         _loc2_.canUseSkll2 = param1.readByte() == 1;
         _loc2_.skill2.isLearn = _loc2_.canUseSkll2 ? 1 : 0;
         _loc2_.isDouble = param1.readByte() == 1;
         _loc2_.isLongshengong = Boolean(param1.readByte() == 1);
         _loc2_.isZuoQi = Boolean(param1.readByte() == 1);
         _loc2_.isHuanZhuang1 = Boolean(param1.readByte() == 1);
         _loc2_.isHuanZhuang2 = Boolean(param1.readByte() == 1);
         this.targetPlaneMediator.initializeMainUI();
      }
   }
}

