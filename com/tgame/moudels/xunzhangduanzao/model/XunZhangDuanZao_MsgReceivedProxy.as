package com.tgame.moudels.xunzhangduanzao.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.synthesize.view.ShiShiKaiFengMediator;
   import com.tgame.moudels.xunzhangduanzao.view.JinHua_PlaneMediator;
   import com.tgame.moudels.xunzhangduanzao.view.QiangHua_PlaneMediator;
   import com.tgame.moudels.xunzhangduanzao.view.ShengDanXunZhangDuanZao_PlaneMediator;
   import com.tgame.moudels.xunzhangduanzao.view.XunZhangDuanZao_PlaneMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XunZhangDuanZao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XunZhangDuanZao_MsgReceivedProxy";
      
      private var _XunZhangMainMediator:XunZhangDuanZao_PlaneMediator;
      
      private var _shiShiKaiFengMediator:ShiShiKaiFengMediator;
      
      private var _diwangjianMediator:ShengDanXunZhangDuanZao_PlaneMediator;
      
      private var _qiangHua_PlaneMediator:QiangHua_PlaneMediator;
      
      private var _jinHua_PlaneMediator:JinHua_PlaneMediator;
      
      public function XunZhangDuanZao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get XunZhangMainMediator() : XunZhangDuanZao_PlaneMediator
      {
         if(!this._XunZhangMainMediator)
         {
            this._XunZhangMainMediator = facade.retrieveMediator(XunZhangDuanZao_PlaneMediator.NAME) as XunZhangDuanZao_PlaneMediator;
         }
         return this._XunZhangMainMediator;
      }
      
      public function get jinHua_PlaneMediator() : JinHua_PlaneMediator
      {
         if(!this._jinHua_PlaneMediator)
         {
            this._jinHua_PlaneMediator = facade.retrieveMediator(JinHua_PlaneMediator.NAME) as JinHua_PlaneMediator;
         }
         return this._jinHua_PlaneMediator;
      }
      
      private function get shiShiKaiFengMediator() : ShiShiKaiFengMediator
      {
         if(this._shiShiKaiFengMediator == null)
         {
            this._shiShiKaiFengMediator = facade.retrieveMediator(ShiShiKaiFengMediator.NAME) as ShiShiKaiFengMediator;
         }
         return this._shiShiKaiFengMediator;
      }
      
      private function get diWangJianMediator() : ShengDanXunZhangDuanZao_PlaneMediator
      {
         if(this._diwangjianMediator == null)
         {
            this._diwangjianMediator = facade.retrieveMediator(ShengDanXunZhangDuanZao_PlaneMediator.NAME) as ShengDanXunZhangDuanZao_PlaneMediator;
         }
         return this._diwangjianMediator;
      }
      
      private function get qiangHua_PlaneMediator() : QiangHua_PlaneMediator
      {
         if(this._qiangHua_PlaneMediator == null)
         {
            this._qiangHua_PlaneMediator = facade.retrieveMediator(QiangHua_PlaneMediator.NAME) as QiangHua_PlaneMediator;
         }
         return this._qiangHua_PlaneMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53566,53568,53576,53578,53580,82702,82704],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53566,53568,53576,53578,53580,82702,82704],NAME);
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
      
      public function received_53566(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:String = _loc2_.readUTF();
         var _loc9_:String = _loc2_.readUTF();
         var _loc10_:String = _loc2_.readUTF();
         var _loc11_:String = _loc2_.readUTF();
         var _loc12_:int = _loc2_.readInt();
         var _loc13_:int = _loc2_.readByte();
         var _loc14_:Goods = new Goods(_loc4_);
         var _loc15_:Goods = new Goods(_loc5_);
         var _loc16_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc6_,true);
         if(_loc3_ == 1)
         {
            this.XunZhangMainMediator.InitializePanel(_loc14_,_loc15_,_loc16_,_loc7_,_loc10_,_loc8_,_loc9_,_loc11_,_loc12_,_loc13_,0);
         }
         else if(_loc3_ == 2)
         {
            this.XunZhangMainMediator.dakaiZuoqiQianghua(_loc4_,_loc6_,_loc7_,_loc8_,_loc9_);
         }
         else if(_loc3_ == 4)
         {
            this.XunZhangMainMediator.InitializePanel(_loc14_,_loc15_,_loc16_,_loc7_,_loc10_,_loc8_,_loc9_,_loc11_,_loc12_,_loc13_,0);
         }
         else
         {
            this.diWangJianMediator.InitializePanel(_loc10_,_loc14_,_loc16_,_loc8_,_loc9_);
         }
      }
      
      public function received_53568(param1:ByteArray = null) : void
      {
         var _loc5_:Goods = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readShort();
         if(_loc3_ == 1)
         {
            _loc5_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc4_);
            if(_loc5_ != null)
            {
               if(_loc5_.res.position == ItemPositionRange.POSTION_ZHUANGBEIWEIZHI1)
               {
                  this.XunZhangMainMediator.reRequestXunZhangInfo(_loc5_);
               }
               else if(ItemPositionRange.YUENAN_ZHAOYUANWUHUJIANGARR.indexOf(_loc5_.id) != -1)
               {
                  this.XunZhangMainMediator.reRequestXunZhangInfo(_loc5_);
               }
            }
            this.XunZhangMainMediator.stopzdupdate(1);
         }
         else if(_loc3_ == 2)
         {
            this.XunZhangMainMediator.stopzdupdate(2);
         }
      }
      
      public function received_53576(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = new Object();
            _loc7_.id = param1.readInt();
            _loc7_.count = param1.readByte();
            _loc7_.jilv = param1.readInt();
            _loc7_.jiacheng = param1.readUTF();
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.qiangHua_PlaneMediator.setQiangHuaPanel(_loc2_,_loc3_,_loc5_);
      }
      
      public function received_53578(param1:ByteArray = null) : void
      {
         var _loc2_:Boolean = param1.readByte() == 1;
         this.qiangHua_PlaneMediator.closePanel();
      }
      
      public function received_53580(param1:ByteArray) : void
      {
         ZLog.add("53580\t\t返回进化信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:String = _loc2_.readUTF();
         var _loc8_:Goods = new Goods(_loc3_);
         var _loc9_:Goods = new Goods(_loc4_);
         var _loc10_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc5_,true);
         this.jinHua_PlaneMediator.InitializePanel(_loc8_,_loc9_,_loc10_,_loc6_,_loc7_);
      }
      
      public function received_82702(param1:ByteArray) : void
      {
         ZLog.add("82702：返回武防勋章面板信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:String = _loc2_.readUTF();
         var _loc9_:String = _loc2_.readUTF();
         var _loc10_:String = _loc2_.readUTF();
         var _loc11_:String = _loc2_.readUTF();
         var _loc12_:int = _loc2_.readInt();
         var _loc13_:Goods = new Goods(_loc4_);
         var _loc14_:Goods = new Goods(_loc5_);
         var _loc15_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc6_,true);
         this.XunZhangMainMediator.InitializePanel(_loc13_,_loc14_,_loc15_,_loc7_,_loc10_,_loc8_,_loc9_,_loc11_,_loc12_,1);
      }
      
      public function received_82704(param1:ByteArray) : void
      {
         ZLog.add("82704：武防勋章升级成功返回");
         var _loc2_:int = param1.readShort();
         this.XunZhangMainMediator.send_80701(_loc2_);
      }
   }
}

