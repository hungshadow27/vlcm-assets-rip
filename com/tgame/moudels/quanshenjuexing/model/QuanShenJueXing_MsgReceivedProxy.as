package com.tgame.moudels.quanshenjuexing.model
{
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.quanshenjuexing.model.info.QuanShenJueXingVO;
   import com.tgame.moudels.quanshenjuexing.view.QuanShenJueXing_Mediator;
   import com.tgame.moudels.quanshenjuexing.view.QuanShenJueXing_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QuanShenJueXing_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "QuanShenJueXing_MsgReceivedProxy";
      
      private var _mainPanelMediator:QuanShenJueXing_Mediator;
      
      private var _targetMediator:QuanShenJueXing_TargetPanelMediator;
      
      public function QuanShenJueXing_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : QuanShenJueXing_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(QuanShenJueXing_Mediator.NAME) as QuanShenJueXing_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : QuanShenJueXing_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(QuanShenJueXing_TargetPanelMediator.NAME) as QuanShenJueXing_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72002,72004,72006],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72002,72004,72006],NAME);
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
      
      public function received_72002(param1:ByteArray) : void
      {
         ZLog.add("72002：返回玩虎翼觉醒功详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:QuanShenJueXingVO = new QuanShenJueXingVO();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.baoji = param1.readInt();
         _loc3_.shanbi = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.attack = param1.readInt();
         _loc3_.lv = param1.readInt();
         var _loc4_:int = param1.readInt();
         _loc3_.skill = new Skill(_loc4_);
         _loc3_.skill.isLearn = param1.readByte();
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_72004(param1:ByteArray) : void
      {
         ZLog.add("72004：返回虎翼觉醒突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mainPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_72006(param1:ByteArray) : void
      {
         ZLog.add("72006: 返回突虎翼觉醒结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.setTupoResult(_loc2_);
      }
   }
}

