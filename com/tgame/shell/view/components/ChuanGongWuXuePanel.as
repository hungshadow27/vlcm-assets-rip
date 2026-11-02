package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Skill;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class ChuanGongWuXuePanel extends FPanel
   {
      
      public static const UI_CHUANGONGWUXUE_DIZI_SHOW:String = "UI_CHUANGONGWUXUE_DIZI_SHOW";
      
      public static const UI_CHUANGONGWUXUE_DIZIWUXUE_SHOW:String = "UI_CHUANGONGWUXUE_DIZIWUXUE_SHOW";
      
      public static const UI_CHUANGONGWUXUE_DIZI_DRAGUP_1:String = "UI_CHUANGONGWUXUE_DIZI_DRAGUP_1";
      
      public static const UI_CHUANGONGWUXUE_DIZI_DRAGUP:String = "UI_CHUANGONGWUXUE_DIZI_DRAGUP";
      
      public static const UI_CHUANGONGWUXUE_DIZI_YICHU:String = "UI_CHUANGONGWUXUE_DIZI_YICHU";
      
      private var tabBar:FTabBar;
      
      private var diziWuXue:DiZiWuXueCanvas;
      
      private var nameArr:Array = [];
      
      private var aaa:int = 0;
      
      private var bg1:DisplayObject;
      
      public function ChuanGongWuXuePanel()
      {
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 755;
         height = 459 + 70;
         this.titleText = LanResManager.getLanCommonTextWords("传功武学");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/skill.swf");
         this.bg1.x = 11;
         this.bg1.y = 24;
         addChild(this.bg1);
         this.nameArr = new Array();
         this.diziWuXue = new DiZiWuXueCanvas();
         this.diziWuXue.$parent = this;
         addChild(this.diziWuXue);
         this.diziWuXue.x = 6;
         this.diziWuXue.y = 22;
         this.diziWuXue.visible = true;
         this.tabBar = new FTabBar();
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.tabBar.removeAllButton();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:String = (param1.target as FButton).label;
         var _loc3_:int = 0;
         while(_loc3_ < this.nameArr.length)
         {
            if(_loc2_ == this.nameArr[_loc3_].name)
            {
               this.aaa = this.nameArr[_loc3_].id;
            }
            _loc3_++;
         }
         dispatchEvent(new BaseEvent(UI_CHUANGONGWUXUE_DIZIWUXUE_SHOW,"",this.aaa));
         this.diziWuXue.visible = false;
      }
      
      public function setDizi(param1:Array) : void
      {
         this.nameArr = param1;
         this.tabBar.removeAllButton();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.tabBar.addButton(param1[_loc2_].name,this.onClick);
            if(_loc2_ == 0)
            {
               dispatchEvent(new BaseEvent(UI_CHUANGONGWUXUE_DIZIWUXUE_SHOW,"",param1[_loc2_].id));
               this.tabBar.setCurrentButtonByLabel(param1[_loc2_].name);
            }
            _loc2_++;
         }
         this.diziWuXue.visible = false;
      }
      
      public function showParty(param1:Boolean = false) : void
      {
         this.diziWuXue.visible = true;
      }
      
      public function setDiZiWuXue(param1:int, param2:Array, param3:Array, param4:Array, param5:Array) : void
      {
         this.diziWuXue.visible = true;
         this.diziWuXue.setSkil(param1,param2,param3,param4);
         this.diziWuXue.setShiYongSkill(param5);
      }
      
      public function getDiZiWuXueBySkill(param1:Skill) : ItemFace
      {
         return this.diziWuXue.getKungFuBySkill(param1);
      }
   }
}

