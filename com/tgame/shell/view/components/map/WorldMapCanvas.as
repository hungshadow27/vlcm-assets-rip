package com.tgame.shell.view.components.map
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.PopMapPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class WorldMapCanvas extends FCanvas
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
      
      private var yuanyueshanzhuang:FSimpleButton;
      
      private var diwangbaoku:FSimpleButton;
      
      private var baituoshanxia:FSimpleButton;
      
      private var tip:FLabel;
      
      public function WorldMapCanvas()
      {
         var obj:DisplayObject;
         this.names = [LanResManager.getLanCommonTextWords("华山"),LanResManager.getLanCommonTextWords("古墓"),LanResManager.getLanCommonTextWords("神雕谷"),LanResManager.getLanCommonTextWords("终南后山"),LanResManager.getLanCommonTextWords("终南山"),LanResManager.getLanCommonTextWords("襄阳战场"),LanResManager.getLanCommonTextWords("渔村"),LanResManager.getLanCommonTextWords("桃花岛"),LanResManager.getLanCommonTextWords("襄阳城"),LanResManager.getLanCommonTextWords("终南山下"),LanResManager.getLanCommonTextWords("大胜关"),LanResManager.getLanCommonTextWords("牛家村"),LanResManager.getLanCommonTextWords("绝情深涧"),LanResManager.getLanCommonTextWords("绝情谷"),LanResManager.getLanCommonTextWords("圆月山庄"),LanResManager.getLanCommonTextWords("帝王宝库"),LanResManager.getLanCommonTextWords("白驼山下")];
         super();
         skin = "box";
         width = 574;
         height = 409;
         obj = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/world.jpg",629,403);
         obj.x = 3;
         obj.y = 3;
         addChild(obj);
         this.tip = new FLabel();
         with(this.tip)
         {
            filters = StaticValue.filter;
            x = 230;
            y = -18;
            textColor = 16777215;
         }
         this.tip.htmlText = LanResManager.getLanTextWords(this,"点击地图名称即可快速传送至该地图");
         addChild(this.tip);
         this.huashan = new FSimpleButton();
         this.huashan.skin = "huashan";
         this.huashan.name = "0";
         addChild(this.huashan);
         this.huashan.x = 224;
         this.huashan.y = 50;
         this.huashan.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gumu = new FSimpleButton();
         this.gumu.skin = "gumu";
         this.gumu.name = "1";
         addChild(this.gumu);
         this.gumu.x = 105;
         this.gumu.y = 58;
         this.gumu.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shendiaogu = new FSimpleButton();
         this.shendiaogu.skin = "shendiaogu";
         this.shendiaogu.name = "2";
         addChild(this.shendiaogu);
         this.shendiaogu.x = 196;
         this.shendiaogu.y = 102;
         this.shendiaogu.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhongnanhoushan = new FSimpleButton();
         this.zhongnanhoushan.skin = "zhongnanhoushan";
         this.zhongnanhoushan.name = "3";
         addChild(this.zhongnanhoushan);
         this.zhongnanhoushan.x = 30;
         this.zhongnanhoushan.y = 115;
         this.zhongnanhoushan.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhongnanshan = new FSimpleButton();
         this.zhongnanshan.skin = "zhongnanshan";
         this.zhongnanshan.name = "4";
         addChild(this.zhongnanshan);
         this.zhongnanshan.x = 140;
         this.zhongnanshan.y = 135;
         this.zhongnanshan.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xiangyangzhanchang = new FSimpleButton();
         this.xiangyangzhanchang.skin = "xiangyangzhanchang";
         this.xiangyangzhanchang.name = "5";
         addChild(this.xiangyangzhanchang);
         this.xiangyangzhanchang.x = 211;
         this.xiangyangzhanchang.y = 138;
         this.xiangyangzhanchang.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yuchun = new FSimpleButton();
         this.yuchun.skin = "yuchun";
         this.yuchun.name = "6";
         addChild(this.yuchun);
         this.yuchun.x = 342;
         this.yuchun.y = 133;
         this.yuchun.addEventListener(MouseEvent.CLICK,this.onClick);
         this.taohuadao = new FSimpleButton();
         this.taohuadao.skin = "taohuadao";
         this.taohuadao.name = "7";
         addChild(this.taohuadao);
         this.taohuadao.x = 426;
         this.taohuadao.y = 121;
         this.taohuadao.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xiangyangcheng = new FSimpleButton();
         this.xiangyangcheng.skin = "xiangyangcheng";
         this.xiangyangcheng.name = "8";
         addChild(this.xiangyangcheng);
         this.xiangyangcheng.x = 265;
         this.xiangyangcheng.y = 194;
         this.xiangyangcheng.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhongnanshanxia = new FSimpleButton();
         this.zhongnanshanxia.skin = "zhongnanshanxia";
         this.zhongnanshanxia.name = "9";
         addChild(this.zhongnanshanxia);
         this.zhongnanshanxia.x = 165;
         this.zhongnanshanxia.y = 226;
         this.zhongnanshanxia.addEventListener(MouseEvent.CLICK,this.onClick);
         this.dashengguan = new FSimpleButton();
         this.dashengguan.skin = "dashengguan";
         this.dashengguan.name = "10";
         addChild(this.dashengguan);
         this.dashengguan.x = 378;
         this.dashengguan.y = 245;
         this.dashengguan.addEventListener(MouseEvent.CLICK,this.onClick);
         this.niujiachun = new FSimpleButton();
         this.niujiachun.skin = "niujiachun";
         this.niujiachun.name = "11";
         addChild(this.niujiachun);
         this.niujiachun.x = 331;
         this.niujiachun.y = 306;
         this.niujiachun.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jueqingshenjian = new FSimpleButton();
         this.jueqingshenjian.skin = "jueqingshenjian";
         this.jueqingshenjian.name = "12";
         addChild(this.jueqingshenjian);
         this.jueqingshenjian.x = 95;
         this.jueqingshenjian.y = 297;
         this.jueqingshenjian.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jueqinggu = new FSimpleButton();
         this.jueqinggu.skin = "jueqinggu";
         this.jueqinggu.name = "13";
         addChild(this.jueqinggu);
         this.jueqinggu.x = 222;
         this.jueqinggu.y = 348;
         this.jueqinggu.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yuanyueshanzhuang = new FSimpleButton();
         this.yuanyueshanzhuang.skin = "yuanyueshanzhuang";
         this.yuanyueshanzhuang.name = "14";
         addChild(this.yuanyueshanzhuang);
         this.yuanyueshanzhuang.x = 222 + 80 + 38 + 15;
         this.yuanyueshanzhuang.y = 348 - 278 + 20 - 40;
         this.yuanyueshanzhuang.addEventListener(MouseEvent.CLICK,this.onClick);
         this.diwangbaoku = new FSimpleButton();
         this.diwangbaoku.skin = "diwangbaoku";
         this.diwangbaoku.name = "15";
         addChild(this.diwangbaoku);
         this.diwangbaoku.x = 378 + 55;
         this.diwangbaoku.y = 268 - 74;
         this.diwangbaoku.addEventListener(MouseEvent.CLICK,this.onClick);
         this.baituoshanxia = new FSimpleButton();
         this.baituoshanxia.skin = "baituoshanxia";
         this.baituoshanxia.name = "16";
         addChild(this.baituoshanxia);
         this.baituoshanxia.x = 30;
         this.baituoshanxia.y = 200;
         this.baituoshanxia.addEventListener(MouseEvent.CLICK,this.onClick);
         this.char = StaticValue.getMCByClassName("ui.map.worldmap.char");
         addChild(this.char);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(PopMapPanel.UI_MAP_WORLDMAP_MAP_NAME_BTN_CLICK,"",this.names[int(param1.target.name)]));
      }
      
      public function setChar(param1:String) : void
      {
         switch(param1)
         {
            case this.names[0]:
               this.char.x = 258;
               this.char.y = 57;
               break;
            case this.names[1]:
               this.char.x = 156;
               this.char.y = 87;
               break;
            case this.names[2]:
               this.char.x = 212;
               this.char.y = 102;
               break;
            case this.names[3]:
               this.char.x = 93;
               this.char.y = 124;
               break;
            case this.names[4]:
               this.char.x = 134;
               this.char.y = 166;
               break;
            case this.names[5]:
               this.char.x = 260;
               this.char.y = 167;
               break;
            case this.names[6]:
               this.char.x = 356;
               this.char.y = 180;
               break;
            case this.names[7]:
               this.char.x = 474;
               this.char.y = 147;
               break;
            case this.names[8]:
               this.char.x = 298;
               this.char.y = 219;
               break;
            case this.names[9]:
               this.char.x = 206;
               this.char.y = 238;
               break;
            case this.names[10]:
               this.char.x = 378;
               this.char.y = 268;
               break;
            case this.names[11]:
               this.char.x = 330;
               this.char.y = 324;
               break;
            case this.names[12]:
               this.char.x = 177;
               this.char.y = 334;
               break;
            case this.names[13]:
               this.char.x = 251;
               this.char.y = 339;
               break;
            case this.names[14]:
               this.char.x = 222 + 80 + 38 + 53;
               this.char.y = 348 - 278 + 10 + 20;
               break;
            case this.names[15]:
               this.char.x = 378 + 61;
               this.char.y = 268 - 48;
               break;
            case this.names[16]:
               this.char.x = 113;
               this.char.y = 215;
         }
      }
   }
}

