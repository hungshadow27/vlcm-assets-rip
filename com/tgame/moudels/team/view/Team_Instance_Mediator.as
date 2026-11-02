package com.tgame.moudels.team.view
{
   import com.fireice.text.FLabel;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.instance.InstanceRes;
   import com.tgame.common.res.instance.InstanceResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.manager.ConfirmManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TimeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.team.Team_ApplicationFacade;
   import com.tgame.moudels.team.model.Team_MsgSenderProxy;
   import com.tgame.shell.view.components.InstanceConvectionPanel;
   import com.tgame.shell.view.components.InstancePortalPanel;
   import com.tgame.shell.view.components.instanceportal.FubenTongguanCanvas;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.manager.TimerManager;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Team_Instance_Mediator extends Mediator
   {
      
      public static const NAME:String = "Team_Instance_Mediator";
      
      private var teamPlayers:Array = [];
      
      private var currentFubenList:Array = [];
      
      private var timerData:TimerData;
      
      private var readyEnterTimerData:TimerData;
      
      private var timerCount:int;
      
      private var readyEnterTimerCount:int;
      
      private var readyEnterInstanceID:int;
      
      private var timer:Timer;
      
      private var fuBenTimeLabel:FLabel;
      
      private var fubenTime:int;
      
      private var yijingFubenTime:int;
      
      private var fubenContainer:Sprite;
      
      private var _msgSenderProxy:Team_MsgSenderProxy;
      
      public function Team_Instance_Mediator()
      {
         super(NAME);
      }
      
      private function get sender() : Team_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Team_MsgSenderProxy.NAME) as Team_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get instancePanel() : InstancePortalPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.teamInstancePanel);
         }
         return viewComponent as InstancePortalPanel;
      }
      
      private function get instanceSelectPanel() : InstanceConvectionPanel
      {
         return GameInstance.uiInstance.instanceSelectPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Team_ApplicationFacade.SHOW_TEAM_INSTANCE,Team_ApplicationFacade.ENTER_SCENE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Team_ApplicationFacade.SHOW_TEAM_INSTANCE:
               _loc3_ = Number(_loc2_);
               if(_loc3_ == NpcFunctionType.INSTANCE)
               {
                  this.clear();
                  if(GameInstance.mainCharData.teamInfo.teamPlayers.length > 0 && GameInstance.mainCharData.teamInfo.teamLeaderID == GameInstance.mainChar.id)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance._instanceSelectPanel))
                     {
                        PipeManager.sendMsg(PipeConstants.SHOW_INSTANCE_SELECT_PANEL);
                     }
                  }
                  else
                  {
                     if(GameInstance.mainCharData.teamInfo.teamPlayers.length > 0 && GameInstance.mainCharData.teamInfo.teamLeaderID != GameInstance.mainChar.id)
                     {
                        NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您当前不是队长，不可以操作副本传送"),false);
                        NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您当前不是队长，不可以操作副本传送"),false);
                        return;
                     }
                     if(GameInstance.mainCharData.teamInfo.teamPlayers.length == 0)
                     {
                        if(!Fun.isVisible(GameInstance.uiInstance._instanceSelectPanel))
                        {
                           PipeManager.sendMsg(PipeConstants.SHOW_INSTANCE_SELECT_PANEL);
                        }
                     }
                  }
               }
               else if(_loc3_ == NpcFunctionType.LINGQU_MIZONG)
               {
                  this.sender.send_52059();
               }
               break;
            case Team_ApplicationFacade.ENTER_SCENE:
               if(GameConfig.wantEnterMapRes.isFuben != 1)
               {
                  this.closeTime();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.fuBenTimeLabel = new FLabel();
         this.fuBenTimeLabel.textColor = StaticValue.YELLOW;
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.size = 16;
         this.fuBenTimeLabel.defaultTextFormat = _loc1_;
         this.fuBenTimeLabel.name = "fuBenTimeLabel";
         this.fubenContainer = new Sprite();
         GameInstance.uiInstance.letterContainer.addChild(this.fubenContainer);
      }
      
      private function initEvents() : void
      {
         this.timerData = TimerManager.createTimer(1000,0,this.onTimerUpdate);
         this.timerData.timer.stop();
         this.readyEnterTimerData = TimerManager.createTimer(1000,0,this.onReadyTimerUpdate);
         this.readyEnterTimerData.timer.stop();
         UIEventsRegisterManager.addUIRegisterEvent(InstanceConvectionPanel,function():void
         {
            instanceSelectPanel.addEventListener(Event.ADDED_TO_STAGE,onInstanceSelectToStage);
            instanceSelectPanel.addEventListener(InstanceConvectionPanel.UI_FUBENLINPANEL_SUBBTN,onClickFubenLinEnter);
            instanceSelectPanel.addEventListener(InstanceConvectionPanel.UI_INSTANCECONVECTION_FUBENLINGBTNCLICK,onClickFubenLin);
            instanceSelectPanel.addEventListener(InstanceConvectionPanel.UI_CHANGJINGGEMILING_SUBBTN,onClickCangjinggeEnter);
            instanceSelectPanel.addEventListener(InstanceConvectionPanel.UI_INSTANCECONVECTION_BTNCLICK,onClickEnterTeamPanel);
            instanceSelectPanel.addEventListener(InstanceConvectionPanel.SHOW_CHAKANFUBENJINGSUBANG_CLICK,onClcikFuBenJingSu);
         });
         UIEventsRegisterManager.addUIRemovedEvent(InstanceConvectionPanel,function():void
         {
            instanceSelectPanel.removeEventListener(Event.ADDED_TO_STAGE,onInstanceSelectToStage);
            instanceSelectPanel.removeEventListener(InstanceConvectionPanel.UI_FUBENLINPANEL_SUBBTN,onClickFubenLinEnter);
            instanceSelectPanel.removeEventListener(InstanceConvectionPanel.UI_INSTANCECONVECTION_FUBENLINGBTNCLICK,onClickFubenLin);
            instanceSelectPanel.removeEventListener(InstanceConvectionPanel.UI_CHANGJINGGEMILING_SUBBTN,onClickCangjinggeEnter);
            instanceSelectPanel.removeEventListener(InstanceConvectionPanel.UI_INSTANCECONVECTION_BTNCLICK,onClickEnterTeamPanel);
            instanceSelectPanel.removeEventListener(InstanceConvectionPanel.SHOW_CHAKANFUBENJINGSUBANG_CLICK,onClcikFuBenJingSu);
         });
         UIEventsRegisterManager.addUIRegisterEvent(FubenTongguanCanvas,function():void
         {
            instanceSelectPanel.addEventListener(InstanceConvectionPanel.UI_FUBENTONGGUANCANVAS_SUBCLICK,onClickPickGood);
         });
         UIEventsRegisterManager.addUIRemovedEvent(FubenTongguanCanvas,function():void
         {
            instanceSelectPanel.removeEventListener(InstanceConvectionPanel.UI_FUBENTONGGUANCANVAS_SUBCLICK,onClickPickGood);
         });
         UIEventsRegisterManager.addUIRegisterEvent(InstancePortalPanel,function():void
         {
            instancePanel.addEventListener(InstancePortalPanel.UI_INSTANCEPORTAL_ACCEDEBTN,onClickOK);
            instancePanel.addEventListener(InstancePortalPanel.UI_INSTANCEPORTAL_REFUSEBTN,onClickCancel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(InstancePortalPanel,function():void
         {
            instancePanel.removeEventListener(InstancePortalPanel.UI_INSTANCEPORTAL_ACCEDEBTN,onClickOK);
            instancePanel.removeEventListener(InstancePortalPanel.UI_INSTANCEPORTAL_REFUSEBTN,onClickCancel);
         });
      }
      
      private function onClickFubenLin(param1:BaseEvent) : void
      {
         var _loc3_:NpcRes = null;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc2_:SceneCharacter = GameInstance.lockOnChar;
         if(Boolean(_loc2_) && _loc2_.type == SceneCharacterType.NPC)
         {
            _loc3_ = NpcResManager.getNpcRes(_loc2_.id);
            _loc4_ = param1.data as Array;
            _loc5_ = this.getInstanceObj(Number(_loc4_[0]));
            if(_loc5_.isFubenLinEnter == 0)
            {
               NoticeManager.notify(NoticeManager.ALERT,LanResManager.getLanTextWords(this,"该副本不能使用副本令进入"),false);
               return;
            }
            if(_loc5_.isFubenLinEnter == 1)
            {
               _loc6_ = _loc5_.fubenLinCount - 1;
               NoticeManager.notify(NoticeManager.ALERT,LanResManager.getLanTextWords(this,"今天使用副本令最多进入",[_loc6_]),false);
               return;
            }
            if(_loc5_.isFubenLinEnter == 2)
            {
               NoticeManager.notify(NoticeManager.ALERT,LanResManager.getLanTextWords(this,"您必须在免费进入完毕后才能使用副本令进入1"),false);
               return;
            }
            this.readyEnterInstanceID = _loc5_.id;
            this.instanceSelectPanel.showFuBenLingPanel(_loc5_.fubenLinCount,_loc5_.name,_loc5_.fubenLin,_loc4_[1]);
         }
      }
      
      private function onClickOK(param1:BaseEvent) : void
      {
         var _loc2_:Array = param1.data as Array;
         this.sender.send_10705([_loc2_[0],1,_loc2_[1]]);
      }
      
      private function onClickCancel(param1:BaseEvent) : void
      {
         var _loc2_:Array = param1.data as Array;
         this.sender.send_10705([_loc2_[0],2,_loc2_[1]]);
      }
      
      private function onClickEnterTeamPanel(param1:BaseEvent) : void
      {
         var sc:SceneCharacter = null;
         var npcRes:NpcRes = null;
         var arr:Array = null;
         var obj:Object = null;
         var $e:BaseEvent = param1;
         sc = GameInstance.lockOnChar;
         if(Boolean(sc) && sc.type == SceneCharacterType.NPC)
         {
            npcRes = NpcResManager.getNpcRes(sc.id);
            arr = ($e as BaseEvent).data as Array;
            obj = this.getInstanceObj(Number(arr[0]));
            if(ReloginManager.isKuafu3v3Baominging)
            {
               ConfirmManager.confirmBreak3v3Baoming(function():void
               {
                  sender.send_10701([sc.id,obj.mapID,arr[1],arr[2]]);
               },null);
            }
            else
            {
               this.sender.send_10701([sc.id,obj.mapID,arr[1],arr[2]]);
            }
         }
      }
      
      private function onClcikFuBenJingSu(param1:BaseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_FB_RANK_PLANE);
      }
      
      private function onClickFubenLinEnter(param1:BaseEvent) : void
      {
         var _loc4_:NpcRes = null;
         var _loc5_:Object = null;
         var _loc2_:SceneCharacter = GameInstance.lockOnChar;
         var _loc3_:Array = param1.data as Array;
         if(Boolean(_loc2_) && _loc2_.type == SceneCharacterType.NPC)
         {
            _loc4_ = NpcResManager.getNpcRes(_loc2_.id);
            _loc5_ = this.getInstanceObj(this.readyEnterInstanceID);
            this.sender.send_10721([_loc2_.id,_loc5_.mapID,1,_loc3_[1]]);
         }
      }
      
      private function onClickCangjinggeEnter(param1:BaseEvent) : void
      {
         var _loc4_:NpcRes = null;
         var _loc5_:Object = null;
         var _loc2_:Array = param1.data as Array;
         var _loc3_:SceneCharacter = GameInstance.lockOnChar;
         if(Boolean(_loc3_) && _loc3_.type == SceneCharacterType.NPC)
         {
            _loc4_ = NpcResManager.getNpcRes(_loc3_.id);
            _loc5_ = this.getInstanceObj(_loc2_[0] as int);
            this.sender.send_10721([_loc3_.id,_loc5_.mapID,2,_loc2_[1]]);
         }
      }
      
      private function onInstanceSelectToStage(param1:Event) : void
      {
         var _loc2_:SceneCharacter = GameInstance.lockOnChar;
         if(Boolean(_loc2_) && _loc2_.type == SceneCharacterType.NPC)
         {
            this.sender.send_10711(_loc2_.id);
            this.currentFubenList.length = 0;
            this.readyEnterInstanceID = 0;
         }
      }
      
      private function clear() : void
      {
         this.instanceSelectPanel.SetInitializePlay([]);
         this.instancePanel.setInitializeContent([],-1);
         this.teamPlayers.length = 0;
      }
      
      public function showInstanceList(param1:Array) : void
      {
         this.currentFubenList = param1;
         this.instanceSelectPanel.SetInitializePlay(param1);
      }
      
      public function showTeamInstance(param1:int, param2:int) : void
      {
         var _loc14_:int = 0;
         var _loc16_:Object = null;
         var _loc17_:PurePlayer = null;
         if(GameInstance.mainCharData.teamInfo.teamPlayers.length == 0)
         {
            return;
         }
         this.clear();
         if(Fun.isVisible(GameInstance.uiInstance._instanceSelectPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_INSTANCE_SELECT_PANEL);
         }
         if(!Fun.isVisible(GameInstance.uiInstance._teamInstancePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_TEAM_INSTANCE_PANEL);
         }
         var _loc3_:InstanceRes = InstanceResManager.getInstanceRes(param1);
         var _loc4_:PurePlayer = GameInstance.mainCharData.teamInfo.getPlayerByID(GameInstance.mainCharData.teamInfo.teamLeaderID);
         var _loc5_:String = _loc4_.attributeInfo.headImg;
         var _loc6_:String = _loc4_.name;
         var _loc7_:int = _loc4_.attributeInfo.lv;
         var _loc8_:String = _loc4_.banghuiInfo.banghuiName;
         var _loc9_:String = _loc4_.attributeInfo.getPartyName();
         var _loc10_:int = _loc3_.level_lower_limit;
         var _loc11_:int = _loc3_.enter_count_limite;
         var _loc12_:int = _loc3_.rewardgrade;
         this.instancePanel.setInitializeContent([_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc3_.instance_name],param1);
         var _loc13_:Array = GameInstance.mainCharData.teamInfo.teamPlayers;
         var _loc15_:int = int(_loc13_.length);
         _loc14_ = 0;
         while(_loc14_ < _loc15_)
         {
            _loc17_ = _loc13_[_loc14_];
            _loc16_ = new Object();
            _loc16_.id = _loc17_.id;
            _loc16_.name = _loc17_.name;
            _loc16_.grade = _loc17_.attributeInfo.lv;
            _loc16_.school = _loc17_.attributeInfo.getPartyName();
            _loc16_.state = 4;
            this.teamPlayers.push(_loc16_);
            _loc14_++;
         }
         this.instancePanel.setProcessionListFun(this.teamPlayers);
         if(_loc4_.id == GameInstance.mainChar.id)
         {
            this.instancePanel.isDuizhang(false,param2);
         }
         else
         {
            this.instancePanel.isDuizhang(true,1);
         }
         this.instancePanel.refuseBtn.enabled = true;
         this.timerCount = 15;
         this.readyEnterTimerCount = 5;
         this.timerData.timer.stop();
         this.timerData.timer.reset();
         this.timerData.timer.start();
      }
      
      public function failure(param1:String) : void
      {
         this.timerData.timer.stop();
         this.timerData.timer.reset();
         this.readyEnterTimerData.timer.stop();
         this.readyEnterTimerData.timer.reset();
         NoticeManager.notify(NoticeManager.ALERT,param1);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,param1);
         this.instancePanel.accedeBtn.enabled = false;
         this.instancePanel.refuseBtn.enabled = false;
      }
      
      public function updateTeamStatus(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Object = null;
         var _loc4_:int = int(this.teamPlayers.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = this.teamPlayers[_loc3_];
            if(_loc5_.id == param1)
            {
               _loc5_.state = param2;
            }
            _loc3_++;
         }
         this.instancePanel.setProcessionListFun(this.teamPlayers);
      }
      
      private function onTimerUpdate() : void
      {
         --this.timerCount;
         if(this.timerCount <= 0)
         {
            this.timerData.timer.stop();
         }
         this.instancePanel.setCountDownFun(this.timerCount);
      }
      
      private function onReadyTimerUpdate() : void
      {
         --this.readyEnterTimerCount;
         if(this.readyEnterTimerCount <= 0)
         {
            this.readyEnterTimerData.timer.stop();
         }
         GameInstance.mainChar.showAttackFace("",0,LanResManager.getLanTextWords(this,"进入副本倒计时") + "：" + this.readyEnterTimerCount,AttackFace.DEFAULT_FOUNT_SIZE_14,AttackFace.DEFAULT_FOUNT_COLOR_GREEN);
      }
      
      public function singleEnter() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._instanceSelectPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_INSTANCE_SELECT_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._teamInstancePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_TEAM_INSTANCE_PANEL);
         }
      }
      
      public function readyEnter(param1:int) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._instanceSelectPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_INSTANCE_SELECT_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._teamInstancePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_TEAM_INSTANCE_PANEL);
         }
         this.clear();
         this.readyEnterTimerCount = 5;
         this.readyEnterTimerData.timer.stop();
         this.readyEnterTimerData.timer.reset();
         this.readyEnterTimerData.timer.start();
      }
      
      public function getInstanceObj(param1:int) : Object
      {
         var _loc2_:int = 0;
         var _loc4_:Object = null;
         var _loc3_:int = int(this.currentFubenList.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.currentFubenList[_loc2_];
            if(_loc4_.id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function startTimer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int) : void
      {
         var _loc11_:int = 0;
         this.instanceSelectPanel.showIngressFubenPanel();
         if(param2 != 0)
         {
            _loc11_ = param2 / 60;
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"上次通关用时",[_loc11_]),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"上次通关用时",[_loc11_]),false);
         }
         this.fubenTime = getTimer();
         this.yijingFubenTime = param6;
         this.fuBenTimeLabel.x = 50;
         this.fuBenTimeLabel.y = 100;
         this.fubenContainer.addChild(this.fuBenTimeLabel);
         var _loc7_:FLabel = new FLabel();
         this.initLabel(_loc7_);
         _loc7_.text = LanResManager.getLanTextWords(this,"个人最快用时",[Math.floor(param3 / 60),Math.floor(param3 % 60)]);
         _loc7_.x = 50;
         _loc7_.y = 120;
         this.fubenContainer.addChild(_loc7_);
         var _loc8_:FLabel = new FLabel();
         this.initLabel(_loc8_);
         _loc8_.text = LanResManager.getLanTextWords(this,"记录保持者") + "：" + param4;
         _loc8_.x = 50;
         _loc8_.y = 140;
         this.fubenContainer.addChild(_loc8_);
         var _loc9_:FLabel = new FLabel();
         this.initLabel(_loc9_);
         _loc9_.text = LanResManager.getLanTextWords(this,"最快纪录",[Math.floor(param5 / 60),Math.floor(param5 % 60)]);
         _loc9_.x = 50;
         _loc9_.y = 160;
         this.fubenContainer.addChild(_loc9_);
         var _loc10_:FLabel = new FLabel();
         this.initLabel(_loc10_);
         if(param1 == 6)
         {
            _loc10_.text = LanResManager.getLanTextWords(this,"到达第十六层后视为副本通关");
         }
         else if(param1 == 9)
         {
            _loc10_.text = LanResManager.getLanCommonTextWords("少于100只怪物走入中间的消失点视为副本通关");
         }
         else if(param1 == 22)
         {
            _loc10_.text = LanResManager.getLanCommonTextWords("击败所有敌军和魔雕，成功防守神雕蛋。");
         }
         else
         {
            _loc10_.text = LanResManager.getLanTextWords(this,"击杀全部怪物后视为副本通关");
         }
         _loc10_.x = 50;
         _loc10_.y = 180;
         this.fubenContainer.addChild(_loc10_);
         if(param1 == 28)
         {
            this.fubenContainer.visible = false;
         }
         else
         {
            this.fubenContainer.visible = true;
         }
         this.timer.reset();
         this.timer.start();
      }
      
      private function initLabel(param1:FLabel) : void
      {
         param1.textColor = StaticValue.YELLOW;
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.size = 16;
         param1.defaultTextFormat = _loc2_;
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = getTimer() - this.fubenTime + this.yijingFubenTime;
         var _loc3_:Array = TimeManager.getTime1(_loc2_);
         this.fuBenTimeLabel.text = LanResManager.getLanTextWords(this,"副本用时",[_loc3_[0],_loc3_[1],_loc3_[2]]);
      }
      
      public function missionOK(param1:Array, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:GoodsRes = null;
         var _loc12_:String = null;
         this.closeTime();
         if(param2)
         {
            _loc7_ = TimeManager.getTime1(param2);
            _loc8_ = int(_loc7_[1]);
            _loc9_ = int(_loc7_[2]);
            _loc10_ = _loc8_ + LanResManager.getLanCommonTextWords("分") + _loc9_ + LanResManager.getLanCommonTextWords("秒");
         }
         var _loc5_:int = int(param1.length);
         var _loc6_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc11_ = GoodsResManager.getGoodsRes(param1[_loc4_][0]);
            _loc12_ = "【" + _loc11_.name + "】 X " + param1[_loc4_][1];
            _loc6_.push(_loc12_);
            _loc4_++;
         }
         if(param2)
         {
            this.instanceSelectPanel.showFubenTongguanPanel(_loc10_,_loc6_,true,param3);
         }
         else
         {
            this.instanceSelectPanel.showFubenTongguanPanel(_loc10_,_loc6_,false,param3);
         }
      }
      
      private function closeTime() : void
      {
         Fun.clearChildren(this.fubenContainer);
         this.timer.stop();
      }
      
      public function onClickPickGood(param1:BaseEvent) : void
      {
         this.sender.send_10723();
      }
      
      public function pickOK() : void
      {
         this.instanceSelectPanel.closeFubenTongguan();
      }
   }
}

