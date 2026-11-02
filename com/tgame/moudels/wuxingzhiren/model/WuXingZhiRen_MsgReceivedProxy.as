package com.tgame.moudels.wuxingzhiren.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.wuxingzhiren.view.WuXingZhiRen_Mediator;
   import com.tgame.moudels.wuxingzhiren.view.WuXingZhiRen_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WuXingZhiRen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "WuXingZhiRen_MsgReceivedProxy";
      
      private var _WuXingZhiRenMediator:WuXingZhiRen_Mediator;
      
      private var _WuXingZhiRenTargetMediator:WuXingZhiRen_TargetMediator;
      
      public function WuXingZhiRen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      private function get wuXingZhirenMediator() : WuXingZhiRen_Mediator
      {
         if(!this._WuXingZhiRenMediator)
         {
            this._WuXingZhiRenMediator = facade.retrieveMediator(WuXingZhiRen_Mediator.NAME) as WuXingZhiRen_Mediator;
         }
         return this._WuXingZhiRenMediator;
      }
      
      private function get wuXingZhirenTargetMediator() : WuXingZhiRen_TargetMediator
      {
         if(!this._WuXingZhiRenTargetMediator)
         {
            this._WuXingZhiRenTargetMediator = facade.retrieveMediator(WuXingZhiRen_TargetMediator.NAME) as WuXingZhiRen_TargetMediator;
         }
         return this._WuXingZhiRenTargetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([55522,55524,55526],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([55522,55524,55526],NAME);
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
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_55522(param1:ByteArray) : void
      {
         var _loc14_:Object = null;
         var _loc15_:int = 0;
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = new Array();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:int = 1;
         while(_loc6_ <= _loc5_)
         {
            _loc14_ = {};
            _loc14_.id = _loc2_.readByte();
            _loc14_.name = _loc2_.readUTF();
            _loc14_.zhuangtai = _loc2_.readByte();
            _loc15_ = _loc2_.readInt();
            _loc14_.go = new Goods(_loc15_);
            _loc14_.goodNums = _loc2_.readInt();
            _loc14_.xkshuxing = _loc2_.readUTF();
            _loc14_.sxshuoming = _loc2_.readUTF();
            _loc14_.gongji = _loc2_.readInt();
            _loc14_.fangyu = _loc2_.readInt();
            _loc14_.shengming = _loc2_.readInt();
            _loc14_.cuilian = Boolean(_loc2_.readByte() == 1);
            _loc14_.wugong = _loc2_.readInt();
            _loc3_.push(_loc14_);
            _loc6_++;
         }
         var _loc7_:String = _loc2_.readUTF();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readByte();
         var _loc10_:Boolean = Boolean(_loc2_.readByte());
         var _loc11_:int = _loc2_.readInt();
         var _loc12_:* = Boolean(_loc2_.readByte() == 1);
         var _loc13_:* = Boolean(_loc2_.readByte() == 1);
         if(_loc4_ == -1)
         {
            this.wuXingZhirenMediator.updateWuXingZhiRenPanel(_loc3_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
            this.wuXingZhirenMediator.isHuanZhuang(_loc13_);
         }
         else if(_loc4_ == GameInstance.lookPlayerID)
         {
            this.wuXingZhirenTargetMediator.updateWuXingZhiRenPanel(_loc3_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
            this.wuXingZhirenTargetMediator.isHuanZhuang(_loc13_);
         }
      }
      
      public function received_55524(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ >= 1 && _loc3_ <= 5)
         {
            if(this.wuXingZhirenMediator.no == _loc3_)
            {
               this.wuXingZhirenMediator.refillWuXingZhiRenData(_loc3_);
            }
         }
      }
      
      public function received_55526(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         this.wuXingZhirenMediator.qhWuXingZhiRenData(_loc3_);
      }
   }
}

