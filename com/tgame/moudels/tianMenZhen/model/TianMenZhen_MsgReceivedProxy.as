package com.tgame.moudels.tianMenZhen.model
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.tianMenZhen.model.info.TianMenZhenVO;
   import com.tgame.moudels.tianMenZhen.view.BuZhen_Mediator;
   import com.tgame.moudels.tianMenZhen.view.TianMenZhen_Mediator;
   import com.tgame.moudels.tianMenZhen.view.TianMenZhen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianMenZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TianMenZhen_MsgReceivedProxy";
      
      private var _buZhen_Mediator:BuZhen_Mediator;
      
      private var _mainPanelMediator:TianMenZhen_Mediator;
      
      private var _targetMediator:TianMenZhen_TargetPanelMediator;
      
      public function TianMenZhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get buZhen_Mediator() : BuZhen_Mediator
      {
         if(!this._buZhen_Mediator)
         {
            this._buZhen_Mediator = facade.retrieveMediator(BuZhen_Mediator.NAME) as BuZhen_Mediator;
         }
         return this._buZhen_Mediator;
      }
      
      public function get mainPanelMediator() : TianMenZhen_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(TianMenZhen_Mediator.NAME) as TianMenZhen_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : TianMenZhen_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(TianMenZhen_TargetPanelMediator.NAME) as TianMenZhen_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70102,70104,70106,70108],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70102,70104,70106,70108],NAME);
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
      
      public function received_70102(param1:ByteArray) : void
      {
         var _loc6_:Goods = null;
         ZLog.add("70102\t\t返回玩家天门阵详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:TianMenZhenVO = new TianMenZhenVO();
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
      
      public function received_70104(param1:ByteArray) : void
      {
         ZLog.add("70104\t\t返回天门阵突破数据");
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
      
      public function received_70106(param1:ByteArray) : void
      {
         ZLog.add("70106\t\t返回突破天门阵结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateLVComplete(_loc2_);
      }
      
      public function received_70108(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc8_:Object = null;
         ZLog.add("70108\t\t返回布阵信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc8_ = new Object();
            _loc8_.id = param1.readInt();
            _loc8_.index = param1.readShort();
            _loc4_.push(_loc8_);
            _loc5_++;
         }
         var _loc6_:int = param1.readByte();
         var _loc7_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc8_ = new Object();
            _loc8_.id = param1.readInt();
            _loc8_.count = param1.readByte();
            _loc7_.push(_loc8_);
            _loc5_++;
         }
         this.buZhen_Mediator.setPanel(_loc2_,_loc4_,_loc7_);
      }
   }
}

