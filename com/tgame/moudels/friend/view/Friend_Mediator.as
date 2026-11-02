package com.tgame.moudels.friend.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.FriendInfo;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.friend.Friend_ApplicationFacade;
   import com.tgame.moudels.friend.model.Friend_MsgSenderProxy;
   import com.tgame.shell.view.components.FriendPanel;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Friend_Mediator extends Mediator
   {
      
      public static const NAME:String = "Friend_Mediator";
      
      private var menuUI:Menu;
      
      private var load:LoadBuffer = null;
      
      private var peiOu:PurePlayer;
      
      private var _msgSenderProxy:Friend_MsgSenderProxy;
      
      private var menuType:int;
      
      private var menuPlayerID:int;
      
      private var menuPlayerName:String;
      
      private var searchIndex:int = 1;
      
      private var isSearchEnd:Boolean = false;
      
      private var searchKeyword:String = "";
      
      public function Friend_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Friend_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Friend_MsgSenderProxy.NAME) as Friend_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get friendPanel() : FriendPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.friendPanel);
         }
         return viewComponent as FriendPanel;
      }
      
      private function get mainUI() : MainUI
      {
         return GameInstance.uiInstance.mainUI;
      }
      
      private function get myFriends() : FriendInfo
      {
         return GameInstance.mainCharData.friendInfo;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Friend_ApplicationFacade.SEND_ADD_FRIEND,Friend_ApplicationFacade.LIHUN_SUCCESS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Friend_ApplicationFacade.SEND_ADD_FRIEND:
               this.msgSenderProxy.send_10303(_loc2_ as int);
               break;
            case Friend_ApplicationFacade.LIHUN_SUCCESS:
               this.peiOu = null;
               this.setPeiOu(null);
               this.updateFriendListPanel();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         EventDispatchCenter.getInstance().addEventListener(FriendPanel.UI_FRIEND_ADD_FRIEND_BTN_CLICK,this.friendPanelHandel);
         EventDispatchCenter.getInstance().addEventListener(FriendPanel.UI_FRIEND_LOOK_INFOBTN_CLICK,this.friendPanelHandel);
         this.friendPanel.addEventListener(FriendPanel.UI_SHITUTUIJIAN_CHECK,this.friendPanelHandel);
         this.friendPanel.addEventListener(FriendPanel.UI_TUDITUIJIAN_CHECK,this.friendPanelHandel);
         this.friendPanel.addEventListener(FriendPanel.UI_TUDITUIJIAN_SHOUTU,this.friendPanelHandel);
         this.friendPanel.addEventListener(FriendPanel.UI_SHITUTUIJIAN_BAISHI,this.friendPanelHandel);
         UIEventsRegisterManager.addUIRegisterEvent(FriendPanel,function():void
         {
            friendPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            friendPanel.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_LARGESS_CANCEL_BTN_CLICK,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_SHOW,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_MOODICO_SET,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_MOODTXT_SET,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_SEARCH_BNT_CLICK,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_FRIEND_ADDBTN_CLICK,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_FRIEND_INFOBTN_CLICK,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_MOUSE_OVER_TIP_SHOW,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_FRIEND_MENU_SHOW,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_FRIEND_YANBTN_CLICK,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_FRIEND_TANBTN_CLICK,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_BLACK_ADDBTN_CLICK,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_BLACK_ADDTOBTN_CLICK,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_ENEMY_SNOOP_BTN_CLICK,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_GET_PREPAGE,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_GET_NEXTPAGE,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_SHITU_BAISHI,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_SHITU_TUICHU,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_SHITU_LINGQU,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_SHITU_SHOUTU,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_SHITU_QUZHU,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_SHITU_FAFANG,friendPanelHandel);
            friendPanel.addEventListener(FriendPanel.UI_SHITU_CHENGHAOTXT_SET,friendPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(FriendPanel,function():void
         {
            friendPanel.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_SHOW,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_MOODICO_SET,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_MOODTXT_SET,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_SEARCH_BNT_CLICK,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_FRIEND_ADDBTN_CLICK,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_FRIEND_INFOBTN_CLICK,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_MOUSE_OVER_TIP_SHOW,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_FRIEND_MENU_SHOW,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_FRIEND_YANBTN_CLICK,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_FRIEND_TANBTN_CLICK,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_BLACK_ADDBTN_CLICK,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_BLACK_ADDTOBTN_CLICK,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_ENEMY_SNOOP_BTN_CLICK,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_GET_PREPAGE,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_GET_NEXTPAGE,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_SHITU_BAISHI,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_SHITU_TUICHU,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_SHITU_LINGQU,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_SHITU_SHOUTU,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_SHITU_QUZHU,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_SHITU_FAFANG,friendPanelHandel);
            friendPanel.removeEventListener(FriendPanel.UI_SHITU_CHENGHAOTXT_SET,friendPanelHandel);
         });
      }
      
      private function onRemoveToStage(param1:Event) : void
      {
         TCursorManager.resumFullMouse();
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.updateFriendListPanel();
      }
      
      private function friendPanelHandel(param1:Event) : void
      {
         var e:Event = param1;
         var d:Player = GameInstance.mainCharData;
         var c:SceneCharacter = GameInstance.mainChar;
         var type:String = e.type;
         var evt:BaseEvent = e as BaseEvent;
         var i:int = 0;
         switch(type)
         {
            case FriendPanel.UI_FRIEND_SHOW:
               this.requestList(evt.data as int);
               break;
            case FriendPanel.UI_FRIEND_FRIEND_ADDBTN_CLICK:
               this.menuType = 1;
               this.friendPanel.showAddFriendSearchPlayerPanel();
               break;
            case FriendPanel.UI_FRIEND_SEARCH_BNT_CLICK:
               this.searchKeyword = evt.data as String;
               this.msgSenderProxy.send_10301(this.searchIndex,this.searchKeyword);
               break;
            case FriendPanel.UI_FRIEND_GET_PREPAGE:
               --this.searchIndex;
               if(this.searchIndex < 1)
               {
                  this.searchIndex = 1;
               }
               this.msgSenderProxy.send_10301(this.searchIndex,this.searchKeyword);
               break;
            case FriendPanel.UI_FRIEND_GET_NEXTPAGE:
               if(!this.isSearchEnd)
               {
                  ++this.searchIndex;
                  this.msgSenderProxy.send_10301(this.searchIndex,this.searchKeyword);
               }
               break;
            case FriendPanel.UI_FRIEND_MOODICO_SET:
               this.msgSenderProxy.send_10371(evt.data as String);
               break;
            case FriendPanel.UI_FRIEND_MOODTXT_SET:
               this.msgSenderProxy.send_10373(evt.data as String);
               break;
            case FriendPanel.UI_FRIEND_ADD_FRIEND_BTN_CLICK:
               this.msgSenderProxy.send_10303(evt.data as int);
               break;
            case FriendPanel.UI_FRIEND_LOOK_INFOBTN_CLICK:
            case FriendPanel.UI_FRIEND_FRIEND_INFOBTN_CLICK:
               GameInstance.lookPlayerID = evt.data as int;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case FriendPanel.UI_FRIEND_MOUSE_OVER_TIP_SHOW:
               this.msgSenderProxy.send_10375(evt.data as int);
               break;
            case FriendPanel.UI_FRIEND_FRIEND_MENU_SHOW:
               this.onMenuShow(evt.data as Array);
               break;
            case FriendPanel.UI_FRIEND_FRIEND_YANBTN_CLICK:
               break;
            case FriendPanel.UI_FRIEND_FRIEND_TANBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.LOOK_OTHERCHAR_SHOP_PANEL,evt.data as int);
               break;
            case FriendPanel.UI_FRIEND_BLACK_ADDBTN_CLICK:
               this.menuType = 3;
               this.friendPanel.showBlackSearchPlayerPanel();
               break;
            case FriendPanel.UI_FRIEND_BLACK_ADDTOBTN_CLICK:
               this.msgSenderProxy.send_10353(evt.data as int);
               break;
            case FriendPanel.UI_FRIEND_ENEMY_SNOOP_BTN_CLICK:
               this.msgSenderProxy.send_10381(evt.data as int);
               break;
            case FriendPanel.UI_FRIEND_LARGESS_CANCEL_BTN_CLICK:
               TCursorManager.resumFullMouse();
               break;
            case FriendPanel.UI_FRIEND_SHITU_BAISHI:
               if(Fun.isVisible(GameInstance.uiInstance._shiTuSystemPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SHITU_PANEL);
               }
               else
               {
                  this.msgSenderProxy.send_10397([0,1,10]);
                  this.load = LoadBuffer.show(this.friendPanel);
               }
               break;
            case FriendPanel.UI_FRIEND_SHITU_TUICHU:
               FAlert.show(LanResManager.getLanCommonTextWords("您确认要退出师门吗？"),LanResManager.getLanCommonTextWords("提示"),2,function(param1:FAlertEvent = null):void
               {
                  if(Boolean(param1) && param1.eventData != FAlert.OK)
                  {
                     return;
                  }
                  msgSenderProxy.send_10387();
               });
               break;
            case FriendPanel.UI_FRIEND_SHITU_LINGQU:
               this.msgSenderProxy.send_10389();
               break;
            case FriendPanel.UI_FRIEND_SHITU_SHOUTU:
               if(Fun.isVisible(GameInstance.uiInstance._shiTuSystemPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SHITU_PANEL);
               }
               else
               {
                  this.msgSenderProxy.send_10397([1,1,10]);
                  this.load = LoadBuffer.show(this.friendPanel);
               }
               break;
            case FriendPanel.UI_FRIEND_SHITU_QUZHU:
               break;
            case FriendPanel.UI_FRIEND_SHITU_FAFANG:
               this.msgSenderProxy.send_10395();
               break;
            case FriendPanel.UI_SHITU_CHENGHAOTXT_SET:
               this.msgSenderProxy.send_11005(evt.data as Array);
               break;
            case FriendPanel.UI_SHITUTUIJIAN_CHECK:
               GameInstance.lookPlayerID = evt.data as int;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case FriendPanel.UI_TUDITUIJIAN_CHECK:
               GameInstance.lookPlayerID = evt.data as int;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case FriendPanel.UI_SHITUTUIJIAN_BAISHI:
               this.msgSenderProxy.send_11021([0,evt.data as int]);
               break;
            case FriendPanel.UI_TUDITUIJIAN_SHOUTU:
               this.msgSenderProxy.send_11021([1,evt.data as int]);
         }
      }
      
      public function updateSnoopEnemyPanel(param1:int, param2:String, param3:String, param4:String, param5:String = "") : void
      {
         this.friendPanel.setSnoopResult(param1,param2,param3,param4,param5);
      }
      
      public function updateMouseTip(param1:int, param2:String, param3:String) : void
      {
         this.friendPanel.showMouseMoveTip(param1,param3,param2);
      }
      
      private function onMenuShow(param1:Array) : void
      {
         this.menuPlayerID = param1[0] as int;
         this.menuPlayerName = param1[1] as String;
         var _loc2_:int = param1[2] as int;
         this.menuType = param1[3] as int;
         var _loc3_:MouseEvent = param1[4] as MouseEvent;
         var _loc4_:Array = [];
         switch(this.menuType)
         {
            case 1:
            case 4:
               if(_loc2_ == 0)
               {
                  _loc4_ = [LanResManager.getLanCommonTextWords("删除")];
               }
               else
               {
                  _loc4_ = [LanResManager.getLanCommonTextWords("查看"),LanResManager.getLanCommonTextWords("私聊"),LanResManager.getLanCommonTextWords("组队"),LanResManager.getLanCommonTextWords("帮邀"),LanResManager.getLanCommonTextWords("交易"),LanResManager.getLanCommonTextWords("看摊"),LanResManager.getLanCommonTextWords("双修"),LanResManager.getLanCommonTextWords("送花"),LanResManager.getLanCommonTextWords("求婚"),LanResManager.getLanCommonTextWords("删除"),LanResManager.getLanCommonTextWords("成就对比")];
               }
               break;
            case 2:
               if(_loc2_ == 0)
               {
                  _loc4_ = [LanResManager.getLanCommonTextWords("删除")];
               }
               else
               {
                  _loc4_ = [LanResManager.getLanCommonTextWords("查看"),LanResManager.getLanCommonTextWords("打探"),LanResManager.getLanCommonTextWords("删除")];
               }
               break;
            case 3:
               if(_loc2_ == 0)
               {
                  _loc4_ = [LanResManager.getLanCommonTextWords("删除")];
               }
               else
               {
                  _loc4_ = [LanResManager.getLanCommonTextWords("查看"),LanResManager.getLanCommonTextWords("删除")];
               }
               break;
            case 6:
               if(this.menuPlayerID == GameInstance.mainChar.id)
               {
                  return;
               }
               _loc4_ = [LanResManager.getLanCommonTextWords("查看"),LanResManager.getLanCommonTextWords("私聊"),LanResManager.getLanCommonTextWords("组队"),LanResManager.getLanCommonTextWords("帮邀"),LanResManager.getLanCommonTextWords("交易"),LanResManager.getLanCommonTextWords("看摊"),LanResManager.getLanCommonTextWords("双修"),LanResManager.getLanCommonTextWords("送花")];
               if(_loc2_ == 1)
               {
                  _loc4_.push(LanResManager.getLanCommonTextWords("驱逐师门"));
               }
         }
         this.menuUI = Menu.addMenuItem(_loc4_,_loc3_);
         this.menuUI.addEventListener(Menu.MENUITEM_CLICK,this.onMenuClick);
      }
      
      private function onMenuClick(param1:BaseEvent) : void
      {
         var type:String;
         var e:BaseEvent = param1;
         this.menuUI.removeEventListener(Menu.MENUITEM_CLICK,this.onMenuClick);
         type = e.data as String;
         switch(type)
         {
            case LanResManager.getLanCommonTextWords("删除"):
               FAlert.okLabel = LanResManager.getLanCommonTextWords("是");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("否");
               switch(this.menuType)
               {
                  case 1:
                     if(Boolean(this.peiOu) && this.peiOu.id == this.menuPlayerID)
                     {
                        FAlert.show(LanResManager.getLanTextWords(this,"夫妻之间无法删除"));
                     }
                     else
                     {
                        FAlert.show(LanResManager.getLanTextWords(this,"断绝交情吗",[StaticValue.RED_HTML,this.menuPlayerName]),"",2,function(param1:FAlertEvent):void
                        {
                           if(param1.eventData == "FAlert.ok")
                           {
                              msgSenderProxy.send_10309(menuPlayerID);
                           }
                        });
                     }
                     break;
                  case 4:
                     this.msgSenderProxy.send_10333(this.menuPlayerID);
                     break;
                  case 2:
                     FAlert.show(LanResManager.getLanTextWords(this,"相逢一笑泯恩仇",[StaticValue.RED_HTML,this.menuPlayerName]),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == "FAlert.ok")
                        {
                           msgSenderProxy.send_10343(menuPlayerID);
                        }
                     });
                     break;
                  case 3:
                     this.msgSenderProxy.send_10359(this.menuPlayerID);
               }
               break;
            case LanResManager.getLanCommonTextWords("查看"):
               GameInstance.lookPlayerID = this.menuPlayerID;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case LanResManager.getLanCommonTextWords("私聊"):
               GameInstance.uiInstance._mainUI.setPrivateChat(this.menuPlayerName);
               break;
            case LanResManager.getLanCommonTextWords("组队"):
               PipeManager.sendMsg(PipeConstants.SEND_TEAM_INVITE,this.menuPlayerID);
               break;
            case LanResManager.getLanCommonTextWords("帮邀"):
               PipeManager.sendMsg(PipeConstants.SEND_BANGYAO,this.menuPlayerID);
               break;
            case LanResManager.getLanCommonTextWords("看摊"):
               PipeManager.sendMsg(PipeConstants.LOOK_OTHERCHAR_SHOP_PANEL,this.menuPlayerID);
               break;
            case LanResManager.getLanCommonTextWords("送花"):
               PipeManager.sendMsg(PipeConstants.SHOW_SEND_FLOWER_PANEL,[this.menuPlayerID,this.menuPlayerName,"100"]);
               break;
            case LanResManager.getLanCommonTextWords("双修"):
               PipeManager.sendMsg(PipeConstants.SEND_SHUANGXIU,this.menuPlayerID);
               break;
            case LanResManager.getLanCommonTextWords("交易"):
               PipeManager.sendMsg(PipeConstants.START_TRADE,this.menuPlayerID);
               break;
            case LanResManager.getLanCommonTextWords("打探"):
               this.friendPanel.showSnoopEnemyPanel(this.menuPlayerID,this.menuPlayerName,GameInstance.mainCharData.attributeInfo.headImg);
               break;
            case LanResManager.getLanCommonTextWords("求婚"):
               GameInstance.readyJieHunID = this.menuPlayerID;
               PipeManager.sendMsg(PipeConstants.SEND_QIUHUN);
               break;
            case LanResManager.getLanCommonTextWords("成就对比"):
               PipeManager.sendMsg(PipeConstants.SHOW_CHENGJIU_PANEL,[this.menuPlayerID,this.menuPlayerName]);
               break;
            case LanResManager.getLanCommonTextWords("驱逐师门"):
               FAlert.show("<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"解除师徒关系将使您不再获得由带来的收益是否确定将其逐出师门",[this.menuPlayerName]),LanResManager.getLanCommonTextWords("提示"),2,function(param1:FAlertEvent = null):void
               {
                  if(Boolean(param1) && param1.eventData != FAlert.OK)
                  {
                     return;
                  }
                  msgSenderProxy.send_10393(menuPlayerID);
               });
         }
      }
      
      public function requestList(param1:int) : void
      {
         this.menuType = param1;
         switch(param1)
         {
            case 1:
               if(this.myFriends.friends.length > 0 && this.myFriends.friendsReady)
               {
                  this.updateFriendPanel();
               }
               else
               {
                  this.load = LoadBuffer.show(this.friendPanel);
                  this.msgSenderProxy.send_10307();
               }
               break;
            case 2:
               if(this.myFriends.enemies.length > 0)
               {
                  this.updateEnemyPanel();
               }
               else
               {
                  this.load = LoadBuffer.show(this.friendPanel);
                  this.msgSenderProxy.send_10341();
               }
               break;
            case 3:
               if(this.myFriends.blacklist.length > 0)
               {
                  this.updateBlackListPanel();
               }
               else
               {
                  this.load = LoadBuffer.show(this.friendPanel);
                  this.msgSenderProxy.send_10357();
               }
               break;
            case 4:
               if(this.myFriends.tempFriends.length > 0)
               {
                  this.updateTempsPanel();
               }
               else
               {
                  this.load = LoadBuffer.show(this.friendPanel);
                  this.msgSenderProxy.send_10331();
               }
               break;
            case 6:
               if(GameInstance.mainCharData.attributeInfo.lv >= 15)
               {
                  this.friendPanel.showShiTu(true);
                  this.load = LoadBuffer.show(this.friendPanel);
                  this.msgSenderProxy.send_10383();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("等级不到15级"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("等级不到15级"),false);
                  this.friendPanel.tabBar.recoverBtnState();
               }
         }
         if(this.myFriends.myFace == null)
         {
            this.msgSenderProxy.send_10365();
         }
      }
      
      public function updateFriendListPanel() : void
      {
         if(!Fun.isVisible(this.friendPanel))
         {
            return;
         }
         if(this.load)
         {
            this.load.close();
         }
         switch(this.menuType)
         {
            case 1:
               this.updateFriendPanel();
               break;
            case 2:
               this.updateEnemyPanel();
               break;
            case 3:
               this.updateBlackListPanel();
               break;
            case 4:
               this.updateTempsPanel();
         }
         this.friendPanel.setXlNum(GameInstance.mainCharData.attributeInfo.prestige_fuQi);
      }
      
      public function updatePeiOuStatus(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         if(Boolean(this.peiOu) && this.peiOu.id == param1)
         {
            this.peiOu.favor = param5;
            this.peiOu.lineserver = param2;
            this.peiOu.specialAct = param4;
            this.updateFriendListPanel();
            this.friendPanel.setHeadImg(GameInstance.mainCharData.attributeInfo.headImg,this.peiOu.attributeInfo.headImg,this.peiOu.lineserver);
         }
      }
      
      private function updateFriendPanel() : void
      {
         var _loc2_:PurePlayer = null;
         if(GameInstance.uiInstance._friendPanel == null)
         {
            return;
         }
         var _loc1_:XML = <list/>;
         if(this.peiOu)
         {
            _loc1_.appendChild(this.getListXml(this.peiOu));
         }
         for each(_loc2_ in this.myFriends.friends)
         {
            _loc1_.appendChild(this.getListXml(_loc2_));
         }
         this.friendPanel.showFriend(_loc1_);
      }
      
      private function updateEnemyPanel() : void
      {
         var _loc2_:PurePlayer = null;
         if(GameInstance.uiInstance._friendPanel == null)
         {
            return;
         }
         var _loc1_:XML = <list/>;
         for each(_loc2_ in this.myFriends.enemies)
         {
            _loc1_.appendChild(this.getListXml(_loc2_,true));
         }
         this.friendPanel.showEnemy(_loc1_);
      }
      
      private function updateTempsPanel() : void
      {
         var _loc2_:PurePlayer = null;
         if(GameInstance.uiInstance._friendPanel == null)
         {
            return;
         }
         var _loc1_:XML = <list/>;
         for each(_loc2_ in this.myFriends.tempFriends)
         {
            _loc1_.appendChild(this.getListXml(_loc2_));
         }
         this.friendPanel.showTemp(_loc1_);
      }
      
      private function updateBlackListPanel() : void
      {
         var _loc2_:PurePlayer = null;
         if(GameInstance.uiInstance._friendPanel == null)
         {
            return;
         }
         var _loc1_:XML = <list/>;
         for each(_loc2_ in this.myFriends.blacklist)
         {
            _loc1_.appendChild(this.getListXml(_loc2_));
         }
         this.friendPanel.showBlack(_loc1_);
      }
      
      public function updateShiTuPanel(param1:int) : void
      {
         var _loc4_:XML = null;
         if(GameInstance.uiInstance._friendPanel == null)
         {
            return;
         }
         var _loc2_:XML = <list/>;
         var _loc3_:int = 0;
         while(_loc3_ < this.myFriends.shiTulist.length)
         {
            _loc4_ = XML("<node label=\'\'/>");
            _loc4_.@label = this.myFriends.shiTulist[_loc3_].label;
            _loc4_.@playerName = this.myFriends.shiTulist[_loc3_].playerName;
            _loc4_.@line = this.myFriends.shiTulist[_loc3_].lineserver;
            _loc4_.@state = this.myFriends.shiTulist[_loc3_].state;
            _loc4_.@otherName = this.myFriends.shiTulist[_loc3_].otherName;
            _loc4_.@lv = this.myFriends.shiTulist[_loc3_].lv;
            _loc2_.appendChild(_loc4_);
            _loc3_++;
         }
         this.friendPanel.setShituInfo(param1,_loc2_);
      }
      
      private function getListXml(param1:PurePlayer, param2:Boolean = false) : XML
      {
         var _loc3_:XML = XML(LanResManager.getLanTextWords(this,"xml玩家名字"));
         _loc3_.@label = param1.id;
         _loc3_.@playerName = param1.name;
         _loc3_.@line = param1.lineserver;
         _loc3_.@state = param1.specialAct;
         _loc3_.@value = param2 ? param1.hate : param1.favor;
         if(this.peiOu)
         {
            _loc3_.@isMate = param1.id == this.peiOu.id ? "1" : "0";
         }
         else
         {
            _loc3_.@isMate = "0";
         }
         return _loc3_;
      }
      
      public function updateFacePanel() : void
      {
         this.friendPanel.setMood(this.myFriends.myFace);
         this.friendPanel.setMoodText(this.myFriends.myFaceText);
      }
      
      public function setPeiOu(param1:PurePlayer) : void
      {
         this.peiOu = param1;
         if(this.peiOu != null)
         {
            this.friendPanel.setHeadImg(GameInstance.mainCharData.attributeInfo.headImg,param1.attributeInfo.headImg,param1.lineserver);
         }
         else
         {
            this.friendPanel.setHeadImg(GameInstance.mainCharData.attributeInfo.headImg,"");
         }
      }
      
      public function updateSearchPanel(param1:Array, param2:int) : void
      {
         var _loc4_:PurePlayer = null;
         var _loc6_:XML = null;
         this.searchIndex = param2;
         if(param1.length < 5)
         {
            this.isSearchEnd = true;
         }
         else
         {
            this.isSearchEnd = false;
         }
         var _loc3_:XML = <list/>;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = param1[_loc5_] as PurePlayer;
            _loc6_ = XML(LanResManager.getLanTextWords(this,"xml序号"));
            _loc6_.@label = _loc4_.id;
            _loc6_.@number = _loc5_;
            _loc6_.@playerName = _loc4_.name;
            _loc6_.@level = _loc4_.attributeInfo.lv;
            _loc6_.@party = _loc4_.attributeInfo.getPartyName();
            _loc3_.appendChild(_loc6_);
            _loc5_++;
         }
         if(this.menuType == 1)
         {
            this.friendPanel.setAddFriendSearchPanelList(_loc3_,this.searchIndex);
         }
         else if(this.menuType == 3)
         {
            this.friendPanel.setBlaskSearchPanelList(_loc3_,this.searchIndex);
         }
      }
      
      public function showAddFriendTips(param1:PurePlayer, param2:int) : void
      {
         var $player:PurePlayer = param1;
         var $icon:int = param2;
         this.mainUI.showICOTip(MainUI.TYPE_FRIEND_TIP,function():void
         {
            friendPanel.showAddFriendPanel($player.id,HeadResChange.headResChangeToString($icon),$player.name,$player.attributeInfo.lv.toString(),$player.banghuiInfo.banghuiName,$player.attributeInfo.getPartyName(),myFriends.getFriendByID($player.id) != null);
         });
      }
      
      public function showShiFuTuiJianTips(param1:Array) : void
      {
         var xml:XML = null;
         var node:XML = null;
         var arr:Array = param1;
         xml = <list/>;
         var i:int = 0;
         while(i < arr.length)
         {
            node = XML("<node label=\'\'/>");
            node.@label = arr[i].id;
            node.@res = HeadResChange.headResChangeToString(arr[i].head);
            node.@playerName = arr[i].name;
            node.@lv = arr[i].lv;
            node.@party = arr[i].party;
            xml.appendChild(node);
            i++;
         }
         this.mainUI.showICOTip(MainUI.TYPE_SHITU_TIP,function():void
         {
            friendPanel.showShiFuTuiJianPanel(xml);
         });
      }
      
      public function showTuDiTuiJianTips(param1:Array, param2:int, param3:int) : void
      {
         var xml:XML = null;
         var node:XML = null;
         var arr:Array = param1;
         var n:int = param2;
         var m:int = param3;
         xml = <list/>;
         var i:int = 0;
         while(i < arr.length)
         {
            node = XML("<node label=\'\'/>");
            node.@label = arr[i].id;
            node.@res = HeadResChange.headResChangeToString(arr[i].head);
            node.@playerName = arr[i].name;
            node.@lv = arr[i].lv;
            node.@party = arr[i].party;
            xml.appendChild(node);
            i++;
         }
         this.mainUI.showICOTip(MainUI.TYPE_SHITU_TIP,function():void
         {
            friendPanel.showTuDiTuiJianPanel(xml,n,m);
         });
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.load != null)
         {
            this.load.close();
         }
         this.load = null;
      }
   }
}

