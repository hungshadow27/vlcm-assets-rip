package com.tgame.moudels.huangtubaye.model
{
   import com.tgame.common.GameConfig;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.huangtubaye.view.HuangTuBaYe_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HuangTuBaYe_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "HuangTuBaYe_MsgReceivedProxy";
      
      private var _mainPanelMediator:HuangTuBaYe_Mediator;
      
      public function HuangTuBaYe_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : HuangTuBaYe_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(HuangTuBaYe_Mediator.NAME) as HuangTuBaYe_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71002,71004,71006,71012,71060],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71002,71004,71006,71012,71060],NAME);
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
      
      public function received_71002(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("71002\t\t返回皇途霸业详细数据");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.biaoshi = param1.readByte();
            _loc5_.name = param1.readUTF();
            _loc5_.jibie = param1.readByte();
            _loc5_.bangpai = param1.readUTF();
            _loc5_.bangzhu = param1.readUTF();
            _loc5_.zhandouli = param1.readDouble();
            _loc5_.renshu = param1.readInt();
            _loc5_.pingtai = param1.readByte();
            _loc5_.guishu = Boolean(param1.readByte() == 1);
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.mainPanelMediator.setPanel(_loc3_);
      }
      
      public function received_71004(param1:ByteArray) : void
      {
         var _loc11_:Object = null;
         ZLog.add("71004\t\t返回江山社稷面板信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = param1.readByte();
         var _loc9_:Array = [];
         var _loc10_:int = 0;
         while(_loc10_ < _loc8_)
         {
            _loc11_ = new Object();
            _loc11_.leixing = param1.readByte();
            if(_loc11_.leixing != 0)
            {
               _loc11_.name = param1.readUTF();
               _loc11_.sex = param1.readByte();
            }
            _loc9_.push(_loc11_);
            _loc10_++;
         }
         this.mainPanelMediator.setJiangShanPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc9_);
      }
      
      public function received_71006(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("71006\t\t返回【江山社稷】查看信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc7_ = new Object();
            _loc7_.jieci = param1.readByte();
            _loc7_.shijian = param1.readUTF();
            _loc7_.renyuan = param1.readUTF();
            _loc7_.tianshu = param1.readInt();
            _loc3_.push(_loc7_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         this.mainPanelMediator.setXinXiPanel(_loc3_,_loc5_,_loc6_);
      }
      
      public function received_71012(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         ZLog.add("71012\t\t返回奖励设置面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.fenghao = param1.readByte();
            _loc5_.guding = param1.readUTF();
            _loc5_.meiri = param1.readUTF();
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.mainPanelMediator.setJiangLiPanel(_loc3_);
      }
      
      public function received_71060(param1:ByteArray) : void
      {
         ZLog.add("71060\t\t更新皇主id");
         GameConfig.huangZhu_ID = param1.readInt();
      }
   }
}

