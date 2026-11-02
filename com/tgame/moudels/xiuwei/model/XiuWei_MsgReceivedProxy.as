package com.tgame.moudels.xiuwei.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xiuwei.model.info.XiuWeiVo;
   import com.tgame.moudels.xiuwei.view.XiuWei_PlaneMediator;
   import com.tgame.moudels.xiuwei.view.XiuWei_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiuWei_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XiuWei_MsgReceivedProxy";
      
      private var exp:int = 0;
      
      private var _XiuWeiMainMediator:XiuWei_PlaneMediator;
      
      private var _senderProxy:XiuWei_MsgSenderProxy;
      
      private var _targetMediator:XiuWei_TargetPanelMediator;
      
      public function XiuWei_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get XiuWeiMainMediator() : XiuWei_PlaneMediator
      {
         if(!this._XiuWeiMainMediator)
         {
            this._XiuWeiMainMediator = facade.retrieveMediator(XiuWei_PlaneMediator.NAME) as XiuWei_PlaneMediator;
         }
         return this._XiuWeiMainMediator;
      }
      
      private function get senderProxy() : XiuWei_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiuWei_MsgSenderProxy.NAME) as XiuWei_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      private function get targetPlaneMediator() : XiuWei_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XiuWei_TargetPanelMediator.NAME) as XiuWei_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([55702,55704,55706],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([55702,55704,55706],NAME);
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
      
      public function received_55702(param1:ByteArray) : void
      {
         ZLog.add("55702：修为 信息返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:XiuWeiVo = null;
         if(_loc2_ == -1)
         {
            _loc3_ = XiuWei_PlaneMediator.xiuweiVO;
         }
         else
         {
            _loc3_ = XiuWei_TargetPanelMediator.xiuweiVO;
         }
         _loc3_.userID = _loc2_;
         _loc3_.learnedID = param1.readByte();
         _loc3_.viewID = param1.readByte();
         _loc3_.viewName = param1.readUTF();
         _loc3_.viewDesc = param1.readUTF();
         _loc3_.isLingwu = param1.readByte();
         _loc3_.addAttack = param1.readInt();
         _loc3_.addDefend = param1.readInt();
         _loc3_.addLifeMax = param1.readInt();
         _loc3_.addNeiliMax = param1.readInt();
         _loc3_.addTiliMax = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         _loc3_.dese = param1.readUTF();
         var _loc8_:int = param1.readByte();
         _loc3_.isJihuo = Boolean(param1.readByte() == 1);
         _loc3_.isSelect = Boolean(param1.readByte() == 1);
         _loc3_.isHuanZhuang = Boolean(param1.readByte() == 1);
         _loc3_.isHuanZhuang2 = Boolean(param1.readByte() == 1);
         this.XiuWeiMainMediator.xiaohaoGoodsId = _loc4_;
         this.XiuWeiMainMediator.xiaohaoNeedNum = _loc5_;
         if(_loc2_ == -1)
         {
            _loc3_.learnedID += 1;
            this.XiuWeiMainMediator.initializeMainUI(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
         }
         else
         {
            _loc3_.learnedID += 1;
            this.targetPlaneMediator.initializeMainUI(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
         }
      }
      
      public function received_55704(param1:ByteArray) : void
      {
         ZLog.add("55704：修为 领悟 结果 接收");
         var _loc2_:Boolean = Boolean(param1.readByte());
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readInt();
         if(_loc2_)
         {
            this.XiuWeiMainMediator.LingWuSucc(_loc6_,_loc7_);
         }
         else
         {
            this.XiuWeiMainMediator.UpdateExp(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
         }
      }
      
      public function received_55706(param1:ByteArray) : void
      {
         ZLog.add("55706：修为  九转悟性丹消失");
         this._senderProxy.send_55701({
            "userID":-1,
            "skillID":0
         });
      }
   }
}

