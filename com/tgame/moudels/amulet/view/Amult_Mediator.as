package com.tgame.moudels.amulet.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.equipMosaic.EquipMosaic;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.amulet.model.Amult_MsgSenderProxy;
   import com.tgame.shell.view.components.AmuletPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Amult_Mediator extends Mediator
   {
      
      public static var loaderBuff:LoadBuffer;
      
      public static const NAME:String = "Amult_Mediator";
      
      private var panelType:String;
      
      private var huShenFu:Goods;
      
      private var useCopper:int;
      
      private var sheLiZi:Goods;
      
      private var xingYunJing:Goods;
      
      private var jingLianShi:Goods;
      
      private var gaiLv:int;
      
      private var useXingYunJingNum:int;
      
      private var useJingGangShiNum:int;
      
      private var nextItem:Goods;
      
      private var timer:Timer;
      
      private var _sendMsg:Amult_MsgSenderProxy;
      
      public function Amult_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get amultPanel() : AmuletPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.amuletPanel);
         }
         return viewComponent as AmuletPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      public function upDataComplete(param1:int, param2:int, param3:int) : void
      {
         if(!this.timer)
         {
            this.timer = new Timer(500,1);
            this.timer.start();
            this.timer.addEventListener(TimerEvent.TIMER,this.timerOvre);
         }
         if(param1 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
         }
         else
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(!Fun.isVisible(GameInstance.uiInstance._amuletPanel))
         {
            this.panelClose();
            return;
         }
         if(param3 == 52110 && this.panelType == AmuletPanel.UI_AMULET_PANEL_SHELIZI_SHOW)
         {
            this.itemToPanel(null,GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param2));
         }
         if(param3 == 52116 && this.panelType == AmuletPanel.UI_AMULET_PANEL_MAKE_SHOW)
         {
            this.itemToPanel(null,GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param2));
         }
         if(param3 == 52118 && this.panelType == AmuletPanel.UI_AMULET_PANEL_RESETGEST_SHOW)
         {
            this.itemToPanel(null,GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param2));
         }
      }
      
      public function setGL(param1:Object, param2:int) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:Goods = null;
         if(param1.isUpData != 1)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"不能升级或合成"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"不能升级或合成"),false);
            return;
         }
         if(param2 == 52108 && this.panelType == AmuletPanel.UI_AMULET_PANEL_SHELIZI_SHOW)
         {
            _loc4_ = param1.nextItem == 1 ? null : new Goods(param1.nextItem);
            if(_loc4_)
            {
               _loc4_.hushenfuIndex = this.sheLiZi.position;
               _loc4_.position = param1.positionID;
               _loc4_.roleID = -110;
            }
            this.amultPanel.setShelizi(this.sheLiZi,_loc4_);
            _loc3_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JU_LING_ZHU,true);
            this.amultPanel.setSheliziLingzhu(_loc3_.count,_loc3_);
            this.amultPanel.setSheliziData(this.useCopper = param1.money,param1.money > GameInstance.mainCharData.moneyInfo.copper ? false : true,this.useJingGangShiNum = param1.juNengNum,param1.juNengNum > _loc3_.count ? false : true,this.gaiLv = param1.gl);
         }
         if(param2 == 52112 && this.panelType == AmuletPanel.UI_AMULET_PANEL_MAKE_SHOW)
         {
            this.nextItem = param1.nextItem == 1 ? null : new Goods(param1.nextItem);
            if(this.nextItem)
            {
               this.nextItem.hushenfuIndex = this.huShenFu.position;
               this.nextItem.position = param1.positionID;
               this.nextItem.roleID = -110;
            }
            this.amultPanel.setHushenfu(this.huShenFu,this.nextItem);
            _loc3_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JU_LING_ZHU,true);
            this.amultPanel.setHushenfuLingzhu(_loc3_.count,_loc3_);
            this.amultPanel.setHushenfuData(this.useCopper = param1.money,param1.money > GameInstance.mainCharData.moneyInfo.copper ? false : true,this.useJingGangShiNum = param1.juNengNum,param1.juNengNum > _loc3_.count ? false : true,this.gaiLv = param1.gl);
         }
         if(param2 == 52114 && this.panelType == AmuletPanel.UI_AMULET_PANEL_RESETGEST_SHOW)
         {
            this.jingLianShi = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JINGLIANSHI_ID,true);
            this.xingYunJing = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
            this.amultPanel.setResetgestShelizi(this.sheLiZi);
            this.amultPanel.setResetgestMaterial(this.jingLianShi,this.xingYunJing);
            this.gaiLv = param1.gl;
            this.amultPanel.setResetgestData(this.useCopper = param1.money,param1.money > GameInstance.mainCharData.moneyInfo.copper ? false : true,this.useJingGangShiNum = param1.jingLianShiNum,param1.jingLianShiNum > this.jingLianShi.count ? false : true,param1.gl + this.useXingYunJingNum * OtherConst.XINGYUNJING_JILV < 100 ? int(param1.gl + this.useXingYunJingNum * OtherConst.XINGYUNJING_JILV) : 100);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(AmuletPanel,function():void
         {
            amultPanel.addEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_AMULET_PANEL_MAKE_GET_STONE,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_AMULET_PANEL_MAKE_PUT_STONE,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_AMULET_PANEL_MAKE_SHOW,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_AMULET_PANEL_MAKE_START,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_AMULET_PANEL_RESETGEST_SHOW,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_AMULET_PANEL_SHELIZI_SHOW,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_RESERGEST_PANEL_MAKE_GET_STONE,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_RESERGEST_PANEL_MAKE_PUT_STONE,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_RESERGEST_PANEL_MAKE_START,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_SHELIZI_PANEL_MAKE_GET_STONE,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_SHELIZI_PANEL_MAKE_PUT_STONE,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(AmuletPanel.UI_SHELIZI_PANEL_MAKE_START,mainCharEquipPuddingHandle);
            amultPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
            amultPanel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(AmuletPanel,function():void
         {
            amultPanel.removeEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_AMULET_PANEL_MAKE_GET_STONE,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_AMULET_PANEL_MAKE_PUT_STONE,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_AMULET_PANEL_MAKE_SHOW,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_AMULET_PANEL_MAKE_START,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_AMULET_PANEL_RESETGEST_SHOW,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_AMULET_PANEL_SHELIZI_SHOW,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_RESERGEST_PANEL_MAKE_GET_STONE,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_RESERGEST_PANEL_MAKE_PUT_STONE,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_RESERGEST_PANEL_MAKE_START,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_SHELIZI_PANEL_MAKE_GET_STONE,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_SHELIZI_PANEL_MAKE_PUT_STONE,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(AmuletPanel.UI_SHELIZI_PANEL_MAKE_START,mainCharEquipPuddingHandle);
            amultPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            amultPanel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:* = null) : void
      {
         this.replay();
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         var baseE:BaseEvent = null;
         var data:Object = null;
         var next:Function = null;
         var obj:Object = null;
         var glv:int = 0;
         var astr:String = null;
         var e:Event = param1;
         next = function(param1:FAlertEvent = null):void
         {
            if(!param1)
            {
               addLoadBuffer();
               sendMsg.send_52115(data);
               SynthesizeMsg.AmluteSmallLoadingBarMsg = LanResManager.getLanTextWords(this,"护身符合成中");
            }
            else if(param1.eventData == FAlert.OK)
            {
               addLoadBuffer();
               sendMsg.send_52115(data);
               SynthesizeMsg.AmluteSmallLoadingBarMsg = LanResManager.getLanTextWords(this,"护身符合成中");
            }
         };
         baseE = e as BaseEvent;
         data = {};
         switch(e.type)
         {
            case Event.ADDED_TO_STAGE:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               ResizeManager.showDoublePanel(this.amultPanel,GameInstance.uiInstance.backpack);
               break;
            case AmuletPanel.UI_AMULET_PANEL_MAKE_SHOW:
               this.panelClose();
               this.panelType = AmuletPanel.UI_AMULET_PANEL_MAKE_SHOW;
               this.amultPanel.showAmuletMakeCanvas();
               break;
            case AmuletPanel.UI_AMULET_PANEL_RESETGEST_SHOW:
               this.panelClose();
               this.panelType = AmuletPanel.UI_AMULET_PANEL_RESETGEST_SHOW;
               this.amultPanel.showResetGestCanvas();
               break;
            case AmuletPanel.UI_AMULET_PANEL_SHELIZI_SHOW:
               this.panelClose();
               this.panelType = AmuletPanel.UI_AMULET_PANEL_SHELIZI_SHOW;
               this.amultPanel.showSheliziMakeCanvas();
               break;
            case AmuletPanel.UI_AMULET_PANEL_MAKE_PUT_STONE:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case AmuletPanel.UI_AMULET_PANEL_MAKE_GET_STONE:
               this.replay();
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               this.panelType = AmuletPanel.UI_AMULET_PANEL_MAKE_SHOW;
               break;
            case AmuletPanel.UI_AMULET_PANEL_MAKE_START:
               if(!this.huShenFu)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入包裹中的护身符"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入包裹中的护身符"),false);
                  return;
               }
               if(!ItemPositionRange.inBag(this.huShenFu.position))
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入包裹中的护身符"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入包裹中的护身符"),false);
                  return;
               }
               if(this.useCopper > GameInstance.mainCharData.moneyInfo.copper)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"铜钱不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"铜钱不足"),false);
                  return;
               }
               data.xy = this.huShenFu.position;
               data.id = this.huShenFu.id;
               if(Boolean(this.nextItem) && this.nextItem.res.limit_grade > GameInstance.mainCharData.attributeInfo.lv)
               {
                  astr = "";
                  astr = LanResManager.getLanTextWords(this,"进结合成",[StaticValue.RED_HTML,this.nextItem.res.name]);
                  astr += LanResManager.getLanTextWords(this,"进结合成2",[StaticValue.GREEN_HTML,this.nextItem.res.limit_grade]);
                  FAlert.show(astr,LanResManager.getLanTextWords(this,"进阶"),2,next);
               }
               else
               {
                  next();
               }
               break;
            case AmuletPanel.UI_RESERGEST_PANEL_MAKE_GET_STONE:
               this.replay();
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               this.panelType = AmuletPanel.UI_AMULET_PANEL_RESETGEST_SHOW;
               break;
            case AmuletPanel.UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT:
               obj = baseE.data as Object;
               this.useXingYunJingNum = obj.isSetMaterial ? int(obj.num) : 0;
               glv = this.gaiLv + this.useXingYunJingNum * OtherConst.XINGYUNJING_JILV < 100 ? int(this.gaiLv + this.useXingYunJingNum * OtherConst.XINGYUNJING_JILV) : 100;
               this.amultPanel.setResetgestData(this.useCopper,this.useCopper > GameInstance.mainCharData.moneyInfo.copper ? false : true,this.useJingGangShiNum,this.useJingGangShiNum > this.jingLianShi.count ? false : true,glv);
               break;
            case AmuletPanel.UI_RESERGEST_PANEL_MAKE_PUT_STONE:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case AmuletPanel.UI_RESERGEST_PANEL_MAKE_START:
               if(!this.sheLiZi)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入舍利子"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入舍利子"));
                  return;
               }
               if(this.useCopper > GameInstance.mainCharData.moneyInfo.copper)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"铜钱不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"铜钱不足"),false);
                  return;
               }
               if(this.useJingGangShiNum > GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JINGLIANSHI_ID,true).count)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"精炼石不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"精炼石不足"),false);
                  return;
               }
               data.xy = this.sheLiZi.position;
               data.id = this.sheLiZi.id;
               data.xingyunJingNum = this.useXingYunJingNum;
               this.addLoadBuffer();
               this.sendMsg.send_52117(data);
               SynthesizeMsg.AmluteSmallLoadingBarMsg = LanResManager.getLanTextWords(this,"武功类型重置中");
               break;
            case AmuletPanel.UI_SHELIZI_PANEL_MAKE_GET_STONE:
               this.replay();
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               this.panelType = AmuletPanel.UI_AMULET_PANEL_SHELIZI_SHOW;
               break;
            case AmuletPanel.UI_SHELIZI_PANEL_MAKE_PUT_STONE:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case AmuletPanel.UI_SHELIZI_PANEL_MAKE_START:
               if(!this.sheLiZi)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入舍利子"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入舍利子"));
                  return;
               }
               if(this.useCopper > GameInstance.mainCharData.moneyInfo.copper)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"铜钱不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"铜钱不足"),false);
                  return;
               }
               data.xy = this.sheLiZi.position;
               data.id = this.sheLiZi.id;
               data.useJLJH = baseE.data;
               this.addLoadBuffer();
               this.sendMsg.send_52109(data);
               SynthesizeMsg.AmluteSmallLoadingBarMsg = LanResManager.getLanTextWords(this,"舍利子合成中");
         }
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc3_:Object = {};
         if(!param2)
         {
            param2 = param1.getBaseItem() as Goods;
         }
         if(param2)
         {
            if(!ItemPositionRange.inBag(param2.position))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入包裹中的物品"),false);
               return;
            }
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            if(this.panelType == AmuletPanel.UI_AMULET_PANEL_MAKE_SHOW)
            {
               if(EquipMosaic.getEquipMosaicData(param2.id) == 1 && param2.res.kind == GoodsKind.K2)
               {
                  this.huShenFu = param2;
                  _loc3_.xy = param2.position;
                  _loc3_.id = param2.id;
                  this.sendMsg.send_52111(_loc3_);
                  this.mouseToNormal();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不能放入"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不能放入"),false);
               }
            }
            if(this.panelType == AmuletPanel.UI_AMULET_PANEL_RESETGEST_SHOW)
            {
               if(SpecialGoodsID.isSheLiZi(param2.id))
               {
                  this.sheLiZi = param2;
                  _loc3_.xy = param2.position;
                  _loc3_.id = param2.id;
                  this.sendMsg.send_52113(_loc3_);
                  this.mouseToNormal();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不是舍利子"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不是舍利子"),false);
               }
            }
            if(this.panelType == AmuletPanel.UI_AMULET_PANEL_SHELIZI_SHOW)
            {
               if(SpecialGoodsID.isSheLiZi(param2.id))
               {
                  this.sheLiZi = param2;
                  _loc3_.xy = param2.position;
                  _loc3_.id = param2.id;
                  this.sendMsg.send_52107(_loc3_);
                  this.mouseToNormal();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不是舍利子"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不是舍利子"),false);
               }
            }
         }
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
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
      
      private function mouseToNormal() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = function a(param1:*):void
            {
            };
            TCursorManager.mouseToNormal();
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.amultPanel,GameInstance.uiInstance.backpack);
      }
      
      private function replay() : void
      {
         this.huShenFu = null;
         this.xingYunJing = null;
         this.jingLianShi = null;
         this.sheLiZi = null;
         this.panelType = "";
         this.useCopper = 0;
         this.gaiLv = 0;
         this.useXingYunJingNum = 0;
         this.useJingGangShiNum = 0;
         this.nextItem = null;
         this.amultPanel.setHushenfu();
         this.amultPanel.setHushenfuLingzhu();
         this.amultPanel.setResetgestMaterial();
         this.amultPanel.setResetgestShelizi();
         this.amultPanel.setShelizi();
         this.amultPanel.setSheliziLingzhu();
         this.resumMouseStatus();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
      }
      
      private function get sendMsg() : Amult_MsgSenderProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Amult_MsgSenderProxy.NAME) as Amult_MsgSenderProxy;
         }
         return this._sendMsg;
      }
      
      public function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         loaderBuff = LoadBuffer.show(GameInstance.uiInstance.amuletPanel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(loaderBuff)
         {
            loaderBuff.close();
         }
         loaderBuff = null;
      }
      
      private function timerOvre(param1:TimerEvent) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this.timerOvre);
         this.timer = null;
         this.removeLoaderBuff();
      }
   }
}

