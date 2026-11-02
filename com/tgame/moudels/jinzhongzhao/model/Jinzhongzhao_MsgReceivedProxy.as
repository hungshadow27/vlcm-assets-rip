package com.tgame.moudels.jinzhongzhao.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jinzhongzhao.model.info.JinzhongzhaoVo;
   import com.tgame.moudels.jinzhongzhao.view.Jinzhongzhao_ChuangguanPanelMediator;
   import com.tgame.moudels.jinzhongzhao.view.Jinzhongzhao_PanelMediator;
   import com.tgame.moudels.jinzhongzhao.view.Jinzhongzhao_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Jinzhongzhao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Jinzhongzhao_MsgReceivedProxy";
      
      private var oldzhufu:int = 0;
      
      private var zhufuMaxNow:int = 0;
      
      private var qiantiID:int = 0;
      
      private var qiantiName:String = "";
      
      private var xiaohaoID:int = 0;
      
      private var xiaohaoCount:int = 0;
      
      private var chenggongjilv:int = 0;
      
      private var _TongRenMainMediator:Jinzhongzhao_PanelMediator;
      
      private var _chuangguanPanelMediator:Jinzhongzhao_ChuangguanPanelMediator;
      
      private var _targetMediator:Jinzhongzhao_TargetPanelMediator;
      
      public function Jinzhongzhao_MsgReceivedProxy()
      {
         super();
      }
      
      public function get tongRenMainMediator() : Jinzhongzhao_PanelMediator
      {
         if(!this._TongRenMainMediator)
         {
            this._TongRenMainMediator = facade.retrieveMediator(Jinzhongzhao_PanelMediator.NAME) as Jinzhongzhao_PanelMediator;
         }
         return this._TongRenMainMediator;
      }
      
      private function get chuangguanPanelMediator() : Jinzhongzhao_ChuangguanPanelMediator
      {
         if(!this._chuangguanPanelMediator)
         {
            this._chuangguanPanelMediator = facade.retrieveMediator(Jinzhongzhao_ChuangguanPanelMediator.NAME) as Jinzhongzhao_ChuangguanPanelMediator;
         }
         return this._chuangguanPanelMediator;
      }
      
      private function get targetPlaneMediator() : Jinzhongzhao_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(Jinzhongzhao_TargetPanelMediator.NAME) as Jinzhongzhao_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([55602,55604,55606,55608,55610],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([55602,55604,55606,55608,55610],NAME);
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
      
      public function received_55602(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         var _loc2_:int = param1.readInt();
         var _loc3_:JinzhongzhaoVo = null;
         if(_loc2_ == -1)
         {
            _loc3_ = Jinzhongzhao_PanelMediator.tongrenVO;
         }
         else
         {
            _loc3_ = Jinzhongzhao_TargetPanelMediator.tongrenVO;
         }
         _loc3_.userID = _loc2_;
         _loc3_.learnedSkillID = param1.readByte();
         _loc3_.viewSkillID = param1.readByte();
         _loc3_.viewSkillName = param1.readUTF();
         _loc3_.viewSkillDesc = param1.readUTF();
         _loc3_.isLingwu = param1.readByte();
         _loc3_.minShengming = param1.readInt();
         _loc3_.maxShengming = param1.readInt();
         _loc3_.minFangyu = param1.readInt();
         _loc3_.maxFangyu = param1.readInt();
         _loc3_.minNeili = param1.readInt();
         _loc3_.maxNeili = param1.readInt();
         _loc3_.minTili = param1.readInt();
         _loc3_.maxTili = param1.readInt();
         _loc3_.goodId = param1.readInt();
         var _loc4_:int = param1.readByte();
         _loc3_.shiyongArray = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = new Object();
            _loc8_.dizhi = param1.readUTF();
            _loc8_.mapName = param1.readUTF();
            _loc3_.shiyongArray.push(_loc8_);
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         _loc3_.sk = _loc6_;
         _loc3_.skMiaoshu = param1.readUTF();
         _loc3_.chi = param1.readByte() == 1;
         _loc3_.dese = param1.readUTF();
         var _loc7_:int = param1.readByte();
         _loc3_.isQiangHua = _loc7_ == 1;
         _loc3_.fumoBo = param1.readByte();
         _loc3_.isJinzhongTuwen = Boolean(param1.readByte() == 1);
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
      
      public function received_55604(param1:ByteArray) : void
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
         if(this.qiantiName == LanResManager.getLanCommonTextWords("无"))
         {
            this.qiantiName = LanResManager.getLanCommonTextWords("等级已达70级");
         }
         var _loc5_:int = Jinzhongzhao_PanelMediator.tongrenVO.learnedSkillID;
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
      
      public function received_55606(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Goods = null;
         ZLog.add("54506：金钟罩 闯关 结果 接收");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 0)
         {
            _loc3_ = param1.readInt();
            this.chuangguanPanelMediator.setZhufuzhi(_loc3_,this.zhufuMaxNow,_loc3_ - this.oldzhufu);
            this.oldzhufu = _loc3_;
            if(this.qiantiName == LanResManager.getLanCommonTextWords("无"))
            {
               this.qiantiName = LanResManager.getLanCommonTextWords("等级已达70级");
            }
            _loc4_ = Jinzhongzhao_PanelMediator.tongrenVO.learnedSkillID;
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
      
      public function received_55608(param1:ByteArray) : void
      {
         this.tongRenMainMediator.s_55601();
      }
      
      public function received_55610(param1:ByteArray) : void
      {
         ZLog.add("54506：金钟罩 强化 结果 接收");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.tongRenMainMediator.setQiangHuaResult(true);
         }
      }
   }
}

