package com.tgame.moudels.shibatongren.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.shibatongren.model.info.ShiBaTongRenMainPanelVO;
   import com.tgame.moudels.shibatongren.view.ShiBatongren_ChuangguanPanelMediator;
   import com.tgame.moudels.shibatongren.view.ShiBatongren_PanelMediator;
   import com.tgame.moudels.shibatongren.view.ShiBatongren_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShiBaTongRen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ShiBaTongRen_MsgReceivedProxy";
      
      private var oldzhufu:int = 0;
      
      private var zhufuMaxNow:int = 0;
      
      private var qiantiID:int = 0;
      
      private var qiantiName:String = "";
      
      private var xiaohaoID:int = 0;
      
      private var xiaohaoCount:int = 0;
      
      private var chenggongjilv:int = 0;
      
      private var _TongRenMainMediator:ShiBatongren_PanelMediator;
      
      private var _chuangguanPanelMediator:ShiBatongren_ChuangguanPanelMediator;
      
      private var _targetMediator:ShiBatongren_TargetPanelMediator;
      
      public function ShiBaTongRen_MsgReceivedProxy()
      {
         super();
      }
      
      public function get tongRenMainMediator() : ShiBatongren_PanelMediator
      {
         if(!this._TongRenMainMediator)
         {
            this._TongRenMainMediator = facade.retrieveMediator(ShiBatongren_PanelMediator.NAME) as ShiBatongren_PanelMediator;
         }
         return this._TongRenMainMediator;
      }
      
      private function get chuangguanPanelMediator() : ShiBatongren_ChuangguanPanelMediator
      {
         if(!this._chuangguanPanelMediator)
         {
            this._chuangguanPanelMediator = facade.retrieveMediator(ShiBatongren_ChuangguanPanelMediator.NAME) as ShiBatongren_ChuangguanPanelMediator;
         }
         return this._chuangguanPanelMediator;
      }
      
      private function get targetPlaneMediator() : ShiBatongren_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(ShiBatongren_TargetPanelMediator.NAME) as ShiBatongren_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([54502,54504,54506],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([54502,54504,54506],NAME);
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
      
      public function received_54502(param1:ByteArray) : void
      {
         ZLog.add("54502：十八铜人阵 面板信息接收");
         var _loc2_:int = param1.readInt();
         var _loc3_:ShiBaTongRenMainPanelVO = null;
         if(_loc2_ == -1)
         {
            _loc3_ = ShiBatongren_PanelMediator.tongrenVO;
         }
         else
         {
            _loc3_ = ShiBatongren_TargetPanelMediator.tongrenVO;
         }
         _loc3_.userID = _loc2_;
         _loc3_.learnedSkillID = param1.readByte();
         _loc3_.viewSkillID = param1.readByte();
         _loc3_.viewSkillName = param1.readUTF();
         _loc3_.viewSkillDesc = param1.readUTF();
         _loc3_.isLingwu = param1.readByte();
         _loc3_.addAttack = param1.readInt();
         _loc3_.addDefend = param1.readInt();
         _loc3_.addLifeMax = param1.readInt();
         _loc3_.addNeiliMax = param1.readInt();
         _loc3_.addTiliMax = param1.readInt();
         _loc3_.bigSkillID = param1.readInt();
         _loc3_.bigSkillValue = param1.readInt();
         _loc3_.isZuoQi = Boolean(param1.readByte());
         _loc3_.isHuanZhuang = Boolean(param1.readByte());
         _loc3_.isDanTian = Boolean(param1.readByte());
         _loc3_.YN_Qixuan = Boolean(param1.readByte());
         _loc3_.YN_QixuanState = Boolean(param1.readByte());
         _loc3_.setJiaCheng();
         if(_loc3_.bigSkillID == 0)
         {
            _loc3_.bigSkillID = 96001;
         }
         _loc3_.bigSkill = new Skill(_loc3_.bigSkillID);
         if(_loc2_ == -1)
         {
            this.tongRenMainMediator.initializeMainUI();
            this.chuangguanPanelMediator.closeChuangGuan();
         }
         else
         {
            this.targetPlaneMediator.initializeMainUI();
         }
      }
      
      public function received_54504(param1:ByteArray) : void
      {
         var _loc8_:Boolean = false;
         var _loc2_:int = param1.readByte();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         this.zhufuMaxNow = param1.readInt();
         this.qiantiID = param1.readByte();
         this.qiantiName = param1.readUTF();
         this.xiaohaoID = param1.readInt();
         this.xiaohaoCount = param1.readInt();
         this.chenggongjilv = param1.readInt();
         if(this.qiantiName == "")
         {
            this.qiantiName = LanResManager.getLanCommonTextWords("未闯关");
         }
         var _loc5_:int = ShiBatongren_PanelMediator.tongrenVO.learnedSkillID;
         var _loc6_:Boolean = false;
         if(_loc5_ >= this.qiantiID)
         {
            _loc6_ = true;
         }
         var _loc7_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoID,true);
         _loc8_ = this.xiaohaoCount <= _loc7_ ? true : false;
         var _loc9_:Goods = new Goods(this.xiaohaoID);
         _loc9_.count = _loc7_;
         this.chuangguanPanelMediator.setGoods(_loc9_,_loc8_);
         this.chuangguanPanelMediator.xiaohaoGoodsId = this.xiaohaoID;
         this.chuangguanPanelMediator.xiaohaoNeedNum = this.xiaohaoCount;
         this.chuangguanPanelMediator.setShuoming(_loc3_);
         this.chuangguanPanelMediator.setZhufuzhi(_loc4_,this.zhufuMaxNow,_loc4_ - this.oldzhufu);
         this.chuangguanPanelMediator.setInitializeSBTR(this.qiantiName,_loc6_,_loc9_.res.name,this.xiaohaoCount,_loc8_,this.chenggongjilv);
         this.chuangguanPanelMediator.showChuangGuan();
         this.oldzhufu = _loc4_;
      }
      
      public function received_54506(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Goods = null;
         ZLog.add("54506：十八铜人阵 闯关 结果 接收");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 0)
         {
            _loc3_ = param1.readInt();
            this.chuangguanPanelMediator.setZhufuzhi(_loc3_,this.zhufuMaxNow,_loc3_ - this.oldzhufu);
            this.oldzhufu = _loc3_;
            if(this.qiantiName == "")
            {
               this.qiantiName = LanResManager.getLanCommonTextWords("未闯关");
            }
            _loc4_ = ShiBatongren_PanelMediator.tongrenVO.learnedSkillID;
            _loc5_ = false;
            if(_loc4_ >= this.qiantiID)
            {
               _loc5_ = true;
            }
            _loc6_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoID,true);
            _loc7_ = this.xiaohaoCount <= _loc6_ ? true : false;
            _loc8_ = new Goods(this.xiaohaoID);
            _loc8_.count = _loc6_;
            this.chuangguanPanelMediator.setGoods(_loc8_,_loc7_);
            this.chuangguanPanelMediator.xiaohaoGoodsId = this.xiaohaoID;
            this.chuangguanPanelMediator.xiaohaoNeedNum = this.xiaohaoCount;
            this.chuangguanPanelMediator.setInitializeSBTR(this.qiantiName,_loc5_,_loc8_.res.name,this.xiaohaoCount,_loc7_,this.chenggongjilv);
         }
         else
         {
            this.chuangguanPanelMediator.chuangGuanSuccess();
            this.oldzhufu = 0;
         }
      }
   }
}

