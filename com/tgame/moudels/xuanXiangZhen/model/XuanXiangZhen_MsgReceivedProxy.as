package com.tgame.moudels.xuanXiangZhen.model
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xuanXiangZhen.model.info.XuanXiangZhenVO;
   import com.tgame.moudels.xuanXiangZhen.view.XuanXiangZhen_Mediator;
   import com.tgame.moudels.xuanXiangZhen.view.XuanXiangZhen_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XuanXiangZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XuanXiangZhen_MsgReceivedProxy";
      
      private var _mainPanelMediator:XuanXiangZhen_Mediator;
      
      private var _targetMediator:XuanXiangZhen_TargetPanelMediator;
      
      public function XuanXiangZhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : XuanXiangZhen_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(XuanXiangZhen_Mediator.NAME) as XuanXiangZhen_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : XuanXiangZhen_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(XuanXiangZhen_TargetPanelMediator.NAME) as XuanXiangZhen_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70752,70754,70756],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70752,70754,70756],NAME);
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
      
      public function received_70752(param1:ByteArray) : void
      {
         var _loc6_:Goods = null;
         ZLog.add("70752\t\t返回玩家玄襄阵详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:XuanXiangZhenVO = new XuanXiangZhenVO();
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
      
      public function received_70754(param1:ByteArray) : void
      {
         ZLog.add("70754\t\t返回玄襄阵突破数据");
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
      
      public function received_70756(param1:ByteArray) : void
      {
         ZLog.add("70756\t\t返回突破玄襄阵结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateLVComplete(_loc2_);
      }
   }
}

