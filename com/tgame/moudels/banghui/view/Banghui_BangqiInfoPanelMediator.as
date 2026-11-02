package com.tgame.moudels.banghui.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.banghui.Banghui_ApplicationFacade;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.shell.view.components.PartyFlagPanel;
   import com.tgame.shell.view.components.party.PartyFlagHelpPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_BangqiInfoPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_BangqiInfoPanelMediator";
      
      private var _showCondition:int = 0;
      
      private var _pageCount:int = 10;
      
      private var _currentPage:int = 1;
      
      private var _maxPage:int = 1;
      
      private var _nextData:Object = {
         "nextID":0,
         "next_buffID":0,
         "next_tongqian":0,
         "next_ling_qinglong":0,
         "next_ling_baihu":0,
         "next_ling_zhuque":0,
         "next_ling_xuanwu":0
      };
      
      private var _senderProxy:Banghui_MsgSenderProxy;
      
      public function Banghui_BangqiInfoPanelMediator()
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
         UIEventsRegisterManager.addUIRegisterEvent(PartyFlagPanel,function():void
         {
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_CONTRIBUTE_RENAME_BTN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_CONTRIBUTE_CHANGE_BTN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_CONTRIBUTE_UPGRADE_BTN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_UPGRADE_FLAG,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_UPGRADE_FLAG_NO_CHANGE,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_RENAME_OK,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_CHANGE_FLAG_OK,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PARTYFLAGINSTALLPANEL_FIX_FLAG,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PARTYFLAGINSTALLPANEL_RENOVATE,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PartyFlagPanel,function():void
         {
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_CONTRIBUTE_RENAME_BTN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_CONTRIBUTE_CHANGE_BTN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_CONTRIBUTE_UPGRADE_BTN_CLICK,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_UPGRADE_FLAG,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_UPGRADE_FLAG_NO_CHANGE,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_RENAME_OK,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(PartyFlagPanel.UI_PARTYFLAGPANEL_CHANGE_FLAG_OK,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(PartyFlagPanel.UI_PARTYFLAGINSTALLPANEL_FIX_FLAG,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(PartyFlagPanel.UI_PARTYFLAGINSTALLPANEL_RENOVATE,uiHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(PartyFlagHelpPanel,function():void
         {
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PANRTYFLAGPANEL_HELPPANEL_ISSHOW_HELPPANEL,uiHandle);
            GameInstance.uiInstance.bangqiInfoPanel.addEventListener(PartyFlagPanel.UI_PANELFLAGPANEL_HELPPAEL_OKBTN_CLICK,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PartyFlagHelpPanel,function():void
         {
            GameInstance.uiInstance.bangqiInfoPanel.removeEventListener(PartyFlagPanel.UI_PANRTYFLAGPANEL_HELPPANEL_ISSHOW_HELPPANEL,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
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
               this.senderProxy.send_51079();
               this._pageCount = 1000;
               this._showCondition = 0;
               _loc6_ = 0;
               if(_loc6_ == 0)
               {
                  _loc7_ = 1;
               }
               else if(_loc6_ == 1)
               {
                  _loc7_ = this._currentPage - 1;
                  if(_loc7_ <= 0)
                  {
                     _loc7_ = 1;
                  }
               }
               else if(_loc6_ == 2)
               {
                  _loc7_ = this._currentPage + 1;
                  if(_loc7_ >= this._maxPage)
                  {
                     _loc7_ = this._maxPage;
                  }
               }
               else if(_loc6_ == 3)
               {
                  _loc7_ = this._maxPage;
               }
               this.senderProxy.send_51083([this._showCondition,this._pageCount,_loc7_]);
               break;
            case PartyFlagPanel.UI_PARTYFLAGPANEL_CONTRIBUTE_RENAME_BTN_CLICK:
               GameInstance.uiInstance.bangqiInfoPanel.showFlagRenamePanel();
               break;
            case PartyFlagPanel.UI_PARTYFLAGPANEL_CONTRIBUTE_CHANGE_BTN_CLICK:
               GameInstance.uiInstance.bangqiInfoPanel.showChangeFlagPanel(GameInstance.mainCharData.banghuiInfo.bangqiLv);
               break;
            case PartyFlagPanel.UI_PARTYFLAGPANEL_CONTRIBUTE_UPGRADE_BTN_CLICK:
               _loc8_ = GameInstance.mainCharData.banghuiInfo.bangqiLv;
               if(_loc8_ < 3)
               {
                  GameInstance.uiInstance.bangqiInfoPanel.showFlagUpgradePanel(this._nextData.nextID,this._nextData.next_tongqian,this._nextData.next_ling_qinglong,this._nextData.next_ling_baihu,this._nextData.next_ling_zhuque,this._nextData.next_ling_xuanwu);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"帮旗等级已达最高级别"),false);
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"帮旗等级已达最高级别"),false);
               }
               break;
            case PartyFlagPanel.UI_PARTYFLAGPANEL_UPGRADE_FLAG:
               _loc9_ = _loc5_ as Array;
               this.senderProxy.send_51089([_loc9_[0],_loc9_[1] + "," + _loc9_[2] + "," + _loc9_[3]]);
               break;
            case PartyFlagPanel.UI_PARTYFLAGPANEL_UPGRADE_FLAG_NO_CHANGE:
               _loc9_ = [GameInstance.mainCharData.banghuiInfo.bangqiImgID].concat(GameInstance.mainCharData.banghuiInfo.bangqiImgColor);
               this.senderProxy.send_51089([_loc9_[0],_loc9_[1] + "," + _loc9_[2] + "," + _loc9_[3]]);
               break;
            case PartyFlagPanel.UI_PARTYFLAGPANEL_RENAME_OK:
               this.senderProxy.send_51085(_loc5_);
               break;
            case PartyFlagPanel.UI_PARTYFLAGPANEL_CHANGE_FLAG_OK:
               _loc9_ = _loc5_ as Array;
               this.senderProxy.send_51087([_loc9_[0],_loc9_[1] + "," + _loc9_[2] + "," + _loc9_[3]]);
               break;
            case PartyFlagPanel.UI_PARTYFLAGINSTALLPANEL_FIX_FLAG:
               this.senderProxy.send_51095(_loc5_);
               break;
            case PartyFlagPanel.UI_PARTYFLAGINSTALLPANEL_RENOVATE:
               this.senderProxy.send_51097(_loc5_);
               break;
            case PartyFlagPanel.UI_PANRTYFLAGPANEL_HELPPANEL_ISSHOW_HELPPANEL:
               GameState.tiaoguoBangzhu = _loc5_ == true;
               this.senderProxy.send_51099(GameState.tiaoguoBangzhu);
               break;
            case PartyFlagPanel.UI_PANELFLAGPANEL_HELPPAEL_OKBTN_CLICK:
               if(!Fun.isVisible(GameInstance.uiInstance._bangqiInfoPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGQI_INFO_PANEL);
               }
         }
      }
      
      public function f5() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._bangqiInfoPanel))
         {
            this.senderProxy.send_51079();
            this.senderProxy.send_51083([this._showCondition,this._pageCount,this._currentPage]);
         }
      }
      
      public function receive_bangqiAnchaList(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int, param7:String, param8:int, param9:String, param10:int) : void
      {
         var _loc12_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:String = null;
         var _loc23_:String = null;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:String = null;
         var _loc27_:XML = null;
         if(this._showCondition != param1)
         {
            return;
         }
         if(this._pageCount != param2)
         {
            return;
         }
         this._currentPage = param3;
         this._maxPage = param4;
         var _loc11_:XML = <list/>;
         for each(_loc12_ in param5)
         {
            _loc13_ = int(_loc12_[0]);
            _loc14_ = int(_loc12_[1]);
            _loc15_ = _loc12_[2];
            _loc16_ = int(_loc12_[3]);
            _loc17_ = int(_loc12_[4]);
            _loc18_ = int(_loc12_[5]);
            _loc19_ = "";
            _loc20_ = "";
            _loc21_ = "";
            _loc22_ = "";
            _loc23_ = "";
            _loc24_ = 0;
            _loc25_ = 0;
            if(_loc18_ == 1)
            {
               _loc19_ = String(_loc12_[6]);
               _loc20_ = _loc12_[7];
               _loc21_ = String(_loc12_[8]);
               _loc22_ = _loc12_[9];
               _loc23_ = _loc12_[10];
               _loc24_ = int(_loc12_[11]);
               _loc25_ = int(_loc12_[12]);
            }
            _loc26_ = _loc16_ + "," + _loc17_;
            _loc27_ = <node label={_loc15_} flagID={_loc21_} coordinateID={_loc13_} coordinate={_loc26_} flagName={_loc20_} flagLv={_loc19_} party={_loc23_} lifeNow={_loc24_} lifeMax={_loc25_}/>;
            _loc11_.appendChild(_loc27_);
         }
         GameInstance.uiInstance.bangqiInfoPanel.setListData(_loc11_);
         GameInstance.uiInstance.bangqiInfoPanel.setYiAnCha(param6.toString() + LanResManager.getLanTextWords(this,"帮旗单位名称"));
         GameInstance.uiInstance.bangqiInfoPanel.setAnChaShuLiang(param5.length);
         GameInstance.uiInstance.bangqiInfoPanel.setShiLiDuibi(param7,param8,param9,param10);
      }
      
      public function receive_bangqiInfo(param1:int, param2:String, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int) : void
      {
         var _loc13_:Buff = new Buff(param5);
         GameInstance.uiInstance.bangqiInfoPanel.setInfo(param2,param1,param3);
         this._nextData.hasNext = param6 == 1;
         if(this._nextData.hasNext)
         {
            this._nextData.nextID = param1 + 1;
            this._nextData.next_buffID = param7;
            this._nextData.next_tongqian = param8;
            this._nextData.next_ling_qinglong = param9;
            this._nextData.next_ling_baihu = param10;
            this._nextData.next_ling_zhuque = param11;
            this._nextData.next_ling_xuanwu = param12;
         }
         else
         {
            this._nextData.nextID = 0;
            this._nextData.next_buffID = 0;
            this._nextData.next_tongqian = 0;
            this._nextData.next_ling_qinglong = 0;
            this._nextData.next_ling_baihu = 0;
            this._nextData.next_ling_zhuque = 0;
            this._nextData.next_ling_xuanwu = 0;
         }
      }
   }
}

