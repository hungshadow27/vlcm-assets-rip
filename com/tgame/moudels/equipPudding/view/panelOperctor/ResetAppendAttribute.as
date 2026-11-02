package com.tgame.moudels.equipPudding.view.panelOperctor
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.equipMosaic.EquipMosaic;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.EquipPuddingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   
   public class ResetAppendAttribute extends BaseStrengthen
   {
      
      private static var _resetAppendAttribute:ResetAppendAttribute;
      
      public function ResetAppendAttribute()
      {
         super();
      }
      
      public static function getResetAppendAttribute() : ResetAppendAttribute
      {
         if(_resetAppendAttribute == null)
         {
            _resetAppendAttribute = new ResetAppendAttribute();
         }
         return _resetAppendAttribute;
      }
      
      public function panelClose() : void
      {
         this.equipPuddingPanel.getResetAppendAttributeEquip();
         super.closePanel();
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
      
      override public function addListener() : void
      {
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SETEQUIPBTN_CLICK,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_STARTBTN_CLICK,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_USELUCKSTONE,this.mainCharEquipPuddingHandle);
         super.equipPuddingPanel.addEventListener(EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_GETEQUIPBTN_CLICK,this.mainCharEquipPuddingHandle);
      }
      
      private function mainCharEquipPuddingHandle(param1:BaseEvent) : void
      {
         var next:Function = null;
         var next2:Function = null;
         var obj:Object = null;
         var e:BaseEvent = param1;
         next = function(param1:FAlertEvent = null):void
         {
            if(Boolean(param1) && param1.eventData != FAlert.OK)
            {
               return;
            }
            if(GameState.gongneng104 && BaseStrengthen.xingYunJingNum < 5 && BaseStrengthen.xingYunJingNum != 0 && equip.quality >= 4)
            {
               FAlert.show(LanResManager.getLanCommonTextWords("放入的幸运晶不足5颗，无法参加本次活动，是否继续？"),"",2,next2);
               return;
            }
            next2();
         };
         next2 = function(param1:FAlertEvent = null):void
         {
            if(Boolean(param1) && param1.eventData != FAlert.OK)
            {
               return;
            }
            var _loc2_:Object = {};
            _loc2_.XY = equip.position;
            _loc2_.ID = equip.id;
            _loc2_.xingYunJingNum = BaseStrengthen.xingYunJingNum;
            BaseStrengthen.addLoadBuffer();
            BaseStrengthen.sendMsgFun.send_50109(_loc2_);
         };
         switch(e.type)
         {
            case EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SETEQUIPBTN_CLICK:
               super.chickItemToPanelFun = this.setItem;
               super.openBackpack();
               super.changeMouseStatus();
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_GETEQUIPBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.panelClose();
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_STARTBTN_CLICK:
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
               break;
            case EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_USELUCKSTONE:
               obj = e.data;
               BaseStrengthen.xingYunJingNum = obj.num;
               if(BaseStrengthen.xingYunJingNum > 0)
               {
                  if(obj.isSetMaterial)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"使用幸运晶数量",[BaseStrengthen.xingYunJingNum,BaseStrengthen.xingYunJingNum * OtherConst.XINGYUNJING_JILV]),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"使用幸运晶数量",[BaseStrengthen.xingYunJingNum,BaseStrengthen.xingYunJingNum * OtherConst.XINGYUNJING_JILV]),false);
                  }
               }
               super.setExpendGasAndProbability(null);
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
            if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW)
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
         if(Boolean(param1 && param1.res && param1.res.kind == 2) && Boolean(param1.quality > 1) && EquipMosaic.getEquipMosaicData(param1.id) > 1)
         {
            super.equip = param1;
            super.equipPuddingPanel.setResetAppendAttributeEquip(param1);
            _loc3_ = {};
            _loc3_.XY = param1.position;
            _loc3_.ID = param1.id;
            _loc3_.type = 3;
            BaseStrengthen.tempData = _loc3_;
            BaseStrengthen.sendMsgFun.send_50125(_loc3_);
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            super.chickItemToPanelFun = null;
            super.mouseToNormal();
            SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("附加属性重置中");
         }
         else if(!param1)
         {
            this.panelClose();
         }
         else if(param1.quality <= 1 && param1.res.kind == 2)
         {
            if(param2)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"装备洗成白色"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"装备洗成白色"),false);
               this.equipPuddingPanel.getResetAppendAttributeEquip();
            }
            else
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"白色的装备无法重置附加属性"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"白色的装备无法重置附加属性"),false);
            }
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不能重置附加属性"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不能重置附加属性"),false);
            this.equipPuddingPanel.getResetAppendAttributeEquip();
         }
      }
   }
}

