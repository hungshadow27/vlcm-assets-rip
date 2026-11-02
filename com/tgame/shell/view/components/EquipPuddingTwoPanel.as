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
   import com.tgame.shell.view.components.equippuddingTwo.EquipZanWenKeHuaCanvas;
   import com.tgame.shell.view.components.equippuddingTwo.ModifyEquipAttibuteCountConfirmPanel;
   import com.tgame.shell.view.components.equippuddingTwo.ModifyEquipAttributeCountCanvas;
   import com.tgame.shell.view.components.equippuddingTwo.ModifyEquipAttributeValueCanvas;
   import com.tgame.shell.view.components.equippuddingTwo.ModifyEquipAttributeValueConfirmPanel;
   import com.tgame.shell.view.components.equippuddingTwo.ZanWenKeHuaTipCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class EquipPuddingTwoPanel extends FPanel
   {
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_USELUCKSTONE:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_USELUCKSTONE";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CLICK:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CLICK";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_GETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_GETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_OLD:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_OLD";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_NEW:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_NEW";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_USELUCKSTONE:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_USELUCKSTONE";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_STARTBTN_CLICK:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_STARTBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_GETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_GETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_CONFIRM_USE_OLD:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_CONFIRM_USE_OLD";
      
      public static const UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_CONFIRM_USE_NEW:String = "UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_CONFIRM_USE_NEW";
      
      public static const UI_EQUIPPUDDING_ZANWEN_SHOW:String = "UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW2";
      
      public static const UI_EQUIPPUDDING_ZANWEN_USELUCKSTONE:String = "UI_EQUIPPUDDING_ZANWEN_USELUCKSTONE";
      
      public static const UI_EQUIPPUDDING_ZANWEN_STARTBTN_CLICK:String = "UI_EQUIPPUDDING_ZANWEN_STARTBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_ZANWEN_SETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_ZANWEN_SETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_ZANWEN_GETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_ZANWEN_GETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_OPTION:String = "UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_OPTION";
      
      public static const UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_NEXT_IS_SHOW:String = "UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_NEXT_IS_SHOW";
      
      private var tabBar:FTabBar;
      
      private var modifyCount:ModifyEquipAttributeCountCanvas;
      
      private var modifyValue:ModifyEquipAttributeValueCanvas;
      
      private var zanWen:EquipZanWenKeHuaCanvas;
      
      private var zanWenTip:ZanWenKeHuaTipCanvas;
      
      private var attributeCountConfirmPanel:ModifyEquipAttibuteCountConfirmPanel;
      
      private var attributeValueConfirmPanel:ModifyEquipAttributeValueConfirmPanel;
      
      public function EquipPuddingTwoPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 325;
         height = 396;
         this.titleText = LanResManager.getLanCommonTextWords("装备炼制");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.modifyCount = new ModifyEquipAttributeCountCanvas();
         addChild(this.modifyCount);
         this.modifyCount.$parent = this;
         this.modifyCount.x = 10;
         this.modifyCount.y = 22;
         this.modifyCount.visible = false;
         this.modifyValue = new ModifyEquipAttributeValueCanvas();
         addChild(this.modifyValue);
         this.modifyValue.$parent = this;
         this.modifyValue.x = 10;
         this.modifyValue.y = 22;
         this.modifyValue.visible = false;
         this.zanWen = new EquipZanWenKeHuaCanvas();
         addChild(this.zanWen);
         this.zanWen.$parent = this;
         this.zanWen.x = 10;
         this.zanWen.y = 22;
         this.zanWen.visible = false;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.modifyCount.bg);
         _loc1_.push(this.modifyValue.bg);
         _loc1_.push(this.zanWen.bg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("增删附加属性条数"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("重置附加属性数值"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("战纹刻画"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ATTRIBUTE_MODIFY_COUNT);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ATTRIBUTE_MODIFY_VALUE);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ZANWEN);
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("增删附加属性条数"):
               dispatchEvent(new BaseEvent(UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("重置附加属性数值"):
               dispatchEvent(new BaseEvent(UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("战纹刻画"):
               dispatchEvent(new BaseEvent(UI_EQUIPPUDDING_ZANWEN_SHOW));
         }
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ATTRIBUTE_MODIFY_COUNT);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ATTRIBUTE_MODIFY_VALUE);
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_ZANWEN);
      }
      
      public function showModifyCountCanvas(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("增删附加属性条数"));
         }
         this.modifyCount.visible = true;
         this.modifyValue.visible = false;
         this.zanWen.visible = false;
      }
      
      public function setModifyCountEnergyExpendItem(param1:Boolean = true, param2:Goods = null, param3:Goods = null) : void
      {
         this.modifyCount.setEnergyExpendItem(param1,param2,param3);
      }
      
      public function setModifyCountEquip(param1:Goods) : void
      {
         this.modifyCount.setEquip(param1);
      }
      
      public function getModifyCountEquip() : Goods
      {
         return this.modifyCount.getEquip();
      }
      
      public function setModifyCountExpendGasAndProbability(param1:int, param2:String, param3:int) : void
      {
         this.modifyCount.setExpendGasAndProbability(param1,param2,param3);
      }
      
      public function showCountConfirmPanel(param1:String, param2:String) : void
      {
         if(!this.attributeCountConfirmPanel)
         {
            this.attributeCountConfirmPanel = new ModifyEquipAttibuteCountConfirmPanel();
            this.attributeCountConfirmPanel.$parent = this;
         }
         this.attributeCountConfirmPanel.setAtt(param1,param2);
         POPWindowManager.showWindow(this.attributeCountConfirmPanel);
      }
      
      public function showModifyValueCanvas(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("重置附加属性数值"));
         }
         this.modifyCount.visible = false;
         this.modifyValue.visible = true;
         this.zanWen.visible = false;
      }
      
      public function setModifyValueEnergyExpendItem(param1:Boolean, param2:Goods = null, param3:Goods = null) : void
      {
         this.modifyValue.setEnergyExpendItem(param1,param2,param3);
      }
      
      public function setModifyValueEquip(param1:Goods) : void
      {
         this.modifyValue.setEquip(param1);
      }
      
      public function getModifyValueEquip() : Goods
      {
         return this.modifyValue.getEquip();
      }
      
      public function setModifyValueExpendGasAndProbability(param1:int, param2:String, param3:int) : void
      {
         this.modifyValue.setExpendGasAndProbability(param1,param2,param3);
      }
      
      public function isShowExchangeLabel(param1:Boolean) : void
      {
         this.modifyValue.isShowExchangeLabel(param1);
      }
      
      public function showValueConfirmPanel(param1:String, param2:String) : void
      {
         if(!this.attributeValueConfirmPanel)
         {
            this.attributeValueConfirmPanel = new ModifyEquipAttributeValueConfirmPanel();
            this.attributeValueConfirmPanel.$parent = this;
         }
         this.attributeValueConfirmPanel.setAtt(param1,param2);
         POPWindowManager.showWindow(this.attributeValueConfirmPanel);
      }
      
      public function showZanWenCanvas(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("战纹刻画"));
         }
         this.modifyCount.visible = false;
         this.modifyValue.visible = false;
         this.zanWen.reset();
         this.zanWen.visible = true;
      }
      
      public function setZanWenEnergyExpendItem(param1:Boolean, param2:Goods = null, param3:Goods = null) : void
      {
         this.zanWen.setEnergyExpendItem(param1,param2,param3);
      }
      
      public function setZanWenEquip(param1:Goods) : void
      {
         this.zanWen.setEquip(param1);
      }
      
      public function getZanWenEquip() : Goods
      {
         return this.zanWen.getEquip();
      }
      
      public function setZanWenExpendGasAndProbability(param1:int, param2:String, param3:int) : void
      {
         this.zanWen.setExpendGasAndProbability(param1,param2,param3);
      }
      
      public function showZanWenTip() : void
      {
         if(!this.zanWenTip)
         {
            this.zanWenTip = new ZanWenKeHuaTipCanvas();
            this.zanWenTip.$parent = this;
         }
         POPWindowManager.showWindow(this.zanWenTip);
      }
      
      public function setBuff(param1:Array) : void
      {
         this.zanWen.setBuff(param1);
      }
   }
}

