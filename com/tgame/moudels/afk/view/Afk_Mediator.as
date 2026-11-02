package com.tgame.moudels.afk.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.character.info.AfkInfo2;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TopTipManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.afk.Afk_ApplicationFacade;
   import com.tgame.moudels.afk.model.Afk_MsgSenderProxy;
   import com.tgame.shell.view.components.AutoFightPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.graphics.tagger.AttackFace;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Afk_Mediator extends Mediator
   {
      
      public static const NAME:String = "Afk_Mediator";
      
      private var afkConfig:Array = [];
      
      private var _loadBuffer:LoadBuffer;
      
      private var _isFirst:Boolean;
      
      private var _senderProxy:Afk_MsgSenderProxy;
      
      public function Afk_Mediator()
      {
         super(NAME);
      }
      
      protected function get afkSettingsPanel() : AutoFightPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.autoFightPanelPanel);
         }
         return viewComponent as AutoFightPanel;
      }
      
      private function get sender() : Afk_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Afk_MsgSenderProxy.NAME) as Afk_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Afk_ApplicationFacade.AFK_STOP,Afk_ApplicationFacade.UPDATE_AFK_CONFIG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Afk_ApplicationFacade.AFK_STOP:
               if(ReloginManager.isInKuafu_To_biWuDaHui == 2)
               {
                  NoticeManager.notify(NoticeManager.FOOT,"此功能已屏蔽，观战玩家不能挂机。");
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"此功能已屏蔽，观战玩家不能挂机。");
                  return;
               }
               this.sender.send_50583(_loc2_);
               break;
            case Afk_ApplicationFacade.UPDATE_AFK_CONFIG:
               if(!Fun.isVisible(GameInstance.uiInstance._autoFightPanelPanel))
               {
                  return;
               }
               _loc3_ = _loc2_ as Array;
               if(_loc3_[0] == 1)
               {
                  this.afkSettingsPanel.skills_char = GameInstance.mainCharData.afkInfo2.setCharSkillArray();
               }
               else if(_loc3_[0] == 2)
               {
                  this.afkSettingsPanel.skills_ride = GameInstance.mainCharData.afkInfo2.setMountSkillArray();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(AutoFightPanel,function():void
         {
            afkSettingsPanel.addEventListener(AutoFightPanel.UI_AUTOFIGHT_START,addPanelEventListener);
            afkSettingsPanel.addEventListener(AutoFightPanel.UI_AUTOFIGHT_STOP,addPanelEventListener);
            afkSettingsPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
         });
         UIEventsRegisterManager.addUIRemovedEvent(AutoFightPanel,function():void
         {
            afkSettingsPanel.removeEventListener(AutoFightPanel.UI_AUTOFIGHT_START,addPanelEventListener);
            afkSettingsPanel.removeEventListener(AutoFightPanel.UI_AUTOFIGHT_STOP,addPanelEventListener);
            afkSettingsPanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
         });
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.initAFKConfig();
      }
      
      private function addPanelEventListener(param1:BaseEvent) : void
      {
         switch(param1.type)
         {
            case AutoFightPanel.UI_AUTOFIGHT_START:
               this.saveSettings(param1);
               break;
            case AutoFightPanel.UI_AUTOFIGHT_STOP:
               this.sender.send_50583(0);
         }
      }
      
      private function saveSettings(param1:BaseEvent) : void
      {
         var _loc2_:AfkInfo2 = param1.data as AfkInfo2;
         GameInstance.mainCharData.afkInfo2.update(_loc2_);
         this.sender.send_50581();
      }
      
      public function saveSettingsOK(param1:int) : void
      {
         this.afkSettingsPanel.AFKVO = GameInstance.mainCharData.afkInfo2;
         GameInstance.uiInstance.mainUI.setAutoValue(GameInstance.mainCharData.afkInfo2.hpCount,GameInstance.mainCharData.afkInfo2.mpCount,GameInstance.mainCharData.afkInfo2.spCount);
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("保存自动战斗配置成功"));
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("保存自动战斗配置成功"));
         if(param1 == 0)
         {
            this.sender.send_50583(1);
         }
      }
      
      public function initAFKConfig() : void
      {
         if(GameInstance.uiInstance.autoFightPanelPanel != null && Fun.isVisible(GameInstance.uiInstance._autoFightPanelPanel))
         {
            this.afkSettingsPanel.AFKVO = GameInstance.mainCharData.afkInfo2;
         }
      }
      
      public function start() : void
      {
         GameInstance.mainCharData.afkInfo2.isStart = true;
         TopTipManager.getInstance().addTip("guaji",0.5,0.3,AttackFace.OTHERS_AUTO_AFK,100,LanResManager.getLanCommonTextWords("挂机中"));
         if(GameInstance.uiInstance._autoFightPanelPanel != null)
         {
            if(Fun.isVisible(GameInstance.uiInstance._autoFightPanelPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AFK_PANEL);
            }
         }
         GameInstance.mainChar.stopMove();
         TopTipManager.getInstance().removeTip(MainCharSeachPathManager.AUTO_FIND_PATH_TEXT);
      }
      
      public function stop() : void
      {
         GameInstance.mainCharData.afkInfo2.isStart = false;
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("挂机已停止"));
         TopTipManager.getInstance().removeTip("guaji");
      }
      
      public function updateTime(param1:int, param2:int) : void
      {
         if(param1 == 0)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"挂机剩余时间",[param2]),false);
         }
      }
   }
}

