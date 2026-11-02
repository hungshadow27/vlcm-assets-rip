package com.tgame.moudels.zhanhun.model
{
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.zhanhun.view.Zhanhun_Mediator;
   import com.tgame.moudels.zhanhun.view.Zhanhun_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Zhanhun_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Zhanhun_MsgReceivedProxy";
      
      private var _ZhanHunMediator:Zhanhun_Mediator;
      
      private var _ZhanHunTargetMediator:Zhanhun_TargetPanelMediator;
      
      public function Zhanhun_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      private function get zhanHunMediator() : Zhanhun_Mediator
      {
         if(!this._ZhanHunMediator)
         {
            this._ZhanHunMediator = facade.retrieveMediator(Zhanhun_Mediator.NAME) as Zhanhun_Mediator;
         }
         return this._ZhanHunMediator;
      }
      
      private function get zhanHunTargetMediator() : Zhanhun_TargetPanelMediator
      {
         if(!this._ZhanHunTargetMediator)
         {
            this._ZhanHunTargetMediator = facade.retrieveMediator(Zhanhun_TargetPanelMediator.NAME) as Zhanhun_TargetPanelMediator;
         }
         return this._ZhanHunTargetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([55832,55834,55836,55838],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([55832,55834,55836,55838],NAME);
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
      
      public function received_55832(param1:ByteArray) : void
      {
         var _loc9_:int = 0;
         var _loc23_:McBaseItem = null;
         var _loc24_:int = 0;
         var _loc2_:Array = new Array();
         var _loc3_:ByteArray = param1;
         var _loc4_:Boolean = Boolean(_loc3_.readByte());
         var _loc5_:int = _loc3_.readInt();
         var _loc6_:int = _loc3_.readByte();
         this.zhanHunMediator.zbId = _loc6_;
         var _loc7_:int = _loc3_.readByte();
         this.zhanHunMediator.xiangqianShuliang = 0;
         if(_loc5_ == -1)
         {
            _loc9_ = 1;
            while(_loc9_ < 9)
            {
               this.zhanHunMediator.setZhanhunItem(null,_loc9_);
               _loc9_++;
            }
            this.zhanHunMediator.setData();
            this.zhanHunMediator.isHuanZhuang(_loc4_);
         }
         else
         {
            _loc9_ = 1;
            while(_loc9_ < 9)
            {
               this.zhanHunTargetMediator.setZhanhunItem(null,_loc9_);
               _loc9_++;
            }
            this.zhanHunTargetMediator.setData();
            this.zhanHunTargetMediator.isZhanHunHuanZhuang(_loc4_);
         }
         if(_loc7_ == 0)
         {
            if(_loc5_ == -1)
            {
               this.zhanHunMediator.setZhanhunBtn(_loc6_);
               this.zhanHunMediator.setZhanhunDakong(0);
               this.zhanHunMediator.setShuxingVis(false);
               this.zhanHunMediator.openDoublePanel();
            }
            else
            {
               this.zhanHunTargetMediator.setZhanhunBtn(_loc6_);
               this.zhanHunTargetMediator.setZhanhunDakong(0);
               this.zhanHunTargetMediator.setShuxingVis(false);
               this.zhanHunTargetMediator.setBtnEnbale();
            }
            return;
         }
         var _loc8_:int = _loc3_.readByte();
         this.zhanHunMediator.xiangqianShuliang = _loc8_;
         if(_loc8_ == 0)
         {
            if(_loc5_ == -1)
            {
               this.zhanHunMediator.setZhanhunBtn(_loc6_);
               this.zhanHunMediator.setZhanhunDakong(_loc7_);
               this.zhanHunMediator.setShuxingVis(false);
               this.zhanHunMediator.openDoublePanel();
            }
            else
            {
               this.zhanHunTargetMediator.setZhanhunBtn(_loc6_);
               this.zhanHunTargetMediator.setZhanhunDakong(_loc7_);
               this.zhanHunTargetMediator.setShuxingVis(false);
               this.zhanHunTargetMediator.setBtnEnbale();
            }
            return;
         }
         _loc9_ = 0;
         while(_loc9_ < _loc8_)
         {
            _loc23_ = new McBaseItem(0);
            _loc23_.name = _loc3_.readUTF();
            _loc23_.dengji = _loc3_.readByte();
            _loc23_.quality = _loc3_.readByte();
            _loc23_.daojuId = _loc3_.readInt();
            _loc23_.id = _loc23_.daojuId;
            _loc23_.dangqianJingyan = _loc3_.readInt();
            _loc23_.zuidaJingyan = _loc3_.readInt();
            _loc23_.tunshiJingyan = _loc3_.readInt();
            _loc23_.isSuoding = _loc3_.readByte();
            _loc23_.bind = _loc3_.readByte();
            _loc23_.miaoshu = _loc3_.readUTF();
            _loc24_ = _loc3_.readByte();
            _loc23_.zhuangbeiId = _loc6_;
            _loc23_.zhuangbeiWeizhi = _loc24_;
            if(_loc5_ == -1)
            {
               this.zhanHunMediator.setZhanhunItem(_loc23_,_loc24_);
            }
            else
            {
               this.zhanHunTargetMediator.setZhanhunItem(_loc23_,_loc24_);
            }
            _loc9_++;
         }
         var _loc10_:int = _loc3_.readInt();
         var _loc11_:int = _loc3_.readInt();
         var _loc12_:int = _loc3_.readInt();
         var _loc13_:int = _loc3_.readInt();
         var _loc14_:int = _loc3_.readInt();
         var _loc15_:int = _loc3_.readInt();
         var _loc16_:int = _loc3_.readInt();
         var _loc17_:int = _loc3_.readInt();
         var _loc18_:int = _loc3_.readInt();
         var _loc19_:int = _loc3_.readInt();
         var _loc20_:int = _loc3_.readInt();
         var _loc21_:int = _loc3_.readInt();
         var _loc22_:int = _loc3_.readInt();
         _loc2_.push(_loc11_);
         _loc2_.push(_loc12_);
         _loc2_.push(_loc13_);
         _loc2_.push(_loc14_);
         _loc2_.push(_loc15_);
         _loc2_.push(_loc16_);
         _loc2_.push(_loc17_);
         _loc2_.push(_loc18_);
         _loc2_.push(_loc19_);
         _loc2_.push(_loc20_);
         _loc2_.push(_loc21_);
         _loc2_.push(_loc22_);
         if(_loc5_ == -1)
         {
            this.zhanHunMediator.setZhanhunBtn(_loc6_);
            this.zhanHunMediator.setZhanhunDakong(_loc7_);
            this.zhanHunMediator.setShuxingVis(true);
            this.zhanHunMediator.setZhanhunShuxingNum(_loc10_,_loc2_);
            this.zhanHunMediator.openDoublePanel();
         }
         else
         {
            this.zhanHunTargetMediator.setZhanhunBtn(_loc6_);
            this.zhanHunTargetMediator.setZhanhunDakong(_loc7_);
            this.zhanHunTargetMediator.setShuxingVis(true);
            this.zhanHunTargetMediator.setZhanhunShuxingNum(_loc10_,_loc2_);
            this.zhanHunTargetMediator.setBtnEnbale();
         }
      }
      
      public function received_55834(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         this.zhanHunMediator.updateZhanhun(_loc3_);
      }
      
      public function received_55836(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         this.zhanHunMediator.updateZhanhun(_loc3_);
      }
      
      public function received_55838(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         this.zhanHunMediator.updateZhanhun(_loc3_);
      }
   }
}

