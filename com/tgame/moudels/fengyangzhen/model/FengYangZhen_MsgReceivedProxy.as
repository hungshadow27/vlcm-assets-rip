package com.tgame.moudels.fengyangzhen.model
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.fengyangzhen.model.info.FengYangZhenVO;
   import com.tgame.moudels.fengyangzhen.view.FengYangZhen_Mediator;
   import com.tgame.moudels.fengyangzhen.view.FengYangZhen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class FengYangZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "FengYangZhen_MsgReceivedProxy";
      
      private var _mainPanelMediator:FengYangZhen_Mediator;
      
      private var _targetMediator:FengYangZhen_TargetPanelMediator;
      
      public function FengYangZhen_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : FengYangZhen_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(FengYangZhen_Mediator.NAME) as FengYangZhen_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : FengYangZhen_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(FengYangZhen_TargetPanelMediator.NAME) as FengYangZhen_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71752,71754,71756],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71752,71754,71756],NAME);
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
      
      public function received_71752(param1:ByteArray) : void
      {
         var _loc6_:Goods = null;
         ZLog.add("71752\t\t返回玩家地载阵详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:FengYangZhenVO = new FengYangZhenVO();
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
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.upDataPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_71754(param1:ByteArray) : void
      {
         ZLog.add("71754\t\t返回地载阵突破数据");
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
      
      public function received_71756(param1:ByteArray) : void
      {
         ZLog.add("71756\t\t返回突破地载阵结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateLVComplete(_loc2_);
      }
   }
}

