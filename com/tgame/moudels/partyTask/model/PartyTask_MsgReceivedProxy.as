package com.tgame.moudels.partyTask.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.vo.character.info.YabiaoInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.moudels.partyTask.model.info.BiaoCheInfo;
   import com.tgame.moudels.partyTask.view.PartyBossInvite_Mediator;
   import com.tgame.moudels.partyTask.view.PartyTaskComplete_Mediator;
   import com.tgame.moudels.partyTask.view.PartyTaskInvite_Mediator;
   import com.tgame.moudels.partyTask.view.PartyTask_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.manager.TimerManager;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class PartyTask_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "PartyTask_MsgReceivedProxy";
      
      private var biaoCheInfo_group:Array;
      
      private var biaoCheInfo_single:Array;
      
      private var _partyTaskMediator:PartyTask_Mediator;
      
      private var _partyTaskInviteMediator:PartyTaskInvite_Mediator;
      
      private var _partyTaskCompleteMediator:PartyTaskComplete_Mediator;
      
      private var _partyBossInviteMediator:PartyBossInvite_Mediator;
      
      public function PartyTask_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get partyTaskMediator() : PartyTask_Mediator
      {
         if(!this._partyTaskMediator)
         {
            this._partyTaskMediator = facade.retrieveMediator(PartyTask_Mediator.NAME) as PartyTask_Mediator;
         }
         return this._partyTaskMediator;
      }
      
      private function get partyTaskInviteMediator() : PartyTaskInvite_Mediator
      {
         if(!this._partyTaskInviteMediator)
         {
            this._partyTaskInviteMediator = facade.retrieveMediator(PartyTaskInvite_Mediator.NAME) as PartyTaskInvite_Mediator;
         }
         return this._partyTaskInviteMediator;
      }
      
      private function get partyTaskCompleteMediator() : PartyTaskComplete_Mediator
      {
         if(!this._partyTaskCompleteMediator)
         {
            this._partyTaskCompleteMediator = facade.retrieveMediator(PartyTaskComplete_Mediator.NAME) as PartyTaskComplete_Mediator;
         }
         return this._partyTaskCompleteMediator;
      }
      
      private function get partyBossInviteMediator() : PartyBossInvite_Mediator
      {
         if(!this._partyBossInviteMediator)
         {
            this._partyBossInviteMediator = facade.retrieveMediator(PartyBossInvite_Mediator.NAME) as PartyBossInvite_Mediator;
         }
         return this._partyBossInviteMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53732,53734,53736,53738,53740,53742,53744,53746,53748,53750,53752,53756,51202,51204,51206,51208,51214,51216,51230,71016,71018,71020],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53732,53734,53736,53738,53740,53742,53744,53746,53748,53750,53752,53756,51202,51204,51206,51208,51214,51216,51230,71016,71018,71020],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
            ZLog.add("收到消息：" + _loc2_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_53732(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:BiaoCheInfo = null;
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = param1.readByte();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = new BiaoCheInfo();
            _loc6_.type = _loc2_;
            _loc6_.enable = param1.readByte();
            _loc6_.bcID = param1.readInt();
            _loc6_.label = param1.readUTF();
            _loc6_.bcHP = param1.readInt();
            _loc6_.bcHuiFu = param1.readInt();
            _loc6_.bcSpeed = param1.readInt();
            _loc6_.bcChenFa = param1.readInt();
            _loc6_.setLine(param1.readUTF());
            _loc6_.taskLv = param1.readShort();
            _loc6_.taskCopper = param1.readInt();
            _loc6_.copper = param1.readDouble();
            _loc6_.taskGongXian = param1.readInt();
            _loc6_.taskJLGongXian = param1.readInt();
            _loc6_.taskJLExp = param1.readInt();
            _loc6_.taskJLZhenQi = param1.readInt();
            _loc6_.taskJLCopper = param1.readInt();
            _loc6_.setItem(param1.readUTF());
            _loc3_.push(_loc6_);
            _loc5_++;
         }
         if(_loc2_ == -1)
         {
            this.partyTaskMediator.biaoCheInfo_single = _loc3_;
            this.partyTaskMediator.partyTaskPanel.setSingleData(_loc3_);
         }
         else if(_loc2_ == -2)
         {
            this.partyTaskMediator.biaoCheInfo_group = _loc3_;
            this.partyTaskMediator.partyTaskPanel.setGroupData(_loc3_);
         }
      }
      
      public function received_53734(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         if(_loc2_ != -1)
         {
            if(_loc2_ == -2)
            {
            }
         }
         var _loc3_:int = param1.readByte();
      }
      
      public function received_53736(param1:ByteArray) : void
      {
         var _loc11_:int = 0;
         var _loc14_:Goods = null;
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:Array = param1.readUTF().split(";");
         var _loc9_:int = param1.readInt();
         var _loc10_:Array = [];
         var _loc12_:int = int(_loc8_.length);
         var _loc13_:Array = [];
         _loc11_ = 0;
         while(_loc11_ < _loc12_)
         {
            if(_loc8_[_loc11_] != "")
            {
               _loc13_ = _loc8_[_loc11_].split(",");
               _loc14_ = new Goods(int(_loc13_[0]));
               _loc14_.count = int(_loc13_[1]);
               _loc10_.push(_loc14_);
            }
            _loc11_++;
         }
         PipeManager.sendMsg(PipeConstants.OPEN_PARTY_TASK_INVITE);
         this.partyTaskInviteMediator.uiPanel.setPrise(_loc5_,_loc7_,_loc6_);
         this.partyTaskInviteMediator.uiPanel.setTimer(_loc9_);
         this.partyTaskInviteMediator.uiPanel.initGoodsList(_loc10_);
         this.partyTaskInviteMediator.uiPanel.setBangzhu(_loc2_);
         this.partyTaskInviteMediator.uiPanel.setPath(OtherConst.huBiaoLineId.indexOf(_loc3_) + 1);
      }
      
      public function received_53738(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         this.partyTaskInviteMediator.uiPanel.popGeren(_loc2_);
      }
      
      public function received_53740(param1:ByteArray) : void
      {
         ZLog.add("53740  更新主角的押镖情况, 以及是否可以接个人和帮派押镖任务 ");
         GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus = YabiaoInfo.NONE;
         GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus = YabiaoInfo.NONE;
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 0)
         {
            GameInstance.uiInstance.mainUI.shouBiao(false);
         }
         else
         {
            GameInstance.uiInstance.mainUI.shouBiao(true);
            GameInstance.uiInstance.mainUI.setBiaoZhuangtai(1);
         }
         if(_loc2_ == -1)
         {
            GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus = param1.readByte();
            GameInstance.mainCharData.yabiaoInfo.yabiaoNpc = param1.readInt();
            GameInstance.mainCharData.yabiaoInfo.leaveTime = param1.readInt();
         }
         else if(_loc2_ == -2)
         {
            GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus = param1.readByte();
            GameInstance.mainCharData.yabiaoInfo.yabiaoNpc = param1.readInt();
            GameInstance.mainCharData.yabiaoInfo.leaveTime = param1.readInt();
         }
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         if(_loc3_ == 1)
         {
            GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus = YabiaoInfo.NONE_ACCEPTABLE;
         }
         if(_loc4_ == 1)
         {
            GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus = YabiaoInfo.NONE_ACCEPTABLE;
         }
         TaskTracker.updateTaskUI();
      }
      
      public function received_53742(param1:ByteArray) : void
      {
         var timerHandler:Function;
         var $data:ByteArray = param1;
         var result:int = $data.readByte();
         if(result == 1)
         {
            timerHandler = function(param1:Number):void
            {
               var _loc2_:int = Math.round(param1) + 1;
               GameInstance.mainChar.showAttackFace("",0,LanResManager.getLanCommonTextWords("运镖地点传送") + _loc2_,AttackFace.DEFAULT_FOUNT_SIZE_14,AttackFace.DEFAULT_FOUNT_COLOR_GREEN);
            };
            if(this.partyTaskInviteMediator.uiPanel.parent)
            {
               this.partyTaskInviteMediator.uiPanel.parent.removeChild(this.partyTaskInviteMediator.uiPanel);
            }
            TimerManager.createOneOffExactTimer(5,5,0,timerHandler,null,1);
         }
      }
      
      public function received_53744(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         var _loc11_:Goods = null;
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:Array = param1.readUTF().split(";");
         var _loc7_:Array = [];
         var _loc9_:int = int(_loc6_.length);
         var _loc10_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            if(_loc6_[_loc8_] != "")
            {
               _loc10_ = _loc6_[_loc8_].split(",");
               _loc11_ = new Goods(int(_loc10_[0]));
               _loc11_.count = int(_loc10_[1]);
               _loc7_.push(_loc11_);
            }
            _loc8_++;
         }
         this.partyTaskCompleteMediator.uipanel.initGoodsList(_loc7_);
         this.partyTaskCompleteMediator.uipanel.setPrise(_loc3_,_loc5_,_loc2_,_loc4_);
      }
      
      public function received_53746(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            if(this.partyTaskCompleteMediator.uipanel.parent)
            {
               this.partyTaskCompleteMediator.uipanel.parent.removeChild(this.partyTaskCompleteMediator.uipanel);
            }
         }
      }
      
      public function received_53748(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
      }
      
      public function received_53750(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc2_:int = param1.readByte();
         GameInstance.uiInstance.mainUI.setBiaoZhuangtai(_loc2_);
         if(!(_loc2_ == 1 || _loc2_ == 2))
         {
            _loc3_ = param1.readShort();
            _loc4_ = param1.readShort();
            _loc5_ = param1.readShort();
            _loc6_ = param1.readShort();
            _loc7_ = MapTransManager.getSceneNameBySceneId(param1.readInt());
            _loc8_ = param1.readInt();
            GameInstance.uiInstance.mainUI.setBiaoWeizhi(_loc3_,_loc4_,_loc7_ + _loc5_ + "," + _loc6_,_loc8_);
         }
      }
      
      public function received_53752(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc5_:BiaoCheInfo = null;
         this.partyTaskMediator.biaoCheInfo_groupIsUpdata = this.partyTaskMediator.biaoCheInfo_singleIsUpdata = true;
         var _loc2_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc6_:String = "";
         var _loc7_:Boolean = false;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = new BiaoCheInfo();
            _loc5_.enable = param1.readByte();
            _loc5_.bcID = param1.readInt();
            _loc5_.nickName = param1.readUTF();
            _loc5_.label = param1.readUTF();
            if(_loc5_.enable == 0 && _loc3_ > 0 && _loc7_ == false)
            {
               _loc6_ = (_loc4_[_loc3_ - 1] as BiaoCheInfo).label;
               _loc7_ = true;
            }
            else if(_loc3_ == _loc2_ - 1 && _loc7_ == false)
            {
               _loc6_ = _loc5_.label;
            }
            _loc5_.bcHP = param1.readInt();
            _loc5_.bcHuiFu = param1.readInt();
            _loc5_.bcSpeed = param1.readInt();
            _loc5_.setCaiLiao(param1.readUTF());
            _loc5_.gradeCopper = param1.readInt();
            _loc4_.push(_loc5_);
            _loc3_++;
         }
         this.partyTaskMediator.partyTaskPanel.setGradeUPData(_loc4_,_loc6_);
      }
      
      public function received_53756(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 0)
         {
            GameInstance.uiInstance.popMapPanel.setBiaoChe();
         }
         else
         {
            _loc3_ = param1.readInt();
            _loc4_ = param1.readInt();
            _loc5_ = param1.readUTF();
            _loc5_ = _loc5_ + ("[" + param1.readUTF() + "]");
            _loc6_ = param1.readShort();
            _loc7_ = param1.readShort();
            _loc8_ = {
               "name":_loc5_,
               "xy":new Point(_loc6_ * 25,_loc7_ * 25),
               "dec":_loc5_
            };
            GameInstance.uiInstance.popMapPanel.setBiaoChe(_loc8_);
         }
      }
      
      public function received_51202(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         ZLog.add("51202:返回帮派BOSS主面板信息 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:Boolean = false;
         var _loc4_:Array = new Array();
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc11_ = new Object();
            _loc11_.id = param1.readUTF();
            _loc11_.bossid = param1.readInt();
            _loc11_.name = param1.readUTF();
            _loc11_.headImg = param1.readInt();
            _loc11_.lv = param1.readByte();
            _loc11_.maxLv = param1.readByte();
            _loc11_.cooper = param1.readInt();
            _loc11_.chenggonglv = param1.readInt();
            _loc12_ = param1.readByte();
            _loc13_ = "";
            _loc14_ = 0;
            while(_loc14_ < _loc12_)
            {
               _loc15_ = param1.readUTF();
               _loc13_ += _loc15_ + "|";
               _loc14_++;
            }
            if(_loc13_ != null && _loc13_.length > 0)
            {
               _loc11_.jineng = _loc13_.substr(0,_loc13_.length - 1);
            }
            _loc11_.zhenfa = param1.readUTF();
            _loc11_.tiaozhan = param1.readByte();
            if(_loc11_.tiaozhan == 1)
            {
               _loc3_ = true;
            }
            _loc4_.push(_loc11_);
            _loc5_++;
         }
         var _loc6_:String = param1.readUTF();
         var _loc7_:Array = new Array();
         var _loc8_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc11_ = _loc4_[_loc5_];
            if(_loc11_.id == _loc6_)
            {
               _loc8_ = _loc5_;
               break;
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < 5)
         {
            _loc7_.push(param1.readInt());
            _loc5_++;
         }
         var _loc9_:Number = param1.readDouble();
         var _loc10_:int = GameInstance.mainCharData.banghuiInfo.zhiwu;
         this.partyTaskMediator.initBossPanel(_loc4_,_loc7_,_loc9_,_loc8_,_loc3_,_loc10_);
      }
      
      public function received_51204(param1:ByteArray) : void
      {
         ZLog.add("51204:返回挑战帮派boss结果 ");
         var _loc2_:int = param1.readByte();
         this.partyTaskMediator.closePanel();
      }
      
      public function received_51206(param1:ByteArray) : void
      {
         ZLog.add("51206:返回祭奠boss结果");
         var _loc2_:int = param1.readByte();
      }
      
      public function received_51208(param1:ByteArray) : void
      {
         ZLog.add("51208:返回进入帮派boss副本结果  ");
         var _loc2_:int = param1.readByte();
         this.partyTaskMediator.closePanel();
      }
      
      public function received_51214(param1:ByteArray) : void
      {
         ZLog.add("51214 返回提交精魄结果  成功返回 失败不返回该消息 ");
         this.partyTaskMediator.reMoveJingpo();
      }
      
      public function received_51216(param1:ByteArray) : void
      {
         ZLog.add("51216:返回帮众接收帮派boss副本任务面板信息 ");
         var _loc2_:Array = new Array();
         _loc2_[0] = param1.readInt();
         _loc2_[1] = param1.readUTF();
         var _loc3_:int = param1.readByte();
         var _loc4_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ += param1.readUTF() + "<br/>";
            _loc5_++;
         }
         _loc2_[2] = _loc4_;
         _loc2_[3] = param1.readUTF();
         _loc2_[4] = param1.readUTF();
         this.partyTaskMediator.showBossInvite();
         this.partyBossInviteMediator.initReBoss(_loc2_);
      }
      
      public function received_51230(param1:ByteArray) : void
      {
         ZLog.add("51230:帮派副本传出去前阵屏和放妖时黑屏 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:Boolean = param1.readByte() == 1;
         if(_loc2_ == 1)
         {
            if(_loc3_)
            {
               FightManager.screen_shake(10,50);
               HighEffectManager.shitou_start(10);
            }
            else
            {
               HighEffectManager.shitou_stop(true,true);
            }
         }
         else if(_loc2_ == 2)
         {
            FightManager.be_blackWhite(GameInstance.mainChar,false,"ui.darken");
         }
      }
      
      public function received_71016(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("71016\t\t返回帮派荣誉面板城池列表信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc9_ = new Object();
            _loc9_.biaoshi = param1.readByte();
            _loc9_.name = param1.readUTF();
            _loc9_.dengji = param1.readByte();
            _loc9_.banghui = param1.readUTF();
            _loc9_.yingxiong = param1.readUTF();
            _loc3_.push(_loc9_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.partyTaskMediator.ChengChiList(_loc3_,_loc7_,_loc6_,_loc5_,_loc8_);
      }
      
      public function received_71018(param1:ByteArray) : void
      {
         ZLog.add("71018\t\t返回选中城池信息");
         var _loc2_:Object = new Object();
         _loc2_.biaoshi = param1.readByte();
         _loc2_.name = param1.readUTF();
         _loc2_.dengji = param1.readInt();
         if(_loc2_.dengji != 0)
         {
            _loc2_.act = param1.readInt();
            _loc2_.def = param1.readInt();
            _loc2_.shanbi = param1.readInt();
            _loc2_.neili = param1.readInt();
            _loc2_.shengming = param1.readInt();
            _loc2_.baoji = param1.readInt();
         }
         this.partyTaskMediator.ChengChiXinXi(_loc2_);
      }
      
      public function received_71020(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("71020\t\t返回该城史志");
         var _loc2_:int = param1.readByte();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc9_ = new Object();
            _loc9_.jieci = param1.readInt();
            _loc9_.shijian = param1.readUTF();
            _loc9_.renyuan = param1.readUTF();
            _loc9_.tianshu = param1.readInt();
            _loc5_.push(_loc9_);
            _loc6_++;
         }
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.partyTaskMediator.ChengChiShiZhi(_loc2_,_loc3_,_loc5_,_loc7_,_loc8_);
      }
   }
}

