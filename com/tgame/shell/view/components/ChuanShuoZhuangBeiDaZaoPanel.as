package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.chuanshuozhuangbeidazao.ChengZhuangDaZaoPanel;
   import com.tgame.shell.view.components.chuanshuozhuangbeidazao.ChengZhuangShuXingResetPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class ChuanShuoZhuangBeiDaZaoPanel extends FPanel
   {
      
      public static const UI_EQUIPPUDDING_CHENGZHUANGDAZAO_SHOW:String = "UI_EQUIPPUDDING_CHENGZHUANGDAZAO_SHOW";
      
      public static const UI_EQUIPPUDDING_CHENGZHUANGSHUXING_RESTE_SHOW:String = "UI_EQUIPPUDDING_CHENGZHUANGSHUXING_RESTE_SHOW";
      
      public static const UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_STARTBTN_CLICK:String = "UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_STARTBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_SETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_SETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_GETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_CHENGZHUANG_DAZAO_GETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_STARTBTN_CLICK:String = "UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_STARTBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_SETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_SETEQUIPBTN_CLICK";
      
      public static const UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_GETEQUIPBTN_CLICK:String = "UI_EQUIPPUDDING_CHENGZHUANG_SHUXING_RESET_GETEQUIPBTN_CLICK";
      
      private var tabBar:FTabBar;
      
      private var chengZhuangDaZaoPanel:ChengZhuangDaZaoPanel;
      
      private var chengZhuangShuXingResetPanel:ChengZhuangShuXingResetPanel;
      
      public function ChuanShuoZhuangBeiDaZaoPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 325;
         height = 396;
         this.titleText = LanResManager.getLanCommonTextWords("装备炼制");
         this.addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("橙装打造"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("橙装属性重置"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.chengZhuangDaZaoPanel = new ChengZhuangDaZaoPanel();
         addChild(this.chengZhuangDaZaoPanel);
         this.chengZhuangDaZaoPanel.$parent = this;
         this.chengZhuangDaZaoPanel.x = 10;
         this.chengZhuangDaZaoPanel.y = 22;
         this.chengZhuangDaZaoPanel.visible = true;
         this.chengZhuangShuXingResetPanel = new ChengZhuangShuXingResetPanel();
         addChild(this.chengZhuangShuXingResetPanel);
         this.chengZhuangShuXingResetPanel.$parent = this;
         this.chengZhuangShuXingResetPanel.x = 10;
         this.chengZhuangShuXingResetPanel.y = 22;
         this.chengZhuangShuXingResetPanel.visible = false;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.chengZhuangDaZaoPanel.bgImg);
         _loc1_.push(this.chengZhuangShuXingResetPanel.bgImg);
         this.DynamicManageImages = _loc1_;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("橙装打造"):
               dispatchEvent(new BaseEvent(UI_EQUIPPUDDING_CHENGZHUANGDAZAO_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("橙装属性重置"):
               dispatchEvent(new BaseEvent(UI_EQUIPPUDDING_CHENGZHUANGSHUXING_RESTE_SHOW));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showChengZhuangDaZaoPanel(param1:Boolean = false) : void
      {
         this.chengZhuangDaZaoPanel.visible = true;
         this.chengZhuangShuXingResetPanel.visible = false;
      }
      
      public function setChengDaZaoEquip(param1:Goods) : void
      {
         this.chengZhuangDaZaoPanel.setEquip(param1);
      }
      
      public function getChengDaZaoEquip() : Goods
      {
         return this.chengZhuangDaZaoPanel.getEquip();
      }
      
      public function setChengDaZaoInnateAttributeExpendGasAndProbability(param1:int, param2:int, param3:Boolean, param4:int) : void
      {
      }
      
      public function seChengDaZaoInnateAttributeEnergyExpendItem(param1:Boolean = true, param2:Goods = null) : void
      {
         this.chengZhuangDaZaoPanel.setEnergyExpendItem(param1,param2);
      }
      
      public function showChengZhuangShuXingResetPanel(param1:Boolean = false) : void
      {
         this.chengZhuangShuXingResetPanel.visible = true;
         this.chengZhuangDaZaoPanel.visible = false;
      }
      
      public function setChengShuXingResetEquip(param1:Goods) : void
      {
         this.chengZhuangShuXingResetPanel.setEquip(param1);
      }
      
      public function getChengShuXingResetEquip() : Goods
      {
         return this.chengZhuangShuXingResetPanel.getEquip();
      }
      
      public function setChengResetInnateAttributeExpendGasAndProbability(param1:int, param2:int, param3:Boolean, param4:int) : void
      {
      }
      
      public function setChengResetInnateAttributeEnergyExpendItem(param1:Boolean = true, param2:Goods = null) : void
      {
         this.chengZhuangShuXingResetPanel.setEnergyExpendItem(param1,param2);
      }
   }
}

