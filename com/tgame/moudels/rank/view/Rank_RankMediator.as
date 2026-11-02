package com.tgame.moudels.rank.view
{
   import com.fireice.alert.FAlert;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.rank.Rank_ApplicationFacade;
   import com.tgame.moudels.rank.model.Rank_MsgSendProxy;
   import com.tgame.shell.view.components.RankingListPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Rank_RankMediator extends Mediator
   {
      
      public static const NAME:String = "Rank_RankMediator";
      
      private var TitleArr1:Array = [undefined,LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"坐骑主人"),LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"姓名"),undefined,undefined,LanResManager.getLanTextWords(this,"姓名"),LanResManager.getLanTextWords(this,"姓名"),undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,LanResManager.getLanTextWords(this,"姓名"),undefined,undefined,LanResManager.getLanTextWords(this,"姓名"),undefined,LanResManager.getLanTextWords(this,"姓名")];
      
      private var TitleArr2:Array = [undefined,LanResManager.getLanTextWords(this,"等级"),LanResManager.getLanTextWords(this,"拥有铜钱"),LanResManager.getLanTextWords(this,"坐骑身价"),LanResManager.getLanTextWords(this,"连斩次数"),LanResManager.getLanTextWords(this,"本周击杀BOSS"),LanResManager.getLanTextWords(this,"战场声望"),LanResManager.getLanTextWords(this,"武功层数"),LanResManager.getLanTextWords(this,"经脉进度"),LanResManager.getLanTextWords(this,"成就进度"),LanResManager.getLanTextWords(this,"暗器修炼进度"),LanResManager.getLanCommonTextWords("论剑声望"),LanResManager.getLanCommonTextWords("城战声望"),undefined,undefined,LanResManager.getLanCommonTextWords("战斗力"),LanResManager.getLanCommonTextWords("击败玩家"),undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,LanResManager.getLanCommonTextWords("积分"),undefined,undefined,LanResManager.getLanCommonTextWords("功勋"),undefined,LanResManager.getLanCommonTextWords("神圣战斗力")];
      
      private var selectedUserID:int = 0;
      
      private var nowPageNum:int = 1;
      
      private var maxPageNum:int = 1;
      
      private var nowRankTypeMsgNum:int;
      
      private var isPlayerPanel:Boolean = true;
      
      private var menuUI:Menu;
      
      private var menuListArr:Array;
      
      private var menuArr:Array;
      
      private var data:int;
      
      private var action:int;
      
      private var tempPlayerID:int;
      
      private var loaderBuff:LoadBuffer;
      
      private var mountID:int;
      
      private var char_avatar_zizeng:int = 0;
      
      private var mount_avatar_zizeng:int = 0;
      
      private var _msgSenderProxy:Rank_MsgSendProxy;
      
      private var isSetStatisticsData:Boolean = false;
      
      private var searchName:String = "";
      
      private var isPanelOnViewing:Boolean = false;
      
      private var _rankAttackMediator:Rank_AttackPanelMediator;
      
      public function Rank_RankMediator()
      {
         super(NAME);
      }
      
      protected function get rankingListPanel() : RankingListPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.rankingListPanel);
         }
         return viewComponent as RankingListPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Rank_ApplicationFacade.KUA_FU_RANK_DATA_SEND,Rank_ApplicationFacade.LOOK_PLAYER_ZHAN_DOU_LI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Rank_ApplicationFacade.KUA_FU_RANK_DATA_SEND:
               this.msgSenderProxy.send_50337(_loc2_);
               break;
            case Rank_ApplicationFacade.LOOK_PLAYER_ZHAN_DOU_LI:
               this.rankAttackMediator.selectUserID = _loc2_ as int;
               this.msgSenderProxy.send_40029({
                  "id":_loc2_,
                  "type":1
               });
         }
      }
      
      public function biShiHuoChongBai(param1:Boolean, param2:String = "", param3:int = 1, param4:int = 0, param5:int = 0) : void
      {
         if(!this.isPanelOnViewing)
         {
            return;
         }
         if(param1)
         {
         }
         if(param4 >= 0 && param5 >= 0 && this.tempPlayerID == this.selectedUserID)
         {
            this.rankingListPanel.setCongBaiAndBiShi(param4,param5);
         }
      }
      
      public function setICOState(param1:Array) : void
      {
         if(!this.isPanelOnViewing)
         {
            return;
         }
         if(param1.length > 0)
         {
            this.rankingListPanel.setICOState(param1[0][0],param1[0][1],param1[1][0],param1[1][1],param1[2][0],param1[2][1],param1[3][0],param1[3][1],param1[4][0],param1[4][1],param1[5][0],param1[5][1],param1[6][0],param1[6][1],param1[7][0],param1[7][1]);
         }
         else
         {
            this.rankingListPanel.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         }
      }
      
      public function setStatisticsData(param1:Array, param2:Array) : void
      {
         if(!this.isPanelOnViewing)
         {
            return;
         }
         this.isSetStatisticsData = true;
         this.rankingListPanel.setStatisticsData(param1,param2);
      }
      
      public function viewRank(param1:int, param2:int, param3:Array) : void
      {
         if(!this.isPanelOnViewing)
         {
            return;
         }
         this.maxPageNum = param1;
         var _loc4_:XML = <list></list>;
         var _loc5_:Boolean = this.nowPageNum == 1 ? true : false;
         var _loc6_:Boolean = this.nowPageNum == this.maxPageNum ? true : false;
         var _loc7_:String = param2 == 0 ? LanResManager.getLanTextWords(this,"未上榜") : "" + param2;
         var _loc8_:int = 0;
         while(_loc8_ < param3.length)
         {
            _loc4_.appendChild(<node label={param3[_loc8_][0]} NO={param3[_loc8_][4]} player={param3[_loc8_][1]} count={param3[_loc8_][2]} mountID={param3[_loc8_][3]}/>);
            _loc8_++;
         }
         var _loc9_:Boolean = this.nowPageNum == 1 ? true : false;
         this.rankingListPanel.setTitle(_loc9_,this.TitleArr1[this.action],this.TitleArr2[this.action]);
         this.rankingListPanel.setRankingList(_loc4_,_loc7_,this.nowPageNum,this.maxPageNum,_loc5_,_loc6_);
         if(param3.length == 0 && this.action == 3 && this.data == 2)
         {
            FAlert.show(LanResManager.getLanTextWords(this,"请您先骑乘坐骑方可查看排行榜",[StaticValue.WHITE_HTML]));
            this.rankingListPanel.clear();
            this.removeLoaderBuff();
            return;
         }
         if(param3.length == 0)
         {
            if(this.searchName == "")
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"暂无数据"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"暂无数据"),false);
            }
            else
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"暂时没有包含该关键字的角色名上榜"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"暂时没有包含该关键字的角色名上榜"),false);
            }
            this.rankingListPanel.clear();
            this.removeLoaderBuff();
            return;
         }
         this.selectedUserID = param3[0][0];
         this.removeLoaderBuff();
      }
      
      private function get msgSenderProxy() : Rank_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Rank_MsgSendProxy.NAME) as Rank_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(RankingListPanel,function():void
         {
            rankingListPanel.addEventListener(RankingListPanel.UI_RANKINGLIST_LIST_MUTUAL,mainCharEquipPuddingHandle);
            rankingListPanel.addEventListener(RankingListPanel.UI_RANKINGLIST_LIST_GET_PAGE,mainCharEquipPuddingHandle);
            rankingListPanel.addEventListener(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,mainCharEquipPuddingHandle);
            rankingListPanel.addEventListener(RankingListPanel.UI_RANKINGLIST_PARTICULAR_INFO_SHOW,mainCharEquipPuddingHandle);
            rankingListPanel.addEventListener(RankingListPanel.UI_RANKINGLIST_LIST_SEARCH_BTN_CLICK,mainCharEquipPuddingHandle);
            rankingListPanel.addEventListener(RankingListPanel.UI_RANKINGLIST_LIST_STATISTICS_BTN_CLICK,mainCharEquipPuddingHandle);
            rankingListPanel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RankingListPanel,function():void
         {
            rankingListPanel.removeEventListener(RankingListPanel.UI_RANKINGLIST_LIST_MUTUAL,mainCharEquipPuddingHandle);
            rankingListPanel.removeEventListener(RankingListPanel.UI_RANKINGLIST_LIST_GET_PAGE,mainCharEquipPuddingHandle);
            rankingListPanel.removeEventListener(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,mainCharEquipPuddingHandle);
            rankingListPanel.removeEventListener(RankingListPanel.UI_RANKINGLIST_PARTICULAR_INFO_SHOW,mainCharEquipPuddingHandle);
            rankingListPanel.removeEventListener(RankingListPanel.UI_RANKINGLIST_LIST_SEARCH_BTN_CLICK,mainCharEquipPuddingHandle);
            rankingListPanel.removeEventListener(RankingListPanel.UI_RANKINGLIST_LIST_STATISTICS_BTN_CLICK,mainCharEquipPuddingHandle);
            rankingListPanel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Object = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case RankingListPanel.UI_RANKINGLIST_LIST_MUTUAL:
               if(this.selectedUserID == 0 || this.action == 3)
               {
                  return;
               }
               this.msgSenderProxy.send_50301({
                  "type":(_loc2_.data as int == 2 ? 0 : 1),
                  "id":this.selectedUserID,
                  "action":this.action
               });
               this.tempPlayerID = this.selectedUserID;
               break;
            case RankingListPanel.UI_RANKINGLIST_LIST_GET_PAGE:
               if(_loc2_.data as int == 1)
               {
                  this.nowPageNum = 1;
               }
               if(_loc2_.data as int == 2)
               {
                  --this.nowPageNum;
               }
               if(_loc2_.data as int == 3)
               {
                  ++this.nowPageNum;
               }
               if(_loc2_.data as int == 4)
               {
                  this.nowPageNum = this.maxPageNum;
               }
               if(this.nowPageNum < 1)
               {
                  this.nowPageNum = 1;
               }
               if(this.nowPageNum > this.maxPageNum)
               {
                  this.nowPageNum = this.maxPageNum;
               }
               this.msgSenderProxy.sendMsg({
                  "msgNum":this.nowRankTypeMsgNum,
                  "pageNum":this.nowPageNum,
                  "searchName":this.searchName
               });
               this.addLoadBuffer();
               break;
            case RankingListPanel.UI_RANKINGLIST_LIST_SHOW:
               if(this.data == int(_loc2_["data"]) && this.action == int(_loc2_["action"]))
               {
                  return;
               }
               this.data = int(_loc2_["data"]);
               this.action = int(_loc2_["action"]);
               this.isPlayerPanel = this.action == 3 ? false : true;
               if(this.data == 1)
               {
                  this.nowRankTypeMsgNum = this.msgSenderProxy.jiangHuRankMsgNumArr[this.action];
               }
               else
               {
                  this.nowRankTypeMsgNum = this.msgSenderProxy.otherRankMsgNumArr[this.action];
               }
               this.nowPageNum = 1;
               this.searchName = "";
               this.isPanelOnViewing = true;
               this.msgSenderProxy.sendMsg({
                  "msgNum":this.nowRankTypeMsgNum,
                  "pageNum":this.nowPageNum,
                  "searchName":this.searchName
               });
               if(!this.isSetStatisticsData)
               {
                  this.msgSenderProxy.send_50399({"panelType":0});
               }
               this.addLoadBuffer();
               break;
            case RankingListPanel.UI_RANKINGLIST_PARTICULAR_INFO_SHOW:
               _loc3_ = _loc2_.data as Object;
               this.menuArr = [_loc3_.playerID,_loc3_.name,_loc3_.mEvent];
               if(this.mountID == _loc3_.mountID && this.selectedUserID == _loc3_.playerID && _loc3_.NO != 1)
               {
                  this.onMenuShow(this.menuArr[2],false,true);
                  return;
               }
               this.mountID = _loc3_.mountID;
               this.selectedUserID = _loc3_.playerID;
               if(this.isPlayerPanel)
               {
                  this.msgSenderProxy.send_50337({
                     "index":0,
                     "id":this.selectedUserID
                  });
               }
               else
               {
                  this.msgSenderProxy.send_50339({
                     "index":0,
                     "id":this.selectedUserID,
                     "mountID":this.mountID
                  });
               }
               break;
            case RankingListPanel.UI_RANKINGLIST_LIST_SEARCH_BTN_CLICK:
               if(this.searchName == _loc2_.data as String || LanResManager.getLanCommonTextWords("支持模糊搜索") == _loc2_.data as String)
               {
                  return;
               }
               this.searchName = _loc2_.data as String;
               this.nowPageNum = 1;
               this.msgSenderProxy.sendMsg({
                  "msgNum":this.nowRankTypeMsgNum,
                  "pageNum":this.nowPageNum,
                  "searchName":this.searchName
               });
               break;
            case RankingListPanel.UI_RANKINGLIST_LIST_STATISTICS_BTN_CLICK:
         }
      }
      
      private function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(this.rankingListPanel);
      }
      
      private function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
      
      private function panelClose(param1:Event = null) : void
      {
         this.isPanelOnViewing = false;
         this.isSetStatisticsData = false;
         this.searchName = "";
         this.data = 0;
         this.action = 0;
         this.removeLoaderBuff();
      }
      
      private function onMenuShow(param1:MouseEvent, param2:Boolean, param3:Boolean = false) : void
      {
         if(!param3)
         {
            this.menuListArr = param2 ? [LanResManager.getLanCommonTextWords("查看"),LanResManager.getLanCommonTextWords("私聊"),LanResManager.getLanCommonTextWords("加友"),LanResManager.getLanCommonTextWords("帮邀"),LanResManager.getLanCommonTextWords("看摊"),LanResManager.getLanCommonTextWords("送花"),LanResManager.getLanCommonTextWords("成就对比")] : null;
            if(this.menuListArr)
            {
               this.menuListArr.push(LanResManager.getLanCommonTextWords("查看战斗力"));
            }
         }
         if(!param1 || !this.menuListArr)
         {
            return;
         }
         if(this.menuArr[0] == GameInstance.mainChar.id && this.action == 15 && !param3)
         {
            this.menuListArr = [LanResManager.getLanCommonTextWords("查看战斗力")];
         }
         this.menuUI = Menu.addMenuItem(this.menuListArr,param1);
         this.menuUI.addEventListener(Menu.MENUITEM_CLICK,this.onMenuClick);
      }
      
      private function onMenuClick(param1:BaseEvent) : void
      {
         this.menuUI.removeEventListener(Menu.MENUITEM_CLICK,this.onMenuClick);
         var _loc2_:String = param1.data as String;
         var _loc3_:int = int(this.menuArr[0]);
         var _loc4_:String = this.menuArr[1];
         switch(_loc2_)
         {
            case LanResManager.getLanCommonTextWords("查看"):
               GameInstance.lookPlayerID = _loc3_;
               if(_loc3_ == GameInstance.mainChar.id)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，不能查看自己"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，不能查看自己"));
                  return;
               }
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case LanResManager.getLanCommonTextWords("私聊"):
               GameInstance.uiInstance._mainUI.setPrivateChat(_loc4_);
               break;
            case LanResManager.getLanCommonTextWords("加友"):
               PipeManager.sendMsg(PipeConstants.SEND_ADD_FRIEND,_loc3_);
               break;
            case LanResManager.getLanCommonTextWords("帮邀"):
               PipeManager.sendMsg(PipeConstants.SEND_BANGYAO,_loc3_);
               break;
            case LanResManager.getLanCommonTextWords("看摊"):
               PipeManager.sendMsg(PipeConstants.LOOK_OTHERCHAR_SHOP_PANEL,_loc3_);
               break;
            case LanResManager.getLanCommonTextWords("送花"):
               PipeManager.sendMsg(PipeConstants.SHOW_SEND_FLOWER_PANEL,[_loc3_,_loc4_,"100"]);
               break;
            case LanResManager.getLanCommonTextWords("成就对比"):
               PipeManager.sendMsg(PipeConstants.SHOW_CHENGJIU_PANEL,[_loc3_,_loc4_]);
               break;
            case LanResManager.getLanCommonTextWords("查看战斗力"):
               this.rankAttackMediator.setSelectUserID(this.selectedUserID);
               this.msgSenderProxy.send_40029({
                  "id":this.selectedUserID,
                  "type":0
               });
         }
      }
      
      public function setPlayerEquipOrRide(param1:Boolean, param2:Object) : void
      {
         var _loc5_:Array = null;
         var _loc6_:PurePlayer = null;
         var _loc7_:Array = null;
         var _loc8_:Goods = null;
         var _loc9_:int = 0;
         var _loc10_:PureMount = null;
         var _loc11_:Goods = null;
         if(!this.isPanelOnViewing)
         {
            return;
         }
         var _loc3_:Boolean = param2 == null ? false : true;
         this.onMenuShow(this.menuArr[2],_loc3_);
         var _loc4_:int = 0;
         if(this.data == 1 && this.nowPageNum == 1)
         {
            _loc4_ = this.action;
         }
         if(this.isPlayerPanel && param1)
         {
            this.rankingListPanel.clear();
            if(!_loc3_)
            {
               this.rankingListPanel.setPlayer([],null,_loc4_,0,0,_loc3_);
               this.setCharAvatar(null);
               this.rankingListPanel.setICOXiantian(false,0,0,-1);
               this.rankingListPanel.setICORouti(false);
               this.rankingListPanel.setICOWuhun(0,false,false,0,false,0,false,false,0);
               this.rankingListPanel.setICOHuXinYao(false);
               this.rankingListPanel.setICONiXi(false);
               return;
            }
            this.rankingListPanel.setPlayer(param2.equipArr,param2.avatar,_loc4_,param2.congbaiCount,param2.bishiCount,_loc3_);
            _loc5_ = ExchangePositionManager.getEquipStatus(param2.equipArr);
            if(_loc5_.length > 0)
            {
               this.rankingListPanel.setICOState(_loc5_[0][0],_loc5_[0][1],_loc5_[1][0],_loc5_[1][1],_loc5_[2][0],_loc5_[2][1],_loc5_[3][0],_loc5_[3][1],_loc5_[4][0],_loc5_[4][1],_loc5_[5][0],_loc5_[5][1],_loc5_[6][0],_loc5_[6][1],_loc5_[7][0],_loc5_[7][1]);
            }
            else
            {
               this.rankingListPanel.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
            }
            if(param2.taoZhuang)
            {
               this.rankingListPanel.setSiShengShouState(12,12,12,12);
            }
            else
            {
               _loc7_ = ExchangePositionManager.getSiShengShouStatus(param2.equipArr);
               if(_loc7_.length > 0)
               {
                  this.rankingListPanel.setSiShengShouState(_loc7_[0],_loc7_[1],_loc7_[2],_loc7_[3]);
               }
               else
               {
                  this.rankingListPanel.setSiShengShouState(0,0,0,0);
               }
            }
            if(param2.yupeiID)
            {
               _loc8_ = new Goods(param2.yupeiID);
               _loc8_.position = _loc8_.res.position;
               _loc8_.roleID = param2.id;
               this.rankingListPanel.setYupei(_loc8_);
            }
            this.rankingListPanel.setICOXiantian(param2.isXTWJ,param2.TSNL,param2.ShenNongBaiChaoDanSta,param2.qianNengXinFaSta);
            this.rankingListPanel.setICORouti(param2.isRTJS);
            this.rankingListPanel.setICOWuhun(param2.wuhun,param2.wuHunShengJiDan,param2.huohundan,param2.wuhunshendan,param2.longhunwupo,param2.longhunshendan,param2.shenfumiji,param2.isNeitishenqi,param2.neitishenqi);
            this.rankingListPanel.setICOHuXinYao(param2.HuXinYao);
            this.rankingListPanel.setICONiXi(param2.niXiStatus);
            this.rankingListPanel.setICOFengHuang(param2.fengHuang);
            _loc6_ = new PurePlayer();
            _loc6_.isOnMount = param2.isOnMount;
            _loc6_.id = param2.id;
            _loc6_.avatarInfo.useIng_Weapon_id = param2.useIng_Weapon_id;
            _loc6_.avatarInfo.isFeixing = param2.isFeixing;
            _loc6_.avatarInfo.isFeixing_huanzhuang_Id = param2.isFeixing_huanzhuang_Id;
            _loc6_.avatarInfo.isFeixing_wuhun_Id = param2.isFeixing_wuhun_Id;
            param2.mountID = param2.mountID ? param2.mountID : -1;
            _loc6_ = this.setPurePlayer(param2.mountID,param2.partyID,_loc6_,param2.equipArr,param2.usingFashion,param2.useAvatarType);
            this.setCharAvatar(_loc6_);
         }
         else if(!this.isPlayerPanel && !param1)
         {
            if(!_loc3_)
            {
               this.rankingListPanel.setRide([],[],null,_loc4_,"","",0,0,0,0,0,0,0,0,0,0,0,0,0,_loc3_);
               this.setMountAvatar(null);
               this.rankingListPanel.setDreamBarPercentage(1,0,1,1,1,false,0,0,0,0);
               return;
            }
            _loc9_ = 0;
            while(_loc9_ < param2.equips.length)
            {
               _loc11_ = param2.equips[_loc9_];
               param2.equips[_loc9_].roleID = this.selectedUserID;
               param2.equips[_loc9_].mountID = param2.id;
               _loc9_++;
            }
            this.rankingListPanel.setRide(param2.equips,param2.skills,param2.avatar,_loc4_,param2.quality,param2.name,param2.savvy,param2.attackNow,param2.attackMax,param2.recoveryNow,param2.recoveryMax,param2.lightNow,param2.lightMax,param2.healthNow,param2.healthMax,param2.attackFujia,param2.recoveryFujia,param2.lightFujia,param2.healthFujia,_loc3_);
            _loc10_ = new PureMount(param2.modelID);
            if(_loc10_ == null)
            {
               return;
            }
            _loc10_.name = param2.name;
            _loc10_.id = param2.id;
            _loc10_.mountAttributeInfo.menghuan = param2.menghuan;
            _loc10_.mountAttributeInfo.menghuan_wuxing = param2.menghuan_wuxing;
            _loc10_.mountAttributeInfo.menghuan_jineng = param2.menghuan_jineng;
            _loc10_.mountAttributeInfo.menghuan_qianli = param2.menghuan_qianli;
            _loc10_.mountAttributeInfo.menghuan_mhd = param2.menghuan_mhd;
            _loc10_.mountAttributeInfo.menghuanShendanJihuo = param2.menghuanShendanJihuo;
            _loc10_.mountAttributeInfo.chaojizuoqiQianNengDan = param2.chaojizuoqiQianNengDan;
            _loc10_.mountAttributeInfo.zhongjizuoqiQianNengDan = param2.zhongjizuoqiQianNengDan;
            _loc10_.mountAttributeInfo.quality = param2.quality;
            _loc10_.mountAttributeInfo.savvy = param2.savvy;
            _loc10_.mountAttributeInfo.points_attackNow = param2.attackNow;
            _loc10_.mountAttributeInfo.points_attackMax = param2.attackMax;
            _loc10_.mountAttributeInfo.points_attackFujia = param2.attackFujia;
            _loc10_.mountAttributeInfo.points_defenceNow = param2.recoveryNow;
            _loc10_.mountAttributeInfo.points_defenceMax = param2.recoveryMax;
            _loc10_.mountAttributeInfo.points_defenceFujia = param2.recoveryFujia;
            _loc10_.mountAttributeInfo.points_stongNow = param2.healthNow;
            _loc10_.mountAttributeInfo.points_stongMax = param2.healthMax;
            _loc10_.mountAttributeInfo.points_stongFujia = param2.healthFujia;
            _loc10_.mountAttributeInfo.points_flyNow = param2.lightNow;
            _loc10_.mountAttributeInfo.points_flyMax = param2.lightMax;
            _loc10_.mountAttributeInfo.points_flyFujia = param2.lightFujia;
            _loc10_.mountSkillInfo.skillObj = param2.skills;
            this.setMountAvatar(_loc10_);
            this.rankingListPanel.setDreamBarPercentage(_loc10_.mountAttributeInfo.menghuan * 100,_loc10_.mountAttributeInfo.menghuan_mhd,_loc10_.mountAttributeInfo.menghuan_wuxing * 100,_loc10_.mountAttributeInfo.menghuan_qianli * 100,_loc10_.mountAttributeInfo.menghuan_jineng * 100,_loc10_.mountAttributeInfo.menghuanShendanJihuo,_loc10_.mountAttributeInfo.chaojizuoqiQianNengDan,_loc10_.mountAttributeInfo.shoushenDan,_loc10_.mountAttributeInfo.zhongjizuoqiQianNengDan,_loc10_.mountAttributeInfo.dianfengqiannengDan);
         }
      }
      
      private function setMountAvatar(param1:PureMount) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $pMount:PureMount = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pMount.id + "_" + mount_avatar_zizeng)
            {
               return;
            }
            rankingListPanel.setRideAvatar(param2,$pMount.res.id_ico);
         };
         this.rankingListPanel.setRideAvatar(null,0);
         if(!$pMount)
         {
            return;
         }
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.mount_avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
      
      private function setCharAvatar(param1:PurePlayer) : void
      {
         var apdArr:Array;
         var callBack:Function = null;
         var $pPlayer:PurePlayer = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pPlayer.id + "_" + char_avatar_zizeng)
            {
               return;
            }
            rankingListPanel.setAvatar(param2);
            if($pPlayer.avatarInfo.needChangeAvatarXY)
            {
               rankingListPanel.setAvaterXY(true);
            }
         };
         this.rankingListPanel.setAvatar(null);
         if(!$pPlayer)
         {
            return;
         }
         apdArr = $pPlayer.avatarInfo.getSimpleAPDList($pPlayer.isOnMount,PartyType.getSexByParty($pPlayer.attributeInfo.partyID));
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.char_avatar_zizeng,callBack,apdArr);
      }
      
      private function setPurePlayer(param1:int, param2:int, param3:PurePlayer, param4:Array, param5:int = 0, param6:int = 0) : PurePlayer
      {
         var _loc10_:MountRes = null;
         var _loc11_:int = 0;
         var _loc12_:GoodsRes = null;
         var _loc7_:AttributeInfo = param3.attributeInfo;
         var _loc8_:AvatarInfo = param3.avatarInfo;
         _loc7_.partyID = param2;
         _loc8_.usingFashion = param5;
         _loc8_.useAvatarType = param6;
         if(param1 > 0)
         {
            if(_loc8_.usingFashion == 1)
            {
               _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
            }
            else if(_loc8_.useAvatarType > 0)
            {
               _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(param6)),AvatarPartType.MOUNT);
            }
            else
            {
               _loc10_ = MountResManager.getMountRes(param1);
               if(_loc10_ != null)
               {
                  param3.avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc10_.id_m),AvatarPartType.MOUNT);
               }
            }
            _loc8_.lastMountId = param1;
         }
         var _loc9_:int = 0;
         while(_loc9_ < param4.length)
         {
            _loc11_ = (param4[_loc9_] as Goods).id;
            _loc12_ = GoodsResManager.getGoodsRes(_loc11_);
            if(_loc12_ != null)
            {
               AvatarManager.dressAvatarData(_loc8_,_loc12_.position,_loc12_.id_m,_loc7_.getSex());
            }
            _loc9_++;
         }
         return param3;
      }
      
      private function get rankAttackMediator() : Rank_AttackPanelMediator
      {
         if(this._rankAttackMediator == null)
         {
            this._rankAttackMediator = facade.retrieveMediator(Rank_AttackPanelMediator.NAME) as Rank_AttackPanelMediator;
         }
         return this._rankAttackMediator;
      }
   }
}

