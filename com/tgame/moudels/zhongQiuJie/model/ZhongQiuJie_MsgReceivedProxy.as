package com.tgame.moudels.zhongQiuJie.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.zhongQiuJie.view.CaiDengMi_Mediator;
   import com.tgame.moudels.zhongQiuJie.view.YuanXiaoJie_Mediator;
   import com.tgame.moudels.zhongQiuJie.view.ZhongQiuJieZhuoZi_Mediator;
   import com.tgame.moudels.zhongQiuJie.view.ZhongQiuJie_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.display.Sprite;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhongQiuJie_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ZhongQiuJie_MsgReceivedProxy";
      
      private var _zhongQiuJieMediator:ZhongQiuJie_Mediator;
      
      private var _zhuoZiMediator:ZhongQiuJieZhuoZi_Mediator;
      
      private var _yuanXiaoJieMediator:YuanXiaoJie_Mediator;
      
      private var _caiDengMi_Mediator:CaiDengMi_Mediator;
      
      public var window:Sprite = new Sprite();
      
      public function ZhongQiuJie_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([77500,77492,77482,77502,77514,74912,78952,78960],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([77500,77492,77482,77502,77514,74912,78952,78960],NAME);
      }
      
      private function get zhongQiuJieMediator() : ZhongQiuJie_Mediator
      {
         if(!this._zhongQiuJieMediator)
         {
            this._zhongQiuJieMediator = facade.retrieveMediator(ZhongQiuJie_Mediator.NAME) as ZhongQiuJie_Mediator;
         }
         return this._zhongQiuJieMediator;
      }
      
      private function get zhuoZiMediator() : ZhongQiuJieZhuoZi_Mediator
      {
         if(!this._zhuoZiMediator)
         {
            this._zhuoZiMediator = facade.retrieveMediator(ZhongQiuJieZhuoZi_Mediator.NAME) as ZhongQiuJieZhuoZi_Mediator;
         }
         return this._zhuoZiMediator;
      }
      
      private function get yuanXiaoJieMediator() : YuanXiaoJie_Mediator
      {
         if(!this._yuanXiaoJieMediator)
         {
            this._yuanXiaoJieMediator = facade.retrieveMediator(YuanXiaoJie_Mediator.NAME) as YuanXiaoJie_Mediator;
         }
         return this._yuanXiaoJieMediator;
      }
      
      private function get caiDengMi_Mediator() : CaiDengMi_Mediator
      {
         if(!this._caiDengMi_Mediator)
         {
            this._caiDengMi_Mediator = facade.retrieveMediator(CaiDengMi_Mediator.NAME) as CaiDengMi_Mediator;
         }
         return this._caiDengMi_Mediator;
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
      
      public function received_77482(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Goods = null;
         ZLog.add("77482\t\t返回中秋节活动信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc10_ = param1.readInt();
            _loc4_.push(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc10_,true));
            _loc5_++;
         }
         var _loc6_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1.readInt(),true);
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readByte();
         var _loc9_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc8_)
         {
            _loc11_ = new Object();
            _loc11_.huoYueDu = param1.readByte();
            _loc11_.isGet = param1.readByte() == 1;
            _loc11_.goodsArr = [];
            _loc12_ = param1.readByte();
            _loc13_ = 0;
            while(_loc13_ < _loc12_)
            {
               _loc14_ = new Goods(param1.readInt());
               _loc14_.count = param1.readInt();
               _loc11_.goodsArr.push(_loc14_);
               _loc13_++;
            }
            _loc9_.push(_loc11_);
            _loc5_++;
         }
         this.zhongQiuJieMediator.setPanelData(_loc2_,_loc4_,_loc6_,_loc7_,_loc9_);
      }
      
      public function received_77492(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("77492\t\t返回月饼排行榜信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc9_ = new Object();
            _loc9_.index = param1.readInt();
            _loc9_.name = param1.readUTF();
            _loc9_.count = param1.readInt();
            _loc6_.push(_loc9_);
            _loc7_++;
         }
         var _loc8_:Boolean = param1.readByte() == 1;
         this.zhongQiuJieMediator.setRankDate(_loc2_,_loc3_,_loc6_,_loc8_,_loc4_);
      }
      
      public function received_77502(param1:ByteArray) : void
      {
         ZLog.add("77502\t\t返回月饼桌信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readByte();
         var _loc5_:Boolean = param1.readByte() == 1;
         this.zhuoZiMediator.setPanel(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_77500(param1:ByteArray) : void
      {
         ZLog.add("77500\t\t主角双人骑乘状态");
         var _loc2_:Boolean = param1.readByte() == 1;
         HighEffectManager.doubleFlyStatus(_loc2_);
      }
      
      public function received_77514(param1:ByteArray) : void
      {
         ZLog.add("77514\t\t返回双人骑乘确认");
         this.zhongQiuJieMediator.showQiChengQueRen();
      }
      
      public function received_78952(param1:ByteArray) : void
      {
         ZLog.add("78952\t\t返回灯谜大赛获奖名单");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_.push(param1.readUTF());
            _loc5_++;
         }
         this.yuanXiaoJieMediator.setRankPanel(_loc2_,_loc4_);
      }
      
      public function received_78960(param1:ByteArray) : void
      {
         ZLog.add("78960\t\t返回灯谜大赛获奖名单");
         var _loc2_:int = param1.readByte();
         var _loc3_:String = param1.readUTF();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readByte();
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readByte();
         var _loc9_:String = param1.readUTF();
         this.caiDengMi_Mediator.setData(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
   }
}

