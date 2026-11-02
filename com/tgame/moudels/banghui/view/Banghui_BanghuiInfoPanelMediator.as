package com.tgame.moudels.banghui.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.BangzhongZhiwu;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.banghui.Banghui_ApplicationFacade;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.shell.view.components.BangPaiTiShiCanvas;
   import com.tgame.shell.view.components.PartyPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_BanghuiInfoPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_BanghuiInfoPanelMediator";
      
      private var _banghuiID:int = 0;
      
      private var _bangzhanGG:String = "";
      
      private var _gongchengGG:String = "";
      
      private var showTiShi:Boolean = true;
      
      private var tishiCanvas:BangPaiTiShiCanvas;
      
      private var _senderProxy:Banghui_MsgSenderProxy;
      
      public function Banghui_BanghuiInfoPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Banghui_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Banghui_MsgSenderProxy.NAME) as Banghui_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Banghui_ApplicationFacade.BANGQI_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Banghui_ApplicationFacade.BANGQI_CHANGED:
               this.f5();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(PartyPanel,function():void
         {
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYPANEL_MODFIY_AFFICHE,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYPANEL_PARTYFIGHT_AFFICHE,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYPANEL_GONGCHENG_AFFICHE,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYPANEL_PARTY_LIST_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYPANEL_PARTY_FLAG_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYPANEL_PARTY_KUNGFU_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYPANEL_PARTY_TASK_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYFLAGPANEL_PARTY_CONTRIBUTE_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYPANEL_PARTY_XIANGYANG_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYPANEL_PARTY_INFO_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYPANEL_PARTY_MEMBER_INFO_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYFLAGPANEL_PARTY_RONGYU_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.addEventListener(PartyPanel.UI_PARTYFLAGPANEL_RONGYU_CHENGCHI_CLICK,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PartyPanel,function():void
         {
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYPANEL_MODFIY_AFFICHE,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYPANEL_PARTYFIGHT_AFFICHE,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYPANEL_GONGCHENG_AFFICHE,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYPANEL_PARTY_LIST_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYPANEL_PARTY_FLAG_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYPANEL_PARTY_KUNGFU_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYPANEL_PARTY_TASK_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYFLAGPANEL_PARTY_CONTRIBUTE_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYPANEL_PARTY_XIANGYANG_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYPANEL_PARTY_INFO_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYPANEL_PARTY_MEMBER_INFO_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYFLAGPANEL_PARTY_RONGYU_SHOW,uiHandle);
            GameInstance.uiInstance.banghuiInfoPanel.removeEventListener(PartyPanel.UI_PARTYFLAGPANEL_RONGYU_CHENGCHI_CLICK,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc5_:Object = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:BanghuiInfo = _loc2_.banghuiInfo;
         var _loc4_:String = param1.type;
         if(param1 is BaseEvent)
         {
            _loc5_ = (param1 as BaseEvent).data;
         }
         switch(_loc4_)
         {
            case Event.ADDED_TO_STAGE:
               if(GameInstance.lookBanghuiID > 0)
               {
                  this.senderProxy.send_51033(GameInstance.lookBanghuiID);
               }
               break;
            case PartyPanel.UI_PARTYPANEL_MODFIY_AFFICHE:
               if(GameInstance.mainCharData.banghuiInfo.isTongbang(this._banghuiID))
               {
                  this.senderProxy.send_51063(_loc5_ as String);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您不能修改其他公会的公告"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您不能修改其他公会的公告"));
               }
               break;
            case PartyPanel.UI_PARTYPANEL_PARTYFIGHT_AFFICHE:
               if(this._bangzhanGG != "")
               {
                  NoticeManager.notify(NoticeManager.ALERT,LanResManager.getLanTextWords(this,"帮战公告",[this._bangzhanGG]));
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"本帮尚未开启帮战"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"本帮尚未开启帮战"));
               }
               break;
            case PartyPanel.UI_PARTYPANEL_GONGCHENG_AFFICHE:
               if(this._gongchengGG != "")
               {
                  NoticeManager.notify(NoticeManager.ALERT,LanResManager.getLanTextWords(this,"攻城公告",[]));
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"本帮尚未开启攻城"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"本帮尚未开启攻城"));
               }
               break;
            case PartyPanel.UI_PARTYPANEL_PARTY_LIST_SHOW:
               PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_LIST_PANEL);
               break;
            case PartyPanel.UI_PARTYPANEL_PARTY_FLAG_SHOW:
               if(GameInstance.mainCharData.banghuiInfo.isTongbang(this._banghuiID))
               {
                  if(GameState.tiaoguoBangzhu)
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_BANGQI_INFO_PANEL);
                  }
                  else
                  {
                     GameInstance.uiInstance.bangqiInfoPanel.setIsAtuoShowHelpPanel(GameState.tiaoguoBangzhu);
                     GameInstance.uiInstance.bangqiInfoPanel.showHelpPanel();
                  }
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您不能查看其他帮会的旗帜信息"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您不能查看其他帮会的旗帜信息"));
               }
               break;
            case PartyPanel.UI_PARTYPANEL_PARTY_KUNGFU_SHOW:
               if(GameInstance.mainCharData.banghuiInfo.isTongbang(this._banghuiID))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_PARTY_SKILL);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您不能查看其他帮会的帮会武学"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您不能查看其他帮会的帮会武学"));
               }
               break;
            case PartyPanel.UI_PARTYPANEL_PARTY_TASK_SHOW:
               if(GameInstance.mainCharData.banghuiInfo.isTongbang(this._banghuiID))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_PARTY_TASK);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您不能查看其他帮会的帮会任务"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您不能查看其他帮会的帮会任务"));
               }
               break;
            case PartyPanel.UI_PARTYFLAGPANEL_PARTY_CONTRIBUTE_SHOW:
               if(GameInstance.mainCharData.banghuiInfo.isTongbang(this._banghuiID))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGQI_BANGGONG_PANEL);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您不能查看其他帮会的帮会贡献"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您不能查看其他帮会的帮会贡献"));
               }
               break;
            case PartyPanel.UI_PARTYPANEL_PARTY_XIANGYANG_SHOW:
               PipeManager.sendMsg(PipeConstants.SHOW_GONGCHENG_XIANGYANGGUISHU_PANEL);
               break;
            case PartyPanel.UI_PARTYPANEL_PARTY_INFO_SHOW:
               if(GameInstance.mainCharData.banghuiInfo.isTongbang(this._banghuiID))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_NEWS_PANEL);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您不能查看其他帮会的帮会见闻"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您不能查看其他帮会的帮会见闻"));
               }
               break;
            case PartyPanel.UI_PARTYPANEL_PARTY_MEMBER_INFO_SHOW:
               if(GameInstance.mainCharData.banghuiInfo.isTongbang(this._banghuiID))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_MEMBER_LIST_PANEL);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您不能查看其他帮会的成员信息"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您不能查看其他帮会的成员信息"));
               }
               break;
            case PartyPanel.UI_PARTYFLAGPANEL_PARTY_RONGYU_SHOW:
               this.senderProxy.send_71021(this._banghuiID);
               this.senderProxy.send_71023([this._banghuiID,1]);
               PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_RONGYU_LIST_PANEL);
         }
      }
      
      public function f5() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._banghuiInfoPanel))
         {
            this.senderProxy.send_51033(GameInstance.lookBanghuiID);
         }
      }
      
      public function receive_banghuiInfo(param1:int, param2:int, param3:String, param4:int, param5:String, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int, param17:String, param18:Number, param19:String, param20:int, param21:int, param22:int, param23:String, param24:String, param25:String, param26:Array, param27:int, param28:int = 0) : void
      {
         var _loc33_:Array = null;
         var _loc34_:int = 0;
         var _loc35_:String = null;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:String = null;
         var _loc39_:int = 0;
         var _loc40_:XML = null;
         if(GameInstance.lookBanghuiID != param1)
         {
            return;
         }
         this._banghuiID = param1;
         this._bangzhanGG = param24;
         this._gongchengGG = param25;
         GameState.tiaoguoBangzhu = param27;
         var _loc29_:Date = new Date();
         _loc29_.setTime(param18);
         var _loc30_:Buff = new Buff(param6);
         var _loc31_:Boolean = false;
         if(GameInstance.mainCharData.banghuiInfo.isTongbang(this._banghuiID) && GameInstance.mainCharData.banghuiInfo.zhiwu == BangzhongZhiwu.ZW1)
         {
            _loc31_ = true;
         }
         GameInstance.uiInstance.banghuiInfoPanel.setInfo(param3,param2,param4,_loc30_,param17,_loc29_,param19,param20,param21,param22,param23,_loc31_);
         GameInstance.uiInstance.banghuiInfoPanel.setFlagID(param4);
         GameInstance.uiInstance.banghuiInfoPanel.setFlagName(param3);
         GameInstance.uiInstance.banghuiInfoPanel.setAffiche(param23);
         var _loc32_:XML = <list/>;
         for each(_loc33_ in param26)
         {
            _loc34_ = int(_loc33_[0]);
            _loc35_ = _loc33_[1];
            _loc36_ = int(_loc33_[2]);
            _loc37_ = int(_loc33_[3]);
            _loc38_ = _loc33_[4];
            _loc39_ = int(_loc33_[5]);
            _loc40_ = <node label={_loc35_} id={_loc34_} lv={_loc36_} job={BangzhongZhiwu.getNameByValue(_loc37_)} chenghao={_loc38_} gongxian={_loc39_}/>;
            _loc32_.appendChild(_loc40_);
         }
         GameInstance.uiInstance.banghuiInfoPanel.setMemberList(_loc32_);
         if(GameInstance.mainCharData.banghuiInfo.isTongbang(this._banghuiID) && GameInstance.mainCharData.banghuiInfo.zhiwu > 0)
         {
         }
         if(GameInstance.mainCharData.banghuiInfo.isTongbang(this._banghuiID))
         {
            GameInstance.uiInstance.banghuiInfoPanel.setBangpairongyu(this._banghuiID,false);
         }
         else
         {
            GameInstance.uiInstance.banghuiInfoPanel.setBangpairongyu(this._banghuiID,true);
         }
      }
      
      private function showTiShiCanvas(param1:int) : void
      {
         if(!this.showTiShi)
         {
            return;
         }
         this.showTiShi = false;
         if(!this.tishiCanvas)
         {
            this.tishiCanvas = new BangPaiTiShiCanvas();
         }
         this.tishiCanvas.setNum(param1);
         POPWindowManager.showWindow(this.tishiCanvas);
      }
      
      public function bangpailist(param1:Array) : void
      {
         GameInstance.uiInstance.banghuiInfoPanel.setBangpaiList(param1);
      }
      
      public function chengchixinxi(param1:Object) : void
      {
         GameInstance.uiInstance.banghuiInfoPanel.setChengchi(param1);
      }
   }
}

