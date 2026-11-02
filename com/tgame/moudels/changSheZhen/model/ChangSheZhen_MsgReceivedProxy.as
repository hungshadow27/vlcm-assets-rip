package com.tgame.moudels.changSheZhen.model
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.changSheZhen.model.info.ChangSheZhenVO;
   import com.tgame.moudels.changSheZhen.view.ChangSheZhen_Mediator;
   import com.tgame.moudels.changSheZhen.view.ChangSheZhen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChangSheZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ChangSheZhen_MsgReceivedProxy";
      
      private var _mainPanelMediator:ChangSheZhen_Mediator;
      
      private var _targetMediator:ChangSheZhen_TargetPanelMediator;
      
      public function ChangSheZhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : ChangSheZhen_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(ChangSheZhen_Mediator.NAME) as ChangSheZhen_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : ChangSheZhen_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(ChangSheZhen_TargetPanelMediator.NAME) as ChangSheZhen_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70402,70404,70406],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70402,70404,70406],NAME);
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
      
      public function received_70402(param1:ByteArray) : void
      {
         var _loc6_:Goods = null;
         ZLog.add("70402\t\t返回玩家长蛇阵详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:ChangSheZhenVO = new ChangSheZhenVO();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.lookName = param1.readUTF();
         _loc3_.lookID = param1.readByte();
         _loc3_.nowID = param1.readByte();
         _loc3_.xunZhangStr = param1.readUTF();
         _loc3_.equipArr = [];
         var _loc4_:int = param1.readByte();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = new Goods(param1.readInt(),param1.readByte());
            _loc3_.equipArr.push(_loc6_);
            _loc5_++;
         }
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.baoji = param1.readInt();
         _loc3_.shanbi = param1.readInt();
         _loc3_.mp = param1.readInt();
         _loc3_.xiShu = param1.readFloat();
         _loc3_.maxBeiShu = param1.readInt();
         _loc3_.count = param1.readByte();
         _loc3_.isShow = param1.readByte() == 1;
         _loc3_.baofa = param1.readInt();
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.upDataPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_70404(param1:ByteArray) : void
      {
         ZLog.add("70404\t\t返回长蛇阵突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readByte();
         var _loc10_:int = param1.readByte();
         this.mainPanelMediator.upDateLV(_loc6_,_loc7_,_loc4_,_loc5_,_loc8_,_loc3_,_loc2_,_loc9_,_loc10_);
      }
      
      public function received_70406(param1:ByteArray) : void
      {
         ZLog.add("70406\t\t返回突破长蛇阵结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateLVComplete(_loc2_);
      }
   }
}

