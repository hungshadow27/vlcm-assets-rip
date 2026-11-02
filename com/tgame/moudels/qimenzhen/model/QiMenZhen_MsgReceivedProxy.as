package com.tgame.moudels.qimenzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.qimenzhen.model.info.QiMenZhenVo;
   import com.tgame.moudels.qimenzhen.view.QiMenZhen_PanelMediator;
   import com.tgame.moudels.qimenzhen.view.QiMenZhen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QiMenZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "QiMenZhen_MsgReceivedProxy";
      
      private var _QiMenZhenMainMediator:QiMenZhen_PanelMediator;
      
      private var _targetMediator:QiMenZhen_TargetPanelMediator;
      
      public function QiMenZhen_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get QiMenZhenMainMediator() : QiMenZhen_PanelMediator
      {
         if(!this._QiMenZhenMainMediator)
         {
            this._QiMenZhenMainMediator = facade.retrieveMediator(QiMenZhen_PanelMediator.NAME) as QiMenZhen_PanelMediator;
         }
         return this._QiMenZhenMainMediator;
      }
      
      private function get targetPlaneMediator() : QiMenZhen_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(QiMenZhen_TargetPanelMediator.NAME) as QiMenZhen_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([57702,57704],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([57702,57704],NAME);
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
      
      public function received_57702(param1:ByteArray) : void
      {
         ZLog.add("57702：奇门阵 信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:QiMenZhenVo = null;
         if(_loc2_ == -1)
         {
            _loc3_ = QiMenZhen_PanelMediator.qimenzhenVO;
         }
         else
         {
            _loc3_ = QiMenZhen_TargetPanelMediator.qismenzhenVO;
         }
         _loc3_.userID = _loc2_;
         _loc3_.learnedID = param1.readByte();
         _loc3_.viewID = param1.readByte();
         _loc3_.isLingwu = param1.readByte();
         _loc3_.addAttack = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         _loc3_.dese = param1.readUTF();
         var _loc8_:Boolean = Boolean(param1.readByte() == 1);
         var _loc9_:Boolean = Boolean(param1.readByte() == 1);
         _loc3_.fanBei = param1.readByte();
         _loc3_.qiMenDunJia = Boolean(param1.readByte() == 1);
         _loc3_.isZuoQi = Boolean(param1.readByte() == 1);
         _loc3_.isDanTian = Boolean(param1.readByte() == 1);
         _loc3_.isZuoqi1 = Boolean(param1.readByte() == 1);
         this.QiMenZhenMainMediator.xiaohaoGoodsId = _loc4_;
         this.QiMenZhenMainMediator.xiaohaoNeedNum = _loc5_;
         if(_loc2_ == -1)
         {
            this.QiMenZhenMainMediator.initializeMainUI(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
         }
         else
         {
            this.targetPlaneMediator.initializeMainUI(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
         }
      }
      
      public function received_57704(param1:ByteArray) : void
      {
         ZLog.add("57704：奇门阵 领悟 结果 接收");
         var _loc2_:Boolean = Boolean(param1.readByte() == 1);
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:Boolean = Boolean(param1.readByte() == 1);
         var _loc8_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc2_)
         {
            this.QiMenZhenMainMediator.LingWuSucc();
         }
         else
         {
            this.QiMenZhenMainMediator.UpdateExp(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
         }
      }
   }
}

