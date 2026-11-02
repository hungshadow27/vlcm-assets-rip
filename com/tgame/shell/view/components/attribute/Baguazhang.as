package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
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
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.mall.MallBuyPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.*;
   import flash.utils.getDefinitionByName;
   
   public class Baguazhang extends Sprite
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
      
      private var okBtn:SecondButton;
      
      private var preBtn_1:FSimpleButton;
      
      private var flagPage_1:FTextArea;
      
      private var nextBtn_1:FSimpleButton;
      
      public var smithingbodyadvanceCanvas:BaguazhangJinjiePanel;
      
      private var dachengImg:Bitmap;
      
      private var imgFc:Sprite;
      
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
      
      private var longMovieMlip:MovieClip;
      
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
      
      private var bit1:DisplayObject;
      
      private var dengji:int;
      
      private var dianjiId:int;
      
      private var bitObj:Object;
      
      private var fta8:FTextArea;
      
      private var fta9:FTextArea;
      
      private var isLockOn:Boolean = false;
      
      private var lockImg:Bitmap;
      
      private var equipContainer:Sprite;
      
      private var cfts:Bitmap;
      
      private var containers:Sprite;
      
      private var barBg:Bitmap;
      
      private var bar:ColorBar;
      
      private var fts:FTextArea;
      
      private var btns:SecondButton;
      
      private var lbFt:FTextArea;
      
      private var lbl:FLabel;
      
      private var containers1:Sprite;
      
      private var containers2:Sprite;
      
      private var xueshouSprite:Sprite;
      
      private var xueshouBg:DisplayObject;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var guanghuan:DisplayObject;
      
      private var fts3:FTextArea;
      
      private var suipian:int = 0;
      
      private var fts4:FTextArea;
      
      private var check:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var check1:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var fengleishi:int = 0;
      
      private var fts7:FTextArea;
      
      private var canjuan:int = 0;
      
      public function Baguazhang()
      {
         var $class:Class;
         this.bitObj = {};
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
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.baguazhang.ui";
         addChild(this.bgImg);
         this.guanghuan = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/baguazhang/guang.swf");
         this.guanghuan.x = 68;
         this.guanghuan.y = -7;
         addChild(this.guanghuan);
         this.imgFc = new Sprite();
         addChild(this.imgFc);
         this.jihuoBtn = new SecondButton();
         this.jihuoBtn.label = LanResManager.getLanCommonTextWords("激活隐藏属性");
         addChild(this.jihuoBtn);
         this.jihuoBtn.x = 275;
         this.jihuoBtn.y = 5;
         this.jihuoBtn.addEventListener(MouseEvent.CLICK,this.onJiHuoBtnClick);
         this.jihuoFt = new FTextArea();
         this.jihuoFt.x = 265;
         this.jihuoFt.y = 5;
         this.jihuoFt.autoSize = TextFieldAutoSize.LEFT;
         this.jihuoFt.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("隐藏属性已激活") + "</font>";
         this.jihuoFt.visible = false;
         addChild(this.jihuoFt);
         $class = getDefinitionByName("ui.baguazhang.button.a") as Class;
         this.classBtn1 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn1);
         this.classBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn1.x = 176 - 16 + 20;
         this.classBtn1.y = 7 - 5 + 3;
         this.classBtn1.name = "classBtn1";
         this.classBtn1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.baguazhang.button.b") as Class;
         this.classBtn2 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn2);
         this.classBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn2.x = 274 - 22 + 4;
         this.classBtn2.y = 23 - 9 + 30;
         this.classBtn2.name = "classBtn2";
         this.classBtn2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip2);
         this.classBtn2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip2);
         $class = getDefinitionByName("ui.baguazhang.button.c") as Class;
         this.classBtn3 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn3);
         this.classBtn3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn3.x = 331 - 49 + 5 - 3;
         this.classBtn3.y = 79 + 18 + 23 - 4;
         this.classBtn3.name = "classBtn3";
         this.classBtn3.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.classBtn3.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         $class = getDefinitionByName("ui.baguazhang.button.d") as Class;
         this.classBtn4 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn4);
         this.classBtn4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn4.x = 274 - 5;
         this.classBtn4.y = 141 + 42;
         this.classBtn4.name = "classBtn4";
         this.classBtn4.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip4);
         this.classBtn4.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip4);
         $class = getDefinitionByName("ui.baguazhang.button.e") as Class;
         this.classBtn5 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn5);
         this.classBtn5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn5.x = 176 + 10;
         this.classBtn5.y = 155 + 48 + 9;
         this.classBtn5.name = "classBtn5";
         this.classBtn5.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip5);
         this.classBtn5.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip5);
         $class = getDefinitionByName("ui.baguazhang.button.f") as Class;
         this.classBtn6 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn6);
         this.classBtn6.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn6.x = 75 + 19 + 9;
         this.classBtn6.y = 141 + 43;
         this.classBtn6.name = "classBtn6";
         this.classBtn6.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip6);
         this.classBtn6.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip6);
         $class = getDefinitionByName("ui.baguazhang.button.g") as Class;
         this.classBtn7 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn7);
         this.classBtn7.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn7.x = 12 + 63 + 11 - 9;
         this.classBtn7.y = 79 + 31 + 1;
         this.classBtn7.name = "classBtn7";
         this.classBtn7.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip7);
         this.classBtn7.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip7);
         $class = getDefinitionByName("ui.baguazhang.button.h") as Class;
         this.classBtn8 = new $class() as SimpleButton;
         this.imgFc.addChild(this.classBtn8);
         this.classBtn8.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn8.x = 75 + 18 + 9 - 7;
         this.classBtn8.y = 23 + 14 + 5;
         this.classBtn8.name = "classBtn8";
         this.classBtn8.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip8);
         this.classBtn8.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip8);
         this.spr1 = new Sprite();
         this.spr1.x = 5;
         this.spr1.y = 267 + 8;
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
         }
         this.spr1.addChild(this.ft1);
         this.lb5 = new FLabel();
         with(this.lb5)
         {
            x = 0;
            y = 75;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SmithingBody,"防御");
         }
         this.spr1.addChild(this.lb5);
         this.barBg5 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg5);
         this.barBg5.x = this.lb5.x + this.lb5.width + 15;
         this.barBg5.y = this.lb5.y + 2;
         this.barBar5 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar5);
         this.barBar5.x = this.lb5.x + this.lb5.width + 4 + 15;
         this.barBar5.y = this.lb5.y + 5;
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 0;
            y = 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SmithingBody,"生命");
         }
         this.spr1.addChild(this.lb1);
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg1);
         this.barBg1.x = this.lb1.x + this.lb5.width + 15;
         this.barBg1.y = this.lb1.y + 2;
         this.barBar1 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar1);
         this.barBar1.x = this.lb1.x + this.lb5.width + 4 + 15;
         this.barBar1.y = this.lb1.y + 5;
         this.lb2 = new FLabel();
         with(this.lb2)
         {
            x = 0;
            y = 30;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SmithingBody,"内力");
         }
         this.spr1.addChild(this.lb2);
         this.barBg2 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg2);
         this.barBg2.x = this.lb2.x + this.lb5.width + 15;
         this.barBg2.y = this.lb2.y + 2;
         this.barBar2 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar2);
         this.barBar2.x = this.lb2.x + this.lb5.width + 4 + 15;
         this.barBar2.y = this.lb2.y + 5;
         this.lb3 = new FLabel();
         with(this.lb3)
         {
            x = 0;
            y = 45;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SmithingBody,"体力");
         }
         this.spr1.addChild(this.lb3);
         this.barBg3 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg3);
         this.barBg3.x = this.lb3.x + this.lb5.width + 15;
         this.barBg3.y = this.lb3.y + 2;
         this.barBar3 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar3);
         this.barBar3.x = this.lb3.x + this.lb5.width + 4 + 15;
         this.barBar3.y = this.lb3.y + 5;
         this.lb4 = new FLabel();
         with(this.lb4)
         {
            x = 0;
            y = 60;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SmithingBody,"攻击");
         }
         this.spr1.addChild(this.lb4);
         this.barBg4 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg4);
         this.barBg4.x = this.lb4.x + this.lb5.width + 15;
         this.barBg4.y = this.lb4.y + 2;
         this.barBar4 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar4);
         this.barBar4.x = this.lb4.x + this.lb5.width + 4 + 15;
         this.barBar4.y = this.lb4.y + 5;
         this.lb10 = new FLabel();
         with(this.lb10)
         {
            x = 195;
            y = 45;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("抵抗暗器");
         }
         this.spr1.addChild(this.lb10);
         this.barBg10 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg10);
         this.barBg10.x = this.lb10.x + this.lb10.width;
         this.barBg10.y = this.lb10.y + 2;
         this.barBar10 = new ColorBar(5,123,5,false);
         this.spr1.addChild(this.barBar10);
         this.barBar10.x = this.lb10.x + this.lb10.width + 4;
         this.barBar10.y = this.lb10.y + 5;
         this.lb7 = new FLabel();
         with(this.lb7)
         {
            x = 195;
            y = 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("暴    击");
         }
         this.spr1.addChild(this.lb7);
         this.barBg7 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg7);
         this.barBg7.x = this.lb7.x + this.lb10.width;
         this.barBg7.y = this.lb7.y + 2;
         this.barBar7 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar7);
         this.barBar7.x = this.lb7.x + this.lb10.width + 4;
         this.barBar7.y = this.lb7.y + 5;
         this.lb6 = new FLabel();
         with(this.lb6)
         {
            x = 195;
            y = 30;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("闪    避");
         }
         this.spr1.addChild(this.lb6);
         this.barBg6 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg6);
         this.barBg6.x = this.lb6.x + this.lb10.width;
         this.barBg6.y = this.lb6.y + 2;
         this.barBar6 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar6);
         this.barBar6.x = this.lb6.x + this.lb10.width + 4;
         this.barBar6.y = this.lb6.y + 5;
         this.lb10Ft = new FTextArea();
         with(this.lb10Ft)
         {
            x = 250;
            y = 43;
            width = 123;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,9,16777215,null,null,null,null,null,"center");
            text = "2000/2000";
         }
         this.spr1.addChild(this.lb10Ft);
         this.lb8 = new FLabel();
         with(this.lb8)
         {
            x = 195;
            y = 60;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("抵抗弓箭");
         }
         this.spr1.addChild(this.lb8);
         this.barBg8 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg8);
         this.barBg8.x = this.lb8.x + this.lb10.width;
         this.barBg8.y = this.lb8.y + 2;
         this.barBar8 = new ColorBar(5,123,5,false);
         this.spr1.addChild(this.barBar8);
         this.barBar8.x = this.lb8.x + this.lb10.width + 4;
         this.barBar8.y = this.lb8.y + 5;
         this.lb8Ft = new FTextArea();
         with(this.lb8Ft)
         {
            x = 250;
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
            text = LanResManager.getLanTextWords(SmithingBody,"伤害减免");
         }
         this.spr1.addChild(this.lb9);
         this.barBg9 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg9);
         this.barBg9.x = this.lb9.x + this.lb10.width;
         this.barBg9.y = this.lb9.y + 2;
         this.barBar9 = new ColorBar(5,123,5,false);
         this.spr1.addChild(this.barBar9);
         this.barBar9.x = this.lb9.x + this.lb10.width + 4;
         this.barBar9.y = this.lb9.y + 5;
         this.lb9Ft = new FTextArea();
         with(this.lb9Ft)
         {
            x = 250;
            y = 73;
            width = 123;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,9,16777215,null,null,null,null,null,"center");
            text = "12/12";
         }
         this.spr1.addChild(this.lb9Ft);
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
         }
         this.spr1.addChild(this.ft2);
         this.ft2.addEventListener(TextEvent.LINK,this.onLink);
         this.ft2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTipft2);
         this.ft2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTipft2);
         this.ft2.visible = false;
         this.chatText = new FTextArea();
         this.chatText.filters = StaticValue.filter;
         this.chatText.x = 0;
         this.chatText.y = 95 - 109;
         this.chatText.width = 300;
         this.chatText.height = 20;
         this.chatText.autoSize = TextFieldAutoSize.LEFT;
         this.chatText.defaultTextFormat = new TextFormat(null,null,16777215);
         this.spr1.addChild(this.chatText);
         this.chatText.addEventListener(TextEvent.LINK,this.onLink);
         this.chatText.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseTipft2);
         this.chatText.addEventListener(MouseEvent.CLICK,this.onMouseTipft2);
         this.chatText.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTipft2);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("进阶合成");
         this.spr1.addChild(this.okBtn);
         this.okBtn.x = 10;
         this.okBtn.y = -45;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onOkClick);
         this.okBtn.toolTip = "1";
         this.dachengImg = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.complete");
         this.spr1.addChild(this.dachengImg);
         this.dachengImg.width *= 0.5;
         this.dachengImg.height *= 0.5;
         this.dachengImg.x = 10;
         this.dachengImg.y = -55;
         this.dachengImg.visible = false;
         this.preBtn_1 = new FSimpleButton();
         this.preBtn_1.skin = "previousButton";
         this.spr1.addChild(this.preBtn_1);
         this.preBtn_1.x = 315;
         this.preBtn_1.y = 130;
         this.preBtn_1.addEventListener(MouseEvent.CLICK,this.onSelectFlag1);
         this.preBtn_1.visible = false;
         this.flagPage_1 = new FTextArea();
         with(this.flagPage_1)
         {
            x = 335;
            y = 132;
            textColor = StaticValue.WHITE;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            width = 36;
            height = 20;
            text = "";
         }
         this.spr1.addChild(this.flagPage_1);
         this.flagPage_1.visible = false;
         this.nextBtn_1 = new FSimpleButton();
         this.nextBtn_1.skin = "nextButton";
         this.spr1.addChild(this.nextBtn_1);
         this.nextBtn_1.x = 370;
         this.nextBtn_1.y = 130;
         this.nextBtn_1.addEventListener(MouseEvent.CLICK,this.onSelectFlag1);
         this.nextBtn_1.visible = false;
         this.smithingbodyadvanceCanvas = new BaguazhangJinjiePanel();
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
            x = 125;
            y = 6;
            textColor = StaticValue.RED;
            htmlText = "";
         }
         addChild(this.fta9);
         this.lockImg = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         this.addChild(this.lockImg);
         this.lockImg.x = 25 + 2;
         this.lockImg.y = 25 + 2;
         this.equipContainer = new Sprite();
         this.equipContainer.x = 25;
         this.equipContainer.y = 25;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainer);
         this.containers = new Sprite();
         this.containers.x = 225;
         this.containers.y = 235;
         with(this.containers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,170,20);
            endFill();
         }
         addChild(this.containers);
         this.fts = new FTextArea();
         this.fts.x = 0;
         this.fts.y = 0;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("八卦掌顶级翻倍属性(未激活)");
         this.containers2 = new Sprite();
         this.containers2.addChild(this.fts);
         this.containers.addChild(this.containers2);
         this.containers1 = new Sprite();
         this.containers1.x = 197 + 1;
         this.containers1.y = 347 + 1;
         with(this.containers1.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,195,20);
            endFill();
         }
         addChild(this.containers1);
         this.lbl = new FLabel();
         with(this.lbl)
         {
            x = 1;
            y = 1;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("属性翻倍");
         }
         this.containers1.addChild(this.lbl);
         this.barBg = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.containers1.addChild(this.barBg);
         this.barBg.x = this.lbl.x + this.lbl.width;
         this.barBg.y = this.lbl.y + 2;
         this.bar = new ColorBar(5,123,5,false);
         this.containers1.addChild(this.bar);
         this.bar.x = this.lbl.x + this.lbl.width + 4;
         this.bar.y = this.lbl.y + 5;
         this.lbFt = new FTextArea();
         with(this.lbFt)
         {
            x = barBg.width / 2 - 10;
            y = 1;
            width = 123;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,9,16777215,null,null,null,null,null,"center");
            text = "2000/2000";
         }
         this.containers1.addChild(this.lbFt);
         ToolTips.createToolTips(this.containers1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("使用八卦掌秘术，可以激活属性翻倍") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.xueshouSprite = new Sprite();
         addChild(this.xueshouSprite);
         this.xueshouSprite.x = 334;
         this.xueshouSprite.y = 27;
         with(this.xueshouSprite.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,50,50);
            endFill();
         }
         this.fts1 = new FTextArea();
         this.fts1.x = 5 + 180 + 135;
         this.fts1.y = 7 + 195 - 20;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 50;
         addChild(this.fts1);
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 311;
         this.fts2.y = 7 + 80;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 130;
         this.fts2.height = 50;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("八卦武神护盾") + "<br>" + LanResManager.getLanCommonTextWords("（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：2888亿、防御1888亿、血量3888亿、所有武功提升 20000层") + "<br>" + LanResManager.getLanCommonTextWords("武神护盾(特殊技能)：被攻击二十次必定触发，拥有武神护盾的玩家，每次受到对手攻击都有20%的几率") + "<br>" + LanResManager.getLanCommonTextWords("抵抗这次伤害及负面效果，且每受到第十次攻击伤害，必定触发抵抗。效果持续10秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 311;
         this.fts3.y = 7 + 80 + 20 + 15;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("蜀山?金剑仙");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("蜀山?金剑仙：攻击12888888889000 防御10888888889000 血量13888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击 88888闪避88888   所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("蜀山?金剑仙——长年在蜀山灵气之地吸收日月精华，因太阳光的照射，使其剑身犹如黄金打造，") + "<br>" + LanResManager.getLanCommonTextWords("故称金剑。攻击时100%触发金剑仙，持续20秒；对手在此状态下，将受到日月精华之气纯化，") + "<br>" + LanResManager.getLanCommonTextWords("只要血量低于30%，可瞬间秒杀对手。冷却60秒。") + "<br>" + LanResManager.getLanCommonTextWords("蜀山?金剑仙属性：激活蜀山?金剑仙后，将开启蜀山?金剑仙隐藏属性，可使用仙剑碎片对该隐") + "<br>" + LanResManager.getLanCommonTextWords("藏属性进行养成，最多可养成200次。每个增加：攻击1500亿，所有武功350000层。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("颗仙剑碎片") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + suipian * 1500 + LanResManager.getLanCommonTextWords("亿，所有武功") + suipian * 350000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 311;
         this.fts4.y = 7 + 80 + 20 + 15 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 120;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("恶魔天使");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 500000层") + "<br>" + LanResManager.getLanCommonTextWords("恶魔之体：拥有恶魔的翅膀，恶魔的躯体，人物可自己召唤恶魔天使附体。") + "<br>" + LanResManager.getLanCommonTextWords("幽涧空间：恶魔天使，幽涧空间的守护者；攻击时100%触发幽涧空间，持续10秒；对") + "<br>" + LanResManager.getLanCommonTextWords("手在此状态下，将被吸噬至幽涧空间之内，眼前一片黑暗；且在空间内，对手无法触") + "<br>" + LanResManager.getLanCommonTextWords("发任何清除负面状态效果，无法使用任何武学技能，无法进行任何移动。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 120 + 320 - 66;
         this.check.y = 7 + 80 + 20 + 15 + 20;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 311;
         this.fts5.y = 7 + 80 + 20 + 15 + 20 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 120;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("阴阳道人");
         this.fts5.visible = false;
         addChild(this.fts5);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 120 + 320 - 66;
         this.check1.y = 7 + 80 + 20 + 15 + 20 + 20;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 7 + 80 + 20 + 15 + 20 + 20 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("风雷乾坤秘籍");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层全属性提升1000%") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：激活风雷乾坤的玩家，可使用风雷石养成，每次养成增加人物攻击500亿，所有武功提升10000层。") + "<br>" + LanResManager.getLanCommonTextWords("（最多养成9999999次）") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + fengleishi + LanResManager.getLanCommonTextWords("颗风雷石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + fengleishi * 500 + LanResManager.getLanCommonTextWords("亿，所有武功") + fengleishi * 10000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 7 + 80 + 20 + 15 + 20 + 20 + 20 + 20;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 170;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("风雷残卷");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("风雷残卷：双击使用风雷残卷，可提升人物攻击300亿，所有武功提升5000层（最多可使用500次）") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + canjuan + LanResManager.getLanCommonTextWords("风雷残卷") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + canjuan * 300 + LanResManager.getLanCommonTextWords("亿，所有武功") + canjuan * 5000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,46]));
               break;
            case this.check1:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check1.selectState,55]));
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(!this.isLockOn)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
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
                           this._parent.dispatchEvent(new BaseEvent(CharAttribute.ITEM_LINK_CLICKB,"",[_loc4_[1],Tools.currentStage.mouseX,Tools.currentStage.mouseY]));
                        }
                     }
                     else
                     {
                        this._parent.dispatchEvent(new BaseEvent(CharAttribute.CHAT_ITEM_LINK_HIDEB));
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
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.CHAT_ITEM_LINK_HIDEB));
            GameInstance.scene.sceneDispatchEvent(param1);
         }
      }
      
      private function onOkClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICKB));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.dianjiId == int(param1.currentTarget.name.substr(8,1)))
         {
            return;
         }
         this.dianjiId = int(param1.currentTarget.name.substr(8,1));
         if(this.bit1 != null && this.bit1.parent != null)
         {
            this.bit1.parent.removeChild(this.bit1);
         }
         if(this.bitObj[this.dianjiId] != null)
         {
            this.bit1 = this.bitObj[this.dianjiId];
         }
         else
         {
            this.bit1 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/baguazhang/" + int(param1.currentTarget.name.substr(8,1)) + ".png",133,126);
            this.bitObj[this.dianjiId] = this.bit1;
         }
         this.bit1.x = 12 + 162 - 40;
         this.bit1.y = 70 - 6;
         addChild(this.bit1);
         if(this.dengji < int(param1.currentTarget.name.substr(8,1)))
         {
            this.bit1.filters = Tools.blackWhiteFilter;
         }
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_MENU_CLICKB,"",int(param1.currentTarget.name.substr(8,1))));
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
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_JIHUO_CLICKB));
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
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_SHANGYIYE_CLICKB));
               break;
            case this.nextBtn_1:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SMITHINGBODY_XIAYIYE_CLICKB));
         }
      }
      
      public function setJingjie(param1:String = "", param2:String = "") : void
      {
         this.ft1.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"击杀级的怪物有机会获得加成如下",[StaticValue.ORANGE_HTML,param1,StaticValue.BLUE_HTML,param2,StaticValue.ORANGE_HTML]) + "</textformat>";
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
            this.lb8Ft.text = int(param2 / 10000 * 100 * 100) / 100 + "%" + "/" + param3 / 10000 * 100 + "%";
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
         this.lb9.visible = false;
         this.barBg9.visible = false;
         this.barBar9.visible = false;
         this.lb9Ft.visible = false;
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
      
      public function setBar(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.containers1.visible = true;
            this.fts.visible = true;
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("八卦掌顶级翻倍属性(已激活)");
            this.barBg.visible = true;
            this.bar.visible = true;
            this.lbl.visible = true;
            this.lbFt.visible = true;
            this.lbFt.text = param2 + "/" + param3;
            this.bar.setValue(param2,param3);
         }
         else
         {
            this.containers1.visible = false;
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("八卦掌顶级翻倍属性(未激活)");
            this.lbl.visible = false;
            this.barBg.visible = false;
            this.bar.visible = false;
            this.lbFt.visible = false;
         }
      }
      
      public function setPage(param1:int, param2:int, param3:Boolean) : void
      {
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
      
      public function setDengji(param1:int) : void
      {
         this.smithingbodyadvanceCanvas.setDengji(param1);
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
            if(!this.smithingbodyadvanceCanvas)
            {
               this.smithingbodyadvanceCanvas = new BaguazhangJinjiePanel();
               this.smithingbodyadvanceCanvas.$parent = this._parent;
               this.smithingbodyadvanceCanvas.$parent2 = this;
            }
            this.smithingbodyadvanceCanvas.visible = true;
            GameInstance.uiInstance.uiContainer.addChild(this.smithingbodyadvanceCanvas);
            this.smithingbodyadvanceCanvas.x = (GameConfig.sceneWidth - this.smithingbodyadvanceCanvas.width) / 2;
            this.smithingbodyadvanceCanvas.y = (GameConfig.sceneHeight - this.smithingbodyadvanceCanvas.height) / 2;
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
         if(this.bit1 != null && this.bit1.parent != null)
         {
            this.bit1.parent.removeChild(this.bit1);
         }
         if(this.bitObj[param1] != null)
         {
            this.bit1 = this.bitObj[param1];
         }
         else
         {
            this.bit1 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/baguazhang/" + param1 + ".png",133,126);
            this.bitObj[param1] = this.bit1;
         }
         this.bit1.x = 12 + 162 - 40;
         this.bit1.y = 70 - 6;
         addChild(this.bit1);
         this.dengji = param1;
         this.dianjiId = param1;
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
      
      public function setBaguazhangEnabledFun() : void
      {
         this.classBtn1.mouseEnabled = false;
         this.classBtn2.mouseEnabled = false;
         this.classBtn3.mouseEnabled = false;
         this.classBtn4.mouseEnabled = false;
         this.classBtn5.mouseEnabled = false;
         this.classBtn6.mouseEnabled = false;
         this.classBtn7.mouseEnabled = false;
         this.classBtn8.mouseEnabled = false;
         this.okBtn.enabled = false;
         this.jihuoBtn.enabled = false;
         this.isLockOn = true;
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
      
      public function set_BGHL(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_BAGUAHULU)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainer.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      public function setXueshou(param1:Boolean) : void
      {
         var _loc2_:Bitmap = null;
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.xueshouSprite.numChildren > 0)
         {
            this.xueshouSprite.removeChildAt(0);
         }
         if(param1)
         {
            _loc2_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc2_.x = 0;
            _loc2_.y = 0;
            this.xueshouSprite.addChild(_loc2_);
            _loc3_ = new Goods(40579);
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.x = 2;
            _loc4_.y = 2;
            this.xueshouSprite.addChild(_loc4_);
         }
      }
      
      public function setBaGuaDanTian(param1:Boolean, param2:Boolean) : void
      {
         this.check.selectState = param1;
         this.check1.selectState = param2;
      }
      
      public function setBaGuaMenghuanJindan(param1:Boolean) : void
      {
         var isMainChar:Boolean = param1;
         if(isMainChar)
         {
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_BAGUA_ID] + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("梦幻八卦石");
            ToolTips.createToolTips(this.fts1,this,function():String
            {
               var _loc1_:String = "";
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_BAGUA_ID] * 10000 + "," + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_BAGUA_ID] * 1 + "</font>";
               return _loc1_ + "</textformat>";
            });
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_WUSHENHUDUN_ID];
            this.guanghuan.visible = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_WUSHENHUDUN_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_JINJIANXIAN_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_XIANJIANSUIPIAN_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_EMOTIANSHI_ID];
            this.check.visible = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_EMOTIANSHI_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_YINYANGDAOREN_ID];
            this.check1.visible = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_YINYANGDAOREN_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_FENGLEIQIANKUN_ID];
            this.fengleishi = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_FENGLEISHI_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_FENGLEICANJUAN_ID];
            this.canjuan = GameState.dictMainStatus[SpecialGoodsID.BAGUAZHANG_FENGLEICANJUAN_ID];
         }
         else
         {
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_BAGUA_ID] + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("梦幻八卦石");
            ToolTips.createToolTips(this.fts1,this,function():String
            {
               var _loc1_:String = "";
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_BAGUA_ID] * 10000 + "," + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_BAGUA_ID] * 1 + "</font>";
               return _loc1_ + "</textformat>";
            });
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_WUSHENHUDUN_ID];
            this.guanghuan.visible = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_WUSHENHUDUN_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_JINJIANXIAN_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_XIANJIANSUIPIAN_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_EMOTIANSHI_ID];
            this.check.visible = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_EMOTIANSHI_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_YINYANGDAOREN_ID];
            this.check1.visible = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_YINYANGDAOREN_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_FENGLEIQIANKUN_ID];
            this.fengleishi = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_FENGLEISHI_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_FENGLEICANJUAN_ID];
            this.canjuan = GameState.dictTargetStatus[SpecialGoodsID.BAGUAZHANG_FENGLEICANJUAN_ID];
         }
      }
   }
}

