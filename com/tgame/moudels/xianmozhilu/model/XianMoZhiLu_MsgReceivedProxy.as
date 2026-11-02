package com.tgame.moudels.xianmozhilu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xianmozhilu.view.XianMoZhiLu_Mediator;
   import com.tgame.moudels.xianmozhilu.view.XianMoZhiLu_ZhongZu_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XianMoZhiLu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XianMoZhiLu_MsgReceivedProxy";
      
      private var _mianPanelMediator:XianMoZhiLu_Mediator;
      
      private var _mianPanel_ZhongZu_Mediator:XianMoZhiLu_ZhongZu_Mediator;
      
      public function XianMoZhiLu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mianPanelMediator() : XianMoZhiLu_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(XianMoZhiLu_Mediator.NAME) as XianMoZhiLu_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      public function get mianPanel_ZhongZu_Mediator() : XianMoZhiLu_ZhongZu_Mediator
      {
         if(!this._mianPanel_ZhongZu_Mediator)
         {
            this._mianPanel_ZhongZu_Mediator = facade.retrieveMediator(XianMoZhiLu_ZhongZu_Mediator.NAME) as XianMoZhiLu_ZhongZu_Mediator;
         }
         return this._mianPanel_ZhongZu_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([80232,80236,80238,80240,80242,80462,80464,80468,80492,80942,81102,81322],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([80232,80236,80238,80240,80242,80462,80464,80468,80492,80942,81102,81322],NAME);
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
      
      public function received_80232(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("80232：返回仙魔之路数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc8_ = new Object();
            _loc8_.index = param1.readInt();
            _loc8_.isThrough = param1.readByte();
            _loc5_.push(_loc8_);
            _loc6_++;
         }
         var _loc7_:Boolean = Boolean(param1.readByte());
         this.mianPanelMediator.setXianMoZhiLuData(_loc2_,_loc3_,_loc5_,_loc7_);
      }
      
      public function received_80236(param1:ByteArray) : void
      {
         ZLog.add("80236：返回仙魔之路----新地图进入");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTrackVisibleInto(_loc2_);
      }
      
      public function received_80238(param1:ByteArray) : void
      {
         ZLog.add("80238：返回仙魔之路----装备预览");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.mianPanelMediator.setZhuangBeiYuLanData(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_80240(param1:ByteArray) : void
      {
         ZLog.add("80240：返回仙魔之路----装备升级结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setZhuangBeiShengJiData(_loc2_);
      }
      
      public function received_80242(param1:ByteArray) : void
      {
         ZLog.add("80242：返回仙魔之路----新地图传出");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTrackVisibleBack(_loc2_);
      }
      
      public function received_80462(param1:ByteArray) : void
      {
         ZLog.add("80462:转职成功失败");
         var _loc2_:Boolean = Boolean(param1.readByte());
         this.mianPanelMediator.setChengongZhuanzhi(_loc2_);
      }
      
      public function received_80464(param1:ByteArray) : void
      {
         ZLog.add("80464:种族界面信息");
         var _loc2_:Object = {};
         _loc2_.type = param1.readByte();
         _loc2_.ziyuan = param1.readInt();
         _loc2_.isxianshi = Boolean(param1.readByte());
         _loc2_.skillid1 = param1.readInt();
         _loc2_.skillid2 = param1.readInt();
         _loc2_.skillid3 = param1.readInt();
         _loc2_.skillid4 = param1.readInt();
         _loc2_.check33 = Boolean(param1.readByte());
         this.mianPanel_ZhongZu_Mediator.setPanel(_loc2_);
      }
      
      public function received_80468(param1:ByteArray) : void
      {
         ZLog.add("80468:解除转职成功失败");
         var _loc2_:Boolean = Boolean(param1.readByte());
         this.mianPanelMediator.setjieChu(_loc2_);
         this.mianPanel_ZhongZu_Mediator.setjieChu(_loc2_);
      }
      
      public function received_80492(param1:ByteArray) : void
      {
         ZLog.add("80492:仙魔觉醒数据");
         var _loc2_:Object = new Object();
         _loc2_.rank = param1.readInt();
         _loc2_.star = param1.readInt();
         _loc2_.gongji = param1.readDouble();
         _loc2_.fangyu = param1.readDouble();
         _loc2_.shengming = param1.readDouble();
         _loc2_.shuXing = param1.readDouble();
         _loc2_.xiaohao = param1.readInt();
         this.mianPanel_ZhongZu_Mediator.setXianMoJueXingData(_loc2_);
      }
      
      public function received_80942(param1:ByteArray) : void
      {
         ZLog.add("80942(:仙魔天技数据");
         var _loc2_:Object = new Object();
         _loc2_.rank = param1.readInt();
         _loc2_.star = param1.readInt();
         _loc2_.gongji = param1.readDouble();
         _loc2_.fangyu = param1.readDouble();
         _loc2_.shengming = param1.readDouble();
         _loc2_.xiaohao = param1.readInt();
         this.mianPanel_ZhongZu_Mediator.setXianMoTianJiData(_loc2_);
      }
      
      public function received_81102(param1:ByteArray) : void
      {
         ZLog.add("81102:仙魔觉醒数据");
         var _loc2_:Object = new Object();
         _loc2_.rank = param1.readInt();
         _loc2_.star = param1.readInt();
         _loc2_.baihu = param1.readInt();
         _loc2_.zhuque = param1.readInt();
         _loc2_.xuanwu = param1.readInt();
         _loc2_.qinglong = param1.readInt();
         _loc2_.xiaohao = param1.readInt();
         _loc2_.isActived = param1.readByte();
         _loc2_.check4 = Boolean(param1.readByte());
         _loc2_.check5 = Boolean(param1.readByte());
         this.mianPanel_ZhongZu_Mediator.setXianMoTianWenData(_loc2_);
      }
      
      public function received_81322(param1:ByteArray) : void
      {
         ZLog.add("81322:仙魔天瑞数据");
         var _loc2_:Object = new Object();
         _loc2_.rank = param1.readInt();
         _loc2_.star = param1.readInt();
         _loc2_.xiaohao = param1.readInt();
         _loc2_.gouxuan = param1.readByte();
         _loc2_.canGouxuan = param1.readByte();
         _loc2_.check2 = param1.readByte();
         _loc2_.check3 = param1.readByte();
         _loc2_.check4 = param1.readByte();
         _loc2_.check5 = param1.readByte();
         _loc2_.check6 = param1.readByte();
         this.mianPanel_ZhongZu_Mediator.setXianMoTianRuiData(_loc2_);
      }
   }
}

