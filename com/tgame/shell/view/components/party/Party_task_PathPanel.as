package com.tgame.shell.view.components.party
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class Party_task_PathPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var names:Array;
      
      private var char:Sprite;
      
      private var huashan:FSimpleButton;
      
      private var gumu:FSimpleButton;
      
      private var shendiaogu:FSimpleButton;
      
      private var zhongnanhoushan:FSimpleButton;
      
      private var zhongnanshan:FSimpleButton;
      
      private var xiangyangzhanchang:FSimpleButton;
      
      private var yuchun:FSimpleButton;
      
      private var taohuadao:FSimpleButton;
      
      private var xiangyangcheng:FSimpleButton;
      
      private var zhongnanshanxia:FSimpleButton;
      
      private var dashengguan:FSimpleButton;
      
      private var niujiachun:FSimpleButton;
      
      private var jueqingshenjian:FSimpleButton;
      
      private var jueqinggu:FSimpleButton;
      
      private var path1:Bitmap;
      
      private var path2:Bitmap;
      
      private var path3:Bitmap;
      
      private var pathBg:Sprite;
      
      public function Party_task_PathPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 590;
         height = 451;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/world.jpg",569,403);
         _loc1_.x = 10;
         _loc1_.y = 3;
         addChildAt(_loc1_,0);
         this.huashan = new FSimpleButton();
         this.huashan.skin = "huashan";
         this.huashan.name = "0";
         addChild(this.huashan);
         this.huashan.x = 224;
         this.huashan.y = 50;
         this.gumu = new FSimpleButton();
         this.gumu.skin = "gumu";
         this.gumu.name = "1";
         addChild(this.gumu);
         this.gumu.x = 105;
         this.gumu.y = 58;
         this.shendiaogu = new FSimpleButton();
         this.shendiaogu.skin = "shendiaogu";
         this.shendiaogu.name = "2";
         addChild(this.shendiaogu);
         this.shendiaogu.x = 196;
         this.shendiaogu.y = 102;
         this.zhongnanhoushan = new FSimpleButton();
         this.zhongnanhoushan.skin = "zhongnanhoushan";
         this.zhongnanhoushan.name = "3";
         addChild(this.zhongnanhoushan);
         this.zhongnanhoushan.x = 30;
         this.zhongnanhoushan.y = 115;
         this.zhongnanshan = new FSimpleButton();
         this.zhongnanshan.skin = "zhongnanshan";
         this.zhongnanshan.name = "4";
         addChild(this.zhongnanshan);
         this.zhongnanshan.x = 140;
         this.zhongnanshan.y = 135;
         this.xiangyangzhanchang = new FSimpleButton();
         this.xiangyangzhanchang.skin = "xiangyangzhanchang";
         this.xiangyangzhanchang.name = "5";
         addChild(this.xiangyangzhanchang);
         this.xiangyangzhanchang.x = 211;
         this.xiangyangzhanchang.y = 138;
         this.yuchun = new FSimpleButton();
         this.yuchun.skin = "yuchun";
         this.yuchun.name = "6";
         addChild(this.yuchun);
         this.yuchun.x = 342;
         this.yuchun.y = 133;
         this.taohuadao = new FSimpleButton();
         this.taohuadao.skin = "taohuadao";
         this.taohuadao.name = "7";
         addChild(this.taohuadao);
         this.taohuadao.x = 426;
         this.taohuadao.y = 121;
         this.xiangyangcheng = new FSimpleButton();
         this.xiangyangcheng.skin = "xiangyangcheng";
         this.xiangyangcheng.name = "8";
         addChild(this.xiangyangcheng);
         this.xiangyangcheng.x = 265;
         this.xiangyangcheng.y = 194;
         this.zhongnanshanxia = new FSimpleButton();
         this.zhongnanshanxia.skin = "zhongnanshanxia";
         this.zhongnanshanxia.name = "9";
         addChild(this.zhongnanshanxia);
         this.zhongnanshanxia.x = 165;
         this.zhongnanshanxia.y = 226;
         this.dashengguan = new FSimpleButton();
         this.dashengguan.skin = "dashengguan";
         this.dashengguan.name = "10";
         addChild(this.dashengguan);
         this.dashengguan.x = 378;
         this.dashengguan.y = 245;
         this.niujiachun = new FSimpleButton();
         this.niujiachun.skin = "niujiachun";
         this.niujiachun.name = "11";
         addChild(this.niujiachun);
         this.niujiachun.x = 331;
         this.niujiachun.y = 306;
         this.jueqingshenjian = new FSimpleButton();
         this.jueqingshenjian.skin = "jueqingshenjian";
         this.jueqingshenjian.name = "12";
         addChild(this.jueqingshenjian);
         this.jueqingshenjian.x = 95;
         this.jueqingshenjian.y = 297;
         this.jueqinggu = new FSimpleButton();
         this.jueqinggu.skin = "jueqinggu";
         this.jueqinggu.name = "13";
         addChild(this.jueqinggu);
         this.jueqinggu.x = 222;
         this.jueqinggu.y = 348;
         this.pathBg = new Sprite();
         addChild(this.pathBg);
         this.path1 = new Bitmap();
         this.path1.name = "ui.party.task.jueqinggu.1";
         this.path1.x = 57;
         this.path1.y = 79;
         this.path1.x = 233;
         this.path1.y = 226;
         this.path2 = new Bitmap();
         this.path2.name = "ui.party.task.zhongnanshan.1";
         this.path2.x = 57;
         this.path2.y = 79;
         this.path3 = new Bitmap();
         this.path3.name = "ui.party.task.huashan.1";
         this.path3.x = 216;
         this.path3.y = 41;
         this.pathBg.addChild(this.path1);
         this.pathBg.addChild(this.path2);
         this.pathBg.addChild(this.path3);
         var _loc2_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc2_.push(this.path1);
         _loc2_.push(this.path2);
         _loc2_.push(this.path3);
         this.DynamicManageImages = _loc2_;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
      }
      
      public function aa() : void
      {
      }
      
      public function setPath(param1:int = 0) : void
      {
         if(param1 == 0)
         {
            return;
         }
         switch(param1)
         {
            case 1:
               this.path1.filters = [];
               this.path2.filters = Tools.blackWhiteFilter;
               this.path3.filters = Tools.blackWhiteFilter;
               break;
            case 2:
               this.path1.filters = Tools.blackWhiteFilter;
               this.path2.filters = [];
               this.path3.filters = Tools.blackWhiteFilter;
               break;
            case 3:
               this.path1.filters = Tools.blackWhiteFilter;
               this.path2.filters = Tools.blackWhiteFilter;
               this.path3.filters = [];
         }
      }
   }
}

