package com.tgame.moudels.equipPudding.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.equipPudding.EquipPudding_ApplicationFacade;
   import com.tgame.moudels.equipPudding.model.EquipPudding_MsgSendProxy;
   import com.tgame.moudels.equipPudding.view.panelOperctor.BaseStrengthen;
   import com.tgame.moudels.equipPudding.view.panelOperctor.EquipStrengthen;
   import com.tgame.moudels.equipPudding.view.panelOperctor.EquipStrengthenStrengthenLevel;
   import com.tgame.moudels.equipPudding.view.panelOperctor.ResetAppendAttribute;
   import com.tgame.moudels.equipPudding.view.panelOperctor.ResetStrengthenLevel;
   import com.tgame.moudels.equipPudding.view.panelOperctor.StoneFuse;
   import com.tgame.shell.view.components.EquipPuddingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_MainCharEquipPuddingPanelMediator extends Mediator
   {
      
      public static const NAME:String = "UI_MainCharEquipPuddingPanelMediator";
      
      private var _msgSenderProxy:EquipPudding_MsgSendProxy;
      
      private var loaderBufTimer:Timer;
      
      public function UI_MainCharEquipPuddingPanelMediator()
      {
         super(NAME);
      }
      
      public function upDataItem(param1:int, param2:int) : void
      {
         if(param1 != 5)
         {
            BaseStrengthen.removeLoaderBuff();
         }
         else
         {
            if(this.loaderBufTimer)
            {
               this.loaderBufTimer.stop();
            }
            this.loaderBufTimer = new Timer(300,1);
            this.loaderBufTimer.start();
            this.loaderBufTimer.addEventListener(TimerEvent.TIMER,this.loadBuffTime);
         }
         if(!Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
         {
            this.panelClose();
            return;
         }
         if(param1 == 0)
         {
            return;
         }
         if(param2 != 2)
         {
            if(param2 == 1)
            {
               TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_SU);
            }
            else
            {
               TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
            }
         }
         this.brushItem(param2);
         PipeManager.sendMsg(PipeConstants.EQUIP_QIANGHUA_SUCCESS);
      }
      
      public function setExpendGasAndProbability(param1:Object) : void
      {
         var _loc2_:Goods = null;
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW)
         {
            EquipStrengthen.getEquipStrengthen().setExpendGasAndProbability(param1);
            this.viewEquipPanel(true,param1.useItemNum);
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW)
         {
            ResetAppendAttribute.getResetAppendAttribute().setExpendGasAndProbability(param1);
            this.viewResetAppendAttributePanel(true,param1.useItemNum);
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW)
         {
            StoneFuse.getStoneFuse().setExpendGasAndProbability(param1);
            _loc2_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
            if(_loc2_)
            {
               this.equipPuddingPanel.setStoneFuseLuckMaterial(_loc2_);
            }
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW)
         {
            ResetStrengthenLevel.getResetStrengthenLevel().setExpendGasAndProbability(param1);
            this.viewResetStrengthenLevelPanel(true,param1.useItemNum);
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW)
         {
            EquipStrengthenStrengthenLevel.getEquipStrengthenStrengthenLevel().setExpendGasAndProbability(param1);
            this.viewEquieStrengthenLevelPanel(true,param1.useItemNum);
         }
      }
      
      public function stoneSelete(param1:Array) : void
      {
         StoneFuse.getStoneFuse().stoneSelete(param1);
      }
      
      public function isResetStrengthenLevel(param1:String, param2:String) : void
      {
         ResetStrengthenLevel.getResetStrengthenLevel().isResetStrengthenLevel(param1,param2);
      }
      
      private function get msgSenderProxy() : EquipPudding_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(EquipPudding_MsgSendProxy.NAME) as EquipPudding_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function loadBuffTime(param1:TimerEvent) : void
      {
         this.loaderBufTimer = null;
         BaseStrengthen.removeLoaderBuff();
      }
      
      protected function get equipPuddingPanel() : EquipPuddingPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.equipPuddingPanel);
            EquipStrengthen.getEquipStrengthen();
            ResetStrengthenLevel.getResetStrengthenLevel();
            ResetAppendAttribute.getResetAppendAttribute();
            StoneFuse.getStoneFuse();
            BaseStrengthen.sendMsgFun = this.msgSenderProxy;
         }
         return viewComponent as EquipPuddingPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [EquipPudding_ApplicationFacade.NEW_ITEM_TO_BACKPACK,EquipPudding_ApplicationFacade.SHOW_EQUIP_PUDDING_PLANE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Goods = null;
         var _loc4_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case EquipPudding_ApplicationFacade.NEW_ITEM_TO_BACKPACK:
               if(BaseStrengthen.isStrengthenIng)
               {
                  return;
               }
               if(!Fun.isVisible(this.equipPuddingPanel))
               {
                  return;
               }
               _loc3_ = _loc2_ as Goods;
               if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW)
               {
                  if(_loc3_.id == SpecialGoodsID.JINGANGSHI_ID || _loc3_.id == SpecialGoodsID.XINGYUNJING_ID)
                  {
                     EquipStrengthen.getEquipStrengthen().getbackItem();
                  }
               }
               if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW)
               {
                  if(_loc3_.id == SpecialGoodsID.JINGLIANSHI_ID || _loc3_.id == SpecialGoodsID.XINGYUNJING_ID)
                  {
                     ResetAppendAttribute.getResetAppendAttribute().getbackItem();
                  }
               }
               if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW)
               {
                  if(_loc3_.id == SpecialGoodsID.XILIANSHI_ID || _loc3_.id == SpecialGoodsID.XINGYUNJING_ID)
                  {
                     ResetStrengthenLevel.getResetStrengthenLevel().getbackItem();
                  }
               }
               if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW)
               {
                  if(_loc3_.id == SpecialGoodsID.XINGYUNJING_ID)
                  {
                     StoneFuse.getStoneFuse().getbackItem();
                  }
               }
               if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW)
               {
                  if(_loc3_.id == SpecialGoodsID.YANGTIANSHI_ID)
                  {
                     EquipStrengthenStrengthenLevel.getEquipStrengthenStrengthenLevel().getbackItem();
                  }
               }
               break;
            case EquipPudding_ApplicationFacade.SHOW_EQUIP_PUDDING_PLANE:
               if(_loc2_)
               {
                  _loc4_ = _loc2_ as int;
                  if(_loc4_ == 1)
                  {
                     BaseStrengthen.nowPanelType = EquipPuddingPanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW;
                     this.viewEquipPanel(false,0,true);
                  }
                  if(_loc4_ == 2)
                  {
                     BaseStrengthen.nowPanelType = EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW;
                     this.viewResetStrengthenLevelPanel(false,0,true);
                  }
                  if(_loc4_ == 3)
                  {
                     BaseStrengthen.nowPanelType = EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW;
                     this.viewResetAppendAttributePanel(false,0,true);
                  }
               }
               else
               {
                  this.viewEquipPanel();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(EquipPuddingPanel,function():void
         {
            equipPuddingPanel.addEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW,mainCharEquipPuddingHandle);
            equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW,mainCharEquipPuddingHandle);
            equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW,mainCharEquipPuddingHandle);
            equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW,mainCharEquipPuddingHandle);
            equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW,mainCharEquipPuddingHandle);
            equipPuddingPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
            equipPuddingPanel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(EquipPuddingPanel,function():void
         {
            equipPuddingPanel.removeEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            equipPuddingPanel.removeEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW,mainCharEquipPuddingHandle);
            equipPuddingPanel.removeEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW,mainCharEquipPuddingHandle);
            equipPuddingPanel.removeEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW,mainCharEquipPuddingHandle);
            equipPuddingPanel.removeEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW,mainCharEquipPuddingHandle);
            equipPuddingPanel.removeEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW,mainCharEquipPuddingHandle);
            equipPuddingPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            equipPuddingPanel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      public function panelClose(param1:* = null) : void
      {
         if(BaseStrengthen.isStrengthenIng)
         {
            return;
         }
         BaseStrengthen.xingYunJingNum = 0;
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW)
         {
            EquipStrengthen.getEquipStrengthen().panelClose();
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW)
         {
            ResetStrengthenLevel.getResetStrengthenLevel().panelClose();
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW)
         {
            ResetAppendAttribute.getResetAppendAttribute().panelClose();
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW)
         {
            StoneFuse.getStoneFuse().panelClose();
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW)
         {
            EquipStrengthenStrengthenLevel.getEquipStrengthenStrengthenLevel().panelClose();
         }
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         if(BaseStrengthen.nowPanelType == param1.type)
         {
            return;
         }
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               ResizeManager.showDoublePanel(this.equipPuddingPanel,GameInstance.uiInstance.backpack);
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW:
               BaseStrengthen.nowPanelType = param1.type;
               this.viewEquipPanel();
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW:
               BaseStrengthen.nowPanelType = param1.type;
               this.viewResetAppendAttributePanel();
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW:
               BaseStrengthen.nowPanelType = param1.type;
               this.viewStonePanel();
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW:
               BaseStrengthen.nowPanelType = param1.type;
               this.viewResetStrengthenLevelPanel();
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW:
               BaseStrengthen.nowPanelType = param1.type;
               this.viewEquieStrengthenLevelPanel();
         }
      }
      
      private function viewEquieStrengthenLevelPanel(param1:Boolean = false, param2:int = 0, param3:Boolean = false) : void
      {
         var _loc6_:Boolean = false;
         var _loc4_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.YANGTIANSHI_ID,true,true);
         if(_loc4_.count == 0)
         {
            BaseStrengthen.isBind = 0;
         }
         else
         {
            BaseStrengthen.isBind = 1;
         }
         _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.YANGTIANSHI_ID,true);
         if(!param1)
         {
            PipeManager.sendMsg(PipeConstants.USE_BAG,1);
            this.equipPuddingPanel.showInnateAttributePanel(param3);
            this.panelClose();
            _loc4_.count = 0;
         }
         var _loc5_:int = _loc4_.count;
         _loc4_.count = param2;
         if(param2 == 0)
         {
            _loc6_ = true;
         }
         else if(_loc5_ < param2)
         {
            _loc6_ = true;
         }
         else
         {
            _loc6_ = false;
         }
         if(GameInstance.mainCharData.buffInfo.hasBuff(OtherConst.BUFF_YANGTIANMIJI))
         {
            _loc6_ = false;
         }
         this.equipPuddingPanel.seInnateAttributeEnergyExpendItem(_loc6_,_loc4_);
      }
      
      private function viewEquipPanel(param1:Boolean = false, param2:int = 0, param3:Boolean = false) : void
      {
         var _loc7_:Boolean = false;
         var _loc4_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true,true);
         if(_loc4_.count == 0)
         {
            BaseStrengthen.isXingYunJingBind = 0;
         }
         else
         {
            BaseStrengthen.isXingYunJingBind = 1;
         }
         _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
         var _loc5_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.JINGANGSHI_ID,true,true);
         if(_loc5_.count == 0)
         {
            BaseStrengthen.isBind = 0;
         }
         else
         {
            BaseStrengthen.isBind = 1;
         }
         _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JINGANGSHI_ID,true);
         if(!param1)
         {
            PipeManager.sendMsg(PipeConstants.USE_BAG,1);
            this.panelClose();
            this.equipPuddingPanel.showEquipStrengthen(param3);
            _loc4_.count = 0;
            _loc5_.count = 0;
         }
         var _loc6_:int = _loc5_.count;
         _loc5_.count = param2;
         if(param2 == 0)
         {
            _loc7_ = true;
         }
         else if(_loc6_ < param2)
         {
            _loc7_ = true;
         }
         else
         {
            _loc7_ = false;
         }
         this.equipPuddingPanel.setEquipStrengthenEnergyExpendItem(_loc7_,_loc5_,_loc4_);
      }
      
      private function viewResetAppendAttributePanel(param1:Boolean = false, param2:int = 0, param3:Boolean = false) : void
      {
         var _loc7_:Boolean = false;
         var _loc4_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true,true);
         if(_loc4_.count == 0)
         {
            BaseStrengthen.isXingYunJingBind = 0;
         }
         else
         {
            BaseStrengthen.isXingYunJingBind = 1;
         }
         _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
         var _loc5_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.JINGLIANSHI_ID,true,true);
         if(_loc5_.count == 0)
         {
            BaseStrengthen.isBind = 0;
         }
         else
         {
            BaseStrengthen.isBind = 1;
         }
         _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JINGLIANSHI_ID,true);
         if(!param1)
         {
            PipeManager.sendMsg(PipeConstants.USE_BAG,1);
            this.equipPuddingPanel.showResetAppendAttribute(param3);
            this.panelClose();
            _loc4_.count = 0;
            _loc5_.count = 0;
         }
         var _loc6_:int = _loc5_.count;
         _loc5_.count = param2;
         if(param2 == 0)
         {
            _loc7_ = true;
         }
         else if(_loc6_ < param2)
         {
            _loc7_ = true;
         }
         else
         {
            _loc7_ = false;
         }
         if(GameState.gongneng104)
         {
            this.equipPuddingPanel.isShowFt(true);
         }
         else
         {
            this.equipPuddingPanel.isShowFt(false);
         }
         this.equipPuddingPanel.setResetAppendAttributeEnergyExpendItem(_loc7_,_loc5_,_loc4_);
      }
      
      private function viewResetStrengthenLevelPanel(param1:Boolean = false, param2:int = 0, param3:Boolean = false) : void
      {
         var _loc7_:Boolean = false;
         var _loc4_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true,true);
         if(_loc4_.count == 0)
         {
            BaseStrengthen.isXingYunJingBind = 0;
         }
         else
         {
            BaseStrengthen.isXingYunJingBind = 1;
         }
         _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
         var _loc5_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.XILIANSHI_ID,true);
         if(_loc5_.count == 0)
         {
            BaseStrengthen.isBind = 0;
         }
         else
         {
            BaseStrengthen.isBind = 1;
         }
         _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XILIANSHI_ID,true);
         if(!param1)
         {
            PipeManager.sendMsg(PipeConstants.USE_BAG,1);
            this.equipPuddingPanel.showResetStrengthenLevel(param3);
            this.panelClose();
            _loc4_.count = 0;
            _loc5_.count = 0;
         }
         var _loc6_:int = _loc5_.count;
         _loc5_.count = param2;
         if(param2 == 0)
         {
            _loc7_ = true;
         }
         else if(_loc6_ < param2)
         {
            _loc7_ = true;
         }
         else
         {
            _loc7_ = false;
         }
         this.equipPuddingPanel.setResetStrengthenLevelEnergyExpendItem(_loc7_,_loc5_,_loc4_);
      }
      
      private function viewStonePanel(param1:Boolean = false) : void
      {
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
         if(!param1)
         {
            PipeManager.sendMsg(PipeConstants.USE_BAG,1);
            this.equipPuddingPanel.showStoneFuse();
            this.panelClose();
            _loc2_.count = 0;
         }
         this.equipPuddingPanel.setStoneFuseLuckMaterial(_loc2_);
      }
      
      private function brushItem(param1:int) : void
      {
         var _loc2_:Goods = null;
         if(param1 == 2)
         {
            return;
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW)
         {
            BaseStrengthen.sendMsgFun.send_50125(BaseStrengthen.tempData);
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW)
         {
            if(param1 == 3)
            {
               ResetStrengthenLevel.getResetStrengthenLevel().panelClose();
            }
            else
            {
               BaseStrengthen.sendMsgFun.send_50125(BaseStrengthen.tempData);
            }
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW)
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(BaseStrengthen.tempData.XY);
            ResetAppendAttribute.getResetAppendAttribute().itemToPanel(_loc2_,true);
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW)
         {
            this.viewStonePanel(true);
            StoneFuse.getStoneFuse().getbackItem();
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW)
         {
            this.viewEquieStrengthenLevelPanel(true);
            BaseStrengthen.sendMsgFun.send_50125(BaseStrengthen.tempData);
         }
      }
   }
}

