package com.tgame.moudels.dizaizhen.model
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.dizaizhen.model.info.DiZaiZhenVO;
   import com.tgame.moudels.dizaizhen.view.DiZaiZhen_Mediator;
   import com.tgame.moudels.dizaizhen.view.DiZaiZhen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DiZaiZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "DiZaiZhen_MsgReceivedProxy";
      
      private var _mainPanelMediator:DiZaiZhen_Mediator;
      
      private var _targetMediator:DiZaiZhen_TargetPanelMediator;
      
      public function DiZaiZhen_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : DiZaiZhen_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(DiZaiZhen_Mediator.NAME) as DiZaiZhen_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : DiZaiZhen_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(DiZaiZhen_TargetPanelMediator.NAME) as DiZaiZhen_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71702,71704,71706],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71702,71704,71706],NAME);
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
      
      public function received_71702(param1:ByteArray) : void
      {
         var _loc6_:Goods = null;
         ZLog.add("71702\t\t返回玩家地载阵详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:DiZaiZhenVO = new DiZaiZhenVO();
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
      
      public function received_71704(param1:ByteArray) : void
      {
         ZLog.add("71704\t\t返回地载阵突破数据");
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
      
      public function received_71706(param1:ByteArray) : void
      {
         ZLog.add("71706\t\t返回突破地载阵结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateLVComplete(_loc2_);
      }
   }
}

