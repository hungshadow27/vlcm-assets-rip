package com.tgame.shell.view.components.huangtubaye
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.MainButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.HuangTuBaYePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class JiangShanSheJi extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var bg1:DisplayObject;
      
      private var xinxi:FTextArea;
      
      private var shijian:FTextArea;
      
      private var ft:FTextArea;
      
      private var fenglubiao:FTextArea;
      
      private var chakanBtn:SmallButton;
      
      private var mobaiBtn:MainButton;
      
      private var lingquBtn:MainButton;
      
      private var bg3:DisplayObject;
      
      private var xuWei1:DisplayObject;
      
      private var xuWei2:DisplayObject;
      
      private var xuWei3:DisplayObject;
      
      private var xuWei4:DisplayObject;
      
      private var xuWei5:DisplayObject;
      
      private var xuWei6:DisplayObject;
      
      private var mingzi1:FTextArea;
      
      private var mingzi2:FTextArea;
      
      private var mingzi3:FTextArea;
      
      private var mingzi4:FTextArea;
      
      private var mingzi5:FTextArea;
      
      private var mingzi6:FTextArea;
      
      private var bloodMc1:MovieClip;
      
      private var bloodMcSpr1:Sprite;
      
      private var bloodMc2:MovieClip;
      
      private var bloodMcSpr2:Sprite;
      
      private var bloodMc3:MovieClip;
      
      private var bloodMcSpr3:Sprite;
      
      private var bloodMc4:MovieClip;
      
      private var bloodMcSpr4:Sprite;
      
      private var bloodMc5:MovieClip;
      
      private var bloodMcSpr5:Sprite;
      
      private var bloodMc6:MovieClip;
      
      private var bloodMcSpr6:Sprite;
      
      private var bloodMc0:MovieClip;
      
      private var hudong1:Sprite;
      
      private var hudong2:Sprite;
      
      private var hudong3:Sprite;
      
      private var hudong4:Sprite;
      
      private var hudong5:Sprite;
      
      private var hudong6:Sprite;
      
      private var bg9:F9GridBitmap;
      
      private var bg10:F9GridBitmap;
      
      private var tf:TextFormat;
      
      private var mcObj11:Array;
      
      private var mcObj12:Array;
      
      private var mcObj21:Array;
      
      private var mcObj22:Array;
      
      private var mcObj31:Array;
      
      private var mcObj32:Array;
      
      private var mcObj41:Array;
      
      private var mcObj42:Array;
      
      private var mcObj51:Array;
      
      private var mcObj52:Array;
      
      private var mcObj61:Array;
      
      private var mcObj62:Array;
      
      private var aaaaArr:Array;
      
      private var renwuArr:Array;
      
      public function JiangShanSheJi()
      {
         var rwArr:Array;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/jssjbg.swf");
         this.bg1.x = 2;
         this.bg1.y = 2;
         addChild(this.bg1);
         rwArr = [{
            "x":33,
            "y":333
         },{
            "x":150,
            "y":280
         },{
            "x":250,
            "y":150
         },{
            "x":350,
            "y":150
         },{
            "x":450,
            "y":280
         },{
            "x":550,
            "y":333
         }];
         this.bg9 = Tools.get9GridBitmpByName("jiangshansheji9_bg");
         this.bg9.width = 250;
         this.bg9.height = 100 + 11;
         this.bg9.x = 365;
         this.bg9.y = 453 - 11;
         addChild(this.bg9);
         this.bg9 = Tools.get9GridBitmpByName("jiangshanshejishijian9_bg");
         this.bg9.width = 370;
         this.bg9.x = 300;
         this.bg9.y = 10;
         addChild(this.bg9);
         this.bloodMcSpr1 = new Sprite();
         this.bloodMcSpr1.x = 80 + 20 + 50 + 30 + 110;
         this.bloodMcSpr1.y = 350 - 130 - 225 + 20 + 115 + 16;
         addChild(this.bloodMcSpr1);
         this.bloodMcSpr2 = new Sprite();
         this.bloodMcSpr2.x = 170 + 190 - 30 + 110;
         this.bloodMcSpr2.y = 350 - 130 - 225 + 20 + 115 + 16;
         addChild(this.bloodMcSpr2);
         this.bloodMcSpr3 = new Sprite();
         this.bloodMcSpr3.x = 250 - 195 - 20 + 10 + 178 - 6;
         this.bloodMcSpr3.y = 150 - 130 + 55 + 114 + 18;
         addChild(this.bloodMcSpr3);
         this.bloodMcSpr4 = new Sprite();
         this.bloodMcSpr4.x = 350 + 78 - 10 + 178 - 13;
         this.bloodMcSpr4.y = 150 - 130 + 55 + 114 + 18;
         addChild(this.bloodMcSpr4);
         this.bloodMcSpr5 = new Sprite();
         this.bloodMcSpr5.x = 450 - 495 - 30 - 15 + 106;
         this.bloodMcSpr5.y = 250 - 130 + 55 + 40 - 10 + 108;
         addChild(this.bloodMcSpr5);
         this.bloodMcSpr6 = new Sprite();
         this.bloodMcSpr6.x = 660 - 150 + 25 + 20 + 106;
         this.bloodMcSpr6.y = 250 - 130 + 55 + 40 - 10 + 108;
         addChild(this.bloodMcSpr6);
         this.mcObj11 = new Array();
         this.mcObj12 = new Array();
         this.mcObj21 = new Array();
         this.mcObj22 = new Array();
         this.mcObj31 = new Array();
         this.mcObj32 = new Array();
         this.mcObj41 = new Array();
         this.mcObj42 = new Array();
         this.mcObj51 = new Array();
         this.mcObj52 = new Array();
         this.mcObj61 = new Array();
         this.mcObj62 = new Array();
         this.hudong1 = new Sprite();
         this.hudong1.x = 365 + 30;
         this.hudong1.y = 155 + 20;
         with(this.hudong1.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,85,200);
            endFill();
         }
         this.hudong1.name = "hd1";
         addChild(this.hudong1);
         this.hudong1.addEventListener(MouseEvent.CLICK,this.mrClick);
         this.hudong1.addEventListener(MouseEvent.MOUSE_OVER,this.mouseover);
         this.hudong1.addEventListener(MouseEvent.MOUSE_OUT,this.mouseout);
         this.hudong2 = new Sprite();
         this.hudong2.x = 544;
         this.hudong2.y = 150 + 20;
         with(this.hudong2.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,85,200);
            endFill();
         }
         this.hudong2.name = "hd2";
         addChild(this.hudong2);
         this.hudong2.addEventListener(MouseEvent.CLICK,this.mrClick);
         this.hudong2.addEventListener(MouseEvent.MOUSE_OVER,this.mouseover);
         this.hudong2.addEventListener(MouseEvent.MOUSE_OUT,this.mouseout);
         this.hudong3 = new Sprite();
         this.hudong3.x = 240 + 10;
         this.hudong3.y = 230;
         with(this.hudong3.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,85,200);
            endFill();
         }
         this.hudong3.name = "hd3";
         addChild(this.hudong3);
         this.hudong3.addEventListener(MouseEvent.CLICK,this.mrClick);
         this.hudong3.addEventListener(MouseEvent.MOUSE_OVER,this.mouseover);
         this.hudong3.addEventListener(MouseEvent.MOUSE_OUT,this.mouseout);
         this.hudong4 = new Sprite();
         this.hudong4.x = 636;
         this.hudong4.y = 230 + 10;
         with(this.hudong4.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,85,200);
            endFill();
         }
         this.hudong4.name = "hd4";
         addChild(this.hudong4);
         this.hudong4.addEventListener(MouseEvent.CLICK,this.mrClick);
         this.hudong4.addEventListener(MouseEvent.MOUSE_OVER,this.mouseover);
         this.hudong4.addEventListener(MouseEvent.MOUSE_OUT,this.mouseout);
         this.hudong5 = new Sprite();
         this.hudong5.x = 132 - 15;
         this.hudong5.y = 350 - 20 + 10 + 10;
         with(this.hudong5.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,85,200);
            endFill();
         }
         this.hudong5.name = "hd5";
         addChild(this.hudong5);
         this.hudong5.addEventListener(MouseEvent.CLICK,this.mrClick);
         this.hudong5.addEventListener(MouseEvent.MOUSE_OVER,this.mouseover);
         this.hudong5.addEventListener(MouseEvent.MOUSE_OUT,this.mouseout);
         this.hudong6 = new Sprite();
         this.hudong6.x = 748 + 20;
         this.hudong6.y = 360 - 20 + 10;
         with(this.hudong6.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,85,200);
            endFill();
         }
         this.hudong6.name = "hd6";
         addChild(this.hudong6);
         this.hudong6.addEventListener(MouseEvent.CLICK,this.mrClick);
         this.hudong6.addEventListener(MouseEvent.MOUSE_OVER,this.mouseover);
         this.hudong6.addEventListener(MouseEvent.MOUSE_OUT,this.mouseout);
         this.xuWei1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei1.x = 365 + 30;
         this.xuWei1.y = 140;
         addChild(this.xuWei1);
         this.xuWei2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei2.x = 550;
         this.xuWei2.y = 145;
         addChild(this.xuWei2);
         this.xuWei3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei3.x = 259;
         this.xuWei3.y = 214;
         addChild(this.xuWei3);
         this.xuWei4 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei4.x = 632;
         this.xuWei4.y = 214;
         addChild(this.xuWei4);
         this.xuWei5 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei5.x = 129;
         this.xuWei5.y = 332;
         addChild(this.xuWei5);
         this.xuWei6 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/xuweiyidai.swf");
         this.xuWei6.x = 775;
         this.xuWei6.y = 336;
         addChild(this.xuWei6);
         this.mingzi1 = new FTextArea();
         addChild(this.mingzi1);
         this.mingzi1.multiline = true;
         this.mingzi1.wordWrap = true;
         this.mingzi1.filters = StaticValue.filter;
         this.mingzi1.autoSize = TextFieldAutoSize.LEFT;
         this.mingzi1.x = 365 + 30;
         this.mingzi1.y = 145;
         this.mingzi2 = new FTextArea();
         addChild(this.mingzi2);
         this.mingzi2.multiline = true;
         this.mingzi2.filters = StaticValue.filter;
         this.mingzi2.autoSize = TextFieldAutoSize.LEFT;
         this.mingzi2.wordWrap = true;
         this.mingzi2.x = 550;
         this.mingzi2.y = 150;
         this.mingzi3 = new FTextArea();
         addChild(this.mingzi3);
         this.mingzi3.multiline = true;
         this.mingzi3.wordWrap = true;
         this.mingzi3.filters = StaticValue.filter;
         this.mingzi3.autoSize = TextFieldAutoSize.LEFT;
         this.mingzi3.x = 259;
         this.mingzi3.y = 214 + 5;
         this.mingzi4 = new FTextArea();
         addChild(this.mingzi4);
         this.mingzi4.multiline = true;
         this.mingzi4.wordWrap = true;
         this.mingzi4.filters = StaticValue.filter;
         this.mingzi4.autoSize = TextFieldAutoSize.LEFT;
         this.mingzi4.x = 632;
         this.mingzi4.y = 214 + 5;
         this.mingzi5 = new FTextArea();
         addChild(this.mingzi5);
         this.mingzi5.multiline = true;
         this.mingzi5.wordWrap = true;
         this.mingzi5.filters = StaticValue.filter;
         this.mingzi5.autoSize = TextFieldAutoSize.LEFT;
         this.mingzi5.x = 129;
         this.mingzi5.y = 332 + 5;
         this.mingzi6 = new FTextArea();
         addChild(this.mingzi6);
         this.mingzi6.multiline = true;
         this.mingzi6.wordWrap = true;
         this.mingzi6.filters = StaticValue.filter;
         this.mingzi6.autoSize = TextFieldAutoSize.LEFT;
         this.mingzi6.x = 775;
         this.mingzi6.y = 336 + 5;
         this.xinxi = new FTextArea();
         addChild(this.xinxi);
         this.xinxi.multiline = true;
         this.xinxi.wordWrap = true;
         this.xinxi.width = 230;
         this.xinxi.height = 120;
         this.xinxi.x = 10 + 365;
         this.xinxi.y = 10 + 453 - 11;
         this.ft = new FTextArea();
         this.ft.multiline = true;
         this.ft.wordWrap = true;
         this.ft.filters = StaticValue.filter;
         this.ft.width = 150 + 200;
         this.ft.height = 60;
         this.ft.x = -5;
         this.ft.y = 485 + 80;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("皇主帮派的成员，可以每天领取1次俸禄，点击【领取俸禄】") + "<br>" + LanResManager.getLanCommonTextWords("所有玩家每天可以点击1次【领取俸禄】，随机获得奖励") + "</font>";
         addChild(this.ft);
         this.chakanBtn = new SmallButton();
         this.chakanBtn.label = LanResManager.getLanCommonTextWords("查看信息");
         addChild(this.chakanBtn);
         this.chakanBtn.x = 120 + 365 + 55;
         this.chakanBtn.y = 53 + 453;
         this.chakanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.mobaiBtn = new MainButton();
         this.mobaiBtn.label = LanResManager.getLanCommonTextWords("膜拜皇主");
         addChild(this.mobaiBtn);
         this.mobaiBtn.x = 245 + 130;
         this.mobaiBtn.y = 570;
         this.mobaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn = new MainButton();
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("领取俸禄");
         addChild(this.lingquBtn);
         this.lingquBtn.x = 400 + 130;
         this.lingquBtn.y = 570;
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fenglubiao = new FTextArea();
         this.fenglubiao.multiline = true;
         this.fenglubiao.filters = StaticValue.filter;
         this.fenglubiao.width = 100;
         this.fenglubiao.height = 25;
         this.fenglubiao.x = 444 - 174 + 45 + 575;
         this.fenglubiao.y = 480 + 7 + 87;
         addChild(this.fenglubiao);
         this.fenglubiao.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("俸禄查询表") + "</u></a></font>";
         this.fenglubiao.addEventListener(MouseEvent.CLICK,this.onClick2);
         this.shijian = new FTextArea();
         addChild(this.shijian);
         this.shijian.defaultTextFormat = this.tf;
         this.shijian.width = 280;
         this.shijian.height = 20;
         this.shijian.x = 344;
         this.shijian.y = 15;
      }
      
      private function mrClick(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "hd1":
               this.setbloodMc1(2);
               break;
            case "hd2":
               this.setbloodMc2(2);
               break;
            case "hd3":
               this.setbloodMc3(2);
               break;
            case "hd4":
               this.setbloodMc4(2);
               break;
            case "hd5":
               this.setbloodMc5(2);
               break;
            case "hd6":
               this.setbloodMc6(2);
         }
      }
      
      private function mouseover(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.HAND;
      }
      
      private function mouseout(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.chakanBtn:
               this.$parent.dispatchEvent(new BaseEvent(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_CHAKAN));
               break;
            case this.mobaiBtn:
               this.$parent.dispatchEvent(new BaseEvent(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_MOBAI));
               break;
            case this.lingquBtn:
               this.$parent.dispatchEvent(new BaseEvent(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_LINGQU));
         }
      }
      
      private function onClick2(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(HuangTuBaYePanel.UI_HUANGTUBAYE_JIANGSHANSHEJI_JIANGLI));
      }
      
      public function setinitilizeUI(param1:String, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Array) : void
      {
         var _loc8_:int = 1;
         while(_loc8_ <= 6)
         {
            this["mingzi" + _loc8_].htmlText = "";
            _loc8_++;
         }
         this.xinxi.htmlText = "<textformat leading=\'10\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("占领帮会：") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前皇主：") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("在位") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + "</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("天") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("受到膜拜次数：") + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param4 + "</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("次") + "</font>" + "</textformat>";
         this.shijian.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【第") + param5 + LanResManager.getLanCommonTextWords("战】开战时间") + param6 + "</font>";
         this.setRenwu(param7);
      }
      
      private function setRenwu(param1:Array) : void
      {
         this.renwuArr = param1;
         this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/shangshu.swf");
         this.bg3.x = 160 - 25 - 14;
         this.bg3.y = 310 - 53 + 24;
         addChild(this.bg3);
         this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/liehou.swf");
         this.bg3.x = 250 - 30 + 35;
         this.bg3.y = 250 - 90;
         addChild(this.bg3);
         if(param1[0].sex == 1)
         {
            this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/huanghou.swf");
         }
         else
         {
            this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/qinwang.swf");
         }
         this.bg3.x = 350 - 23 + 39 + 30;
         this.bg3.y = 100 - 57 + 46;
         addChild(this.bg3);
         if(param1[0].sex == 1)
         {
            this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/qinwang.swf");
         }
         else
         {
            this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/huanghou.swf");
         }
         this.bg3.x = 450 + 105 - 7;
         this.bg3.y = 100 - 57 + 46;
         addChild(this.bg3);
         this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/chengxiang.swf");
         this.bg3.x = 550 + 122 - 42;
         this.bg3.y = 250 - 90;
         addChild(this.bg3);
         this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/yushi.swf");
         this.bg3.x = 650 + 105 + 12;
         this.bg3.y = 310 - 53 + 24;
         addChild(this.bg3);
         if(param1[0].leixing == 1)
         {
            this.xuWei1.visible = false;
            this.mingzi1.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param1[0].name + "</font>";
         }
         else
         {
            this.xuWei1.visible = true;
         }
         if(param1[1].leixing == 2)
         {
            this.xuWei2.visible = false;
            this.mingzi2.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param1[1].name + "</font>";
         }
         else
         {
            this.xuWei2.visible = true;
         }
         if(param1[2].leixing == 3)
         {
            this.xuWei3.visible = false;
            this.mingzi3.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param1[2].name + "</font>";
         }
         else
         {
            this.xuWei3.visible = true;
         }
         if(param1[3].leixing == 4)
         {
            this.xuWei4.visible = false;
            this.mingzi4.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param1[3].name + "</font>";
         }
         else
         {
            this.xuWei4.visible = true;
         }
         if(param1[4].leixing == 5)
         {
            this.xuWei5.visible = false;
            this.mingzi5.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param1[4].name + "</font>";
         }
         else
         {
            this.xuWei5.visible = true;
         }
         if(param1[5].leixing == 6)
         {
            this.xuWei6.visible = false;
            this.mingzi6.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param1[5].name + "</font>";
         }
         else
         {
            this.xuWei6.visible = true;
         }
         this.setbloodMc1(1);
         this.setbloodMc2(1);
         this.setbloodMc3(1);
         this.setbloodMc4(1);
         this.setbloodMc5(1);
         this.setbloodMc6(1);
      }
      
      public function setbloodMc1(param1:int) : void
      {
         var mcId:int = 0;
         var play_end1:Function = null;
         var loadUrl1:String = null;
         var i:int = param1;
         play_end1 = function(param1:Event):void
         {
            if(param1.target.currentFrame == param1.target.totalFrames)
            {
               bloodMc1.removeEventListener(Event.ENTER_FRAME,play_end1);
               setbloodMc1(1);
            }
         };
         mcId = i;
         if(this.renwuArr[0].sex == 1)
         {
            loadUrl1 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/nvwang_" + mcId + ".swf";
         }
         else
         {
            loadUrl1 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/huangdi_" + mcId + ".swf";
         }
         if(Boolean(this.bloodMc1) && this.bloodMc1.parent != null)
         {
            this.bloodMc1.stop();
            this.bloodMc1.parent.removeChild(this.bloodMc1);
         }
         while(this.bloodMcSpr1.numChildren > 0)
         {
            this.bloodMcSpr1.removeChildAt(0);
         }
         if(this.renwuArr[0].sex == 1)
         {
            if(this.mcObj11[mcId] != null)
            {
               this.bloodMc1 = this.mcObj11[mcId];
               this.bloodMc1.play();
               this.bloodMcSpr1.addChild(this.bloodMc1);
               if(mcId == 2)
               {
                  this.bloodMc1.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl1)
                  {
                     return;
                  }
                  bloodMc1 = _loc2_.content as MovieClip;
                  mcObj11[mcId] = bloodMc1;
                  if(bloodMc1)
                  {
                     bloodMcSpr1.addChild(bloodMc1);
                  }
                  if(mcId == 2)
                  {
                     bloodMc1.addEventListener(Event.ENTER_FRAME,play_end1);
                  }
               },null,false,loadUrl1);
            }
         }
         else if(this.mcObj12[mcId] != null)
         {
            this.bloodMc1 = this.mcObj12[mcId];
            this.bloodMc1.play();
            this.bloodMcSpr1.addChild(this.bloodMc1);
            if(mcId == 2)
            {
               this.bloodMc1.addEventListener(Event.ENTER_FRAME,play_end1);
            }
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl1)
               {
                  return;
               }
               bloodMc1 = _loc2_.content as MovieClip;
               mcObj12[mcId] = bloodMc1;
               if(bloodMc1)
               {
                  bloodMcSpr1.addChild(bloodMc1);
               }
               if(mcId == 2)
               {
                  bloodMc1.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            },null,false,loadUrl1);
         }
      }
      
      public function setbloodMc2(param1:int) : void
      {
         var mcId:int = 0;
         var play_end1:Function = null;
         var loadUrl2:String = null;
         var i:int = param1;
         play_end1 = function(param1:Event):void
         {
            if(param1.target.currentFrame == param1.target.totalFrames)
            {
               bloodMc2.removeEventListener(Event.ENTER_FRAME,play_end1);
               setbloodMc2(1);
            }
         };
         mcId = i;
         if(this.renwuArr[0].sex == 1)
         {
            loadUrl2 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/huangdi_" + mcId + ".swf";
         }
         else
         {
            loadUrl2 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/nvwang_" + mcId + ".swf";
         }
         if(Boolean(this.bloodMc2) && this.bloodMc2.parent != null)
         {
            this.bloodMc2.stop();
            this.bloodMc2.parent.removeChild(this.bloodMc2);
         }
         while(this.bloodMcSpr2.numChildren > 0)
         {
            this.bloodMcSpr2.removeChildAt(0);
         }
         if(this.renwuArr[0].sex == 1)
         {
            if(this.mcObj21[mcId] != null)
            {
               this.bloodMc2 = this.mcObj21[mcId];
               this.bloodMc2.play();
               this.bloodMcSpr2.addChild(this.bloodMc2);
               if(mcId == 2)
               {
                  this.bloodMc2.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl2)
                  {
                     return;
                  }
                  bloodMc2 = _loc2_.content as MovieClip;
                  mcObj21[mcId] = bloodMc2;
                  if(bloodMc2)
                  {
                     bloodMcSpr2.addChild(bloodMc2);
                  }
                  if(mcId == 2)
                  {
                     bloodMc2.addEventListener(Event.ENTER_FRAME,play_end1);
                  }
               },null,false,loadUrl2);
            }
         }
         else if(this.mcObj22[mcId] != null)
         {
            this.bloodMc2 = this.mcObj22[mcId];
            this.bloodMc2.play();
            this.bloodMcSpr2.addChild(this.bloodMc2);
            if(mcId == 2)
            {
               this.bloodMc2.addEventListener(Event.ENTER_FRAME,play_end1);
            }
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl2)
               {
                  return;
               }
               bloodMc2 = _loc2_.content as MovieClip;
               mcObj22[mcId] = bloodMc2;
               if(bloodMc2)
               {
                  bloodMcSpr2.addChild(bloodMc2);
               }
               if(mcId == 2)
               {
                  bloodMc2.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            },null,false,loadUrl2);
         }
      }
      
      public function setbloodMc3(param1:int) : void
      {
         var mcId:int = 0;
         var play_end1:Function = null;
         var loadUrl3:String = null;
         var i:int = param1;
         play_end1 = function(param1:Event):void
         {
            if(param1.target.currentFrame == param1.target.totalFrames)
            {
               bloodMc3.removeEventListener(Event.ENTER_FRAME,play_end1);
               setbloodMc3(1);
            }
         };
         mcId = i;
         if(this.renwuArr[2].sex == 1)
         {
            loadUrl3 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/nv_" + mcId + ".swf";
         }
         else
         {
            loadUrl3 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/nan_" + mcId + ".swf";
         }
         if(Boolean(this.bloodMc3) && this.bloodMc3.parent != null)
         {
            this.bloodMc3.stop();
            this.bloodMc3.parent.removeChild(this.bloodMc3);
         }
         while(this.bloodMcSpr3.numChildren > 0)
         {
            this.bloodMcSpr3.removeChildAt(0);
         }
         if(this.renwuArr[2].sex == 1)
         {
            if(this.mcObj31[mcId] != null)
            {
               this.bloodMc3 = this.mcObj31[mcId];
               this.bloodMc3.play();
               this.bloodMcSpr3.addChild(this.bloodMc3);
               if(mcId == 2)
               {
                  this.bloodMc3.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl3)
                  {
                     return;
                  }
                  bloodMc3 = _loc2_.content as MovieClip;
                  mcObj31[mcId] = bloodMc3;
                  if(bloodMc3)
                  {
                     bloodMc3.y = 10;
                     bloodMcSpr3.addChild(bloodMc3);
                  }
                  if(mcId == 2)
                  {
                     bloodMc3.addEventListener(Event.ENTER_FRAME,play_end1);
                  }
               },null,false,loadUrl3);
            }
         }
         else if(this.mcObj32[mcId] != null)
         {
            this.bloodMc3 = this.mcObj32[mcId];
            this.bloodMc3.play();
            this.bloodMcSpr3.addChild(this.bloodMc3);
            if(mcId == 2)
            {
               this.bloodMc3.addEventListener(Event.ENTER_FRAME,play_end1);
            }
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl3)
               {
                  return;
               }
               bloodMc3 = _loc2_.content as MovieClip;
               mcObj32[mcId] = bloodMc3;
               if(bloodMc3)
               {
                  bloodMc3.y = 10;
                  bloodMcSpr3.addChild(bloodMc3);
               }
               if(mcId == 2)
               {
                  bloodMc3.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            },null,false,loadUrl3);
         }
      }
      
      public function setbloodMc4(param1:int) : void
      {
         var mcId:int = 0;
         var play_end1:Function = null;
         var loadUrl4:String = null;
         var i:int = param1;
         play_end1 = function(param1:Event):void
         {
            if(param1.target.currentFrame == param1.target.totalFrames)
            {
               bloodMc4.removeEventListener(Event.ENTER_FRAME,play_end1);
               setbloodMc4(1);
            }
         };
         mcId = i;
         if(this.renwuArr[3].sex == 1)
         {
            loadUrl4 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/nv_" + mcId + ".swf";
         }
         else
         {
            loadUrl4 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/nan_" + mcId + ".swf";
         }
         if(Boolean(this.bloodMc4) && this.bloodMc4.parent != null)
         {
            this.bloodMc4.stop();
            this.bloodMc4.parent.removeChild(this.bloodMc4);
         }
         while(this.bloodMcSpr4.numChildren > 0)
         {
            this.bloodMcSpr4.removeChildAt(0);
         }
         if(this.renwuArr[3].sex == 1)
         {
            if(this.mcObj41[mcId] != null)
            {
               this.bloodMc4 = this.mcObj41[mcId];
               this.bloodMc4.play();
               this.bloodMcSpr4.addChild(this.bloodMc4);
               if(mcId == 2)
               {
                  this.bloodMc4.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc3_:Matrix = null;
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl4)
                  {
                     return;
                  }
                  bloodMc4 = _loc2_.content as MovieClip;
                  mcObj41[mcId] = bloodMc4;
                  if(bloodMc4)
                  {
                     _loc3_ = bloodMc4.transform.matrix;
                     _loc3_.a = -1;
                     _loc3_.tx = bloodMc4.width + bloodMc4.x;
                     bloodMc4.transform.matrix = _loc3_;
                     bloodMc4.y = 10;
                     bloodMcSpr4.addChild(bloodMc4);
                  }
                  if(mcId == 2)
                  {
                     bloodMc4.addEventListener(Event.ENTER_FRAME,play_end1);
                  }
               },null,false,loadUrl4);
            }
         }
         else if(this.mcObj42[mcId] != null)
         {
            this.bloodMc4 = this.mcObj42[mcId];
            this.bloodMc4.play();
            this.bloodMcSpr4.addChild(this.bloodMc4);
            if(mcId == 2)
            {
               this.bloodMc4.addEventListener(Event.ENTER_FRAME,play_end1);
            }
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc3_:Matrix = null;
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl4)
               {
                  return;
               }
               bloodMc4 = _loc2_.content as MovieClip;
               mcObj42[mcId] = bloodMc4;
               if(bloodMc4)
               {
                  _loc3_ = bloodMc4.transform.matrix;
                  _loc3_.a = -1;
                  _loc3_.tx = bloodMc4.width + bloodMc4.x;
                  bloodMc4.transform.matrix = _loc3_;
                  bloodMc4.y = 10;
                  bloodMcSpr4.addChild(bloodMc4);
               }
               if(mcId == 2)
               {
                  bloodMc4.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            },null,false,loadUrl4);
         }
      }
      
      public function setbloodMc5(param1:int) : void
      {
         var mcId:int = 0;
         var play_end1:Function = null;
         var loadUrl5:String = null;
         var i:int = param1;
         play_end1 = function(param1:Event):void
         {
            if(param1.target.currentFrame == param1.target.totalFrames)
            {
               bloodMc5.removeEventListener(Event.ENTER_FRAME,play_end1);
               setbloodMc5(1);
            }
         };
         mcId = i;
         if(this.renwuArr[4].sex == 1)
         {
            loadUrl5 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/fannv_" + mcId + ".swf";
         }
         else
         {
            loadUrl5 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/fannan_" + mcId + ".swf";
         }
         if(Boolean(this.bloodMc5) && this.bloodMc5.parent != null)
         {
            this.bloodMc5.stop();
            this.bloodMc5.parent.removeChild(this.bloodMc5);
         }
         while(this.bloodMcSpr5.numChildren > 0)
         {
            this.bloodMcSpr5.removeChildAt(0);
         }
         if(this.renwuArr[4].sex == 1)
         {
            if(this.mcObj51[mcId] != null)
            {
               this.bloodMc5 = this.mcObj51[mcId];
               this.bloodMc5.play();
               this.bloodMcSpr5.addChild(this.bloodMc5);
               if(mcId == 2)
               {
                  this.bloodMc5.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc3_:Matrix = null;
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl5)
                  {
                     return;
                  }
                  bloodMc5 = _loc2_.content as MovieClip;
                  mcObj51[mcId] = bloodMc5;
                  if(bloodMc5)
                  {
                     _loc3_ = bloodMc5.transform.matrix;
                     _loc3_.a = -1;
                     _loc3_.tx = bloodMc5.width + bloodMc5.x;
                     bloodMc5.transform.matrix = _loc3_;
                     bloodMcSpr5.addChild(bloodMc5);
                  }
                  if(mcId == 2)
                  {
                     bloodMc5.addEventListener(Event.ENTER_FRAME,play_end1);
                  }
               },null,false,loadUrl5);
            }
         }
         else if(this.mcObj52[mcId] != null)
         {
            this.bloodMc5 = this.mcObj52[mcId];
            this.bloodMc5.play();
            this.bloodMcSpr5.addChild(this.bloodMc5);
            if(mcId == 2)
            {
               this.bloodMc5.addEventListener(Event.ENTER_FRAME,play_end1);
            }
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl5)
               {
                  return;
               }
               bloodMc5 = _loc2_.content as MovieClip;
               mcObj52[mcId] = bloodMc5;
               if(bloodMc5)
               {
                  bloodMcSpr5.addChild(bloodMc5);
               }
               if(mcId == 2)
               {
                  bloodMc5.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            },null,false,loadUrl5);
         }
      }
      
      public function setbloodMc6(param1:int) : void
      {
         var mcId:int = 0;
         var play_end1:Function = null;
         var loadUrl6:String = null;
         var i:int = param1;
         play_end1 = function(param1:Event):void
         {
            if(param1.target.currentFrame == param1.target.totalFrames)
            {
               bloodMc6.removeEventListener(Event.ENTER_FRAME,play_end1);
               setbloodMc6(1);
            }
         };
         mcId = i;
         if(this.renwuArr[5].sex == 1)
         {
            loadUrl6 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/fannv_" + mcId + ".swf";
         }
         else
         {
            loadUrl6 = GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/fannan_" + mcId + ".swf";
         }
         if(Boolean(this.bloodMc6) && this.bloodMc6.parent != null)
         {
            this.bloodMc6.stop();
            this.bloodMc6.parent.removeChild(this.bloodMc6);
         }
         while(this.bloodMcSpr6.numChildren > 0)
         {
            this.bloodMcSpr6.removeChildAt(0);
         }
         if(this.renwuArr[5].sex == 1)
         {
            if(this.mcObj61[mcId] != null)
            {
               this.bloodMc6 = this.mcObj61[mcId];
               this.bloodMc6.play();
               this.bloodMcSpr6.addChild(this.bloodMc6);
               if(mcId == 2)
               {
                  this.bloodMc6.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl6)
                  {
                     return;
                  }
                  bloodMc6 = _loc2_.content as MovieClip;
                  mcObj61[mcId] = bloodMc6;
                  if(bloodMc6)
                  {
                     bloodMcSpr6.addChild(bloodMc6);
                  }
                  if(mcId == 2)
                  {
                     bloodMc6.addEventListener(Event.ENTER_FRAME,play_end1);
                  }
               },null,false,loadUrl6);
            }
         }
         else if(this.mcObj62[mcId] != null)
         {
            this.bloodMc6 = this.mcObj62[mcId];
            this.bloodMc6.play();
            this.bloodMcSpr6.addChild(this.bloodMc6);
            if(mcId == 2)
            {
               this.bloodMc6.addEventListener(Event.ENTER_FRAME,play_end1);
            }
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc3_:Matrix = null;
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl6)
               {
                  return;
               }
               bloodMc6 = _loc2_.content as MovieClip;
               mcObj62[mcId] = bloodMc6;
               if(bloodMc6)
               {
                  _loc3_ = bloodMc6.transform.matrix;
                  _loc3_.a = -1;
                  _loc3_.tx = bloodMc6.width + bloodMc6.x;
                  bloodMc6.transform.matrix = _loc3_;
                  bloodMcSpr6.addChild(bloodMc6);
               }
               if(mcId == 2)
               {
                  bloodMc6.addEventListener(Event.ENTER_FRAME,play_end1);
               }
            },null,false,loadUrl6);
         }
      }
   }
}

