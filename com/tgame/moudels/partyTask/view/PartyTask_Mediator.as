package com.tgame.moudels.partyTask.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.monster.MonsterRes;
   import com.tgame.common.res.monster.MonsterResManager;
   import com.tgame.common.staticdata.BangzhongZhiwu;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.character.info.YabiaoInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.partyTask.PartyTask_ApplicationFacade;
   import com.tgame.moudels.partyTask.model.PartyTask_MsgSenderProxy;
   import com.tgame.shell.view.components.Party_taskPanel;
   import com.tgame.shell.view.components.party.PartyBoss_TiJiaoJingPo;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.setTimeout;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class PartyTask_Mediator extends Mediator
   {
      
      public static const NAME:String = "PartyTask_Mediator";
      
      public var biaoCheInfo_group:Array;
      
      public var biaoCheInfo_single:Array;
      
      public var biaoCheInfo_groupIsUpdata:Boolean = false;
      
      public var biaoCheInfo_singleIsUpdata:Boolean = false;
      
      private var avatar_zizeng:int = 0;
      
      private var _commitJingpoPanel:PartyBoss_TiJiaoJingPo;
      
      private var _commitJingpoArr:Array = [];
      
      private var good:Goods;
      
      private var _senderProxy:PartyTask_MsgSenderProxy;
      
      public function PartyTask_Mediator()
      {
         super(NAME);
      }
      
      public function get partyTaskPanel() : Party_taskPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.partyTaskPanel);
         }
         return viewComponent as Party_taskPanel;
      }
      
      private function get senderProxy() : PartyTask_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(PartyTask_MsgSenderProxy.NAME) as PartyTask_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [PartyTask_ApplicationFacade.OPEN_JIE_YABIAO_PANEL,PartyTask_ApplicationFacade.FANGQI_YABIAO_TASK,PartyTask_ApplicationFacade.ENTER_SCENE,PartyTask_ApplicationFacade.QINGIUCHENGCHISHIZHI_CHAKANXINXI_FANYE,PartyTask_ApplicationFacade.QINGQIUJIHUO_LONGMAI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc2_:int = int(param1.getBody());
         switch(param1.getName())
         {
            case PartyTask_ApplicationFacade.OPEN_JIE_YABIAO_PANEL:
               if(_loc2_ == -1)
               {
                  if(Boolean(this.biaoCheInfo_single) && this.biaoCheInfo_singleIsUpdata == false)
                  {
                     this.partyTaskPanel.setSingleData(this.biaoCheInfo_single);
                  }
                  else
                  {
                     setTimeout(this.senderProxy.send_53731,300,-1);
                     this.biaoCheInfo_singleIsUpdata = false;
                  }
                  this.partyTaskPanel.showPanel(1,true);
               }
               else
               {
                  if(Boolean(this.biaoCheInfo_group) && this.biaoCheInfo_groupIsUpdata == false)
                  {
                     this.partyTaskPanel.setGroupData(this.biaoCheInfo_group);
                  }
                  else
                  {
                     setTimeout(this.senderProxy.send_53731,300,-2);
                     this.biaoCheInfo_groupIsUpdata = false;
                  }
                  this.partyTaskPanel.showPanel(2,true);
               }
               break;
            case PartyTask_ApplicationFacade.FANGQI_YABIAO_TASK:
               this.senderProxy.send_53747(_loc2_);
               break;
            case PartyTask_ApplicationFacade.ENTER_SCENE:
               if(GameInstance.uiInstance._popMapPanel != null)
               {
                  GameInstance.uiInstance.popMapPanel.setBiaoChe();
               }
               break;
            case PartyTask_ApplicationFacade.QINGIUCHENGCHISHIZHI_CHAKANXINXI_FANYE:
               _loc3_ = param1.getBody() as Array;
               this.senderProxy.send_71019(_loc3_);
               break;
            case PartyTask_ApplicationFacade.QINGQIUJIHUO_LONGMAI:
               _loc4_ = param1.getBody() as int;
               this.senderProxy.send_71033(_loc4_);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(Party_taskPanel,function():void
         {
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_SHOW_GERENYUNBIAO,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_SHOW_BANGHUIYUBIAO,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_SHOW_BIAOCHENAME_SHENGJI,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_SHOW_PARTY_BOSS,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_GERENJIEQURENWU_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_TOBIAOQJU_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_BIAOCHENAME_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_SHENGJIBIAOCHE_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_PARTYBOSS_JINGHUN_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_PARTYBOSS_FUBEN_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYBOSS_CHENGGONGLV_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYBOSS_COMMITJINGPO_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYBOSS_JIDIAN_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYBOSS_JINGPO_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYBOSS_YAOQING_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_PARTYBOSS_CHALLENGE,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYBOSS_LIST_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_SHOW_PARTY_RONGYU,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_RONGYU_CHENGCHI_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_RONGYU_SHIZHI_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_RONGYU_LONGMAI_CLICK,uiHandle);
            partyTaskPanel.addEventListener(Party_taskPanel.UI_PARTYTASK_RONGYU_JINRU_CLICK,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Party_taskPanel,function():void
         {
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_SHOW_GERENYUNBIAO,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_SHOW_BANGHUIYUBIAO,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_SHOW_BIAOCHENAME_SHENGJI,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_SHOW_PARTY_BOSS,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_GERENJIEQURENWU_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_TOBIAOQJU_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_BIAOCHENAME_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_SHENGJIBIAOCHE_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_PARTYBOSS_JINGHUN_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_PARTYBOSS_FUBEN_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYBOSS_CHENGGONGLV_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYBOSS_COMMITJINGPO_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYBOSS_JIDIAN_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYBOSS_JINGPO_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYBOSS_YAOQING_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_PARTYBOSS_CHALLENGE,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYBOSS_LIST_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_SHOW_PARTY_RONGYU,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_RONGYU_CHENGCHI_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_RONGYU_SHIZHI_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_RONGYU_LONGMAI_CLICK,uiHandle);
            partyTaskPanel.removeEventListener(Party_taskPanel.UI_PARTYTASK_RONGYU_JINRU_CLICK,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var data:Object = null;
         var arr:Array = null;
         var arr2:Array = null;
         var itemFace:ItemFace = null;
         var index:int = 0;
         var ar:Array = null;
         var m:int = 0;
         var monsterRes:MonsterRes = null;
         var cgl:int = 0;
         var num:int = 0;
         var bo:Boolean = false;
         var sendArr:Array = null;
         var goods:Goods = null;
         var e:Event = param1;
         var type:String = e.type;
         data = (e as BaseEvent).data;
         switch(type)
         {
            case Party_taskPanel.UI_PARTYTASK_SHOW_GERENYUNBIAO:
               if(Boolean(this.biaoCheInfo_single) && Boolean(this.biaoCheInfo_single.length > 0) && this.biaoCheInfo_singleIsUpdata == false)
               {
                  this.partyTaskPanel.setSingleData(this.biaoCheInfo_single);
               }
               else
               {
                  this.senderProxy.send_53731(-1);
                  this.biaoCheInfo_singleIsUpdata = false;
               }
               this.partyTaskPanel.showPanel(1);
               break;
            case Party_taskPanel.UI_PARTYTASK_SHOW_BANGHUIYUBIAO:
               if(GameInstance.mainCharData.banghuiInfo.zhiwu == BangzhongZhiwu.ZW1)
               {
                  if(Boolean(this.biaoCheInfo_group) && Boolean(this.biaoCheInfo_group.length > 0) && this.biaoCheInfo_groupIsUpdata == false)
                  {
                     this.partyTaskPanel.setGroupData(this.biaoCheInfo_group);
                  }
                  else
                  {
                     this.senderProxy.send_53731(-2);
                     this.biaoCheInfo_groupIsUpdata = false;
                  }
                  this.partyTaskPanel.showPanel(2);
               }
               else
               {
                  this.partyTaskPanel.tabBar.recoverBtnState();
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有帮主才能查看与升级镖车"));
               }
               break;
            case Party_taskPanel.UI_PARTYTASK_SHOW_BIAOCHENAME_SHENGJI:
               if(GameInstance.mainCharData.banghuiInfo.zhiwu == BangzhongZhiwu.ZW1)
               {
                  this.partyTaskPanel.showPanel(3);
                  this.senderProxy.send_53751();
               }
               else
               {
                  this.partyTaskPanel.tabBar.recoverBtnState();
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有帮主才能查看与升级镖车"));
               }
               break;
            case Party_taskPanel.UI_PARTYTASK_SHOW_PARTY_BOSS:
               this.partyTaskPanel.showPanel(4);
               this.senderProxy.send_51201();
               break;
            case Party_taskPanel.UI_PARTYTASK_GERENJIEQURENWU_CLICK:
               arr = data as Array;
               this.senderProxy.send_53733(arr);
               break;
            case Party_taskPanel.UI_PARTYTASK_TOBIAOQJU_CLICK:
               MainCharSeachPathManager.mainCharWalk(YabiaoInfo.ACCEPT_NPC_ID);
               break;
            case Party_taskPanel.UI_PARTYTASK_BIAOCHENAME_CLICK:
               arr2 = data as Array;
               this.senderProxy.send_53753(arr2);
               break;
            case Party_taskPanel.UI_PARTYTASK_SHENGJIBIAOCHE_CLICK:
               this.senderProxy.send_53755(data);
               break;
            case Party_taskPanel.UI_PARTYTASK_PARTYBOSS_JINGHUN_CLICK:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               PipeManager.sendMsg(PipeConstants.USE_BAG,0);
               this._commitJingpoPanel = GameInstance.uiInstance.partyTaskPanel.showJingPoPanel();
               ResizeManager.showDoublePanel(this._commitJingpoPanel,GameInstance.uiInstance.backpack);
               this._commitJingpoPanel.addEventListener(Event.REMOVED_FROM_STAGE,function close1(param1:Event):void
               {
                  _commitJingpoPanel.removeEventListener(Event.REMOVED_FROM_STAGE,close1);
                  ResizeManager.hideDoublePanel();
                  _commitJingpoArr.length = 0;
                  _commitJingpoPanel.setItem(_commitJingpoArr);
                  resumMouseStatus();
                  PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               });
               GameInstance.uiInstance.backpack.addEventListener(Event.REMOVED_FROM_STAGE,function close2(param1:Event):void
               {
                  GameInstance.uiInstance.backpack.removeEventListener(Event.REMOVED_FROM_STAGE,close2);
                  ResizeManager.hideDoublePanel();
               });
               TCursorManager.chickItemToPanelFun = function(param1:ItemFace):void
               {
                  var _loc3_:int = 0;
                  var _loc2_:Goods = param1.getItem() as Goods;
                  if(_loc2_.id >= 15000 && _loc2_.id <= 15016)
                  {
                     _commitJingpoPanel = GameInstance.uiInstance.partyTaskPanel.showJingPoPanel();
                     _loc3_ = _commitJingpoArr.indexOf(_loc2_);
                     if(_commitJingpoArr.length > 5)
                     {
                        NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("最多只可提交六个BOSS精魄"),false);
                        NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("最多只可提交六个BOSS精魄"),false);
                     }
                     else
                     {
                        if(_loc3_ == -1)
                        {
                           _commitJingpoArr.push(_loc2_);
                        }
                        if(_commitJingpoPanel != null)
                        {
                           _commitJingpoPanel.setItem(_commitJingpoArr);
                        }
                     }
                     return;
                  }
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该道具不是精魄"),false);
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("该道具不是精魄"),false);
               };
               TCursorManager.showCursor(TCursorManager.CURSOR_XUANZELINGPAI,true);
               TCursorManager.seleteItemOnOtherPanel();
               TCursorManager.lockOnMouseStatus();
               break;
            case Party_taskPanel.UI_PARTYBOSS_JINGPO_CLICK:
               itemFace = data as ItemFace;
               index = this._commitJingpoArr.indexOf(itemFace.getItem());
               if(index != -1)
               {
                  this._commitJingpoArr.splice(index,1);
               }
               if(this._commitJingpoPanel != null)
               {
                  this._commitJingpoPanel.setItem(this._commitJingpoArr);
               }
               break;
            case Party_taskPanel.UI_PARTYBOSS_COMMITJINGPO_CLICK:
               if(this._commitJingpoArr.length > 0 && this._commitJingpoArr.length < 7)
               {
                  sendArr = [];
                  for each(goods in this._commitJingpoArr)
                  {
                     sendArr.push(goods.position);
                  }
                  sendArr.push(this._commitJingpoArr.length);
                  this.senderProxy.send_51213(sendArr);
                  break;
               }
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("最多只可提交六个BOSS精魄"),false);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("最多只可提交六个BOSS精魄"),false);
               return;
               break;
            case Party_taskPanel.UI_PARTYTASK_PARTYBOSS_CHALLENGE:
               this.senderProxy.send_51203(data);
               break;
            case Party_taskPanel.UI_PARTYTASK_PARTYBOSS_FUBEN_CLICK:
               this.senderProxy.send_51207();
               break;
            case Party_taskPanel.UI_PARTYBOSS_LIST_CLICK:
               ar = data as Array;
               m = new int(ar[0].toString());
               monsterRes = MonsterResManager.getMonsterRes(m);
               if(monsterRes != null)
               {
                  this.setAvatar1(monsterRes);
               }
               break;
            case Party_taskPanel.UI_PARTYBOSS_CHENGGONGLV_CLICK:
               ar = data as Array;
               cgl = int(ar[1]);
               num = int(ar[0]);
               cgl += 5 * num;
               bo = Boolean(ar[3]);
               if(bo)
               {
                  this.partyTaskPanel.setChengGongLv(cgl);
               }
               break;
            case Party_taskPanel.UI_PARTYBOSS_JIDIAN_CLICK:
               ar = data as Array;
               this.senderProxy.send_51205(ar);
               break;
            case Party_taskPanel.UI_PARTYTASK_SHOW_PARTY_RONGYU:
               this.partyTaskPanel.showPanel(5);
               this.senderProxy.send_71015();
               this.senderProxy.send_71017(1);
               break;
            case Party_taskPanel.UI_PARTYTASK_RONGYU_CHENGCHI_CLICK:
               this.senderProxy.send_71017(data);
               break;
            case Party_taskPanel.UI_PARTYTASK_RONGYU_SHIZHI_CLICK:
               arr = data as Array;
               this.senderProxy.send_71019(arr);
               PipeManager.sendMsg(PipeConstants.SHOW_JIANGSHANSHEJI_CHAKAN_PLANE);
               break;
            case Party_taskPanel.UI_PARTYTASK_RONGYU_LONGMAI_CLICK:
               this.senderProxy.send_71033(data);
               break;
            case Party_taskPanel.UI_PARTYTASK_RONGYU_JINRU_CLICK:
               PipeManager.sendMsg(PipeConstants.QINGQIUJINRU_HANGTUPAYE_ZHANCHANG,data);
         }
      }
      
      public function closePanel() : void
      {
         if(Fun.isVisible(this.partyTaskPanel))
         {
            this.partyTaskPanel.onClose();
         }
         if(Fun.isVisible(GameInstance.uiInstance.banghuiInfoPanel))
         {
            GameInstance.uiInstance.banghuiInfoPanel.onClose();
         }
      }
      
      public function initBossPanel(param1:Array, param2:Array, param3:Number, param4:int, param5:Boolean = false, param6:int = 0) : void
      {
         var _loc8_:Object = null;
         var _loc17_:* = undefined;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:int = 0;
         var _loc21_:String = null;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:String = null;
         var _loc25_:String = null;
         var _loc26_:Number = NaN;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:XML = null;
         var _loc7_:XML = <list/>;
         var _loc9_:int = int(param1.length);
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_)
         {
            _loc8_ = param1[_loc10_];
            _loc17_ = _loc10_;
            _loc18_ = _loc8_.id;
            _loc19_ = _loc8_.headImg;
            _loc20_ = int(_loc8_.bossid);
            _loc21_ = _loc8_.name;
            _loc22_ = int(_loc8_.lv);
            _loc23_ = int(_loc8_.chenggonglv);
            _loc23_ = _loc23_ / 100;
            _loc24_ = _loc8_.jineng;
            _loc25_ = _loc8_.zhenfa;
            _loc26_ = Number(_loc8_.cooper);
            _loc27_ = int(_loc8_.maxLv);
            _loc28_ = int(_loc8_.tiaozhan);
            _loc29_ = <node id={_loc20_} name={_loc21_} bigRes={_loc19_} grade={_loc22_} cgl={_loc23_} jn={_loc24_} zf={_loc25_} copper={_loc26_} maxLv={_loc27_} biaoshi={_loc18_} tiaozhan={_loc28_} xuhao={_loc17_}/>;
            _loc7_.appendChild(_loc29_);
            _loc10_++;
         }
         var _loc11_:Goods = new Goods(SpecialGoodsID.LING_BANGZHU);
         _loc11_.count = int(param2[0]);
         var _loc12_:Goods = new Goods(SpecialGoodsID.LING_QINGLONG);
         _loc12_.count = int(param2[1]);
         var _loc13_:Goods = new Goods(SpecialGoodsID.LING_BAIHU);
         _loc13_.count = int(param2[2]);
         var _loc14_:Goods = new Goods(SpecialGoodsID.LING_ZHUQUE);
         _loc14_.count = int(param2[3]);
         var _loc15_:Goods = new Goods(SpecialGoodsID.LING_XUANWUG);
         _loc15_.count = int(param2[4]);
         var _loc16_:Array = new Array();
         _loc16_ = [_loc11_,_loc12_,_loc13_,_loc14_,_loc15_];
         this.partyTaskPanel.initBossList(_loc7_,_loc16_,param3,param1.length,param4,param5,param6);
         if(param1.length == 0)
         {
            this.partyTaskPanel.setAvatar1(null);
         }
      }
      
      private function setAvatar1(param1:MonsterRes) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $mr:MonsterRes = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $mr.id_kind + "_" + avatar_zizeng)
            {
               return;
            }
            partyTaskPanel.setAvatar1(param2);
         };
         this.partyTaskPanel.setAvatar1(null);
         apdArr = [];
         apd = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,$mr.id_m));
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($mr.id_kind + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,0);
      }
      
      public function reMoveJingpo() : void
      {
         this._commitJingpoPanel.setItem(null);
      }
      
      public function showBossInvite() : void
      {
         this.partyTaskPanel.showPartyBossInvitePanel();
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      public function ChengChiList(param1:Array, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.partyTaskPanel.showRongYuPanel(param1,param2,param3,param4,param5);
      }
      
      public function ChengChiXinXi(param1:Object) : void
      {
         this.partyTaskPanel.showChengChiXinXi(param1);
      }
      
      public function ChengChiShiZhi(param1:int, param2:String, param3:Array, param4:int, param5:int) : void
      {
         this.partyTaskPanel.showChengChiShiZhi(param1,param2,param3,param4,param5);
      }
   }
}

