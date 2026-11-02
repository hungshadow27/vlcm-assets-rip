package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.huizhangHecheng.DazaoshiHecheng;
   import com.tgame.shell.view.components.huizhangHecheng.HuizhangHecheng;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class HuizhangDazaoHechengPanel extends FPanel
   {
      
      public static const UI_DAZAOSHIHECHENG_SHOW:String = "UI_DAZAOSHIHECHENG_SHOW";
      
      public static const UI_STONE_PANEL_MAKE_PUT_STONE:String = "UI_STONE_PANEL_MAKE_PUT_STONE";
      
      public static const UI_STONE_PANEL_MAKE_GET_STONE:String = "UI_STONE_PANEL_MAKE_GET_STONE";
      
      public static const UI_STONE_PANEL_MAKE_START:String = "UI_STONE_PANEL_MAKE_START";
      
      public static const UI_HUIZHANGHECHENG_SHOW:String = "UI_HUIZHANGHECHENG_SHOW";
      
      public static const UI_STONE_PANEL_MAKE_PUT_STONE_HUIZHANG:String = "UI_STONE_PANEL_MAKE_PUT_STONE_HUIZHANG";
      
      public static const UI_STONE_PANEL_MAKE_GET_STONE_HUIZHANG:String = "UI_STONE_PANEL_MAKE_GET_STONE_HUIZHANG";
      
      public static const UI_STONE_PANEL_MAKE_START_HUIZHANG:String = "UI_STONE_PANEL_MAKE_START_HUIZHANG";
      
      public static const UI_STONE_PANEL_MAKE_USE_BIND_STONE:String = "UI_STONE_PANEL_MAKE_USE_BIND_STONE";
      
      public var tabBar:FTabBar;
      
      private var dazaoshi:DazaoshiHecheng;
      
      private var huizhang:HuizhangHecheng;
      
      public function HuizhangDazaoHechengPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 313;
         height = 396;
         this.titleText = LanResManager.getLanCommonTextWords("徽章打造合成");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.dazaoshi = new DazaoshiHecheng();
         this.dazaoshi.visible = false;
         this.dazaoshi.$parent = this;
         addChild(this.dazaoshi);
         this.dazaoshi.x = 10;
         this.dazaoshi.y = 22;
         this.huizhang = new HuizhangHecheng();
         this.huizhang.visible = false;
         this.huizhang.$parent = this;
         addChild(this.huizhang);
         this.huizhang.x = 10;
         this.huizhang.y = 22;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.dazaoshi.bg);
         _loc1_.push(this.huizhang.bg);
         DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("打造石合成"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("徽章合成"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("打造石合成"):
               dispatchEvent(new BaseEvent(UI_DAZAOSHIHECHENG_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("徽章合成"):
               dispatchEvent(new BaseEvent(UI_HUIZHANGHECHENG_SHOW));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function showDazaoshi() : void
      {
         this.dazaoshi.visible = true;
         this.huizhang.visible = false;
         this.dazaoshi.reset();
      }
      
      public function setStone(param1:Goods = null, param2:Goods = null) : void
      {
         this.dazaoshi.setStone(param1,param2);
      }
      
      public function setResult(param1:Array) : void
      {
         this.dazaoshi.setResult(param1);
      }
      
      public function reset() : void
      {
         this.dazaoshi.reset();
      }
      
      public function setBingStone(param1:Goods, param2:String, param3:Boolean, param4:Boolean) : void
      {
         this.dazaoshi.setBingStone(param1,param2,param3,param4);
      }
      
      public function showHuizhang() : void
      {
         this.dazaoshi.visible = false;
         this.huizhang.visible = true;
         this.huizhang.reset();
      }
      
      public function setStone_Huizhang(param1:Goods = null, param2:Goods = null) : void
      {
         this.huizhang.setStone(param1,param2);
      }
      
      public function setResult_Huizhang(param1:Array) : void
      {
         this.huizhang.setResult(param1);
      }
      
      public function reset_Huizhang() : void
      {
         this.huizhang.reset();
      }
   }
}

