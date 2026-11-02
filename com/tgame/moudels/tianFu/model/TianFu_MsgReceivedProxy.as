package com.tgame.moudels.tianFu.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.tianFu.view.TianFuSuiPianHeChengMediator;
   import com.tgame.moudels.tianFu.view.TianFu_Mediator;
   import com.tgame.moudels.tianFu.view.TianFu_TargetPanelMediator;
   import com.tgame.moudels.tianFu.view.XiangQianTianFu_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianFu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TianFu_MsgReceivedProxy";
      
      private var _tianFuSuiPianHeChengMediator:TianFuSuiPianHeChengMediator;
      
      private var _tianFuMediator:TianFu_Mediator;
      
      private var _xqtianFuMediator:XiangQianTianFu_Mediator;
      
      private var _targetMediator:TianFu_TargetPanelMediator;
      
      public function TianFu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      private function get tianFuSuiPianHeChengMediator() : TianFuSuiPianHeChengMediator
      {
         if(this._tianFuSuiPianHeChengMediator == null)
         {
            this._tianFuSuiPianHeChengMediator = facade.retrieveMediator(TianFuSuiPianHeChengMediator.NAME) as TianFuSuiPianHeChengMediator;
         }
         return this._tianFuSuiPianHeChengMediator;
      }
      
      private function get tianFuMediator() : TianFu_Mediator
      {
         if(!this._tianFuMediator)
         {
            this._tianFuMediator = facade.retrieveMediator(TianFu_Mediator.NAME) as TianFu_Mediator;
         }
         return this._tianFuMediator;
      }
      
      private function get xqtianFuMediator() : XiangQianTianFu_Mediator
      {
         if(!this._xqtianFuMediator)
         {
            this._xqtianFuMediator = facade.retrieveMediator(XiangQianTianFu_Mediator.NAME) as XiangQianTianFu_Mediator;
         }
         return this._xqtianFuMediator;
      }
      
      private function get targetPlaneMediator() : TianFu_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(TianFu_TargetPanelMediator.NAME) as TianFu_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([58322,58324,58328,58252,58256,58258,58302,58304,58306,58308,58260],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([58322,58324,58328,58252,58256,58258,58302,58304,58306,58308,58260],NAME);
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
      
      public function received_58322(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("58322： 返回天赋碎片合成初始信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            _loc4_ = _loc2_.readInt();
            _loc5_ = _loc2_.readShort();
            this.tianFuSuiPianHeChengMediator.setOKGood(_loc4_,_loc5_);
         }
      }
      
      public function received_58324(param1:ByteArray) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Goods = null;
         var _loc11_:Goods = null;
         ZLog.add("58324： 返回天赋碎片拖入或拔除结果");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            _loc4_ = new Array();
            _loc5_ = _loc2_.readShort();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = _loc2_.readShort();
               _loc8_ = _loc2_.readShort();
               _loc9_ = _loc2_.readShort();
               _loc10_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc7_);
               if(_loc10_ != null)
               {
                  _loc11_ = new Goods(_loc10_.id);
                  _loc11_.count = _loc8_;
                  _loc4_.push([_loc11_,_loc7_,_loc8_,_loc9_]);
               }
               _loc6_++;
            }
            this.tianFuSuiPianHeChengMediator.setItems(_loc4_);
         }
      }
      
      public function received_58328(param1:ByteArray) : void
      {
         ZLog.add("58328： 返回天赋碎片拖入或拔除结果");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            this.tianFuSuiPianHeChengMediator.updateButton();
         }
      }
      
      public function received_58252(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc21_:Object = null;
         ZLog.add("58252：收到查看主角天赋返回");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:Boolean = _loc2_.readByte() == 1 ? true : false;
         if(_loc5_)
         {
            _loc6_ = _loc2_.readInt();
         }
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:Array = new Array();
         var _loc9_:* = 0;
         while(_loc9_ < _loc7_)
         {
            _loc21_ = new Object();
            _loc21_.id = _loc2_.readInt();
            _loc21_.goodId = _loc2_.readInt();
            _loc21_.texiao = _loc2_.readByte();
            _loc8_.push(_loc21_);
            _loc9_++;
         }
         var _loc10_:Number = _loc2_.readDouble();
         var _loc11_:Number = _loc2_.readDouble();
         var _loc12_:Number = _loc2_.readDouble();
         var _loc13_:Number = _loc2_.readDouble();
         var _loc14_:Number = _loc2_.readDouble();
         var _loc15_:Number = _loc2_.readDouble();
         var _loc16_:Number = _loc2_.readDouble();
         var _loc17_:int = _loc2_.readInt();
         var _loc18_:Boolean = _loc2_.readByte() == 1;
         var _loc19_:Boolean = _loc2_.readByte() == 1;
         var _loc20_:Boolean = _loc2_.readByte() == 1;
         this.tianFuMediator.setData(_loc3_,_loc4_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc5_,_loc6_,_loc17_,_loc18_,_loc19_);
         this.tianFuMediator.setGoods(_loc8_);
         this.tianFuMediator.isHuanZhuang(_loc20_);
      }
      
      public function received_58256(param1:ByteArray) : void
      {
         ZLog.add("58256：收到主角推命返回");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         this.tianFuMediator.setShuaXinNum(_loc6_);
         this.tianFuMediator.setTuiMingNum(_loc5_);
         this.tianFuMediator.setTurn(_loc3_,_loc4_);
      }
      
      public function received_58260(param1:ByteArray) : void
      {
         ZLog.add("58260：收到主角领取天赋返回");
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         if(_loc3_)
         {
            this.tianFuMediator.lingQuGoods();
         }
      }
      
      public function received_58258(param1:ByteArray) : void
      {
         var _loc18_:Object = null;
         ZLog.add("58258：收到查看他人天赋面板返回");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:Array = new Array();
         var _loc6_:* = 0;
         while(_loc6_ < _loc4_)
         {
            _loc18_ = new Object();
            _loc18_.id = _loc2_.readInt();
            _loc18_.goodId = _loc2_.readInt();
            _loc5_.push(_loc18_);
            _loc6_++;
         }
         var _loc7_:Number = _loc2_.readDouble();
         var _loc8_:Number = _loc2_.readDouble();
         var _loc9_:Number = _loc2_.readDouble();
         var _loc10_:Number = _loc2_.readDouble();
         var _loc11_:Number = _loc2_.readDouble();
         var _loc12_:Number = _loc2_.readDouble();
         var _loc13_:Number = _loc2_.readDouble();
         var _loc14_:int = _loc2_.readInt();
         var _loc15_:Boolean = _loc2_.readByte() == 1;
         var _loc16_:Boolean = _loc2_.readByte() == 1;
         var _loc17_:Boolean = _loc2_.readByte() == 1;
         this.targetPlaneMediator.setData(_loc3_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_);
         this.targetPlaneMediator.setGoods(_loc5_);
         this.targetPlaneMediator.isHuanZhuang(_loc17_);
      }
      
      public function received_58302(param1:ByteArray) : void
      {
         var _loc2_:Array = null;
         var _loc9_:Object = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         ZLog.add("58302：返回镶嵌天赋面板");
         _loc2_ = new Array();
         var _loc3_:ByteArray = param1;
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:Array = [];
         var _loc10_:int = 0;
         while(_loc10_ < _loc7_)
         {
            _loc2_ = [];
            _loc11_ = param1.readInt();
            _loc12_ = 0;
            while(_loc12_ < _loc11_)
            {
               _loc9_ = new Object();
               _loc9_.jh = param1.readByte();
               _loc9_.id = param1.readInt();
               _loc9_.name = param1.readUTF();
               _loc9_.t = param1.readInt();
               _loc9_.zhi = param1.readDouble();
               _loc9_.type = param1.readByte();
               _loc9_.state = param1.readByte();
               _loc9_.time = param1.readUTF();
               _loc9_.x = param1.readInt();
               _loc9_.y = param1.readInt();
               _loc9_.gid = param1.readInt();
               _loc9_.gnum = param1.readInt();
               _loc9_.copper = param1.readInt();
               _loc9_.gas = param1.readInt();
               _loc2_.push(_loc9_);
               _loc12_++;
            }
            _loc8_.push(_loc2_);
            _loc10_++;
         }
         this.xqtianFuMediator.setData(_loc8_,_loc5_,_loc6_,_loc7_,_loc4_);
      }
      
      public function received_58304(param1:ByteArray) : void
      {
         var _loc5_:* = undefined;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:String = null;
         var _loc12_:Object = null;
         ZLog.add("58304：返回遗忘天赋结果");
         var _loc2_:Array = new Array();
         var _loc3_:ByteArray = param1;
         var _loc4_:int = param1.readByte();
         if(_loc4_ == 1)
         {
            _loc5_ = param1.readByte();
            _loc6_ = param1.readInt();
            _loc7_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readInt();
            _loc10_ = param1.readDouble();
            _loc11_ = "";
            if(_loc5_ == 1)
            {
               this.xqtianFuMediator.ywTianFuRe(_loc4_,_loc6_,_loc7_,_loc9_);
            }
            else if(_loc5_ == 2)
            {
               _loc11_ = param1.readUTF();
               this.xqtianFuMediator.hxTianFuRe(_loc4_,_loc6_,_loc7_,_loc9_,_loc11_);
            }
            else if(_loc5_ == 3)
            {
               _loc12_ = new Object();
               _loc11_ = param1.readUTF();
               _loc12_.goid = param1.readInt();
               _loc12_.gonum = param1.readInt();
               _loc12_.copper = param1.readInt();
               _loc12_.gas = param1.readInt();
               _loc12_.zhi = _loc10_;
               _loc12_.time = _loc11_;
               _loc12_.type = _loc8_;
               this.xqtianFuMediator.xqTianFuRe(_loc4_,_loc6_,_loc7_,_loc9_,_loc12_);
            }
         }
      }
   }
}

