package com.tgame.moudels.xiangyangzhizhan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xiangyangzhizhan.view.XiangYangZhiZhan_Mediator;
   import com.tgame.moudels.xiangyangzhizhan.view.XiangYangZhiZhan_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiangYangZhiZhan_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XiangYangZhiZhan_MsgReceivedProxy";
      
      private var _mainPanelMediator:XiangYangZhiZhan_Mediator;
      
      private var _targetMediator:XiangYangZhiZhan_TargetPanelMediator;
      
      public function XiangYangZhiZhan_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : XiangYangZhiZhan_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(XiangYangZhiZhan_Mediator.NAME) as XiangYangZhiZhan_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : XiangYangZhiZhan_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XiangYangZhiZhan_TargetPanelMediator.NAME) as XiangYangZhiZhan_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([79172,79174,79176],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([79172,79174,79176],NAME);
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
      
      public function received_79172(param1:ByteArray) : void
      {
         ZLog.add("79172: 返回华山论剑面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:String = param1.readUTF();
         var _loc6_:String = param1.readUTF();
         var _loc7_:String = param1.readUTF();
         var _loc8_:Object = new Object();
         _loc8_.act = param1.readDouble();
         _loc8_.actMax = param1.readDouble();
         _loc8_.def = param1.readDouble();
         _loc8_.defMax = param1.readDouble();
         _loc8_.hp = param1.readDouble();
         _loc8_.hpMax = param1.readDouble();
         _loc8_.lv = param1.readDouble();
         _loc8_.lvMax = param1.readDouble();
         _loc8_.xiaohaoGoodsID = param1.readInt();
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.setInit(_loc8_,_loc4_,_loc3_,_loc7_,_loc6_,_loc5_);
         }
         else
         {
            this.targetPlaneMediator.setInit(_loc8_,_loc4_,_loc3_,_loc7_,_loc6_,_loc5_);
         }
      }
      
      public function received_79174(param1:ByteArray) : void
      {
         ZLog.add("79174: 返回领悟面板信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mainPanelMediator.upDateLV(_loc3_,_loc4_,_loc6_,_loc7_,_loc8_,_loc5_,_loc2_);
      }
      
      public function received_79176(param1:ByteArray) : void
      {
         ZLog.add("79176: 返回领悟结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateLVComplete(_loc2_);
      }
   }
}

