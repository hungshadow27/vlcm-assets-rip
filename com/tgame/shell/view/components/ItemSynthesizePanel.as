package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.HelpManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.equippudding.EquipLevelLessPanel;
   import com.tgame.shell.view.components.itemsynthesize.EquipSynthesizeCanvas;
   import com.tgame.shell.view.components.itemsynthesize.EquipSynthesizeTipCanvas;
   import com.tgame.shell.view.components.itemsynthesize.JingYanHeCanvas;
   import com.tgame.shell.view.components.itemsynthesize.MaterialSynthesizeCanvas;
   import com.tgame.shell.view.components.itemsynthesize.StoneSynthesizeCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class ItemSynthesizePanel extends FPanel
   {
      
      public static const UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW:String = "UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW";
      
      public static const UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SETEQUIPBTN_CLICK:String = "UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SETEQUIPBTN_CLICK";
      
      public static const UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_GETEQUIPBTN_CLICK:String = "UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_GETEQUIPBTN_CLICK";
      
      public static const UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENXINGFU:String = "UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENXINGFU";
      
      public static const UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENHUNFU:String = "UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_ZHENHUNFU";
      
      public static const UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_LUCKSTONE_COUNT:String = "UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_USE_LUCKSTONE_COUNT";
      
      public static const UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_STARTBTN_CLICK:String = "UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_STARTBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_EQUIPSTRENGTHEN_KEEP:String = "UI_EQUIPPUDDING_EQUIPSTRENGTHEN_KEEP";
      
      public static const UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW:String = "UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW";
      
      public static const UI_ITEMSYNTESIZE_STONESYNTHESIZE_SETSTONEBTN_CLICK:String = "UI_ITEMSYNTESIZE_STONESYNTHESIZE_SETSTONEBTN_CLICK";
      
      public static const UI_ITEMSYNTESIZE_STONESYNTHESIZE_GETSTONEBTN_CLICK:String = "UI_ITEMSYNTESIZE_STONESYNTHESIZE_GETSTONEBTN_CLICK";
      
      public static const UI_ITEMSYNTESIZE_STONESYNTHESIZE_USE_LUCKSTONE_COUNT:String = "UI_ITEMSYNTESIZE_STONESYNTHESIZE_USE_LUCKSTONE_COUNT";
      
      public static const UI_ITEMSYNTESIZE_STONESYNTHESIZE_STARTBTN_CLICK:String = "UI_ITEMSYNTESIZE_STONESYNTHESIZE_STARTBTN_CLICK";
      
      public static const UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW:String = "UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW";
      
      public static const UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SETMATERIALBTN_CLICK:String = "UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SETMATERIALBTN_CLICK";
      
      public static const UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_GETMATERIALBTN_CLICK:String = "UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_GETMATERIALBTN_CLICK";
      
      public static const UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT:String = "UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT";
      
      public static const UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_STARTBTN_CLICK:String = "UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_STARTBTN_CLICK";
      
      public static const UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_PILIANGHECHENG_CLICK:String = "UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_PILIANGHECHENG_CLICK";
      
      public static const UI_JINGYANHE_SHOW:String = "UI_JINGYANHE_SHOW";
      
      public static const UI_JINGYANHE_SETEQUIPBTN_CLICK:String = "UI_JINGYANHE_SETEQUIPBTN_CLICK";
      
      public static const UI_JINGYANHE_GETEQUIPBTN_CLICK:String = "UI_JINGYANHE_GETEQUIPBTN_CLICK";
      
      public static const UI_JINGYANHE_STARTBTN_CLICK:String = "UI_JINGYANHE_STARTBTN_CLICK";
      
      public static const UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_OPTION:String = "UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_OPTION";
      
      public static const UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_NEXT_IS_SHOW:String = "UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_NEXT_IS_SHOW";
      
      private var tabBar:FTabBar;
      
      private var equipSynthesize:EquipSynthesizeCanvas;
      
      public var materialSynthesize:MaterialSynthesizeCanvas;
      
      private var stoneSynthesize:StoneSynthesizeCanvas;
      
      private var jingyanhe:JingYanHeCanvas;
      
      private var equipSynthesizeTip:EquipSynthesizeTipCanvas;
      
      public var piliangBtn:SecondButton;
      
      public function ItemSynthesizePanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 313;
         height = 396;
         this.titleText = LanResManager.getLanCommonTextWords("物品合成");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.equipSynthesize = new EquipSynthesizeCanvas();
         this.equipSynthesize.$parent = this;
         addChild(this.equipSynthesize);
         this.equipSynthesize.x = 10;
         this.equipSynthesize.y = 22;
         this.equipSynthesize.visible = false;
         this.materialSynthesize = new MaterialSynthesizeCanvas();
         this.materialSynthesize.$parent = this;
         addChild(this.materialSynthesize);
         this.materialSynthesize.x = 10;
         this.materialSynthesize.y = 22;
         this.materialSynthesize.visible = false;
         this.stoneSynthesize = new StoneSynthesizeCanvas();
         this.stoneSynthesize.$parent = this;
         addChild(this.stoneSynthesize);
         this.stoneSynthesize.x = 10;
         this.stoneSynthesize.y = 22;
         this.stoneSynthesize.visible = false;
         this.jingyanhe = new JingYanHeCanvas();
         this.jingyanhe.$parent = this;
         addChild(this.jingyanhe);
         this.jingyanhe.x = 10;
         this.jingyanhe.y = 22;
         this.jingyanhe.visible = false;
         this.piliangBtn = new SecondButton();
         this.piliangBtn.label = LanResManager.getLanCommonTextWords("批量合成");
         addChild(this.piliangBtn);
         this.piliangBtn.x = 200 + 30;
         this.piliangBtn.y = 333;
         this.piliangBtn.enabled = false;
         this.piliangBtn.addEventListener(MouseEvent.CLICK,this.onPiliang);
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.equipSynthesize.bgImg);
         _loc1_.push(this.materialSynthesize.bgImg);
         _loc1_.push(this.stoneSynthesize.bgImg);
         _loc1_.push(this.jingyanhe.bg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("装备进阶合成"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("材料与秘籍合成"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("经验盒合成"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("装备进阶合成"):
               dispatchEvent(new BaseEvent(UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("宝石合成"):
               dispatchEvent(new BaseEvent(UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("材料与秘籍合成"):
               dispatchEvent(new BaseEvent(UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("经验盒合成"):
               dispatchEvent(new BaseEvent(UI_JINGYANHE_SHOW));
         }
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_HECHENG);
      }
      
      private function onPiliang(param1:MouseEvent) : void
      {
         if(param1.currentTarget.label == LanResManager.getLanCommonTextWords("批量合成"))
         {
            dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_PILIANGHECHENG_CLICK,"",true));
         }
         else if(param1.currentTarget.label == LanResManager.getLanCommonTextWords("终止批量合成"))
         {
            dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_PILIANGHECHENG_CLICK,"",false));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_EQUIP_HECHENG);
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function showEquipSynthesize() : void
      {
         this.equipSynthesize.visible = true;
         this.materialSynthesize.visible = false;
         this.stoneSynthesize.visible = false;
         this.piliangBtn.visible = false;
         this.jingyanhe.visible = false;
         this.equipSynthesize.reset();
      }
      
      public function setEquipSynthesizeMaterial(param1:Boolean = true, param2:Goods = null, param3:Goods = null, param4:Goods = null, param5:Goods = null) : void
      {
         this.equipSynthesize.setMaterial(param1,param2,param3,param4,param5);
      }
      
      public function setEquipSynthesizeEquip(param1:Goods, param2:Goods) : void
      {
         this.equipSynthesize.setItem(param1,param2);
      }
      
      public function getEquipSynthesizeEquip() : Goods
      {
         return this.equipSynthesize.getItem();
      }
      
      public function showLevelLessPanel(param1:String, param2:int) : void
      {
         var _loc3_:EquipLevelLessPanel = new EquipLevelLessPanel();
         _loc3_.$parent = this;
         _loc3_.setData(param1,param2);
         POPWindowManager.showWindow(_loc3_);
      }
      
      public function setEquipSynthesizeExpendGasAndProbability(param1:int, param2:String, param3:int) : void
      {
         this.equipSynthesize.setExpendGasAndProbability(param1,param2,param3);
      }
      
      public function showEquipSynthesizeTip() : void
      {
         if(!this.equipSynthesizeTip)
         {
            this.equipSynthesizeTip = new EquipSynthesizeTipCanvas();
            this.equipSynthesizeTip.$parent = this;
         }
         POPWindowManager.showWindow(this.equipSynthesizeTip);
      }
      
      public function showStoneSynthesize() : void
      {
         this.equipSynthesize.visible = false;
         this.stoneSynthesize.visible = true;
         this.materialSynthesize.visible = false;
         this.piliangBtn.visible = false;
         this.jingyanhe.visible = false;
         this.stoneSynthesize.reset();
      }
      
      public function setStoneSynthesizeMaterial(param1:Goods = null, param2:Goods = null, param3:Goods = null, param4:Goods = null, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : void
      {
         this.stoneSynthesize.setMaterial(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setStoneSynthesizeEquip(param1:Goods, param2:Goods) : void
      {
         this.stoneSynthesize.setItem(param1,param2);
      }
      
      public function getStoneSynthesizeEquip() : Goods
      {
         return this.stoneSynthesize.getItem();
      }
      
      public function setStoneSynthesizeExpendGasAndProbability(param1:int, param2:int) : void
      {
         this.stoneSynthesize.setExpendGasAndProbability(param1,param2);
      }
      
      public function showMaterialSynthesize() : void
      {
         this.equipSynthesize.visible = false;
         this.stoneSynthesize.visible = false;
         this.materialSynthesize.visible = true;
         this.piliangBtn.visible = true;
         this.jingyanhe.visible = false;
         this.materialSynthesize.reset();
      }
      
      public function setMaterialSynthesizeMaterial(param1:Goods = null, param2:Goods = null, param3:Goods = null, param4:Goods = null, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : void
      {
         this.materialSynthesize.setMaterial(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setMaterialSynthesizeMainMaterial(param1:Goods, param2:Goods) : void
      {
         this.materialSynthesize.setItem(param1,param2);
      }
      
      public function getMaterialSynthesizeMainMaterial() : Goods
      {
         return this.materialSynthesize.getItem();
      }
      
      public function setMaterialSynthesizeExpendGasAndProbability(param1:int, param2:int) : void
      {
         this.materialSynthesize.setExpendGasAndProbability(param1,param2);
      }
      
      public function setPiliangBtn(param1:int) : void
      {
         if(param1 == 1)
         {
            this.piliangBtn.enabled = false;
            this.piliangBtn.label = LanResManager.getLanCommonTextWords("批量合成");
         }
         else if(param1 == 2)
         {
            this.piliangBtn.enabled = true;
            this.piliangBtn.label = LanResManager.getLanCommonTextWords("批量合成");
         }
         else if(param1 == 3)
         {
            this.piliangBtn.enabled = true;
            this.piliangBtn.label = LanResManager.getLanCommonTextWords("终止批量合成");
         }
      }
      
      public function showJingYanHe() : void
      {
         this.equipSynthesize.visible = false;
         this.stoneSynthesize.visible = false;
         this.materialSynthesize.visible = false;
         this.piliangBtn.visible = false;
         this.jingyanhe.visible = true;
         this.materialSynthesize.reset();
      }
      
      public function setStone(param1:Goods = null, param2:Goods = null) : void
      {
         this.jingyanhe.setStone(param1,param2);
      }
      
      public function setResult(param1:Array) : void
      {
         this.jingyanhe.setResult(param1);
      }
      
      public function setData(param1:int, param2:int) : void
      {
         this.jingyanhe.setData(param1,param2);
      }
   }
}

