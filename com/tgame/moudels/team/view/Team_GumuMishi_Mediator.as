package com.tgame.moudels.team.view
{
   import com.fireice.text.FLabel;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.team.Team_ApplicationFacade;
   import com.tgame.moudels.team.model.Team_MsgSenderProxy;
   import com.tgame.shell.view.components.GumuMishiChuansongPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.manager.TimerManager;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Team_GumuMishi_Mediator extends Mediator
   {
      
      public static const NAME:String = "Team_GumuMishi_Mediator";
      
      private var teamPlayers:Array = [];
      
      private var currentList:Array = [];
      
      private var readyEnterTimerData:TimerData;
      
      private var readyEnterTimerCount:int;
      
      private var readyEnterInstanceID:int;
      
      private var fuBenTimeLabel:FLabel;
      
      private var _msgSenderProxy:Team_MsgSenderProxy;
      
      public function Team_GumuMishi_Mediator()
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
      
      private function get gumuMishiChuansongPanel() : GumuMishiChuansongPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.gumuMishiChuansongPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as GumuMishiChuansongPanel;
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
               if(_loc3_ == NpcFunctionType.GUMU_MISHI)
               {
                  this.clear();
                  if(!Fun.isVisible(GameInstance.uiInstance._gumuMishiChuansongPanel))
                  {
                     GameInstance.uiInstance.uiContainer.addChild(viewComponent as GumuMishiChuansongPanel);
                     this.gumuMishiChuansongPanel.visible = true;
                     this.onAddtoStage();
                  }
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         this.readyEnterTimerData = TimerManager.createTimer(1000,0,this.onReadyTimerUpdate);
         this.readyEnterTimerData.timer.stop();
         UIEventsRegisterManager.addUIRegisterEvent(GumuMishiChuansongPanel,function():void
         {
            gumuMishiChuansongPanel.addEventListener(GumuMishiChuansongPanel.UI_GUMUMISHI_BTNCLICK,onClickEnter);
         });
         UIEventsRegisterManager.addUIRemovedEvent(GumuMishiChuansongPanel,function():void
         {
            gumuMishiChuansongPanel.removeEventListener(GumuMishiChuansongPanel.UI_GUMUMISHI_BTNCLICK,onClickEnter);
         });
      }
      
      private function onClickEnter(param1:BaseEvent) : void
      {
         var _loc3_:NpcRes = null;
         var _loc4_:Object = null;
         var _loc2_:SceneCharacter = GameInstance.lockOnChar;
         if(Boolean(_loc2_) && _loc2_.type == SceneCharacterType.NPC)
         {
            _loc3_ = NpcResManager.getNpcRes(_loc2_.id);
            _loc4_ = this.getInstanceObj(Number(param1.data));
            this.sender.send_10731([_loc2_.id,1,_loc4_.id]);
            this.gumuMishiChuansongPanel.visible = false;
            if(this.gumuMishiChuansongPanel.parent)
            {
               this.gumuMishiChuansongPanel.parent.removeChild(this.gumuMishiChuansongPanel);
            }
         }
      }
      
      private function onAddtoStage() : void
      {
         var _loc1_:SceneCharacter = GameInstance.lockOnChar;
         if(Boolean(_loc1_) && _loc1_.type == SceneCharacterType.NPC)
         {
            this.sender.send_10729([_loc1_.id,1]);
            this.currentList.length = 0;
            this.readyEnterInstanceID = 0;
         }
      }
      
      private function clear() : void
      {
         this.gumuMishiChuansongPanel.setInitializePlay([]);
         this.teamPlayers.length = 0;
      }
      
      public function showInstanceList(param1:Array) : void
      {
         this.currentList = param1;
         this.gumuMishiChuansongPanel.setInitializePlay(param1);
      }
      
      public function failure(param1:String) : void
      {
         this.readyEnterTimerData.timer.stop();
         this.readyEnterTimerData.timer.reset();
         NoticeManager.notify(NoticeManager.ALERT,param1);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,param1);
      }
      
      private function onReadyTimerUpdate() : void
      {
         --this.readyEnterTimerCount;
         if(this.readyEnterTimerCount <= 0)
         {
            this.readyEnterTimerData.timer.stop();
         }
         GameInstance.mainChar.showAttackFace("",0,LanResManager.getLanTextWords(this,"进入古墓密室倒计时") + "：" + this.readyEnterTimerCount,AttackFace.DEFAULT_FOUNT_SIZE_14,AttackFace.DEFAULT_FOUNT_COLOR_GREEN);
      }
      
      public function readyEnter(param1:int) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._gumuMishiChuansongPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_INSTANCE_SELECT_PANEL);
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
         var _loc3_:int = int(this.currentList.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.currentList[_loc2_];
            if(_loc4_.id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
   }
}

