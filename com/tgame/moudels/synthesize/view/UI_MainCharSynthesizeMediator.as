package com.tgame.moudels.synthesize.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.synthesize.Synthesize_ApplicationFacde;
   import com.tgame.moudels.synthesize.model.Synthesize_MsgSendProxy;
   import com.tgame.moudels.synthesize.view.panelOperctor.BaseSynthesize;
   import com.tgame.moudels.synthesize.view.panelOperctor.ExpBoxSynthesize;
   import com.tgame.moudels.synthesize.view.panelOperctor.equipSynthesize;
   import com.tgame.moudels.synthesize.view.panelOperctor.materialSynthesize;
   import com.tgame.moudels.synthesize.view.panelOperctor.stoneSynthesize;
   import com.tgame.shell.view.components.ItemSynthesizePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_MainCharSynthesizeMediator extends Mediator
   {
      
      public static const NAME:String = "UI_MainCharSynthesizeMediator";
      
      private var _msgSenderProxy:Synthesize_MsgSendProxy;
      
      public function UI_MainCharSynthesizeMediator()
      {
         super(NAME);
      }
      
      protected function get itemSynthesizePanel() : ItemSynthesizePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.itemSynthesizePanel);
            BaseSynthesize.sendMsgFun = this.msgSenderProxy;
            equipSynthesize.getEquipSynthesize();
            materialSynthesize.getMaterialSynthesize();
            stoneSynthesize.getStoneSynthesize();
            ExpBoxSynthesize.getExpBoxSynthesize();
         }
         return viewComponent as ItemSynthesizePanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Synthesize_ApplicationFacde.EXPENDGAS_AND_PROBABILITY,Synthesize_ApplicationFacde.CLOSE_SYNTHESIZE_LOAD_BUFF,Synthesize_ApplicationFacde.SYNTHESIZE_NOT_ITEML,Synthesize_ApplicationFacde.NEW_ITEM_TO_BACKPACK,Synthesize_ApplicationFacde.SHOW_ITEM_SYNTHESIZE_PLANE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Synthesize_ApplicationFacde.EXPENDGAS_AND_PROBABILITY:
               this.getItemData(_loc2_);
               if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW)
               {
                  equipSynthesize.getEquipSynthesize().setExpendGasAndProbability(_loc2_);
               }
               if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW)
               {
                  materialSynthesize.getMaterialSynthesize().setExpendGasAndProbability(_loc2_);
               }
               if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW)
               {
                  stoneSynthesize.getStoneSynthesize().setExpendGasAndProbability(_loc2_);
               }
               if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_JINGYANHE_SHOW)
               {
                  ExpBoxSynthesize.getExpBoxSynthesize().setExpendGasAndProbability(_loc2_);
               }
               break;
            case Synthesize_ApplicationFacde.CLOSE_SYNTHESIZE_LOAD_BUFF:
               BaseSynthesize.removeLoaderBuff();
               this.panelClose();
               break;
            case Synthesize_ApplicationFacde.SYNTHESIZE_NOT_ITEML:
               if(_loc2_.type == 5 || _loc2_.type == 6 || _loc2_.type == 7)
               {
                  this.panelClose();
               }
               if(_loc2_.type == 19)
               {
                  this.itemSynthesizePanel.setStone();
               }
               break;
            case Synthesize_ApplicationFacde.NEW_ITEM_TO_BACKPACK:
               if(BaseSynthesize.isStrengthenIng)
               {
                  return;
               }
               if(!Fun.isVisible(this.itemSynthesizePanel))
               {
                  return;
               }
               _loc3_ = _loc2_ as Goods;
               if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW)
               {
                  if(_loc3_.id == SpecialGoodsID.SHENGJIESHI_ID || _loc3_.id == SpecialGoodsID.XINGYUNJING_ID || _loc3_.id == SpecialGoodsID.ZHENHUNFU_ID || _loc3_.id == SpecialGoodsID.ZHENXINGFU_ID)
                  {
                     equipSynthesize.getEquipSynthesize().getbackItem();
                  }
               }
               if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW)
               {
                  if(_loc3_.id == SpecialGoodsID.XINGYUNJING_ID)
                  {
                     materialSynthesize.getMaterialSynthesize().getbackItem();
                  }
               }
               if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW)
               {
                  if(_loc3_.id == SpecialGoodsID.XINGYUNJING_ID)
                  {
                     stoneSynthesize.getStoneSynthesize().getbackItem();
                  }
               }
               break;
            case Synthesize_ApplicationFacde.SHOW_ITEM_SYNTHESIZE_PLANE:
               this.viewEquipPanel();
         }
      }
      
      public function upDataItem(param1:int, param2:String = "", param3:String = "", param4:Object = 0) : void
      {
         if(param1 == 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(param1 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
         }
         if(!Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
         {
            this.panelClose();
            return;
         }
         this.brushItem(param4);
         PipeManager.sendMsg(PipeConstants.EQUIP_QIANGHUA_SUCCESS);
      }
      
      public function getItemData(param1:Object) : void
      {
         if(!param1.nextLevelData)
         {
            return;
         }
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW)
         {
            this.viewEquipPanel(true,param1.useItemNum);
            equipSynthesize.getEquipSynthesize().setEquipSynthesizeEquip(param1);
         }
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW)
         {
            materialSynthesize.getMaterialSynthesize().setMaterialSynthesizeMaterial(param1);
         }
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW)
         {
            stoneSynthesize.getStoneSynthesize().setStoneSynthesizeMaterial(param1);
         }
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_JINGYANHE_SHOW)
         {
            ExpBoxSynthesize.getExpBoxSynthesize().setStone(param1);
         }
      }
      
      private function panelClose(param1:* = null) : void
      {
         if(BaseSynthesize.isStrengthenIng)
         {
            return;
         }
         BaseSynthesize.xingYunJingNum = 0;
         equipSynthesize.getEquipSynthesize().panelClose();
         materialSynthesize.getMaterialSynthesize().panelClose();
         stoneSynthesize.getStoneSynthesize().panelClose();
         ExpBoxSynthesize.getExpBoxSynthesize().panelClose();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         ResizeManager.hideDoublePanel();
      }
      
      private function get msgSenderProxy() : Synthesize_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Synthesize_MsgSendProxy.NAME) as Synthesize_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ItemSynthesizePanel,function():void
         {
            itemSynthesizePanel.addEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW,mainCharEquipPuddingHandle);
            itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW,mainCharEquipPuddingHandle);
            itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW,mainCharEquipPuddingHandle);
            itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_JINGYANHE_SHOW,mainCharEquipPuddingHandle);
            itemSynthesizePanel.addEventListener(FCloseEvent.CLOSE,panelClose);
            itemSynthesizePanel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ItemSynthesizePanel,function():void
         {
            itemSynthesizePanel.removeEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            itemSynthesizePanel.removeEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW,mainCharEquipPuddingHandle);
            itemSynthesizePanel.removeEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW,mainCharEquipPuddingHandle);
            itemSynthesizePanel.removeEventListener(ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW,mainCharEquipPuddingHandle);
            itemSynthesizePanel.removeEventListener(ItemSynthesizePanel.UI_JINGYANHE_SHOW,mainCharEquipPuddingHandle);
            itemSynthesizePanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            itemSynthesizePanel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         if(BaseSynthesize.nowPanelType == param1.type)
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
               ResizeManager.showDoublePanel(this.itemSynthesizePanel,GameInstance.uiInstance.backpack);
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW:
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               BaseSynthesize.nowPanelType = param1.type;
               this.viewEquipPanel();
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW:
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               BaseSynthesize.nowPanelType = param1.type;
               this.viewMaterialPanel();
               break;
            case ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW:
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               BaseSynthesize.nowPanelType = param1.type;
               this.viewStonePanel();
               break;
            case ItemSynthesizePanel.UI_JINGYANHE_SHOW:
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               BaseSynthesize.nowPanelType = param1.type;
               this.viewExpBoxPanel();
         }
      }
      
      private function viewExpBoxPanel(param1:Boolean = false) : void
      {
         this.itemSynthesizePanel.setData(0,0);
         if(!param1)
         {
            this.itemSynthesizePanel.showJingYanHe();
            this.panelClose();
         }
      }
      
      private function viewEquipPanel(param1:Boolean = false, param2:int = 0) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc11_:Boolean = false;
         BaseSynthesize.xingYunJingNum = 0;
         var _loc6_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true,true);
         if(_loc6_.count == 0)
         {
            BaseSynthesize.isXingYunJingBind = 0;
         }
         else
         {
            BaseSynthesize.isXingYunJingBind = 1;
         }
         _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
         var _loc7_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.SHENGJIESHI_ID,true,true);
         if(_loc7_.count == 0)
         {
            _loc3_ = 0;
         }
         else
         {
            _loc3_ = 1;
         }
         _loc7_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.SHENGJIESHI_ID,true);
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.ZHENHUNFU_ID,true,true);
         if(_loc8_.count == 0)
         {
            _loc4_ = 0;
         }
         else
         {
            _loc4_ = 1;
         }
         _loc8_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZHENHUNFU_ID,true);
         var _loc9_:Goods = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.ZHENXINGFU_ID,true,true);
         if(_loc9_.count == 0)
         {
            _loc5_ = 0;
         }
         else
         {
            _loc5_ = 1;
         }
         _loc9_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZHENXINGFU_ID,true);
         if(_loc3_ == 1 || _loc4_ == 1 || _loc5_ == 1)
         {
            BaseSynthesize.isBind = 1;
         }
         else
         {
            BaseSynthesize.isBind = 0;
         }
         if(!param1)
         {
            this.itemSynthesizePanel.showEquipSynthesize();
            this.panelClose();
            _loc6_.count = 0;
            _loc7_.count = 0;
            _loc8_.count = 0;
            _loc9_.count = 0;
            this.itemSynthesizePanel.setEquipSynthesizeMaterial(true,_loc7_,_loc9_,_loc8_,_loc6_);
            return;
         }
         if(_loc8_.count != 0)
         {
            _loc8_.count = 1;
         }
         if(_loc9_.count != 0)
         {
            _loc9_.count = 1;
         }
         var _loc10_:int = _loc7_.count;
         _loc7_.count = param2;
         if(param2 == 0)
         {
            _loc11_ = true;
         }
         else if(_loc10_ < param2)
         {
            _loc11_ = true;
         }
         else
         {
            _loc11_ = false;
         }
         this.itemSynthesizePanel.setEquipSynthesizeMaterial(_loc11_,_loc7_,_loc9_,_loc8_,_loc6_);
      }
      
      private function viewMaterialPanel(param1:Boolean = false) : void
      {
         var _loc2_:Goods = null;
         _loc2_ = GameInstance.mainCharData.goodsInfo.getBangDingFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true,true);
         if(_loc2_.count == 0)
         {
            BaseSynthesize.isXingYunJingBind = 0;
         }
         else
         {
            BaseSynthesize.isXingYunJingBind = 1;
         }
         _loc2_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
         if(!param1)
         {
            this.itemSynthesizePanel.showMaterialSynthesize();
            this.panelClose();
            _loc2_.count = 0;
         }
         this.itemSynthesizePanel.setMaterialSynthesizeMaterial(null,null,null,_loc2_);
      }
      
      private function viewStonePanel(param1:Boolean = false) : void
      {
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
         if(!param1)
         {
            this.itemSynthesizePanel.showStoneSynthesize();
            this.panelClose();
            _loc2_.count = 0;
         }
         this.itemSynthesizePanel.setStoneSynthesizeMaterial(null,null,null,_loc2_);
      }
      
      private function brushItem(param1:Object) : void
      {
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW)
         {
            equipSynthesize.getEquipSynthesize().getbackItem();
         }
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW)
         {
            this.viewMaterialPanel(true);
            materialSynthesize.getMaterialSynthesize().getbackItem(param1 as int);
         }
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW)
         {
            this.viewStonePanel(true);
            stoneSynthesize.getStoneSynthesize().getbackItem();
         }
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_JINGYANHE_SHOW)
         {
            this.viewExpBoxPanel(true);
            ExpBoxSynthesize.getExpBoxSynthesize().getbackItem(param1 as Array);
         }
      }
   }
}

