package com.tgame.moudels.biguan.model
{
   import com.fireice.alert.FAlert;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.biguan.view.Biguan_BiguanMediator;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Biguan_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Biguan_MsgReceivedProxy";
      
      public var mallid:int = 0;
      
      public function Biguan_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50552,50554],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50552,50554],NAME);
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
      
      private function get biguanmediator() : Biguan_BiguanMediator
      {
         return facade.retrieveMediator(Biguan_BiguanMediator.NAME) as Biguan_BiguanMediator;
      }
      
      public function received_50552(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = param1.readInt();
         ZLog.add("闭关时间（int）（单位：秒）:" + _loc2_);
         this.biguanmediator.biguanPan.setTime(int(_loc2_ / 3600),int(_loc2_ % 3600 / 60));
         var _loc3_:int = GameInstance.mainCharData.attributeInfo.lv;
         if(_loc3_ > 0 && _loc3_ < 30)
         {
            _loc4_ = Math.floor(_loc3_ * 100 * (_loc2_ / 3600));
         }
         else if(_loc3_ >= 30 && _loc3_ < 40)
         {
            _loc4_ = Math.floor(_loc3_ * 200 * (_loc2_ / 3600));
         }
         else if(_loc3_ >= 40 && _loc3_ < 50)
         {
            _loc4_ = Math.floor(_loc3_ * 400 * (_loc2_ / 3600));
         }
         else if(_loc3_ >= 50)
         {
            _loc4_ = Math.floor(_loc3_ * 600 * (_loc2_ / 3600));
         }
         var _loc5_:int = Math.floor(_loc2_ / 300 + _loc3_ * _loc2_ / 3000);
         this.biguanmediator.rec_jinyan = _loc4_;
         this.biguanmediator.rec_zhenqi = _loc5_;
         this.biguanmediator.biguanPan.setIncome(_loc4_,_loc5_);
      }
      
      public function received_50554(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
         if(this.biguanmediator.is_doubling == 1)
         {
            NoticeManager.notify(1,LanResManager.getLanTextWords(this,"领取双倍闭关收益成功",[_loc2_,_loc3_]));
            this.biguanmediator.biguanPan.showDoubleIncomeAffirmancePanel(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.BIGUANFU_ID,true),0,0);
         }
         else
         {
            NoticeManager.notify(1,LanResManager.getLanTextWords(this,"领取闭关收益成功",[_loc2_,_loc3_]));
            this.biguanmediator.biguanPan.showIncomeAffirmancePanel(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.BIGUANFU_ID,true),0,0);
         }
         this.biguanmediator.rec_jinyan = 0;
         this.biguanmediator.rec_zhenqi = 0;
         this.biguanmediator.biguanPan.setTime(0,0);
         this.biguanmediator.biguanPan.setIncome(0,0);
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_BIGUAN_TIME_TO_12_HORSE_FLOOR,"complete");
      }
   }
}

