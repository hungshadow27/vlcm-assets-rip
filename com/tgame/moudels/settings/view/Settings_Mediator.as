package com.tgame.moudels.settings.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SettingKey;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.settings.Setting_ApplicationFacade;
   import com.tgame.moudels.settings.model.Settings_MsgSenderProxy;
   import com.tgame.shell.view.components.SystemPanel;
   import flash.utils.Dictionary;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Settings_Mediator extends Mediator
   {
      
      public static const NAME:String = "Settings_Mediator";
      
      private static var _configDict:Dictionary = new Dictionary();
      
      private var _sender:Settings_MsgSenderProxy;
      
      private var isShowPlayerName:Boolean = true;
      
      private var isShowPlayer:Boolean = true;
      
      public function Settings_Mediator()
      {
         super(NAME);
      }
      
      public function get sender() : Settings_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Settings_MsgSenderProxy.NAME) as Settings_MsgSenderProxy;
         }
         return this._sender;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Setting_ApplicationFacade.SETTING_DATA];
      }
      
      protected function get settingsPanel() : SystemPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.settingsPanel);
         }
         return viewComponent as SystemPanel;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Setting_ApplicationFacade.SETTING_DATA:
               _loc3_ = _loc2_ as Array;
               this.setSettingsData(_loc3_[0],_loc3_[1],true);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(SystemPanel,function():void
         {
            settingsPanel.addEventListener(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,addPanelEventListener);
            settingsPanel.addEventListener(SystemPanel.UI_SYSTEM_BUGSUBMIS_SUB_SHOW,addPanelEventListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(SystemPanel,function():void
         {
            settingsPanel.removeEventListener(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,addPanelEventListener);
            settingsPanel.removeEventListener(SystemPanel.UI_SYSTEM_BUGSUBMIS_SUB_SHOW,addPanelEventListener);
         });
      }
      
      private function addPanelEventListener(param1:*) : void
      {
         var _loc2_:Array = null;
         switch(param1.type)
         {
            case SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW:
               _loc2_ = param1.data as Array;
               this.setSettingsData(_loc2_[0],_loc2_[1],false);
               break;
            case SystemPanel.UI_SYSTEM_BUGSUBMIS_SUB_SHOW:
               _loc2_ = param1.data as Array;
               this.sender.send_28001(_loc2_);
         }
      }
      
      private function setSettingsData(param1:int, param2:Boolean, param3:Boolean = false) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:AttributeInfo = null;
         _configDict[param1] = param2;
         if(param3)
         {
            this.SystemSetupSetInitialize(_configDict);
         }
         if(param1 == SettingKey.K0 && param2 && !this.isShowPlayerName)
         {
            GameInstance.uiInstance.mainUI.setPlayerShowBtnSkin(true);
         }
         if(param1 == SettingKey.K1 && param2 && !this.isShowPlayer)
         {
            GameInstance.uiInstance.mainUI.setPlayerShowBtnSkin(true);
         }
         if(param1 == SettingKey.K6 && TSoundManager.getShortSoundMute() && param2)
         {
            GameInstance.uiInstance.mainUI.setSoundBtnSkin(true);
         }
         if(param1 == SettingKey.K7 && TSoundManager.getBgSoundMute() && param2)
         {
            GameInstance.uiInstance.mainUI.setSoundBtnSkin(true);
         }
         if(param1 >= SettingKey.K8 && param1 <= SettingKey.K13)
         {
            this.sender.send_27001([param1,param2]);
         }
         switch(param1)
         {
            case SettingKey.K0:
               _loc4_ = !param2;
               GameInstance.scene.setCharAvatarVisible(_loc4_);
               if(!_loc4_)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已隐藏其他玩家形象"),false);
                  this.isShowPlayer = false;
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已显示其他玩家形象"),false);
                  GameInstance.uiInstance.mainUI.setPlayerShowBtnSkin(false);
                  this.isShowPlayer = true;
               }
               break;
            case SettingKey.K1:
               _loc5_ = !param2;
               GameInstance.scene.setCharHeadVisible(_loc5_);
               if(!_loc5_)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已隐藏其他玩家名字"),false);
                  this.isShowPlayerName = false;
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已显示其他玩家名字"),false);
                  GameInstance.uiInstance.mainUI.setPlayerShowBtnSkin(false);
                  this.isShowPlayerName = true;
               }
               break;
            case SettingKey.K2:
               FightManager.enableScreenShake = !param2;
               if(!FightManager.enableScreenShake)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已禁用震屏特效"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已启用震屏特效"),false);
               }
               break;
            case SettingKey.K3:
               GameState.enableHeartEffect = !param2;
               if(!GameState.enableHeartEffect)
               {
                  TSoundManager.stopHeartSound();
               }
               if(!GameState.enableHeartEffect)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已禁用心跳特效"),false);
               }
               else
               {
                  _loc8_ = GameInstance.mainCharData.attributeInfo;
                  if(_loc8_.hpNow <= _loc8_.hpMax * TSoundManager.MAX_HEART_PER)
                  {
                     TSoundManager.playHeartSound(_loc8_.hpNow / _loc8_.hpMax);
                  }
                  else
                  {
                     TSoundManager.stopHeartSound();
                  }
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已启用心跳特效"),false);
               }
               break;
            case SettingKey.K4:
               _loc6_ = !param2;
               GameInstance.uiInstance.mainUI.setTrackShowHide(_loc6_);
               if(!_loc6_)
               {
                  GameState.taskTrackerPlaneTabStatus = 0;
               }
               if(GameState.taskPlaneTabStatus == 1 || GameState.taskPlaneTabStatus == 2)
               {
                  GameInstance.uiInstance.taskPanel.setIsShowTaskTrackPanel(_loc6_);
               }
               if(!_loc6_)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"任务追踪面板已隐藏"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"任务追踪面板已显示"),false);
               }
               break;
            case SettingKey.K5:
               _loc6_ = !param2;
               PipeManager.sendMsg(PipeConstants.SET_TEAM_PARMS,[3,_loc6_]);
               if(!_loc6_)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"队员信息窗口已设置为隐藏"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"队员信息窗口已设置为显示"),false);
               }
               break;
            case SettingKey.K6:
               _loc7_ = param2;
               TSoundManager.setBgSoundMute(_loc7_);
               if(_loc7_)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已关闭背景音乐"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已开启背景音乐"),false);
                  GameInstance.uiInstance.mainUI.setSoundBtnSkin(false);
               }
               break;
            case SettingKey.K7:
               _loc7_ = param2;
               TSoundManager.setShortSoundMute(_loc7_);
               if(_loc7_)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已关闭特效音效"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已开启特效音效"),false);
                  GameInstance.uiInstance.mainUI.setSoundBtnSkin(false);
               }
               break;
            case SettingKey.K8:
               if(param2)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已禁止其他人向我发起私聊"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已允许其他人向我发起私聊"),false);
               }
               break;
            case SettingKey.K9:
               if(param2)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已禁止其他人加我为好友"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已允许其他人加我为好友"),false);
               }
               break;
            case SettingKey.K10:
               if(param2)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已禁止其他人向我发起交易"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已允许其他人向我发起交易"),false);
               }
               break;
            case SettingKey.K11:
               if(param2)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已禁止其他人邀请我加入帮派"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已允许其他人邀请我加入帮派"),false);
               }
               break;
            case SettingKey.K12:
               if(param2)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已禁止其他人邀请我加入队伍"),false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已允许其他人邀请我加入队伍"),false);
               }
               break;
            case SettingKey.K13:
               if(param2)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"Huỷ kích hoạt kĩ năng ẩn thân",false);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"Kích hoạt kĩ năng ẩn thân",false);
               }
               break;
            case SettingKey.K21:
         }
      }
      
      private function SystemSetupSetInitialize(param1:Dictionary) : void
      {
         this.settingsPanel.SystemSetupSetInitialize(param1);
      }
      
      public function unLockBugPanel() : void
      {
         this.settingsPanel.BugSubmissRelieve();
      }
   }
}

