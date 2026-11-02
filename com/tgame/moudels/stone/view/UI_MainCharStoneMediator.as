package com.tgame.moudels.stone.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.equipMosaic.EquipMosaic;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.stone.Stone_ApplicationFacade;
   import com.tgame.moudels.stone.model.Stone_MsgSendProxy;
   import com.tgame.shell.view.components.StonePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_MainCharStoneMediator extends Mediator
   {
      
      public static var loaderBuff:LoadBuffer;
      
      public static const NAME:String = "UI_MainCharStoneMediator";
      
      private var stone:Goods;
      
      private var stone2:Goods;
      
      private var equip:Goods;
      
      private var xingYunJingNum:int = 0;
      
      private var gaiLv:int = 0;
      
      private var zhenQi:int = 0;
      
      private var itemres:int = 0;
      
      private var panelType:String = "";
      
      private var isUseYuZao:Boolean;
      
      private var kill:int;
      
      private var isHpAdd100BtnClick:Boolean;
      
      private var willStoneID:int;
      
      private var isBandStonePlayer:Boolean = false;
      
      private var _sendMsg:Stone_MsgSendProxy;
      
      public function UI_MainCharStoneMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get stonePanel() : StonePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.stonePanel);
         }
         return viewComponent as StonePanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Stone_ApplicationFacade.NEW_ITEM_TO_BACKPACK,Stone_ApplicationFacade.SYNTHESIZE_NOT_ITEM,Stone_ApplicationFacade.EXPENDGAS_AND_PROBABILITY,Stone_ApplicationFacade.CLOSE_STONE_LOAD_BUFF,Stone_ApplicationFacade.SHOW_STONE_PLANE,Stone_ApplicationFacade.SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE,Stone_ApplicationFacade.ITEM_SWAP_OR_MOVE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:Goods = null;
         var _loc6_:Goods = null;
         var _loc7_:Goods = null;
         var _loc8_:Array = null;
         var _loc9_:Goods = null;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Stone_ApplicationFacade.EXPENDGAS_AND_PROBABILITY:
               if(_loc2_.type == 8 && this.panelType == StonePanel.UI_STONE_PANEL_MAKE_SHOW)
               {
                  this.stonePanel.makeCanvas.setStone(this.stone,_loc2_.nextLevelItem);
                  this.gaiLv = _loc2_.gaiLv;
                  this.zhenQi = _loc2_.zhenQi;
                  this.stonePanel.makeCanvas.setData(this.zhenQi,this.gaiLv);
                  if(this.stone.bind)
                  {
                     _loc9_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.stone.id,true,true,2);
                  }
                  else
                  {
                     _loc9_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.stone.id,true,true,1);
                  }
                  _loc10_ = this.stone.bind == 0 ? LanResManager.getLanTextWords(this,"背包中同类型的绑定宝石同时参与合成") : LanResManager.getLanTextWords(this,"背包中同类型的非绑定宝石同时参与合成");
                  this.stonePanel.setBingStone(_loc9_,_loc10_,this.stone.bind == 0 ? true : false);
               }
            case Stone_ApplicationFacade.CLOSE_STONE_LOAD_BUFF:
               this.removeLoaderBuff();
               break;
            case Stone_ApplicationFacade.NEW_ITEM_TO_BACKPACK:
               if(!Fun.isVisible(this.stonePanel))
               {
                  return;
               }
               break;
            case Stone_ApplicationFacade.SHOW_STONE_PLANE:
               if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
               {
                  PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
               }
               if(loaderBuff)
               {
                  PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
                  return;
               }
               if(GameState.gongneng109)
               {
                  this.stonePanel.isShowExchangeLabel(true);
               }
               else
               {
                  this.stonePanel.isShowExchangeLabel(false);
               }
               if(GameState.gongneng110)
               {
                  this.stonePanel.isShowTimeMakeLabel(true);
               }
               else
               {
                  this.stonePanel.isShowTimeMakeLabel(false);
               }
               _loc6_ = _loc2_ as Goods;
               if(!_loc6_)
               {
                  return;
               }
               this.panelClose();
               this.stonePanel.tabBar.setCurrentButtonByLabel(LanResManager.getLanTextWords(this,"宝石合成"));
               this.panelType = StonePanel.UI_STONE_PANEL_MAKE_SHOW;
               this.stonePanel.showMackCanvas();
               this.itemres = GoodsKind.K6;
               this.stonePanel.makeCanvas.setResult([]);
               this.openBackpack();
               this.changeMouseStatus();
               this.itemToPanel(null,_loc6_);
               break;
            case Stone_ApplicationFacade.SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE:
               if(ReloginManager.isInKuafu)
               {
                  return;
               }
               _loc7_ = _loc2_ as Goods;
               if(!_loc7_)
               {
                  return;
               }
               if(Boolean(_loc7_) && Boolean(Fun.isVisible(this.stonePanel)) && this.panelType == StonePanel.UI_STONE_PANEL_INLAY_SHOW)
               {
                  this.itemres = GoodsKind.K2;
                  this.openBackpack();
                  this.changeMouseStatus();
                  this.itemToPanel(null,_loc7_);
                  this.mouseToNormal();
               }
               else if(Boolean(_loc7_) && Boolean(Fun.isVisible(this.stonePanel)) && this.panelType == StonePanel.UI_STONE_PANEL_ABRUPTION_SHOW)
               {
                  this.itemres = GoodsKind.K2;
                  this.openBackpack();
                  this.changeMouseStatus();
                  this.itemToPanel(null,_loc7_);
                  this.mouseToNormal();
               }
               else if(Fun.isVisible(this.stonePanel))
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请在已打开的宝石工艺面板中进行操作"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请在已打开的宝石工艺面板中进行操作"),false);
                  PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
               }
               break;
            case Stone_ApplicationFacade.ITEM_SWAP_OR_MOVE:
               _loc8_ = _loc2_ as Array;
               _loc11_ = 0;
               while(_loc11_ < _loc8_.length)
               {
                  if(this.equip)
                  {
                     if(_loc8_[_loc11_] == this.equip.position)
                     {
                        if(Fun.isVisible(this.stonePanel))
                        {
                           PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
                        }
                        this.panelClose(null,true);
                        return;
                     }
                  }
                  if(this.stone)
                  {
                     if(_loc8_[_loc11_] == this.stone.position)
                     {
                        if(Fun.isVisible(this.stonePanel))
                        {
                           PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
                        }
                        this.panelClose(null,true);
                        return;
                     }
                  }
                  if(this.stone2)
                  {
                     if(_loc8_[_loc11_] == this.stone2.position)
                     {
                        if(Fun.isVisible(this.stonePanel))
                        {
                           PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
                        }
                        this.panelClose(null,true);
                        return;
                     }
                  }
                  _loc11_++;
               }
               break;
            case Stone_ApplicationFacade.SYNTHESIZE_NOT_ITEM:
         }
      }
      
      public function isChangeStoneType(param1:int, param2:int) : void
      {
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID);
         var _loc4_:Array = this.selectStone(this.stone);
         if(param2 <= 4 || _loc4_ == null)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入5品或6品的宝石"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入5品或6品的宝石"),false);
            return;
         }
         if(!param1)
         {
            this.stonePanel.setChangeMaterial(_loc3_,false);
            this.willStoneID = _loc4_[0].id;
            this.stonePanel.setChangeStone(this.stone);
            this.stonePanel.setChangeStones(_loc4_);
            return;
         }
         if(param2 >= 5)
         {
            _loc3_ = new Goods(_loc3_.id);
            _loc3_.count = param2 == 5 ? 30 : 0;
         }
         this.willStoneID = _loc4_[0].id;
         this.stonePanel.setChangeMaterial(_loc3_,true);
         this.stonePanel.setChangeStone(this.stone);
         this.stonePanel.setChangeStones(_loc4_);
      }
      
      public function upDataItem(param1:String, param2:int, param3:* = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Goods = null;
         if(param2 == 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(param2 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
         }
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.removeLoaderBuff();
         if(!Fun.isVisible(GameInstance.uiInstance._stonePanel))
         {
            this.panelClose();
            return;
         }
         if(param1 == this.panelType && this.panelType == StonePanel.UI_STONE_PANEL_MAKE_SHOW && Boolean(this.stone))
         {
            _loc4_ = param3 as Array;
            _loc5_ = int(_loc4_[_loc4_.length - 1]);
            _loc4_.splice(_loc4_.length - 1,1);
            this.stonePanel.makeCanvas.setResult(_loc4_);
            _loc6_ = _loc4_[0];
            if((Boolean(_loc6_)) && _loc6_.count > 0)
            {
               _loc6_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc5_);
               this.itemToPanel(null,_loc6_);
            }
            else
            {
               this.stone = null;
               this.stonePanel.makeCanvas.setStone();
            }
         }
         if(Boolean(param1 == this.panelType && this.panelType == StonePanel.UI_STONE_PANEL_TIME_MAKE_SHOW) && Boolean(this.stone2) && Boolean(param3.type))
         {
            if(param3.index < 0)
            {
               return;
            }
            this.itemres = GoodsKind.K6;
            this.stone2 = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param3.index);
            this.isHpAdd100BtnClick = param3.type;
            this.itemToPanel(null,this.stone2);
         }
         if(Boolean(param1 == this.panelType && this.panelType == StonePanel.UI_STONE_PANEL_TIME_MAKE_SHOW) && Boolean(this.stone) && !param3.type)
         {
            if(param3.index < 0)
            {
               return;
            }
            this.itemres = GoodsKind.K6;
            this.stone = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param3.index);
            this.isHpAdd100BtnClick = param3.type;
            this.itemToPanel(null,this.stone);
         }
      }
      
      public function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         loaderBuff = LoadBuffer.show(GameInstance.uiInstance.stonePanel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(loaderBuff)
         {
            loaderBuff.close();
         }
         loaderBuff = null;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(StonePanel,function():void
         {
            stonePanel.addEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_SHOW,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_MAKE_SHOW,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_INLAY_SHOW,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_MAKE_PUT_STONE,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_MAKE_START,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_MAKE_GET_STONE,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_INLAY_GET_EQUIP,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_INLAY_GET_STONE,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_INLAY_LUCK_STONE_COUNT,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_INLAY_PUT_EQUIP,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_INLAY_PUT_STONE,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_INLAY_START,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_GET_EQUIP,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_LUCK_STONE_COUNT,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_PUT_EQUIP,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_START,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_YUZHAO_ISUSE,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_EXCHANGE_OK,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_EXCHANGE_SHOW,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_PUT,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_START,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_START,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_PUT,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_SHOW,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_GET,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_GET,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(StonePanel.UI_STONE_PANEL_MAKE_USE_BIND_STONE,mainCharEquipPuddingHandle);
            stonePanel.addEventListener(FCloseEvent.CLOSE,panelClose);
            stonePanel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(StonePanel,function():void
         {
            stonePanel.removeEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_SHOW,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_MAKE_SHOW,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_INLAY_SHOW,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_MAKE_PUT_STONE,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_MAKE_START,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_MAKE_GET_STONE,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_INLAY_GET_EQUIP,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_INLAY_GET_STONE,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_INLAY_LUCK_STONE_COUNT,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_INLAY_PUT_EQUIP,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_INLAY_PUT_STONE,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_INLAY_START,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_GET_EQUIP,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_LUCK_STONE_COUNT,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_PUT_EQUIP,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_START,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_ABRUPTION_YUZHAO_ISUSE,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_EXCHANGE_SHOW,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_EXCHANGE_OK,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_PUT,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_START,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_START,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_PUT,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_SHOW,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_GET,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_GET,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(StonePanel.UI_STONE_PANEL_MAKE_USE_BIND_STONE,mainCharEquipPuddingHandle);
            stonePanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            stonePanel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:* = null, param2:Boolean = false) : void
      {
         if(Boolean(loaderBuff) && !param2)
         {
            return;
         }
         this.replay();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
         this.panelType = "";
         if(param2)
         {
            this.removeLoaderBuff();
         }
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Goods = null;
         _loc2_ = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               ResizeManager.showDoublePanel(this.stonePanel,GameInstance.uiInstance.backpack);
               break;
            case StonePanel.UI_STONE_PANEL_MAKE_SHOW:
               this.panelClose();
               this.panelType = StonePanel.UI_STONE_PANEL_MAKE_SHOW;
               this.stonePanel.showMackCanvas();
               break;
            case StonePanel.UI_STONE_PANEL_EXCHANGE_SHOW:
               this.panelClose();
               this.panelType = StonePanel.UI_STONE_PANEL_EXCHANGE_SHOW;
               this.stonePanel.showExchange();
               this.stonePanel.setExchangeStone([new Goods(6501),new Goods(6502),new Goods(6503),new Goods(6504),new Goods(6505),new Goods(6506)]);
               break;
            case StonePanel.UI_STONE_PANEL_TIME_MAKE_SHOW:
               this.panelClose();
               this.panelType = StonePanel.UI_STONE_PANEL_TIME_MAKE_SHOW;
               this.stonePanel.showTimeMake();
               break;
            case StonePanel.UI_STONE_PANEL_MAKE_PUT_STONE:
               this.itemres = GoodsKind.K6;
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.stonePanel.makeCanvas.setResult([]);
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case StonePanel.UI_STONE_PANEL_MAKE_GET_STONE:
               this.replay();
               this.stonePanel.makeCanvas.setStone();
               this.stonePanel.makeCanvas.setResult([]);
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               break;
            case StonePanel.UI_STONE_PANEL_MAKE_USE_BIND_STONE:
               this.isBandStonePlayer = _loc2_.data as Boolean;
               if(!this.stone)
               {
                  return;
               }
               _loc3_.XY = this.stone.position;
               _loc3_.ID = this.stone.id;
               _loc3_.type = this.isBandStonePlayer ? 16 : 8;
               this.sendMsg.send_50125(_loc3_);
               break;
            case StonePanel.UI_STONE_PANEL_MAKE_START:
               this.stonePanel.makeCanvas.setResult([]);
               if(!this.stone)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入宝石"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入宝石"),false);
                  return;
               }
               if(!ItemPositionRange.inBag(this.stone.position))
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  return;
               }
               if(this.zhenQi > GameInstance.mainCharData.attributeInfo.gqNow)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("真气不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("真气不足"),false);
                  return;
               }
               if(this.stone.count < 3)
               {
                  if(!this.isBandStonePlayer)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"宝石不足3颗"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"宝石不足3颗"),false);
                     return;
                  }
                  _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.stone.id,true);
                  if(_loc6_.count < 3)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"宝石不足3颗"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"宝石不足3颗"),false);
                     return;
                  }
               }
               _loc3_.XY = this.stone.position;
               _loc3_.ID = this.stone.id;
               _loc3_.count = this.stone.count;
               _loc3_.isBandStonePlayer = this.isBandStonePlayer;
               this.addLoadBuffer();
               this.sendMsg.send_50193(_loc3_);
               SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("新宝石合成中");
               break;
            case StonePanel.UI_STONE_PANEL_EXCHANGE_OK:
               _loc5_ = _loc2_.data as int;
               this.sendMsg.send_50173({"id":_loc5_});
               break;
            case StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_PUT:
               this.isHpAdd100BtnClick = true;
               this.itemres = GoodsKind.K6;
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_GET:
               this.stone2 = null;
               this.stonePanel.setMakeStone(null);
               if(!this.stone)
               {
                  PipeManager.sendMsg(PipeConstants.USE_BAG,1);
                  this.resumMouseStatus();
               }
               break;
            case StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_START:
               if(Boolean(this.stone2) && Boolean(this.stone) && this.stone2.position == this.stone.position)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该宝石已被放入其他面板中"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该宝石已被放入其他面板中"),false);
                  return;
               }
               if(!this.stone2)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入6品宝石"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入6品宝石"),false);
                  return;
               }
               this.sendMsg.send_50167({
                  "index":this.stone2.position,
                  "ID":this.stone2.id
               });
               break;
            case StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_PUT:
               this.isHpAdd100BtnClick = false;
               this.itemres = GoodsKind.K6;
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_GET:
               this.stone = null;
               this.stonePanel.setChangeStone(null);
               if(!this.stone2)
               {
                  PipeManager.sendMsg(PipeConstants.USE_BAG,1);
                  this.resumMouseStatus();
               }
               break;
            case StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_START:
               if(Boolean(this.stone2) && Boolean(this.stone) && this.stone2.position == this.stone.position)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该宝石已被放入其他面板中"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该宝石已被放入其他面板中"),false);
                  return;
               }
               if(!this.stone)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入宝石"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入宝石"),false);
                  return;
               }
               this.willStoneID = _loc2_.data as int;
               this.sendMsg.send_50165({
                  "index":this.stone.position,
                  "ID":this.stone.id,
                  "willID":this.willStoneID
               });
         }
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc5_:Array = null;
         var _loc3_:Object = {};
         var _loc4_:Boolean = true;
         if(!param2)
         {
            param2 = param1.getBaseItem() as Goods;
         }
         if(param2)
         {
            if(!ItemPositionRange.inBag(param2.position))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               return;
            }
         }
         if(Boolean(param2) && Boolean(this.itemres == GoodsKind.K2) && EquipMosaic.getEquipMosaicData(param2.id) < 2)
         {
            _loc4_ = false;
         }
         if(Boolean(param2 && param2.res) && Boolean(param2.res.kind == this.itemres) && _loc4_)
         {
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            if(this.panelType == StonePanel.UI_STONE_PANEL_MAKE_SHOW)
            {
               this.stonePanel.makeCanvas.setStone();
               this.stone = param2;
               _loc3_.XY = param2.position;
               _loc3_.ID = param2.id;
               _loc3_.type = 8;
               this.sendMsg.send_50125(_loc3_);
               this.mouseToNormal();
            }
            if(this.panelType == StonePanel.UI_STONE_PANEL_TIME_MAKE_SHOW)
            {
               if(this.isHpAdd100BtnClick)
               {
                  this.stone2 = param2;
                  _loc5_ = this.selectStone2(this.stone2);
                  if(_loc5_ == null)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,"请放入6品的宝石");
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"请放入6品的宝石");
                     this.stone2 = null;
                     return;
                  }
                  this.stonePanel.setMakeStone(this.stone2);
               }
               else
               {
                  this.stone = param2;
                  _loc5_ = this.selectStone(this.stone);
                  if(_loc5_ == null)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"请放入5品或6品的宝石"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请放入5品或6品的宝石"),false);
                     this.stone = null;
                     return;
                  }
                  this.sendMsg.send_50163({
                     "index":this.stone.position,
                     "ID":this.stone.id
                  });
               }
            }
         }
         else if(param1)
         {
            if(this.itemres == GoodsKind.K6)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("该物品不是宝石"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该物品不是宝石"),false);
            }
            else if(this.itemres == GoodsKind.K2)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不是装备"),false);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不是装备"),false);
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
         ResizeManager.showDoublePanel(this.stonePanel,GameInstance.uiInstance.backpack);
      }
      
      private function replay() : void
      {
         this.stone = null;
         this.equip = null;
         this.stone2 = null;
         this.stonePanel.makeCanvas.setStone();
         this.stonePanel.setMakeStone(null);
         this.stonePanel.setChangeStone(null);
         this.stonePanel.setChangeMaterial(null,false);
         this.stonePanel.setBingStone();
         this.xingYunJingNum = 0;
         this.gaiLv = 0;
         this.zhenQi = 0;
         this.itemres = 0;
         this.kill = 0;
      }
      
      private function get sendMsg() : Stone_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Stone_MsgSendProxy.NAME) as Stone_MsgSendProxy;
         }
         return this._sendMsg;
      }
      
      private function selectStone(param1:Goods) : Array
      {
         var _loc5_:Array = null;
         var _loc8_:int = 0;
         var _loc2_:Array = [6501,6502,6503,6504,6505,6506];
         var _loc3_:Array = [6601,6602,6603,6604,6605,6606];
         var _loc4_:Array = [6701,6702,6703,6704,6705,6706];
         var _loc6_:Array = [];
         var _loc7_:int = param1.id;
         _loc8_ = _loc2_.indexOf(_loc7_);
         if(_loc8_ >= 0)
         {
            _loc2_.splice(_loc8_,1);
            _loc5_ = _loc2_;
         }
         _loc8_ = _loc3_.indexOf(_loc7_);
         if(_loc8_ >= 0)
         {
            _loc3_.splice(_loc8_,1);
            _loc5_ = _loc3_;
         }
         _loc8_ = _loc4_.indexOf(_loc7_);
         if(_loc8_ >= 0)
         {
            _loc4_.splice(_loc8_,1);
            _loc5_ = _loc4_;
         }
         if(!_loc5_)
         {
            return null;
         }
         _loc8_ = 0;
         while(_loc8_ < _loc5_.length)
         {
            _loc6_.push(new Goods(_loc5_[_loc8_]));
            _loc8_++;
         }
         return _loc6_;
      }
      
      private function selectStone2(param1:Goods) : Array
      {
         var _loc3_:Array = null;
         var _loc6_:int = 0;
         var _loc2_:Array = [6601,6602,6603,6604,6605,6606];
         var _loc4_:Array = [];
         var _loc5_:int = param1.id;
         _loc6_ = _loc2_.indexOf(_loc5_);
         if(_loc6_ >= 0)
         {
            _loc2_.splice(_loc6_,1);
            _loc3_ = _loc2_;
         }
         if(!_loc3_)
         {
            return null;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_.push(new Goods(_loc3_[_loc6_]));
            _loc6_++;
         }
         return _loc4_;
      }
   }
}

