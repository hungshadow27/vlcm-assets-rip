package com.tgame.moudels.zunrongwanbaoge.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.zunrongwanbaoge.view.ZunrongWanbaogeHuigui_Mediator;
   import com.tgame.moudels.zunrongwanbaoge.view.ZunrongWanbaoge_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZunrongWanbaoge_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ZunrongWanbaoge_MsgReceivedProxy";
      
      public function ZunrongWanbaoge_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71822,71824,71826,71828,71830,71832],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71822,71824,71826,71828,71830,71832],NAME);
      }
      
      private function get zunrongwanbaogemediator() : ZunrongWanbaoge_Mediator
      {
         return facade.retrieveMediator(ZunrongWanbaoge_Mediator.NAME) as ZunrongWanbaoge_Mediator;
      }
      
      private function get zunrongwanbaogeHuiguimediator() : ZunrongWanbaogeHuigui_Mediator
      {
         return facade.retrieveMediator(ZunrongWanbaogeHuigui_Mediator.NAME) as ZunrongWanbaogeHuigui_Mediator;
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
      
      public function received_71822(param1:ByteArray) : void
      {
         ZLog.add("71822：万宝阁回归界面信息返回");
         var _loc2_:Boolean = param1.readBoolean();
         var _loc3_:int = param1.readInt();
         this.zunrongwanbaogeHuiguimediator.showWanbaogeHuiguiPanel(_loc2_,_loc3_);
      }
      
      public function received_71824(param1:ByteArray) : void
      {
         var _loc3_:Skill = null;
         var _loc4_:SkillRes = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = undefined;
         ZLog.add("71824：初始化万宝阁主功能栏信息");
         GameInstance.mainCharData.skillInfo.skillObj = {};
         GameInstance.mainCharData.goodsInfo.skillsOfQuickBar = [];
         var _loc2_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc2_)
         {
            _loc5_ = param1.readInt();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = param1.readInt();
               _loc8_ = param1.readShort();
               _loc4_ = SkillResManager.getSkillRes(_loc7_);
               _loc3_ = new Skill(_loc7_,_loc4_.position,_loc8_,_loc4_.coolingtime);
               _loc3_.isLearn = param1.readByte();
               GameInstance.mainCharData.skillInfo.addSkill(_loc3_);
               if(_loc3_.quickbarindex != 0)
               {
                  ExchangePositionManager.addSkillsOfQuickBar(_loc3_);
               }
               _loc6_++;
            }
            ExchangePositionManager.getWanbaogeShortIndexItem();
         }
         GameInstance.uiInstance.mainUI.setWanbaogeFunctionBarVisible(_loc2_);
         this.zunrongwanbaogeHuiguimediator.removeWanbaogeHuiguiPanel();
      }
      
      public function received_71830(param1:ByteArray) : void
      {
         ZLog.add("71830：初始化万宝阁主功能栏押宝按钮倒计时");
         var _loc2_:int = param1.readInt();
         GameInstance.uiInstance.mainUI.setYanbaoBtn(_loc2_);
      }
      
      public function received_71832(param1:ByteArray) : void
      {
         ZLog.add("71832：初始化万宝阁主功能栏怒气值");
         var _loc2_:int = param1.readInt();
         GameInstance.uiInstance.mainUI.setNuqiNum(_loc2_);
      }
      
      public function received_71826(param1:ByteArray) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc2_:int = param1.readInt();
         ZLog.add("宝石鉴赏押注剩余时间（int）（单位：毫秒）:" + _loc2_);
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = param1.readDouble();
            _loc7_ = param1.readByte();
            _loc8_ = new Object();
            _loc8_.beishu = _loc6_;
            _loc8_.type = _loc7_;
            _loc9_ = new Array();
            _loc10_ = 0;
            while(_loc10_ < _loc7_)
            {
               _loc11_ = param1.readInt();
               _loc12_ = param1.readUTF();
               _loc13_ = new Array();
               _loc13_ = _loc12_.split(";");
               _loc14_ = 0;
               while(_loc14_ < _loc13_.length)
               {
                  _loc9_.push(_loc13_[_loc14_]);
                  _loc14_++;
               }
               _loc9_.push(_loc11_);
               _loc10_++;
            }
            _loc8_.info = _loc9_;
            _loc4_.push(_loc8_);
            _loc5_++;
         }
         this.zunrongwanbaogemediator.setShowBaoShi(_loc4_);
         this.zunrongwanbaogemediator.setTimer(_loc2_);
      }
      
      public function received_71828(param1:ByteArray) : void
      {
         var _loc2_:Boolean = Boolean(param1.readByte());
         ZLog.add("71828：宝石押注结果返回" + _loc2_);
         if(_loc2_)
         {
            this.zunrongwanbaogemediator.yaBaoSuccess();
         }
      }
   }
}

