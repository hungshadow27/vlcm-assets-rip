package com.tgame.moudels.huyijuexing.model
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.huyijuexing.model.info.HuYiJueXingVO;
   import com.tgame.moudels.huyijuexing.view.HuYiJueXingXiangQian_Mediator;
   import com.tgame.moudels.huyijuexing.view.HuYiJueXing_Mediator;
   import com.tgame.moudels.huyijuexing.view.HuYiJueXing_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HuYiJueXing_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "HuYiJueXing_MsgReceivedProxy";
      
      private var _mainPanelMediator:HuYiJueXing_Mediator;
      
      private var _targetMediator:HuYiJueXing_TargetPanelMediator;
      
      private var _xiangqianMediator:HuYiJueXingXiangQian_Mediator;
      
      public function HuYiJueXing_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : HuYiJueXing_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(HuYiJueXing_Mediator.NAME) as HuYiJueXing_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : HuYiJueXing_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(HuYiJueXing_TargetPanelMediator.NAME) as HuYiJueXing_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      private function get xiangqianPlaneMediator() : HuYiJueXingXiangQian_Mediator
      {
         if(!this._xiangqianMediator)
         {
            this._xiangqianMediator = facade.retrieveMediator(HuYiJueXingXiangQian_Mediator.NAME) as HuYiJueXingXiangQian_Mediator;
         }
         return this._xiangqianMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71402,71404,71406,71408],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71402,71404,71406,71408],NAME);
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
      
      public function received_71402(param1:ByteArray) : void
      {
         ZLog.add("71402：返回玩虎翼觉醒功详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:HuYiJueXingVO = new HuYiJueXingVO();
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
      
      public function received_71404(param1:ByteArray) : void
      {
         ZLog.add("71404：返回虎翼觉醒突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mainPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_71406(param1:ByteArray) : void
      {
         ZLog.add("71406: 返回突虎翼觉醒结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.setTupoResult(_loc2_);
      }
      
      public function received_71408(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Goods = null;
         var _loc13_:int = 0;
         var _loc14_:Goods = null;
         ZLog.add("71408: 返回神兵觉醒镶嵌面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc10_ = param1.readInt();
            _loc11_ = param1.readInt();
            _loc12_ = new Goods(_loc10_,_loc11_);
            _loc4_.push(_loc12_);
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         var _loc7_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc13_ = param1.readInt();
            _loc14_ = new Goods(_loc13_);
            _loc7_.push(_loc14_);
            _loc5_++;
         }
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         this.xiangqianPlaneMediator.setShenbingXiangqianInit(_loc7_,_loc4_,_loc2_,_loc8_,_loc9_);
      }
   }
}

