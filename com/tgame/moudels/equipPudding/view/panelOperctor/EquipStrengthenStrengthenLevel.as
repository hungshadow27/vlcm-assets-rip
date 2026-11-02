package com.tgame.moudels.equipPudding.view.panelOperctor
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.equipMosaic.EquipMosaic;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.EquipPuddingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   
   public class EquipStrengthenStrengthenLevel extends BaseStrengthen
   {
      
      private static var _equipStrengthenStrengthenLevel:EquipStrengthenStrengthenLevel;
      
      public function EquipStrengthenStrengthenLevel()
      {
         super();
      }
      
      public static function getEquipStrengthenStrengthenLevel() : EquipStrengthenStrengthenLevel
      {
         if(_equipStrengthenStrengthenLevel == null)
         {
            _equipStrengthenStrengthenLevel = new EquipStrengthenStrengthenLevel();
         }
         return _equipStrengthenStrengthenLevel;
      }
      
      override public function addListener() : void
      {
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_GETEQUIPBTN_CLICK,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SETEQUIPBTN_CLICK,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_STARTBTN_CLICK,this.mainCharEquipPuddingHandle);
      }
      
      private function mainCharEquipPuddingHandle(param1:BaseEvent) : void
      {
         var next:Function = null;
         var e:BaseEvent = param1;
         next = function(param1:FAlertEvent = null):void
         {
            if(Boolean(param1) && param1.eventData != FAlert.OK)
            {
               return;
            }
            var _loc2_:Object = {};
            _loc2_.XY = equip.position;
            _loc2_.ID = equip.id;
            BaseStrengthen.addLoadBuffer();
            BaseStrengthen.sendMsgFun.send_50171(_loc2_);
         };
         switch(e.type)
         {
            case EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SETEQUIPBTN_CLICK:
               super.chickItemToPanelFun = this.setItem;
               super.openBackpack();
               super.changeMouseStatus();
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_GETEQUIPBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.panelClose();
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_STARTBTN_CLICK:
               if(!super.equip)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入装备"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入装备"));
                  return;
               }
               if(super.zhenQi > GameInstance.mainCharData.moneyInfo.copper)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("铜币不足"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("铜币不足"));
                  return;
               }
               if(!ItemPositionRange.inBag(super.equip.position))
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
                  return;
               }
               if(BaseStrengthen.isBind == 1 && equip.bind == 0)
               {
                  FAlert.show(LanResManager.getLanTextWords(this,"绑定提示",[StaticValue.WHITE_HTML]),"",2,next);
               }
               else if(BaseStrengthen.isXingYunJingBind == 1 && BaseStrengthen.xingYunJingNum > 0 && equip.bind == 0)
               {
                  FAlert.show(LanResManager.getLanTextWords(this,"绑定提示",[StaticValue.WHITE_HTML]),"",2,next);
               }
               else
               {
                  next();
               }
         }
      }
      
      public function getbackItem() : void
      {
         var _loc1_:Goods = null;
         if(super.equip)
         {
            _loc1_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(super.equip.position);
            this.itemToPanel(_loc1_);
         }
      }
      
      private function setItem(param1:ItemFace) : void
      {
         var _loc2_:Goods = null;
         if(param1 == null || !Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
         {
            return;
         }
         if(param1.getBaseItem() is Goods)
         {
            if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW)
            {
               _loc2_ = param1.getBaseItem() as Goods;
               this.itemToPanel(_loc2_);
            }
         }
      }
      
      public function itemToPanel(param1:Goods, param2:Boolean = false) : void
      {
         var _loc3_:Object = null;
         if(param1)
         {
            if(!ItemPositionRange.inBag(param1.position))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
               return;
            }
         }
         if(Boolean(param1 && param1.res) && Boolean(param1.res.kind == 2) && EquipMosaic.getEquipMosaicData(param1.id) > 1)
         {
            super.equip = param1;
            super.equipPuddingPanel.setInnateAttributeEquip(param1);
            _loc3_ = {};
            _loc3_.XY = param1.position;
            _loc3_.ID = param1.id;
            _loc3_.type = 15;
            BaseStrengthen.tempData = _loc3_;
            BaseStrengthen.sendMsgFun.send_50125(_loc3_);
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            super.chickItemToPanelFun = null;
            super.mouseToNormal();
            SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("天生属性强化中");
         }
         else if(!param1)
         {
            this.panelClose();
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不能强化附加属性"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不能强化附加属性"));
            this.equipPuddingPanel.getInnateAttributeEquip();
         }
      }
      
      public function panelClose() : void
      {
         this.equipPuddingPanel.getInnateAttributeEquip();
         super.closePanel();
      }
   }
}

