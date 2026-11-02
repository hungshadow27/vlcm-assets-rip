package com.tgame.moudels.jueZhanGuangMingDing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jueZhanGuangMingDing.view.JueZhanGuangMingDing_Mediator;
   import com.tgame.moudels.jueZhanGuangMingDing.view.JueZhanGuangMingDing_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JueZhanGuangMingDing_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "JueZhanGuangMingDing_MsgReceivedProxy";
      
      private var _mainPanelMediator:JueZhanGuangMingDing_Mediator;
      
      private var _targetMediator:JueZhanGuangMingDing_TargetPanelMediator;
      
      public function JueZhanGuangMingDing_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : JueZhanGuangMingDing_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(JueZhanGuangMingDing_Mediator.NAME) as JueZhanGuangMingDing_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : JueZhanGuangMingDing_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(JueZhanGuangMingDing_TargetPanelMediator.NAME) as JueZhanGuangMingDing_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70702],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70702],NAME);
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
      
      public function received_70702(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("70702\t\t返回玩家决战光明顶详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:Object = new Object();
         var _loc4_:Array = [];
         var _loc5_:int = param1.readByte();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = new Object();
            _loc7_.name = param1.readUTF();
            _loc7_.nengli = param1.readUTF();
            _loc7_.jindu = param1.readInt();
            _loc7_.miaoshu = param1.readUTF();
            _loc7_.zhandouli = param1.readInt();
            _loc4_.push(_loc7_);
            _loc6_++;
         }
         _loc3_.dataArr = _loc4_;
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.baoji = param1.readInt();
         _loc3_.shanbi = param1.readInt();
         _loc3_.wugong = param1.readInt();
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.upDataPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,_loc3_);
         }
      }
   }
}

