package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.shell.view.components.party.BangPaiRongYuPanel;
   import com.tgame.shell.view.components.party.PartyBossPanel;
   import com.tgame.shell.view.components.party.PartyBoss_TiJiaoJingPo;
   import com.tgame.shell.view.components.party.Party_task_GerenYunbiaoPanel;
   import com.tgame.shell.view.components.party.Party_task_ShengjiBiaochePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   
   public class Party_taskPanel extends FPanel
   {
      
      public static const UI_PARTYTASK_TOBIAOQJU_CLICK:String = "UPI_PARTYTASK_TOBIAOQJU_CLICK";
      
      public static const UI_PARTYTASK_GERENJIEQURENWU_CLICK:String = "UI_PARTYTASK_GERENJIEQURENWU_CLICK";
      
      public static const UI_PARTYTASK_BANGHUIJIEQURENWU_CLICK:String = "UI_PARTYTASK_BANGHUIJIEQURENWU_CLICK";
      
      public static const UI_PARTYTASK_SHENGJIBIAOCHE_CLICK:String = "UI_PARTYTASK_SHENGJIBIAOCHE_CLICK";
      
      public static const UI_PARTYTASK_BIAOCHELV_CLICK:String = "UI_PARTYTASK_BIAOCHELV_CLICK";
      
      public static const UI_PARTYTASK_BIAOCHENAME_CLICK:String = "UI_PARTYTASK_BIAOCHENAME_CLICK";
      
      public static const UI_PARTYTASK_SHOW_GERENYUNBIAO:String = "UI_PARTYTASK_SHOW_GERENYUNBIAO";
      
      public static const UI_PARTYTASK_SHOW_BANGHUIYUBIAO:String = "UI_PARTYTASK_SHOW_BANGHUIYUBIAO";
      
      public static const UI_PARTYTASK_SHOW_BIAOCHENAME_SHENGJI:String = "UI_PARTYTASK_SHOW_BIAOCHENAME_SHENGJI";
      
      public static const UI_PARTYTASK_SHOW_PARTY_BOSS:String = "UI_PARTYTASK_SHOW_PARTY_BOSS";
      
      public static const UI_PARTYTASK_PARTYBOSS_JINGHUN_CLICK:String = "UI_PARTYTASK_PARTYBOSS_JINGHUN_CLICK";
      
      public static const UI_PARTYTASK_PARTYBOSS_FUBEN_CLICK:String = "UI_PARTYTASK_PARTYBOSS_FUBEN_CLICK";
      
      public static const UI_PARTYTASK_PARTYBOSS_CHALLENGE:String = "UI_PARTYTASK_PARTYBOSS_CHALLENGE";
      
      public static const UI_PARTYBOSS_JIDIAN_CLICK:String = "UI_PARTYBOSS_JIDIAN_CLICK";
      
      public static const UI_PARTYBOSS_CHENGGONGLV_CLICK:String = "UI_PARTYBOSS_CHENGGONGLV_CLICK";
      
      public static const UI_PARTYBOSS_COMMITJINGPO_CLICK:String = "UI_PARTYBOSS_COMMITJINGPO_CLICK";
      
      public static const UI_PARTYBOSS_YAOQING_CLICK:String = "UI_PARTYBOSS_YAOQING_CLICK";
      
      public static const UI_PARTYBOSS_JINGPO_CLICK:String = "UI_PARTYBOSS_JINGPO_CLICK";
      
      public static const UI_PARTYBOSS_LIST_CLICK:String = "UI_PARTYBOSS_LIST_CLICK";
      
      public static const UI_PARTYTASK_SHOW_PARTY_RONGYU:String = "UI_PARTYTASK_SHOW_PARTY_RONGYU";
      
      public static const UI_PARTYTASK_RONGYU_CHENGCHI_CLICK:String = "UI_PARTYTASK_RONGYU_CHENGCHI_CLICK";
      
      public static const UI_PARTYTASK_RONGYU_SHIZHI_CLICK:String = "UI_PARTYTASK_RONGYU_SHIZHI_CLICK";
      
      public static const UI_PARTYTASK_RONGYU_LONGMAI_CLICK:String = "UI_PARTYTASK_RONGYU_LONGMAI_CLICK";
      
      public static const UI_PARTYTASK_RONGYU_JINRU_CLICK:String = "UI_PARTYTASK_RONGYU_JINRU_CLICK";
      
      private var geren:Party_task_GerenYunbiaoPanel;
      
      private var banghui:Party_task_GerenYunbiaoPanel;
      
      private var shengji:Party_task_ShengjiBiaochePanel;
      
      private var commitJingPoPanel:PartyBoss_TiJiaoJingPo;
      
      private var partyBossInvitePanel:PartyBoss_InvitePanel;
      
      private var boss:PartyBossPanel;
      
      private var rongyu:BangPaiRongYuPanel;
      
      public var tabBar:FTabBar;
      
      private var shizhixinxi:HuangTuBaYeChaKanXinXiPanel;
      
      public function Party_taskPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 660 + 20;
         height = 280 + 100 - 2;
         this.titleText = LanResManager.getLanCommonTextWords("帮会任务");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.geren = new Party_task_GerenYunbiaoPanel();
         this.geren.$parent = this;
         this.geren.type = -1;
         addChild(this.geren);
         this.geren.x = 10;
         this.geren.y = 22;
         this.banghui = new Party_task_GerenYunbiaoPanel();
         this.banghui.$parent = this;
         this.banghui.type = -2;
         addChild(this.banghui);
         this.banghui.x = 10;
         this.banghui.y = 22;
         this.shengji = new Party_task_ShengjiBiaochePanel();
         this.shengji.$parent = this;
         addChild(this.shengji);
         this.shengji.x = 10;
         this.shengji.y = 22;
         this.boss = new PartyBossPanel();
         this.boss.$parent = this;
         addChild(this.boss);
         this.boss.x = 10;
         this.boss.y = 22;
         this.rongyu = new BangPaiRongYuPanel();
         this.rongyu.$parent = this;
         addChild(this.rongyu);
         this.rongyu.visible = false;
         this.rongyu.x = 10;
         this.rongyu.y = 22;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.geren.bgImg);
         _loc1_.push(this.banghui.bgImg);
         _loc1_.push(this.shengji.bgImg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("个人日常运镖"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("帮会日常运镖"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("升级镖车"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("血色城堡"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("帮派荣誉"),this.onTabClick);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         addChildAt(this.tabBar,0);
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch(param1.target.label)
         {
            case LanResManager.getLanCommonTextWords("个人日常运镖"):
               dispatchEvent(new BaseEvent(UI_PARTYTASK_SHOW_GERENYUNBIAO));
               break;
            case LanResManager.getLanCommonTextWords("帮会日常运镖"):
               dispatchEvent(new BaseEvent(UI_PARTYTASK_SHOW_BANGHUIYUBIAO));
               break;
            case LanResManager.getLanCommonTextWords("升级镖车"):
               dispatchEvent(new BaseEvent(UI_PARTYTASK_SHOW_BIAOCHENAME_SHENGJI));
               break;
            case LanResManager.getLanCommonTextWords("血色城堡"):
               dispatchEvent(new BaseEvent(UI_PARTYTASK_SHOW_PARTY_BOSS));
               break;
            case LanResManager.getLanCommonTextWords("帮派荣誉"):
               dispatchEvent(new BaseEvent(UI_PARTYTASK_SHOW_PARTY_RONGYU));
               this.geren.visible = false;
               this.geren.removeSwf();
               this.banghui.visible = false;
               this.banghui.removeSwf();
               this.shengji.visible = false;
               this.boss.visible = false;
               this.rongyu.visible = true;
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("帮派荣誉"));
         }
      }
      
      public function showPanel(param1:int, param2:Boolean = false) : void
      {
         switch(param1)
         {
            case 1:
               this.geren.visible = true;
               this.shengji.visible = false;
               this.shengji.removeSwf();
               this.banghui.visible = false;
               this.banghui.removeSwf();
               this.boss.visible = false;
               this.rongyu.visible = false;
               if(param2)
               {
                  this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("个人日常运镖"));
               }
               break;
            case 2:
               this.geren.visible = false;
               this.geren.removeSwf();
               this.shengji.visible = false;
               this.shengji.removeSwf();
               this.banghui.visible = true;
               this.boss.visible = false;
               this.rongyu.visible = false;
               if(param2)
               {
                  this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("帮会日常运镖"));
               }
               break;
            case 3:
               this.geren.visible = false;
               this.geren.removeSwf();
               this.banghui.visible = false;
               this.banghui.removeSwf();
               this.shengji.visible = true;
               this.boss.visible = false;
               this.rongyu.visible = false;
               if(param2)
               {
                  this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("升级镖车"));
               }
               break;
            case 4:
               this.geren.visible = false;
               this.geren.removeSwf();
               this.banghui.visible = false;
               this.banghui.removeSwf();
               this.shengji.visible = false;
               this.boss.visible = true;
               this.rongyu.visible = false;
               if(param2)
               {
                  this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("帮派BOSS"));
               }
               break;
            case 5:
               this.geren.visible = false;
               this.geren.removeSwf();
               this.banghui.visible = false;
               this.banghui.removeSwf();
               this.shengji.visible = false;
               this.boss.visible = false;
               this.rongyu.visible = true;
               if(param2)
               {
                  this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("帮派荣誉"));
               }
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.geren.removeSwf();
            this.banghui.removeSwf();
            this.shengji.removeSwf();
            this.parent.removeChild(this);
         }
      }
      
      public function setIsBangZhu(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("帮会日常运镖")) == null)
            {
               this.tabBar.addButton(LanResManager.getLanCommonTextWords("帮会日常运镖"),this.onTabClick);
            }
            if(this.tabBar.getButtonByLabel(LanResManager.getLanCommonTextWords("升级镖车")) == null)
            {
               this.tabBar.addButton(LanResManager.getLanCommonTextWords("升级镖车"),this.onTabClick);
            }
         }
         else
         {
            this.tabBar.subButtonByLabel(LanResManager.getLanCommonTextWords("帮会日常运镖"));
            this.tabBar.subButtonByLabel(LanResManager.getLanCommonTextWords("升级镖车"));
         }
      }
      
      public function setSingleData(param1:Array) : void
      {
         this.geren.initData(param1);
      }
      
      public function setGroupData(param1:Array) : void
      {
         this.banghui.initData(param1);
      }
      
      public function setGradeUPData(param1:Array, param2:String) : void
      {
         this.shengji.setGradeUPData(param1,param2);
      }
      
      public function showJingPoPanel() : PartyBoss_TiJiaoJingPo
      {
         if(!this.commitJingPoPanel)
         {
            this.commitJingPoPanel = new PartyBoss_TiJiaoJingPo();
            this.commitJingPoPanel.$parent = this;
         }
         this.commitJingPoPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.commitJingPoPanel);
         return this.commitJingPoPanel;
      }
      
      public function initBossList(param1:XML, param2:Array, param3:Number, param4:int, param5:int, param6:Boolean = false, param7:int = 0) : void
      {
         this.boss.initBossList(param1,param4,param5);
         this.boss.initGoodsList(param2,param3);
         this.boss.setButtonSta(param6,param7);
      }
      
      public function setChengGongLv(param1:int) : void
      {
         this.boss.setChengGongLv(param1);
      }
      
      public function showPartyBossInvitePanel() : void
      {
         if(!this.partyBossInvitePanel)
         {
            this.partyBossInvitePanel = new PartyBoss_InvitePanel();
            this.partyBossInvitePanel.$parent = this;
         }
         GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.partyBossInvitePanel);
         GameInstance.uiInstance.partyBossInvitePanel.visible = true;
         GameInstance.uiInstance.partyBossInvitePanel.x = (GameConfig.sceneWidth - GameInstance.uiInstance.partyBossInvitePanel.width) / 2;
         GameInstance.uiInstance.partyBossInvitePanel.y = (GameConfig.sceneHeight - GameInstance.uiInstance.partyBossInvitePanel.height) / 2;
      }
      
      public function initPartyBossInvite(param1:Array) : void
      {
         this.partyBossInvitePanel.initPanel(param1[3],param1[2],param1[4]);
      }
      
      public function setAvatar(param1:BitmapData) : void
      {
         this.partyBossInvitePanel.avatar = param1;
      }
      
      public function setAvatar1(param1:BitmapData) : void
      {
         this.boss.avatar = param1;
      }
      
      public function showRongYuPanel(param1:Array, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.rongyu.setInitialize(param1,param2,param3,param4,param5);
      }
      
      public function showChengChiXinXi(param1:Object) : void
      {
         this.rongyu.setChengchi(param1);
      }
      
      public function showChengChiShiZhi(param1:int, param2:String, param3:Array, param4:int, param5:int) : void
      {
         GameInstance.uiInstance.huangTuBaYeChaKanXinXiPanel.setRongYu(param1,param2,param3,param4,param5);
      }
   }
}

