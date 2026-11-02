package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.mall.MallBuyPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.getDefinitionByName;
   import gs.TweenMax;
   
   public class SmithingBody extends Sprite
   {
      
      public static const UI_SMITHINGBODY_GUANBI_CLICK:String = "UI_SMITHINGBODY_GUANBI_CLICK";
      
      public var _parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var line:Bitmap;
      
      private var spr1:Sprite;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var chatText:FTextArea;
      
      private var barBg1:Bitmap;
      
      private var barBg2:Bitmap;
      
      private var barBg3:Bitmap;
      
      private var barBg4:Bitmap;
      
      private var barBg5:Bitmap;
      
      private var barBg6:Bitmap;
      
      private var barBg7:Bitmap;
      
      private var barBg8:Bitmap;
      
      private var barBg9:Bitmap;
      
      private var barBg10:Bitmap;
      
      private var barBar1:ColorBar;
      
      private var barBar2:ColorBar;
      
      private var barBar3:ColorBar;
      
      private var barBar4:ColorBar;
      
      private var barBar5:ColorBar;
      
      private var barBar6:ColorBar;
      
      private var barBar7:ColorBar;
      
      private var barBar8:ColorBar;
      
      private var barBar9:ColorBar;
      
      private var barBar10:ColorBar;
      
      private var lb1:FLabel;
      
      private var lb2:FLabel;
      
      private var lb3:FLabel;
      
      private var lb4:FLabel;
      
      private var lb5:FLabel;
      
      private var lb6:FLabel;
      
      private var lb7:FLabel;
      
      private var lb8:FLabel;
      
      private var lb9:FLabel;
      
      private var lb10:FLabel;
      
      private var lb8Ft:FTextArea;
      
      private var lb9Ft:FTextArea;
      
      private var lb10Ft:FTextArea;
      
      private var jihuoFt:FTextArea;
      
      private var jihuoJinlongFt:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var preBtn_1:FSimpleButton;
      
      private var flagPage_1:FTextArea;
      
      private var nextBtn_1:FSimpleButton;
      
      private var smithingbodyadvanceCanvas:SmithingBodyAdvanceCanvas;
      
      private var dachengImg:Bitmap;
      
      private var imgFc:FCanvas;
      
      private var kuangFc:FCanvas;
      
      private var classBtn1:SimpleButton;
      
      private var classBtn2:SimpleButton;
      
      private var classBtn3:SimpleButton;
      
      private var classBtn4:SimpleButton;
      
      private var classBtn5:SimpleButton;
      
      private var classBtn6:SimpleButton;
      
      private var classBtn7:SimpleButton;
      
      private var classBtn8:SimpleButton;
      
      private var jihuoBtn:SecondButton;
      
      private var jihuoJinlongBtn:SecondButton;
      
      private var routiJinshenBtn:SecondButton;
      
      private var longMovieMlip:MovieClip;
      
      private var jinlong:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var toolTipStr1:String = "1";
      
      private var toolTipStr2:String = "2";
      
      private var toolTipStr3:String = "3";
      
      private var toolTipStr4:String = "4";
      
      private var toolTipStr5:String = "5";
      
      private var toolTipStr6:String = "6";
      
      private var toolTipStr7:String = "7";
      
      private var toolTipStr8:String = "8";
      
      private var tootips1:String = "";
      
      private var url:String;
      
      private var tf:TextFormat;
      
      private var shenQiPuTiDanTip:ShenQiPuTiDanTipCanvas;
      
      private var duantijindanCanvas:DuantijindanCanvas;
      
      private var buffSpr:Sprite;
      
      private var isJiHuoRouShen:Boolean;
      
      private var fta8:FTextArea;
      
      private var fta9:FTextArea;
      
      private var strRouti:String = "";
      
      private var isJihuoRouti:Boolean;
      
      private var jinshenFta:FTextArea;
      
      private var smithingBodyFt:FTextArea;
      
      private var texiaoMc:MovieClip;
      
      private var mcObj6:Object;
      
      private var loadUrl5:String;
      
      private var gongMc5:MovieClip;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var rouBg1:DisplayObject;
      
      private var rouBg2:DisplayObject;
      
      private var rouBg3:DisplayObject;
      
      private var rouBg4:DisplayObject;
      
      private var rouBg5:DisplayObject;
      
      private var rouBg6:DisplayObject;
      
      private var rouBg7:DisplayObject;
      
      private var rouBg8:DisplayObject;
      
      private var fts3:FTextArea;
      
      private var shouyin:int = 0;
      
      private var shou1:Boolean = false;
      
      private var shou2:Boolean = false;
      
      private var shou3:Boolean = false;
      
      private var shou4:Boolean = false;
      
      private var shou5:Boolean = false;
      
      private var shou6:Boolean = false;
      
      private var shou7:Boolean = false;
      
      private var shou8:Boolean = false;
      
      private var fts4:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var mainSkillItemFace:ItemFace;
      
      private var kuang1:Bitmap;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var fts5:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var fts6:FTextArea;
      
      private var mainSkillItemFace2:ItemFace;
      
      private var kuang2:Bitmap;
      
      private var isLearn1:Boolean = false;
      
      private var isLearn2:Boolean = false;
      
      public function SmithingBody()
      {
         var $class:Class;
         var $mask:Sprite = null;
         this.mcObj6 = {};
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.imgFc = new FCanvas();
         this.imgFc.x = 0;
         this.imgFc.width = 406;
         this.imgFc.height = 370;
         this.imgFc.skin = "box_transparence";
         addChild(this.imgFc);
         this.imgFc = new FCanvas();
         this.imgFc.x = 4;
         this.imgFc.y = 2;
         this.imgFc.width = 400;
         this.imgFc.height = 206;
         this.imgFc.skin = "box_transparence";
         addChild(this.imgFc);
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.duanzaoroushen.long.bg";
         this.bgImg.x = 2;
         this.bgImg.y = 2;
         this.imgFc.addChild(this.bgImg);
         this.rouBg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/roushen/1.swf");
         this.rouBg1.x = 2 + 169 - 14 + 3;
         this.rouBg1.y = 2 - 5;
         this.imgFc.addChild(this.rouBg1);
         this.rouBg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/roushen/2.swf");
         this.rouBg2.x = 2 + 274 - 19 + 3;
         this.rouBg2.y = 2 + 12;
         this.imgFc.addChild(this.rouBg2);
         this.rouBg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/roushen/3.swf");
         this.rouBg3.x = 2 + 327 - 10;
         this.rouBg3.y = 2 + 68;
         this.imgFc.addChild(this.rouBg3);
         this.rouBg4 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/roushen/4.swf");
         this.rouBg4.x = 2 + 274 - 15;
         this.rouBg4.y = 2 + 141 - 12;
         this.imgFc.addChild(this.rouBg4);
         this.rouBg5 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/roushen/5.swf");
         this.rouBg5.x = 2 + 169 - 5;
         this.rouBg5.y = 2 + 146 - 5;
         this.imgFc.addChild(this.rouBg5);
         this.rouBg6 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/roushen/6.swf");
         this.rouBg6.x = 2 + 65 - 10 + 3;
         this.rouBg6.y = 2 + 134 - 3;
         this.imgFc.addChild(this.rouBg6);
         this.rouBg7 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/roushen/7.swf");
         this.rouBg7.x = 2 + 8 - 14;
         this.rouBg7.y = 2 + 75 - 7;
         this.imgFc.addChild(this.rouBg7);
         this.rouBg8 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/roushen/8.swf");
         this.rouBg8.x = 2 + 70 - 14 + 3;
         this.rouBg8.y = 2 + 16 - 3;
         this.imgFc.addChild(this.rouBg8);
         this.longMovieMlip = StaticValue.getMCByClassName("ui.duanzaoroushen.long") as MovieClip;
         this.imgFc.addChild(this.longMovieMlip);
         this.longMovieMlip.stop();
         this.longMovieMlip.x = 55;
         this.longMovieMlip.y = 71;
         this.jihuoBtn = new SecondButton();
         this.jihuoBtn.label = LanResManager.getLanCommonTextWords("激活隐藏属性");
         addChild(this.jihuoBtn);
         this.jihuoBtn.x = 325;
         this.jihuoBtn.y = 5;
         this.jihuoBtn.addEventListener(MouseEvent.CLICK,this.onJiHuoBtnClick);
         this.jihuoFt = new FTextArea();
         this.jihuoFt.x = 265;
         this.jihuoFt.y = 5;
         this.jihuoFt.autoSize = TextFieldAutoSize.LEFT;
         this.jihuoFt.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("隐藏属性已激活") + "</font>";
         this.jihuoFt.visible = false;
         addChild(this.jihuoFt);
         this.jihuoJinlongBtn = new SecondButton();
         this.jihuoJinlongBtn.label = LanResManager.getLanCommonTextWords("激活大金龙属性");
         addChild(this.jihuoJinlongBtn);
         this.jihuoJinlongBtn.x = 7;
         this.jihuoJinlongBtn.y = 185;
         this.jihuoJinlongBtn.addEventListener(MouseEvent.CLICK,this.onJiHuoBtnClick1);
         this.jihuoJinlongFt = new FTextArea();
         this.jihuoJinlongFt.x = 7;
         this.jihuoJinlongFt.y = 185;
         this.jihuoJinlongFt.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("大金龙属性已激活") + "</font>";
         this.jihuoJinlongFt.visible = false;
         addChild(this.jihuoJinlongFt);
         this.jihuoJinlongFt.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTips);
         this.jihuoJinlongFt.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTips);
         this.routiJinshenBtn = new SecondButton();
         this.routiJinshenBtn.label = LanResManager.getLanCommonTextWords("肉体金身");
         addChild(this.routiJinshenBtn);
         this.routiJinshenBtn.x = 325;
         this.routiJinshenBtn.y = 185;
         this.routiJinshenBtn.addEventListener(MouseEvent.CLICK,this.onRoutiBtnClick);
         this.routiJinshenBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onRoutiMouseTips);
         this.routiJinshenBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onRoutiMouseTips);
         this.jinshenFta = new FTextArea();
         this.jinshenFta.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("肉体金身已激活") + "</font>";
         this.jinshenFta.x = 315 - 20;
         this.jinshenFta.y = 185;
         addChild(this.jinshenFta);
         this.jinshenFta.visible = false;
         this.jinshenFta.addEventListener(MouseEvent.MOUSE_OVER,this.onJinShenTips);
         this.jinshenFta.addEventListener(MouseEvent.MOUSE_OUT,this.onJinShenTips);
         $class = getDefinitionByName("ui.duanzaoroushen.button.a") as Class;
         this.classBtn1 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn1);
         this.classBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn1.x = 176;
         this.classBtn1.y = 7;
         this.classBtn1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.duanzaoroushen.button.b") as Class;
         this.classBtn2 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn2);
         this.classBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn2.x = 274;
         this.classBtn2.y = 23;
         this.classBtn2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip2);
         this.classBtn2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip2);
         $class = getDefinitionByName("ui.duanzaoroushen.button.c") as Class;
         this.classBtn3 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn3);
         this.classBtn3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn3.x = 331;
         this.classBtn3.y = 79;
         this.classBtn3.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.classBtn3.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         $class = getDefinitionByName("ui.duanzaoroushen.button.d") as Class;
         this.classBtn4 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn4);
         this.classBtn4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn4.x = 274;
         this.classBtn4.y = 141;
         this.classBtn4.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip4);
         this.classBtn4.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip4);
         $class = getDefinitionByName("ui.duanzaoroushen.button.e") as Class;
         this.classBtn5 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn5);
         this.classBtn5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn5.x = 176;
         this.classBtn5.y = 155;
         this.classBtn5.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip5);
         this.classBtn5.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip5);
         $class = getDefinitionByName("ui.duanzaoroushen.button.f") as Class;
         this.classBtn6 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn6);
         this.classBtn6.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn6.x = 75;
         this.classBtn6.y = 141;
         this.classBtn6.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip6);
         this.classBtn6.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip6);
         $class = getDefinitionByName("ui.duanzaoroushen.button.g") as Class;
         this.classBtn7 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn7);
         this.classBtn7.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn7.x = 12;
         this.classBtn7.y = 79;
         this.classBtn7.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip7);
         this.classBtn7.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip7);
         $class = getDefinitionByName("ui.duanzaoroushen.button.h") as Class;
         this.classBtn8 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn8);
         this.classBtn8.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn8.x = 75;
         this.classBtn8.y = 23;
         this.classBtn8.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip8);
         this.classBtn8.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip8);
         this.spr1 = new Sprite();
         this.spr1.x = 5;
         this.spr1.y = 210;
         addChild(this.spr1);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            multiline = true;
            width = 400;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 0;
            y = 0;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanTextWords(this,"当前肉身境界",[StaticValue.ORANGE_HTML,StaticValue.BLUE_HTML,StaticValue.ORANGE_HTML]);
         }
         this.spr1.addChild(this.ft1);
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 0;
            y = 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"生命");
         }
         this.spr1.addChild(this.lb1);
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg1);
         this.barBg1.x = 62;
         this.barBg1.y = this.lb1.y + 2;
         this.barBar1 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar1);
         this.barBar1.x = this.barBg1.x + 4;
         this.barBar1.y = this.lb1.y + 5;
         this.lb2 = new FLabel();
         with(this.lb2)
         {
            x = 0;
            y = 30;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"内力");
         }
         this.spr1.addChild(this.lb2);
         this.barBg2 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg2);
         this.barBg2.x = this.barBg1.x;
         this.barBg2.y = this.lb2.y + 2;
         this.barBar2 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar2);
         this.barBar2.x = this.barBg1.x + 4;
         this.barBar2.y = this.lb2.y + 5;
         this.lb3 = new FLabel();
         with(this.lb3)
         {
            x = 0;
            y = 45;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"体力");
         }
         this.spr1.addChild(this.lb3);
         this.barBg3 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg3);
         this.barBg3.x = this.barBg1.x;
         this.barBg3.y = this.lb3.y + 2;
         this.barBar3 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar3);
         this.barBar3.x = this.barBg1.x + 4;
         this.barBar3.y = this.lb3.y + 5;
         this.lb4 = new FLabel();
         with(this.lb4)
         {
            x = 0;
            y = 60;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"攻击");
         }
         this.spr1.addChild(this.lb4);
         this.barBg4 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg4);
         this.barBg4.x = this.barBg1.x;
         this.barBg4.y = this.lb4.y + 2;
         this.barBar4 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar4);
         this.barBar4.x = this.barBg1.x + 4;
         this.barBar4.y = this.lb4.y + 5;
         this.lb5 = new FLabel();
         with(this.lb5)
         {
            x = 0;
            y = 75;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"防御");
         }
         this.spr1.addChild(this.lb5);
         this.barBg5 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg5);
         this.barBg5.x = this.barBg1.x;
         this.barBg5.y = this.lb5.y + 2;
         this.barBar5 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar5);
         this.barBar5.x = this.barBg1.x + 4;
         this.barBar5.y = this.lb5.y + 5;
         this.lb6 = new FLabel();
         with(this.lb6)
         {
            x = 195;
            y = 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"攻击速度");
         }
         this.spr1.addChild(this.lb6);
         this.barBg6 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg6);
         this.barBg6.x = 265;
         this.barBg6.y = this.lb6.y + 2;
         this.barBar6 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar6);
         this.barBar6.x = this.barBg6.x + 4;
         this.barBar6.y = this.lb6.y + 5;
         this.lb7 = new FLabel();
         with(this.lb7)
         {
            x = 195;
            y = 30;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"移动速度");
         }
         this.spr1.addChild(this.lb7);
         this.barBg7 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg7);
         this.barBg7.x = this.barBg6.x;
         this.barBg7.y = this.lb7.y + 2;
         this.barBar7 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar7);
         this.barBar7.x = this.barBg6.x + 4;
         this.barBar7.y = this.lb7.y + 5;
         this.lb8 = new FLabel();
         with(this.lb8)
         {
            x = 195;
            y = 60;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"反弹伤害");
         }
         this.spr1.addChild(this.lb8);
         this.barBg8 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg8);
         this.barBg8.x = this.barBg6.x;
         this.barBg8.y = this.lb8.y + 2;
         this.barBar8 = new ColorBar(5,123,5,false);
         this.spr1.addChild(this.barBar8);
         this.barBar8.x = this.barBg6.x + 4;
         this.barBar8.y = this.lb8.y + 5;
         this.lb8Ft = new FTextArea();
         with(this.lb8Ft)
         {
            x = 270;
            y = 58;
            width = 123;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,9,16777215,null,null,null,null,null,"center");
            text = "12/12";
         }
         this.spr1.addChild(this.lb8Ft);
         this.lb9 = new FLabel();
         with(this.lb9)
         {
            x = 195;
            y = 75;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"伤害减免");
         }
         this.spr1.addChild(this.lb9);
         this.barBg9 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg9);
         this.barBg9.x = this.barBg6.x;
         this.barBg9.y = this.lb9.y + 2;
         this.barBar9 = new ColorBar(5,123,5,false);
         this.spr1.addChild(this.barBar9);
         this.barBar9.x = this.barBg6.x + 4;
         this.barBar9.y = this.lb9.y + 5;
         this.lb9Ft = new FTextArea();
         with(this.lb9Ft)
         {
            x = 270;
            y = 73;
            width = 123;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,9,16777215,null,null,null,null,null,"center");
            text = "12/12";
         }
         this.spr1.addChild(this.lb9Ft);
         this.lb10 = new FLabel();
         with(this.lb10)
         {
            x = 195;
            y = 45;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"暗器几率");
         }
         this.spr1.addChild(this.lb10);
         this.barBg10 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg10);
         this.barBg10.x = this.barBg6.x;
         this.barBg10.y = this.lb10.y + 2;
         this.barBar10 = new ColorBar(5,123,5,false);
         this.spr1.addChild(this.barBar10);
         this.barBar10.x = this.barBg6.x + 4;
         this.barBar10.y = this.lb10.y + 5;
         this.lb10Ft = new FTextArea();
         with(this.lb10Ft)
         {
            x = 270;
            y = 43;
            width = 123;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,9,16777215,null,null,null,null,null,"center");
            text = "2000/2000";
         }
         this.spr1.addChild(this.lb10Ft);
         this.line = StaticValue.getBitmapByClassName("ui.line");
         this.spr1.addChild(this.line);
         this.line.width = 396;
         this.line.x = 0;
         this.line.y = 94;
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 310;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            x = 0;
            y = 50;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanTextWords(this,"您可以通过食用【山鹿茸】来强化您的肉身",[StaticValue.ORANGE_HTML,StaticValue.BLUE_HTML,StaticValue.ORANGE_HTML]);
         }
         this.spr1.addChild(this.ft2);
         this.ft2.addEventListener(TextEvent.LINK,this.onLink);
         this.ft2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTipft2);
         this.ft2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTipft2);
         this.ft2.visible = false;
         this.smithingBodyFt = new FTextArea();
         with(this.smithingBodyFt)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 0;
            y = 96;
            textColor = StaticValue.RED;
            htmlText = "";
            spr1.addChild(smithingBodyFt);
         }
         this.chatText = new FTextArea();
         this.chatText.filters = StaticValue.filter;
         this.chatText.x = 0;
         this.chatText.y = 95;
         this.chatText.width = 300;
         this.chatText.height = 60;
         this.chatText.wordWrap = true;
         this.chatText.autoSize = TextFieldAutoSize.LEFT;
         this.chatText.defaultTextFormat = new TextFormat(null,null,16777215);
         this.spr1.addChild(this.chatText);
         this.chatText.addEventListener(TextEvent.LINK,this.onLink);
         this.chatText.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseTipft2);
         this.chatText.addEventListener(MouseEvent.CLICK,this.onMouseTipft2);
         this.chatText.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTipft2);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"提升肉身境界");
         this.spr1.addChild(this.okBtn);
         this.okBtn.x = 305;
         this.okBtn.y = 105;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn.toolTip = "1";
         this.dachengImg = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.complete");
         this.spr1.addChild(this.dachengImg);
         this.dachengImg.width *= 0.5;
         this.dachengImg.height *= 0.5;
         this.dachengImg.x = 335;
         this.dachengImg.y = 93;
         this.dachengImg.visible = false;
         this.preBtn_1 = new FSimpleButton();
         this.preBtn_1.skin = "previousButton";
         this.spr1.addChild(this.preBtn_1);
         this.preBtn_1.x = 315;
         this.preBtn_1.y = 130;
         this.preBtn_1.addEventListener(MouseEvent.CLICK,this.onSelectFlag1);
         this.flagPage_1 = new FTextArea();
         with(this.flagPage_1)
         {
            x = 335;
            y = 132;
            textColor = StaticValue.WHITE;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            width = 36;
            height = 20;
            text = "1/4";
         }
         this.spr1.addChild(this.flagPage_1);
         this.nextBtn_1 = new FSimpleButton();
         this.nextBtn_1.skin = "nextButton";
         this.spr1.addChild(this.nextBtn_1);
         this.nextBtn_1.x = 370;
         this.nextBtn_1.y = 130;
         this.nextBtn_1.addEventListener(MouseEvent.CLICK,this.onSelectFlag1);
         this.smithingbodyadvanceCanvas = new SmithingBodyAdvanceCanvas();
         addChild(this.smithingbodyadvanceCanvas);
         this.smithingbodyadvanceCanvas.x = -10;
         this.smithingbodyadvanceCanvas.y = 380;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = -10;
         $mask.y = 270;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,425,110);
            endFill();
         }
         this.smithingbodyadvanceCanvas.mask = $mask;
         addEventListener(UI_SMITHINGBODY_GUANBI_CLICK,this.aa1);
         this.buffSpr = new Sprite();
         this.buffSpr.x = 364;
         this.buffSpr.y = 168;
         addChild(this.buffSpr);
         this.fta8 = new FTextArea();
         with(this.fta8)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 12;
            y = 6;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("顶级激活进度：");
         }
         addChild(this.fta8);
         this.fta8.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
         this.fta8.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
         this.fta9 = new FTextArea();
         with(this.fta9)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 94 + 30 + 1;
            y = 6;
            textColor = StaticValue.RED;
            htmlText = "";
         }
         addChild(this.fta9);
         this.fts1 = new FTextArea();
         this.fts1.x = 5 + 180 + 153;
         this.fts1.y = 7 + 195 - 177;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 50;
         addChild(this.fts1);
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 120;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("第二元神（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("激活人物肉身七经八脉重生效果，当自身死亡时可立即召唤第二元神继续战斗。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 44 + 20;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("八大兽魂");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>";
            if(shou1)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("牛兽印") + "<br>" + LanResManager.getLanCommonTextWords("特珠属性：攻击48888亿 防御42888亿 血量40888亿 暴击 88888 闪避88888") + "<br>";
            }
            if(shou2)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("狼兽印") + "<br>" + LanResManager.getLanCommonTextWords("特珠属性：攻击48888亿 防御42888亿 血量40888亿 暴击 88888 闪避88888") + "<br>";
            }
            if(shou3)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("虎兽印") + "<br>" + LanResManager.getLanCommonTextWords("特珠属性：攻击48888亿 防御42888亿 血量40888亿 暴击 88888 闪避88888") + "<br>";
            }
            if(shou4)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("狮兽印") + "<br>" + LanResManager.getLanCommonTextWords("特珠属性：攻击48888亿 防御42888亿 血量40888亿 暴击 88888 闪避88888") + "<br>";
            }
            if(shou5)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("豹兽印") + "<br>" + LanResManager.getLanCommonTextWords("特珠属性：攻击48888亿 防御42888亿 血量40888亿 暴击 88888 闪避88888") + "<br>";
            }
            if(shou6)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("龙兽印") + "<br>" + LanResManager.getLanCommonTextWords("特珠属性：攻击48888亿 防御42888亿 血量40888亿 暴击 88888 闪避88888") + "<br>";
            }
            if(shou7)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("圣兽印") + "<br>" + LanResManager.getLanCommonTextWords("特珠属性：攻击48888亿 防御42888亿 血量40888亿 暴击 88888 闪避88888") + "<br>";
            }
            if(shou8)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("血兽印") + "<br>" + LanResManager.getLanCommonTextWords("特珠属性：攻击48888亿 防御42888亿 血量40888亿 暴击 88888 闪避88888") + "<br>";
            }
            if(shouyin > 0)
            {
            }
            return _loc1_ + "</font></textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 20 + 208 - 50;
         this.fts4.y = 20 + 159;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("黄金攻城弩(已激活)");
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("黄金攻城弩：攻城掠地之必备神器。可锁定任意一个玩家施发黄金攻城弩；") + "<br>" + LanResManager.getLanCommonTextWords("对手身边将落入千万箭支，使对手每秒血量流失掉血30%，且由于攻城弩箭") + "<br>" + LanResManager.getLanCommonTextWords("支数量巨多，将形成一屏障使对手的视线全眼被箭支，持续10秒。（可在") + "<br>" + LanResManager.getLanCommonTextWords("城里使用）冷却90秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324 - 58;
         this.kuang1.y = 160 + 35 - 186 + 156;
         this.kuang2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang2);
         this.kuang2.x = 25 + 324 - 58 - 200;
         this.kuang2.y = 160 + 35 - 186 + 156 - 40 - 45;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324 - 58;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 156;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 255 + 40;
         this.fts5.y = 7 + 20 + 105;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.visible = false;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("流金炎魔");
         this.fts5.visible = false;
         addChild(this.fts5);
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.visible = false;
         this.checkZq.x = 256 + 117;
         this.checkZq.y = 7 + 20 + 105;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8 - 75;
         this.equipContainers.y = 12 + 30 + 135 + 35 - 30 - 42 - 60;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
         this.fts6 = new FTextArea();
         this.fts6.x = 20 + 208 - 50 - 100;
         this.fts6.y = 20 + 159 - 40 - 10;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("招蜂引蝶");
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("招蜂引蝶：可锁定任意一个玩家使用，可使对手变身成蜜蜂，使其无法进行任何操作；") + "<br>" + LanResManager.getLanCommonTextWords("且自身每移动一步，变身成蜜蜂的对手将跟着移动，直到状态 解除为止。冷却90秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,62]));
      }
      
      private function onMouseTips(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.jihuoJinlongFt.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTips);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(LanResManager.getLanCommonTextWords("大金龙属性已激活 攻击：+5000"));
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.jihuoJinlongFt.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTips);
         }
      }
      
      private function onJinShenTips(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.jinshenFta.addEventListener(MouseEvent.MOUSE_MOVE,this.onJinShenTips);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(LanResManager.getLanCommonTextWords("肉体金身已激活 攻击+2500；防御+1500；血量+30000；所有武功层数+1"));
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.jinshenFta.removeEventListener(MouseEvent.MOUSE_MOVE,this.onJinShenTips);
         }
      }
      
      private function onRoutiMouseTips(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.routiJinshenBtn.addEventListener(MouseEvent.MOUSE_MOVE,this.onRoutiMouseTips);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.strRouti);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.routiJinshenBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onRoutiMouseTips);
         }
      }
      
      public function setRouti(param1:Boolean) : void
      {
         this.isJihuoRouti = param1;
         if(param1)
         {
            this.jinshenFta.visible = true;
            this.routiJinshenBtn.visible = false;
         }
         else
         {
            this.jinshenFta.visible = false;
            this.routiJinshenBtn.visible = true;
         }
         if(param1)
         {
            this.strRouti = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("肉体金身属性") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前状态：【已激活】") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活条件：肉身达到八层") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>          " + LanResManager.getLanCommonTextWords("拥有不朽金丹100颗") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活地点：襄阳城NPC金钱帮长老") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活加成：") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>  " + LanResManager.getLanCommonTextWords("攻击+2500，防御+1500，血量上限+30000") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>  " + LanResManager.getLanCommonTextWords("所有武功层数+1") + "</font><br>" + "</textformat>";
         }
         else
         {
            this.strRouti = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("肉体金身属性") + "</font><br>" + "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前状态：【未激活】") + "</font><br>" + "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("激活条件：肉身达到八层") + "</font><br>" + "<font color=\'#5c5c5c\'>          " + LanResManager.getLanCommonTextWords("拥有不朽金丹100颗") + "</font><br>" + "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("激活地点：襄阳城NPC金钱帮长老") + "</font><br>" + "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("激活加成：") + "</font><br>" + "<font color=\'#5c5c5c\'>  " + LanResManager.getLanCommonTextWords("攻击+2500，防御+1500，血量上限+30000") + "</font><br>" + "<font color=\'#5c5c5c\'>  " + LanResManager.getLanCommonTextWords("所有武功层数+1") + "</font><br>" + "</textformat>";
         }
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.fta8.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.tootips1);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.fta8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      private function onLink(param1:TextEvent) : void
      {
         var _loc2_:Array = new Array();
         _loc2_ = param1.text.split("#");
         if(_loc2_.length == 2)
         {
            if(_loc2_[0] != "goodsID")
            {
               if(_loc2_[0] == "findPath")
               {
                  MainCharSeachPathManager.mainCharWalk(_loc2_[1]);
               }
            }
         }
      }
      
      private function onMouseTipft2(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc2_:int = this.chatText.getCharIndexAtPoint(this.chatText.mouseX,this.chatText.mouseY);
         if(_loc2_ != -1 && _loc2_ < this.chatText.length)
         {
            _loc3_ = this.chatText.getTextFormat(_loc2_,_loc2_ + 1).url;
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  break;
               case MouseEvent.MOUSE_MOVE:
                  _loc3_ = _loc3_.replace(/event:/g,"");
                  if(_loc3_ != this.url)
                  {
                     _loc4_ = new Array();
                     _loc4_ = _loc3_.split("#");
                     if(_loc4_.length == 2)
                     {
                        if(_loc4_[0] == "goodsID")
                        {
                           this._parent.dispatchEvent(new BaseEvent(CharAttribute.ITEM_LINK_CLICK,"",[_loc4_[1],Tools.currentStage.mouseX,Tools.currentStage.mouseY]));
                        }
                     }
                     else
                     {
                        this._parent.dispatchEvent(new BaseEvent(CharAttribute.CHAT_ITEM_LINK_HIDE));
                        GameInstance.scene.sceneDispatchEvent(param1);
                     }
                  }
                  this.url = _loc3_;
                  break;
               case MouseEvent.MOUSE_OUT:
            }
         }
         else
         {
            this.url = "";
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.CHAT_ITEM_LINK_HIDE));
            GameInstance.scene.sceneDispatchEvent(param1);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICK));
               break;
            case this.classBtn1:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_MENU_CLICK,"",1));
               break;
            case this.classBtn2:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_MENU_CLICK,"",2));
               break;
            case this.classBtn3:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_MENU_CLICK,"",3));
               break;
            case this.classBtn4:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_MENU_CLICK,"",4));
               break;
            case this.classBtn5:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_MENU_CLICK,"",5));
               break;
            case this.classBtn6:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_MENU_CLICK,"",6));
               break;
            case this.classBtn7:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_MENU_CLICK,"",7));
               break;
            case this.classBtn8:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_MENU_CLICK,"",8));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.smithingbodyadvanceCanvas.$parent = this._parent;
         this.smithingbodyadvanceCanvas.$parent2 = this;
      }
      
      private function onCom() : void
      {
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.classBtn1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr1);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.classBtn1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function onMouseTip2(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.classBtn2.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr2);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.classBtn2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
         }
      }
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.classBtn3.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr3);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.classBtn3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
         }
      }
      
      private function onMouseTip4(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.classBtn4.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr4);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.classBtn4.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
         }
      }
      
      private function onMouseTip5(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.classBtn5.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr5);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.classBtn5.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
         }
      }
      
      private function onJiHuoBtnClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_JIHUO_CLICK));
      }
      
      private function onJiHuoBtnClick1(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_JIHUODAJINLONG_CLICK));
      }
      
      private function onRoutiBtnClick(param1:MouseEvent) : void
      {
         if(!this.isJihuoRouti)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ROUTIJINSHEN_JIHUODAJINLONG_CLICK));
         }
      }
      
      private function onMouseTip6(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.classBtn6.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr6);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.classBtn6.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
         }
      }
      
      private function onMouseTip7(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.classBtn7.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip7);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr7);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.classBtn7.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip7);
         }
      }
      
      private function onMouseTip8(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.classBtn8.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip8);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.toolTipStr8);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.classBtn8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip8);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function onSelectFlag1(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn_1:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_SHANGYIYE_CLICK));
               break;
            case this.nextBtn_1:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_XIAYIYE_CLICK));
         }
      }
      
      public function setJingjie(param1:String) : void
      {
         this.ft1.htmlText = LanResManager.getLanTextWords(this,"肉身境界提升简介",[StaticValue.ORANGE_HTML,StaticValue.BLUE_HTML,param1,StaticValue.ORANGE_HTML]);
      }
      
      public function setMiaoshu(param1:String) : void
      {
         this.ft2.htmlText = param1;
         this.chatText.htmlText = param1;
      }
      
      public function setBar1(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.lb1.visible = true;
            this.barBg1.visible = true;
            this.barBar1.visible = true;
            this.barBar1.setValue(param2,param3);
         }
         else
         {
            this.lb1.visible = false;
            this.barBg1.visible = false;
            this.barBar1.visible = false;
         }
      }
      
      public function setBar2(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.lb2.visible = true;
            this.barBg2.visible = true;
            this.barBar2.visible = true;
            this.barBar2.setValue(param2,param3);
         }
         else
         {
            this.lb2.visible = false;
            this.barBg2.visible = false;
            this.barBar2.visible = false;
         }
      }
      
      public function setBar3(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.lb3.visible = true;
            this.barBg3.visible = true;
            this.barBar3.visible = true;
            this.barBar3.setValue(param2,param3);
         }
         else
         {
            this.lb3.visible = false;
            this.barBg3.visible = false;
            this.barBar3.visible = false;
         }
      }
      
      public function setBar4(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.lb4.visible = true;
            this.barBg4.visible = true;
            this.barBar4.visible = true;
            this.barBar4.setValue(param2,param3);
         }
         else
         {
            this.lb4.visible = false;
            this.barBg4.visible = false;
            this.barBar4.visible = false;
         }
      }
      
      public function setBar5(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.lb5.visible = true;
            this.barBg5.visible = true;
            this.barBar5.visible = true;
            this.barBar5.setValue(param2,param3);
         }
         else
         {
            this.lb5.visible = false;
            this.barBg5.visible = false;
            this.barBar5.visible = false;
         }
      }
      
      public function setBar6(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.lb6.visible = true;
            this.barBg6.visible = true;
            this.barBar6.visible = true;
            this.barBar6.setValue(param2,param3);
         }
         else
         {
            this.lb6.visible = false;
            this.barBg6.visible = false;
            this.barBar6.visible = false;
         }
      }
      
      public function setBar7(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.lb7.visible = true;
            this.barBg7.visible = true;
            this.barBar7.visible = true;
            this.barBar7.setValue(param2,param3);
         }
         else
         {
            this.lb7.visible = false;
            this.barBg7.visible = false;
            this.barBar7.visible = false;
         }
      }
      
      public function setBar8(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.lb8.visible = true;
            this.barBg8.visible = true;
            this.barBar8.visible = true;
            this.lb8Ft.visible = true;
            this.lb8Ft.text = param2 + "%" + "/" + param3 + "%";
            this.barBar8.setValue(param2,param3);
         }
         else
         {
            this.lb8.visible = false;
            this.barBg8.visible = false;
            this.barBar8.visible = false;
            this.lb8Ft.visible = false;
         }
      }
      
      public function setBar9(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.lb9.visible = true;
            this.barBg9.visible = true;
            this.barBar9.visible = true;
            this.lb9Ft.visible = true;
            this.lb9Ft.text = param2 + "%" + "/" + param3 + "%";
            this.barBar9.setValue(param2,param3);
         }
         else
         {
            this.lb9.visible = false;
            this.barBg9.visible = false;
            this.barBar9.visible = false;
            this.lb9Ft.visible = false;
         }
      }
      
      public function setBar10(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.lb10.visible = true;
            this.barBg10.visible = true;
            this.barBar10.visible = true;
            this.lb10Ft.visible = true;
            this.lb10Ft.text = int(param2 / 10000 * 100 * 100) / 100 + "%" + "/" + param3 / 10000 * 100 + "%";
            this.barBar10.setValue(param2,param3);
         }
         else
         {
            this.lb10.visible = false;
            this.barBg10.visible = false;
            this.barBar10.visible = false;
            this.lb10Ft.visible = false;
         }
      }
      
      public function setPage(param1:int, param2:int, param3:Boolean) : void
      {
         this.flagPage_1.text = param1 + "/" + param2;
         if(param1 == 1)
         {
            this.preBtn_1.enabled = false;
         }
         else
         {
            this.preBtn_1.enabled = true;
         }
         if(param1 == param2)
         {
            this.nextBtn_1.enabled = false;
         }
         else
         {
            this.nextBtn_1.enabled = true;
         }
         if(param3)
         {
            this.okBtn.visible = false;
            this.dachengImg.visible = true;
         }
         else
         {
            this.okBtn.visible = true;
            this.dachengImg.visible = false;
         }
      }
      
      public function setIsEnabled(param1:Boolean) : void
      {
         if(param1)
         {
            this.okBtn.enabled = param1;
            this.okBtn.visible = true;
            this.dachengImg.visible = false;
         }
         else
         {
            this.okBtn.enabled = param1;
         }
      }
      
      public function setZhufuzhi(param1:int, param2:int) : void
      {
         this.smithingbodyadvanceCanvas.setZhufuzhi(param1,param2);
      }
      
      public function setChenggonglv(param1:int, param2:int, param3:String) : void
      {
         this.smithingbodyadvanceCanvas.setChenggonglv(param1,param2,param3);
      }
      
      public function setAdvanceMiaoshu(param1:String) : void
      {
         this.smithingbodyadvanceCanvas.setAdvanceMiaoshu(param1);
      }
      
      public function setCountDown(param1:int) : void
      {
         this.smithingbodyadvanceCanvas.setCountDown(param1);
      }
      
      public function setPudidan(param1:Goods) : void
      {
         this.smithingbodyadvanceCanvas.setPudidan(param1);
      }
      
      public function setIsShowUsePuTiJingCui(param1:Boolean) : void
      {
         this.smithingbodyadvanceCanvas.checkBox.visible = param1;
      }
      
      public function setIsShowUsePuTiDan(param1:Boolean) : void
      {
         this.smithingbodyadvanceCanvas.checkBox1.visible = param1;
      }
      
      public function setIsUsePuTiDan(param1:Boolean) : void
      {
         this.smithingbodyadvanceCanvas.checkBox1.selectState = param1;
      }
      
      public function showPuTiDanTipCanvas(param1:int) : void
      {
         if(!this.shenQiPuTiDanTip)
         {
            this.shenQiPuTiDanTip = new ShenQiPuTiDanTipCanvas();
         }
         addChild(this.shenQiPuTiDanTip);
         this.shenQiPuTiDanTip.x = 438;
         this.shenQiPuTiDanTip.y = 402 - this.shenQiPuTiDanTip.height;
         this.shenQiPuTiDanTip.setTipType(param1);
      }
      
      public function hidePuTiDanTipCanvas() : void
      {
         if(Boolean(this.shenQiPuTiDanTip) && Boolean(this.shenQiPuTiDanTip.parent))
         {
            this.shenQiPuTiDanTip.parent.removeChild(this.shenQiPuTiDanTip);
         }
      }
      
      public function setCheck(param1:Boolean) : void
      {
         this.smithingbodyadvanceCanvas.setCheck(param1);
      }
      
      public function showBuyPanel(param1:int, param2:String, param3:String, param4:int, param5:String, param6:int, param7:Number) : void
      {
         MallBuyPanel.type = MallBuyPanel.TYPE_SILVER;
         var _loc8_:MallBuyPanel = new MallBuyPanel();
         _loc8_.$parent = this;
         _loc8_.setItem(param1,param2,param3,param4,param5,param6,param7);
         POPWindowManager.showWindow(_loc8_);
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.smithingbodyadvanceCanvas.y == 380)
            {
               TweenMax.to(this.smithingbodyadvanceCanvas,1,{
                  "y":273,
                  "onComplete":this.onCom
               });
            }
         }
         else if(this.smithingbodyadvanceCanvas.y == 273)
         {
            TweenMax.to(this.smithingbodyadvanceCanvas,1,{
               "y":380,
               "onComplete":this.onCom
            });
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICK,"",false));
         }
      }
      
      public function okBtnToolTip(param1:String) : void
      {
         this.okBtn.toolTip = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>" + "</textformat>";
      }
      
      public function menuToolTip(param1:Array) : void
      {
         this.toolTipStr1 = param1[0];
         this.toolTipStr2 = param1[1];
         this.toolTipStr3 = param1[2];
         this.toolTipStr4 = param1[3];
         this.toolTipStr5 = param1[4];
         this.toolTipStr6 = param1[5];
         this.toolTipStr7 = param1[6];
         this.toolTipStr8 = param1[7];
      }
      
      public function setJindu(param1:int) : void
      {
         this.longMovieMlip.gotoAndStop(param1);
         if(param1 >= 8)
         {
            this.classBtn8.filters = [];
         }
         else
         {
            this.classBtn8.filters = Tools.blackWhiteFilter;
         }
         if(param1 >= 7)
         {
            this.classBtn7.filters = [];
         }
         else
         {
            this.classBtn7.filters = Tools.blackWhiteFilter;
         }
         if(param1 >= 6)
         {
            this.classBtn6.filters = [];
         }
         else
         {
            this.classBtn6.filters = Tools.blackWhiteFilter;
         }
         if(param1 >= 5)
         {
            this.classBtn5.filters = [];
         }
         else
         {
            this.classBtn5.filters = Tools.blackWhiteFilter;
         }
         if(param1 >= 4)
         {
            this.classBtn4.filters = [];
         }
         else
         {
            this.classBtn4.filters = Tools.blackWhiteFilter;
         }
         if(param1 >= 3)
         {
            this.classBtn3.filters = [];
         }
         else
         {
            this.classBtn3.filters = Tools.blackWhiteFilter;
         }
         if(param1 >= 2)
         {
            this.classBtn2.filters = [];
         }
         else
         {
            this.classBtn2.filters = Tools.blackWhiteFilter;
         }
         if(param1 >= 1)
         {
            this.classBtn1.filters = [];
         }
         else
         {
            this.classBtn1.filters = Tools.blackWhiteFilter;
         }
      }
      
      public function showDuantijindan(param1:Buff) : void
      {
         if(param1 != null)
         {
            if(!this.duantijindanCanvas)
            {
               this.duantijindanCanvas = new DuantijindanCanvas();
            }
            this.duantijindanCanvas.setInitialize(param1);
            addChild(this.duantijindanCanvas);
            this.duantijindanCanvas.x = -10;
            this.duantijindanCanvas.y = 380;
         }
         else if(this.duantijindanCanvas != null && this.duantijindanCanvas.parent != null)
         {
            this.duantijindanCanvas.parent.removeChild(this.duantijindanCanvas);
         }
      }
      
      public function setSmithingBodyBuff(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Bitmap = null;
         while(this.buffSpr.numChildren > 0)
         {
            this.buffSpr.removeChildAt(0);
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.buffSpr.addChild(_loc3_);
            _loc3_.x = -(_loc4_ * 40) - 2;
            _loc3_.y = -2;
            _loc2_ = new ItemFace(param1[_loc4_]);
            _loc2_.x = -(_loc4_ * 40);
            this.buffSpr.addChild(_loc2_);
            _loc4_++;
         }
      }
      
      public function setJihuo(param1:Boolean = false) : void
      {
         if(param1 == false)
         {
            this.jihuoFt.visible = false;
            this.jihuoBtn.visible = true;
         }
         else
         {
            this.jihuoFt.visible = true;
            this.jihuoBtn.visible = false;
         }
      }
      
      public function setJihuoDajinlong(param1:Boolean = false) : void
      {
         if(param1 == false)
         {
            this.jihuoJinlongFt.visible = false;
            this.jihuoJinlongBtn.visible = true;
         }
         else
         {
            this.jihuoJinlongFt.visible = true;
            this.jihuoJinlongBtn.visible = false;
         }
      }
      
      public function setJiHuoRouShen(param1:Boolean = false) : void
      {
         this.isJiHuoRouShen = param1;
      }
      
      public function setZdtsBtnLabel(param1:Boolean) : void
      {
         this.smithingbodyadvanceCanvas.setZdtsBtnLabel(param1);
      }
      
      public function menuJinduToolTip(param1:String) : void
      {
         this.tootips1 = param1;
      }
      
      public function setJinduNum(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            this.fta8.visible = true;
            this.fta9.visible = true;
         }
         else
         {
            this.fta8.visible = false;
            this.fta9.visible = false;
         }
         this.fta9.htmlText = param1 + "%";
      }
      
      public function loadLongPicture() : void
      {
         this.jinlong = StaticValue.getBitmapByClassName("ui.duanzaoroushen.long.jin.bg");
         this.jinlong.name = "dajinlong";
         this.imgFc.addChildAt(this.jinlong,1);
         this.jinlong.x = 2;
         this.jinlong.y = 2;
      }
      
      public function setEnabledFun() : void
      {
         this.classBtn1.mouseEnabled = false;
         this.classBtn2.mouseEnabled = false;
         this.classBtn3.mouseEnabled = false;
         this.classBtn4.mouseEnabled = false;
         this.classBtn5.mouseEnabled = false;
         this.classBtn6.mouseEnabled = false;
         this.classBtn7.mouseEnabled = false;
         this.classBtn8.mouseEnabled = false;
         this.nextBtn_1.enabled = false;
         this.preBtn_1.enabled = false;
         this.jihuoBtn.enabled = false;
         this.jihuoJinlongBtn.enabled = false;
         this.okBtn.enabled = false;
         this.routiJinshenBtn.enabled = false;
      }
      
      public function reSet() : void
      {
         if(this.imgFc.getChildByName("dajinlong") != null)
         {
            this.imgFc.removeChild(this.imgFc.getChildByName("dajinlong"));
         }
      }
      
      public function setIsJihuoMohua(param1:Array) : void
      {
         this.smithingBodyFt.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("肉身攻击魔化") + "—" + LanResManager.getLanCommonTextWords("使用颗数：") + param1[0].gjMhNum + "    " + LanResManager.getLanCommonTextWords("攻击加成：") + param1[0].gj + "<br>" + LanResManager.getLanCommonTextWords("肉身防御魔化") + "—" + LanResManager.getLanCommonTextWords("使用颗数：") + param1[0].fyMhNum + "    " + LanResManager.getLanCommonTextWords("防御加成：") + param1[0].fy + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("提示：肉身攻击魔化和肉身防御魔化颗数使用总和为") + "<br>" + LanResManager.getLanCommonTextWords("10000颗，请仔细进行分配，以免造成不必要的浪费") + "</font>" + "</textformat>";
         if(param1[0].isJihuoMohua)
         {
            this.chatText.visible = false;
            this.smithingBodyFt.visible = true;
            this.loadTexiaoFun();
         }
         else
         {
            this.chatText.visible = true;
            this.smithingBodyFt.visible = false;
         }
      }
      
      private function loadTexiaoFun() : void
      {
         this.loadUrl5 = GameConfig.fileBaseFolder + "res/data/mc/roushen/roushen.swf";
         if(this.mcObj6[1] != null)
         {
            if(Boolean(this.gongMc5) && this.gongMc5.parent != null)
            {
               this.gongMc5.stop();
               this.gongMc5.parent.removeChild(this.gongMc5);
            }
            this.gongMc5 = this.mcObj6[1];
            this.gongMc5.play();
            this.gongMc5.x = -40;
            this.gongMc5.y = 65;
            this.spr1.addChild(this.gongMc5);
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
               if(Boolean(gongMc5) && gongMc5.parent != null)
               {
                  gongMc5.stop();
                  gongMc5.parent.removeChild(gongMc5);
               }
               gongMc5 = _loc2_.content as MovieClip;
               mcObj6[1] = gongMc5;
               if(gongMc5)
               {
                  gongMc5.play();
                  gongMc5.x = -40;
                  gongMc5.y = 65;
                  spr1.addChild(gongMc5);
               }
            },null,false,this.loadUrl5);
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc5) && this.gongMc5.parent != null)
         {
            this.gongMc5.parent.removeChild(this.gongMc5);
         }
      }
      
      public function setRouShenMenghuanJindan(param1:Boolean) : void
      {
         var isMainChar:Boolean = param1;
         this.isMain = isMainChar;
         if(isMainChar)
         {
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_ROUSHEN_ID] + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("梦幻肉身石");
            ToolTips.createToolTips(this.fts1,this,function():String
            {
               var _loc1_:String = "";
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_ROUSHEN_ID] * 10000 + "," + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_ROUSHEN_ID] * 1 + "</font>";
               return _loc1_ + "</textformat>";
            });
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_DIERYUANSHEN_ID];
            this.shouyin = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_BAISHOU_ID];
            this.rouBg1.visible = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_NIUSHOU_ID];
            this.rouBg2.visible = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_LANGSHOU_ID];
            this.rouBg3.visible = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_HUSHOU_ID];
            this.rouBg4.visible = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_SHISHOU_ID];
            this.rouBg5.visible = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_BAOSHOU_ID];
            this.rouBg6.visible = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_LONGSHOU_ID];
            this.rouBg7.visible = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_SHENGSHOU_ID];
            this.rouBg8.visible = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_XUESHOU_ID];
            this.shou1 = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_NIUSHOU_ID];
            this.shou2 = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_LANGSHOU_ID];
            this.shou3 = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_HUSHOU_ID];
            this.shou4 = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_SHISHOU_ID];
            this.shou5 = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_BAOSHOU_ID];
            this.shou6 = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_LONGSHOU_ID];
            this.shou7 = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_SHENGSHOU_ID];
            this.shou8 = GameState.dictMainStatus[SpecialGoodsID.ROUSHEN_XUESHOU_ID];
            if(this.shou1 || this.shou2 || this.shou3 || this.shou4 || this.shou5 || this.shou6 || this.shou7 || this.shou8)
            {
               this.fts3.visible = true;
            }
            else
            {
               this.fts3.visible = false;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.DIZI_ROUSHEN_HUANGJINGONGCHENGNU_ID];
            this.isLearn1 = GameState.dictMainStatus[SpecialGoodsID.DIZI_ROUSHEN_HUANGJINGONGCHENGNU_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.DIZI_ROUSHEN_ZHAOFENGYINDIE_ID];
            this.isLearn2 = GameState.dictMainStatus[SpecialGoodsID.DIZI_ROUSHEN_ZHAOFENGYINDIE_ID];
            this.setSkillJiHuo(200354,200364);
         }
         else
         {
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_ROUSHEN_ID] + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("梦幻肉身石");
            ToolTips.createToolTips(this.fts1,this,function():String
            {
               var _loc1_:String = "";
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_ROUSHEN_ID] * 10000 + "," + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_ROUSHEN_ID] * 1 + "</font>";
               return _loc1_ + "</textformat>";
            });
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_DIERYUANSHEN_ID];
            this.shouyin = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_BAISHOU_ID];
            this.rouBg1.visible = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_NIUSHOU_ID];
            this.rouBg2.visible = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_LANGSHOU_ID];
            this.rouBg3.visible = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_HUSHOU_ID];
            this.rouBg4.visible = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_SHISHOU_ID];
            this.rouBg5.visible = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_BAOSHOU_ID];
            this.rouBg6.visible = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_LONGSHOU_ID];
            this.rouBg7.visible = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_SHENGSHOU_ID];
            this.rouBg8.visible = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_XUESHOU_ID];
            this.shou1 = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_NIUSHOU_ID];
            this.shou2 = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_LANGSHOU_ID];
            this.shou3 = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_HUSHOU_ID];
            this.shou4 = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_SHISHOU_ID];
            this.shou5 = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_BAOSHOU_ID];
            this.shou6 = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_LONGSHOU_ID];
            this.shou7 = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_SHENGSHOU_ID];
            this.shou8 = GameState.dictTargetStatus[SpecialGoodsID.ROUSHEN_XUESHOU_ID];
            if(this.shou1 || this.shou2 || this.shou3 || this.shou4 || this.shou5 || this.shou6 || this.shou7 || this.shou8)
            {
               this.fts3.visible = true;
            }
            else
            {
               this.fts3.visible = false;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.DIZI_ROUSHEN_HUANGJINGONGCHENGNU_ID];
            this.isLearn1 = GameState.dictTargetStatus[SpecialGoodsID.DIZI_ROUSHEN_HUANGJINGONGCHENGNU_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.DIZI_ROUSHEN_ZHAOFENGYINDIE_ID];
            this.isLearn2 = GameState.dictTargetStatus[SpecialGoodsID.DIZI_ROUSHEN_ZHAOFENGYINDIE_ID];
            this.setSkillJiHuo(200354,200364);
         }
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkillJiHuo(param1:int, param2:int) : void
      {
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         _loc3_.isLearn = 1;
         this.mainSkillItemFace = new ItemFace(_loc3_);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
         if(this.mainSkillItemFace2)
         {
            if(this.mainSkillItemFace2.parent)
            {
               this.mainSkillItemFace2.parent.removeChild(this.mainSkillItemFace2);
            }
         }
         var _loc4_:Skill = new Skill(param2);
         _loc4_.isLearn = 1;
         this.mainSkillItemFace2 = new ItemFace(_loc4_);
         this.mainSkillItemFace2.showKungFuTag();
         this.mainSkillItemFace2.x = -200;
         this.mainSkillItemFace2.y = -40 - 45;
         this.mainSkillItemFace2.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace2);
         if(this.isLearn1)
         {
            this.mainSkillItemFace.visible = true;
            this.kuang1.visible = true;
         }
         else
         {
            this.mainSkillItemFace.visible = false;
            this.kuang1.visible = false;
         }
         if(this.isLearn2)
         {
            this.mainSkillItemFace2.visible = true;
            this.kuang2.visible = true;
         }
         else
         {
            this.mainSkillItemFace2.visible = false;
            this.kuang2.visible = false;
         }
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_RouShen(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_ROUSHEN_LIUJINYANMO_ID)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 0;
               this.kuangHD.y = 0;
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.fts5.visible = true;
                  this.checkZq.visible = true;
               }
               else
               {
                  this.fts5.visible = false;
                  this.checkZq.visible = false;
               }
            }
            _loc2_++;
         }
      }
      
      public function zuoqi(param1:Boolean) : void
      {
         this.checkZq.selectState = param1;
      }
   }
}

