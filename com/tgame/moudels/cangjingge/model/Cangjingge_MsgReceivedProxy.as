package com.tgame.moudels.cangjingge.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.cangjingge.view.Cangjingge_LingwuPanelMediator;
   import com.tgame.moudels.cangjingge.view.Cangjingge_PanelMediator;
   import com.tgame.moudels.cangjingge.view.Cangjingge_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Cangjingge_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Cangjingge_MsgReceivedProxy";
      
      private var _CangjinggeMainMediator:Cangjingge_PanelMediator;
      
      private var _lingwuPanelMediator:Cangjingge_LingwuPanelMediator;
      
      private var _targetMediator:Cangjingge_TargetPanelMediator;
      
      public function Cangjingge_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get CangjinggeMainMediator() : Cangjingge_PanelMediator
      {
         if(!this._CangjinggeMainMediator)
         {
            this._CangjinggeMainMediator = facade.retrieveMediator(Cangjingge_PanelMediator.NAME) as Cangjingge_PanelMediator;
         }
         return this._CangjinggeMainMediator;
      }
      
      private function get lingwuPlaneMediator() : Cangjingge_LingwuPanelMediator
      {
         if(!this._lingwuPanelMediator)
         {
            this._lingwuPanelMediator = facade.retrieveMediator(Cangjingge_LingwuPanelMediator.NAME) as Cangjingge_LingwuPanelMediator;
         }
         return this._lingwuPanelMediator;
      }
      
      private function get targetPlaneMediator() : Cangjingge_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(Cangjingge_TargetPanelMediator.NAME) as Cangjingge_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([52042,52044,52046,52048],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([52042,52044,52046,52048],NAME);
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
      
      public function received_52042(param1:ByteArray) : void
      {
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:String = null;
         var _loc24_:String = null;
         ZLog.add("52042：藏经阁境界 主面板 数据接收");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         var _loc13_:int = param1.readByte();
         var _loc14_:int = param1.readByte();
         var _loc15_:int = param1.readByte();
         if(Cangjingge_PanelMediator.jingjie_name.length == 0)
         {
            _loc21_ = param1.readInt();
            _loc22_ = 0;
            while(_loc22_ < _loc21_)
            {
               _loc23_ = param1.readUTF();
               Cangjingge_PanelMediator.jingjie_name.push(_loc23_);
               _loc24_ = param1.readUTF();
               Cangjingge_PanelMediator.jingjie_desc.push(_loc24_);
               _loc22_++;
            }
         }
         var _loc16_:Boolean = Boolean(param1.readByte() == 1);
         var _loc17_:Boolean = Boolean(param1.readByte() == 1);
         var _loc18_:Boolean = Boolean(param1.readByte() == 1);
         var _loc19_:Boolean = Boolean(param1.readByte() == 1);
         var _loc20_:Array = [];
         _loc20_.push(_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_);
         Cangjingge_PanelMediator.current_jingjie = _loc2_;
         this.CangjinggeMainMediator.updateCangjinggeUI(_loc19_,_loc18_,_loc3_,_loc2_,_loc5_,_loc16_,_loc17_,_loc20_);
      }
      
      public function received_52044(param1:ByteArray) : void
      {
         ZLog.add("52044：藏经阁境界 突破面板 数据接收");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:String = GoodsResManager.getGoodsRes(_loc5_).name;
         var _loc9_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc5_,true);
         var _loc10_:Goods = new Goods(_loc5_);
         _loc10_.count = _loc9_;
         this.lingwuPlaneMediator.xiaohaoGoodsId = _loc5_;
         this.lingwuPlaneMediator.xiaohaoNeedNum = _loc6_;
         this.lingwuPlaneMediator.setJingJieGoods(_loc10_);
         this.lingwuPlaneMediator.initializeUI(_loc8_,_loc6_,_loc7_);
         this.lingwuPlaneMediator.setJingJieZhufuzhi(_loc3_,_loc4_);
         this.lingwuPlaneMediator.showLingwu(true);
      }
      
      public function received_52046(param1:ByteArray) : void
      {
         ZLog.add("52046：藏经阁境界 突破结果 数据接收");
         var _loc2_:int = param1.readByte();
         if(_loc2_)
         {
            this.lingwuPlaneMediator.lingwuSuccess();
         }
         else
         {
            this.lingwuPlaneMediator.lingwuFail();
         }
      }
      
      public function received_52048(param1:ByteArray) : void
      {
         ZLog.add("52048：藏经阁境界 其他玩家面板 数据接收");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readByte();
         var _loc13_:int = param1.readByte();
         var _loc14_:int = param1.readByte();
         var _loc15_:Boolean = Boolean(param1.readByte() == 1);
         var _loc16_:Boolean = Boolean(param1.readByte() == 1);
         var _loc17_:Boolean = Boolean(param1.readByte() == 1);
         var _loc18_:Boolean = Boolean(param1.readByte() == 1);
         var _loc19_:Array = [];
         _loc19_.push(_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_);
         this.targetPlaneMediator.initializeMainUI(_loc3_,_loc4_,_loc4_,_loc15_,_loc16_,_loc19_,_loc17_,_loc18_);
      }
   }
}

