package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.menghuanshuxingka.FujiaShuxingChongzhiCanvas;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class MenghuanShuxingKa extends FPanel
   {
      
      public static const UI_FUJIASHUXINGCHONGZHI_CHONGZHI_CLICK:String = "UI_FUJIASHUXINGCHONGZHI_CHONGZHI_CLICK";
      
      public static const UI_FUJIASHUXINGCHONGZHI_SETEQUIPBTN_CLICK:String = "UI_FUJIASHUXINGCHONGZHI_SETEQUIPBTN_CLICK";
      
      public static const UI_FUJIASHUXINGCHONGZHI_GETEQUIPBTN_CLICK:String = "UI_FUJIASHUXINGCHONGZHI_GETEQUIPBTN_CLICK";
      
      private var tabBar:FTabBar;
      
      private var fujiaCount:FujiaShuxingChongzhiCanvas;
      
      public function MenghuanShuxingKa()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 347;
         height = 398;
         this.titleText = LanResManager.getLanCommonTextWords("梦幻属性卡");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.fujiaCount = new FujiaShuxingChongzhiCanvas();
         addChild(this.fujiaCount);
         this.fujiaCount.$parent = this;
         this.fujiaCount.x = 10;
         this.fujiaCount.y = 22;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.fujiaCount.bg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("附加属性数值梦幻重置"),this.onTabClick);
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
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("附加属性数值梦幻重置"):
         }
      }
      
      public function setCailiao(param1:Goods, param2:String, param3:Boolean, param4:int) : void
      {
         this.fujiaCount.setCailiao(param1,param2,param3,param4);
      }
      
      public function setEquip(param1:Goods) : void
      {
         this.fujiaCount.setEquip(param1);
      }
      
      public function getEquip() : Goods
      {
         return this.fujiaCount.getEquip();
      }
      
      public function setShuxing(param1:String) : void
      {
         this.fujiaCount.setShuxing(param1);
      }
   }
}

