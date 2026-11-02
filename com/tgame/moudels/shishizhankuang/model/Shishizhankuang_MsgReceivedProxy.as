package com.tgame.moudels.shishizhankuang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.shishizhankuang.view.ShishiZhankuang_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shishizhankuang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Shishizhankuang_MsgReceivedProxy";
      
      private var _shishizhankuangMediator:ShishiZhankuang_Mediator;
      
      public function Shishizhankuang_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      private function get shishizhankuangMediator() : ShishiZhankuang_Mediator
      {
         if(!this._shishizhankuangMediator)
         {
            this._shishizhankuangMediator = facade.retrieveMediator(ShishiZhankuang_Mediator.NAME) as ShishiZhankuang_Mediator;
         }
         return this._shishizhankuangMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([51964],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([51964],NAME);
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
      
      public function received_51964(param1:ByteArray) : void
      {
         var _loc23_:Object = null;
         ZLog.add("51964：接收实时战况信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readByte();
         var _loc8_:int = _loc2_.readByte();
         var _loc9_:Number = _loc2_.readDouble();
         var _loc10_:Number = _loc2_.readDouble();
         var _loc11_:int = _loc2_.readByte();
         var _loc12_:int = _loc2_.readByte();
         var _loc13_:int = _loc2_.readByte();
         var _loc14_:Number = _loc2_.readDouble();
         var _loc15_:Number = _loc2_.readDouble();
         var _loc16_:int = _loc2_.readByte();
         var _loc17_:int = _loc2_.readByte();
         var _loc18_:int = _loc2_.readByte();
         var _loc19_:Array = new Array();
         _loc19_.push(_loc11_,_loc12_,_loc13_,_loc16_,_loc17_,_loc18_);
         var _loc20_:int = _loc2_.readByte();
         var _loc21_:Array = [];
         var _loc22_:int = 0;
         while(_loc22_ < _loc20_)
         {
            _loc23_ = new Object();
            _loc23_.name = _loc2_.readUTF();
            _loc23_.cishu = _loc2_.readInt();
            _loc23_.shuliang = _loc2_.readInt();
            _loc23_.jifen = _loc2_.readInt();
            _loc23_.zhuangtai = _loc2_.readByte();
            _loc23_.nf = _loc2_.readByte();
            _loc23_.ids = _loc22_ % 2;
            _loc21_.push(_loc23_);
            _loc22_++;
         }
         this.shishizhankuangMediator.setShishiZhanKuangPanelData(_loc3_,_loc5_,_loc4_,_loc6_,_loc21_,_loc7_,_loc8_,_loc9_,_loc10_,_loc14_,_loc15_,_loc19_);
      }
   }
}

