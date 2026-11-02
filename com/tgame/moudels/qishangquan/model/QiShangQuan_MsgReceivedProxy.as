package com.tgame.moudels.qishangquan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.qishangquan.model.info.QiShangQuanVo;
   import com.tgame.moudels.qishangquan.view.QiShangQuan_PlaneMediator;
   import com.tgame.moudels.qishangquan.view.QiShangQuan_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QiShangQuan_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "QiShangQuan_MsgReceivedProxy";
      
      private var exp:int = 0;
      
      private var _QiShangQuanMainMediator:QiShangQuan_PlaneMediator;
      
      private var _targetMediator:QiShangQuan_TargetPanelMediator;
      
      public function QiShangQuan_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get QiShangQuanMainMediator() : QiShangQuan_PlaneMediator
      {
         if(!this._QiShangQuanMainMediator)
         {
            this._QiShangQuanMainMediator = facade.retrieveMediator(QiShangQuan_PlaneMediator.NAME) as QiShangQuan_PlaneMediator;
         }
         return this._QiShangQuanMainMediator;
      }
      
      private function get targetPlaneMediator() : QiShangQuan_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(QiShangQuan_TargetPanelMediator.NAME) as QiShangQuan_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([57262,57264],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([57262,57264],NAME);
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
      
      public function received_57262(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc3_:QiShangQuanVo = null;
         ZLog.add("57262：七伤拳 信息返回");
         _loc2_ = param1.readInt();
         _loc3_ = null;
         if(_loc2_ == -1)
         {
            _loc3_ = QiShangQuan_PlaneMediator.qishangquanVO;
         }
         else
         {
            _loc3_ = QiShangQuan_TargetPanelMediator.qishangquanVO;
         }
         _loc3_.userID = _loc2_;
         _loc3_.maxLevel = param1.readByte();
         _loc3_.bookcountGJ = param1.readInt();
         _loc3_.bookcountFY = param1.readInt();
         _loc3_.bookcountXL = param1.readInt();
         _loc3_.bookAttack = param1.readInt();
         _loc3_.bookDefence = param1.readInt();
         _loc3_.bookLife = param1.readInt();
         _loc3_.bookBaoJi = param1.readInt();
         _loc3_.bookShanBi = param1.readInt();
         _loc3_.learnedID = param1.readByte();
         _loc3_.viewID = param1.readByte();
         _loc3_.viewName = param1.readUTF();
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
         _loc3_.isZuoQi = Boolean(param1.readByte());
         _loc3_.isDanTian = Boolean(param1.readByte());
         this.QiShangQuanMainMediator.xiaohaoGoodsId = _loc4_;
         this.QiShangQuanMainMediator.xiaohaoNeedNum = _loc5_;
         if(_loc2_ == -1)
         {
            this.QiShangQuanMainMediator.initializeMainUI(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
         }
         else
         {
            this.targetPlaneMediator.initializeMainUI(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
         }
      }
      
      public function received_57264(param1:ByteArray) : void
      {
         ZLog.add("57264：七伤拳 领悟 结果 接收");
         var _loc2_:Boolean = Boolean(param1.readByte() == 1);
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:Boolean = Boolean(param1.readByte() == 1);
         var _loc8_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc2_)
         {
            this.QiShangQuanMainMediator.LingWuSucc();
         }
         else
         {
            this.QiShangQuanMainMediator.UpdateExp(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
         }
      }
   }
}

