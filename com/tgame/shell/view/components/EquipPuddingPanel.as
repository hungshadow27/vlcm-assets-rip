package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.HelpManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.equippudding.EquipAttributeResetPanel;
   import com.tgame.shell.view.components.equippudding.EquipInnateAttributeStrengCanvas;
   import com.tgame.shell.view.components.equippudding.EquipStrengthenCanvas;
   import com.tgame.shell.view.components.equippudding.ResetAppendAttributeCanvas;
   import com.tgame.shell.view.components.equippudding.ResetStrengthenLevelCanvas;
   import com.tgame.shell.view.components.equippudding.StoneFuseCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class EquipPuddingPanel extends FPanel
   {
      
      public static const UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW:String = "UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW";
      
      public static const UI_EQUIPPUDDING_EQUIPSTRENGTHEN_USELUCKSTONE:String = "UI_EQUIPPUDDING_EQUIPSTRENGTHEN_USELUCKSTONE";
      
      public static const UI_EQUIPPUDDING_EQUIPSTRENGTHEN_STARTBTN_CLICK:String = "UI_EQUIPPUDDING_START_STRENGTHEN";
      
      public static const UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_EQUIPSTRENGTHEN_GETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_EQUIPSTRENGTHEN_GETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW:String = "UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW";
      
      public static const UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_USELUCKSTONE:String = "UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_USELUCKSTONE";
      
      public static const UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_STARTBTN_CLICK:String = "UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_START_STRENGTHEN";
      
      public static const UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_GETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_GETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW:String = "UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW";
      
      public static const UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_USELUCKSTONE:String = "UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_USELUCKSTONE";
      
      public static const UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_STARTBTN_CLICK:String = "UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_STARTBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_GETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_GETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_ATTRIBUTERESET_OLD:String = "UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_ATTRIBUTERESET_OLD";
      
      public static const UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_ATTRIBUTERESET_NEW:String = "UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_ATTRIBUTERESET_NEW";
      
      public static const UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW:String = "UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW";
      
      public static const UI_EQUIPPUDDING_STONEFUSE_USELUCKSTONE:String = "UI_EQUIPPUDDING_RESETSTONEFUSE_USELUCKSTONE";
      
      public static const UI_EQUIPPUDDING_STONEFUSE_STARTBTN_CLICK:String = "UI_EQUIPPUDDING_RESETSTONEFUSE_STARTBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_STONEFUSE_SETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_RESETSTONEFUSE_SETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_STONEFUSE_GETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_STONEFUSE_GETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_STONEFUSE_SETSTONE:String = "UI_EQUIPPUDDING_STONEFUSE_SETSTONE";
      
      public static const UI_EQUIPPUDDING_STONEFUSE_GETSTONE:String = "UI_EQUIPPUDDING_STONEFUSE_GETSTONE";
      
      public static const UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_OK:String = "UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_OK";
      
      public static const UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_CANCEL:String = "UI_EQUIPPUDDING_STONEFUSE_ATTRIBUTE_BESTROW_CANCEL";
      
      public static const UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW:String = "UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW";
      
      public static const UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_STARTBTN_CLICK:String = "UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_STARTBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_GETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_GETEQUIPBTN_CLICK";
      
      private var tabBar:FTabBar;
      
      private var equipStrengthen:EquipStrengthenCanvas;
      
      private var resetStrengthenLevel:ResetStrengthenLevelCanvas;
      
      private var resetAppendAttribute:ResetAppendAttributeCanvas;
      
      private var stoneFuse:StoneFuseCanvas;
      
      private var attributeResetPanel:EquipAttributeResetPanel;
      
      private var innateAttribute:EquipInnateAttributeStrengCanvas;
      
      public function EquipPuddingPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 325;
         height = 396;
         this.titleText = LanResManager.getLanCommonTextWords("装备炼制");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.equipStrengthen = new EquipStrengthenCanvas();
         addChild(this.equipStrengthen);
         this.equipStrengthen.$parent = this;
         this.equipStrengthen.x = 10;
         this.equipStrengthen.y = 22;
         this.equipStrengthen.visible = false;
         this.resetStrengthenLevel = new ResetStrengthenLevelCanvas();
         addChild(this.resetStrengthenLevel);
         this.resetStrengthenLevel.$parent = this;
         this.resetStrengthenLevel.x = 10;
         this.resetStrengthenLevel.y = 22;
         this.resetStrengthenLevel.visible = false;
         this.resetAppendAttribute = new ResetAppendAttributeCanvas();
         addChild(this.resetAppendAttribute);
         this.resetAppendAttribute.$parent = this;
         this.resetAppendAttribute.x = 10;
         this.resetAppendAttribute.y = 22;
         this.resetAppendAttribute.visible = false;
         this.innateAttribute = new EquipInnateAttributeStrengCanvas();
         addChild(this.innateAttribute);
         this.innateAttribute.$parent = this;
         this.innateAttribute.x = 10;
         this.innateAttribute.y = 22;
         this.innateAttribute.visible = false;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.equipStrengthen.bgImg);
         _loc1_.push(this.resetStrengthenLevel.bgImg);
         _loc1_.push(this.resetAppendAttribute.bgImg);
         _loc1_.push(this.innateAttribute.bgImg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("装备强化"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("重置附加属性"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("天生属性强化"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("装备强化"):
               dispatchEvent(new BaseEvent(UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("重置强化"):
               dispatchEvent(new BaseEvent(UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("重置附加属性"):
               dispatchEvent(new BaseEvent(UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("宝石融合"):
               dispatchEvent(new BaseEvent(UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("天生属性强化"):
               dispatchEvent(new BaseEvent(UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW));
         }
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_QIANGHUA);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_QIANGHUA_RESET);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ATTRIBUTE_RESET);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ATTRIBUTE_QIQNGHUA);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_QIANGHUA);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_QIANGHUA_RESET);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ATTRIBUTE_RESET);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ATTRIBUTE_QIQNGHUA);
      }
      
      public function showEquipStrengthen(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("装备强化"));
         }
         this.equipStrengthen.visible = true;
         this.resetStrengthenLevel.visible = false;
         this.resetAppendAttribute.visible = false;
         this.equipStrengthen.reset();
         this.innateAttribute.visible = false;
      }
      
      public function setEquipStrengthenEnergyExpendItem(param1:Boolean = true, param2:Goods = null, param3:Goods = null) : void
      {
         this.equipStrengthen.setEnergyExpendItem(param1,param2,param3);
      }
      
      public function setEquipStrengthenEquip(param1:Goods) : void
      {
         this.equipStrengthen.setEquip(param1);
      }
      
      public function getEquipStrengthenEquip() : Goods
      {
         return this.equipStrengthen.getEquip();
      }
      
      public function setEquipStrengthenExpendGasAndProbability(param1:int, param2:String, param3:int) : void
      {
         this.equipStrengthen.setExpendGasAndProbability(param1,param2,param3);
      }
      
      public function showResetStrengthenLevel(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("重置强化"));
         }
         this.equipStrengthen.visible = false;
         this.resetStrengthenLevel.visible = true;
         this.resetAppendAttribute.visible = false;
         this.resetStrengthenLevel.reset();
         this.innateAttribute.visible = false;
      }
      
      public function setResetStrengthenLevelEnergyExpendItem(param1:Boolean, param2:Goods = null, param3:Goods = null) : void
      {
         this.resetStrengthenLevel.setEnergyExpendItem(param1,param2,param3);
      }
      
      public function setResetStrengthenLevelEquip(param1:Goods) : void
      {
         this.resetStrengthenLevel.setEquip(param1);
      }
      
      public function getResetStrengthenLevelEquip() : Goods
      {
         return this.resetStrengthenLevel.getEquip();
      }
      
      public function setEquipResetStrengthenLevelExpendGasAndProbability(param1:int, param2:String, param3:int) : void
      {
         this.resetStrengthenLevel.setExpendGasAndProbability(param1,param2,param3);
      }
      
      public function showResetAppendAttribute(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("重置附加属性"));
         }
         this.equipStrengthen.visible = false;
         this.resetStrengthenLevel.visible = false;
         this.resetAppendAttribute.visible = true;
         this.resetAppendAttribute.reset();
         this.innateAttribute.visible = false;
      }
      
      public function setResetAppendAttributeEnergyExpendItem(param1:Boolean = true, param2:Goods = null, param3:Goods = null) : void
      {
         this.resetAppendAttribute.setEnergyExpendItem(param1,param2,param3);
      }
      
      public function setResetAppendAttributeEquip(param1:Goods) : void
      {
         this.resetAppendAttribute.setEquip(param1);
      }
      
      public function getResetAppendAttributeEquip() : Goods
      {
         return this.resetAppendAttribute.getEquip();
      }
      
      public function setResetAppendAttributeExpendGasAndProbability(param1:int, param2:String, param3:int) : void
      {
         this.resetAppendAttribute.setExpendGasAndProbability(param1,param2,param3);
      }
      
      public function showAttributeResetPanel(param1:String, param2:String) : void
      {
         if(!this.attributeResetPanel)
         {
            this.attributeResetPanel = new EquipAttributeResetPanel();
            this.attributeResetPanel.$parent = this;
         }
         this.attributeResetPanel.setAtt(param1,param2);
         POPWindowManager.showWindow(this.attributeResetPanel);
      }
      
      public function showStoneFuse() : void
      {
         this.equipStrengthen.visible = false;
         this.resetStrengthenLevel.visible = false;
         this.resetAppendAttribute.visible = false;
         this.stoneFuse.reset();
         this.innateAttribute.visible = false;
      }
      
      public function setStoneFuseLuckMaterial(param1:Goods) : void
      {
         this.stoneFuse.setEnergyExpendItem(param1);
      }
      
      public function setStoneFuseEquip(param1:Goods) : void
      {
         this.stoneFuse.setEquip(param1);
      }
      
      public function getStoneFuseEquip() : Goods
      {
         return this.stoneFuse.getEquip();
      }
      
      public function setStoneFuseStone(param1:Goods) : void
      {
         this.stoneFuse.setStone(param1);
      }
      
      public function getStoneFuseStone() : Goods
      {
         return this.stoneFuse.getStone();
      }
      
      public function setStoneFuseExpendGasAndProbability(param1:int, param2:int) : void
      {
         this.stoneFuse.setExpendGasAndProbability(param1,param2);
      }
      
      public function showStoneFuseStoneAttributeBestrow(param1:Array) : void
      {
         this.stoneFuse.showStoneAttributeBestrow(param1);
      }
      
      public function showInnateAttributePanel(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("天生属性强化"));
         }
         this.equipStrengthen.visible = false;
         this.resetStrengthenLevel.visible = false;
         this.resetAppendAttribute.visible = false;
         this.innateAttribute.visible = true;
      }
      
      public function seInnateAttributeEnergyExpendItem(param1:Boolean = true, param2:Goods = null) : void
      {
         this.innateAttribute.setEnergyExpendItem(param1,param2);
      }
      
      public function setInnateAttributeEquip(param1:Goods) : void
      {
         this.innateAttribute.setEquip(param1);
      }
      
      public function getInnateAttributeEquip() : Goods
      {
         return this.innateAttribute.getEquip();
      }
      
      public function setInnateAttributeExpendGasAndProbability(param1:int, param2:int, param3:String, param4:int) : void
      {
         this.innateAttribute.setExpendGasAndProbability(param1,param2,param3,param4);
      }
      
      public function isShowFt(param1:Boolean) : void
      {
         this.resetAppendAttribute.isShowFt(param1);
      }
   }
}

