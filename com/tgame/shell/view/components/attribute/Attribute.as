package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.equipPanel.EquipSearchList;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class Attribute extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      public var diZiBgImg:DisplayObject;
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      public var ico:CharAttributeOccultIco;
      
      private var equipContainer:Sprite;
      
      private var baseAttributeTitle:FTextArea;
      
      private var charName:FTextArea;
      
      private var level:FTextArea;
      
      private var party:FTextArea;
      
      private var hpTitle:FTextArea;
      
      private var expBar:ColorBar;
      
      private var zhenqiBar:ColorBar;
      
      private var hpBar:ColorBar;
      
      private var mpBar:ColorBar;
      
      private var nqBar:ColorBar;
      
      private var skillTitle:FTextArea;
      
      private var skillValue:FTextArea;
      
      private var _skillValue1:Number;
      
      private var _skillValue2:Number;
      
      private var _skillValue3:Number;
      
      private var _skillValue4:Number;
      
      private var _skillValue1TT:String;
      
      private var _skillValue2TT:String;
      
      private var _skillValue3TT:String;
      
      private var _skillValue4TT:String;
      
      private var _skillValue5TT:String;
      
      private var _skillValue6TT:String;
      
      private var _skillValue5:int;
      
      private var _skillValue6:int;
      
      private var pointTitle:FTextArea;
      
      private var pointValue:FTextArea;
      
      private var _point1:Number;
      
      private var point1:Number;
      
      private var _point2:Number;
      
      private var point2:Number;
      
      private var _point3:Number;
      
      private var point3:Number;
      
      private var _point4:Number;
      
      private var point4:Number;
      
      private var _point5:Number;
      
      private var point5:Number;
      
      private var allAddP1Btn:FSimpleButton;
      
      private var addP1Btn:FSimpleButton;
      
      private var subP1Btn:FSimpleButton;
      
      private var allSubP1Btn:FSimpleButton;
      
      private var allAddP2Btn:FSimpleButton;
      
      private var addP2Btn:FSimpleButton;
      
      private var subP2Btn:FSimpleButton;
      
      private var allSubP2Btn:FSimpleButton;
      
      private var allAddP3Btn:FSimpleButton;
      
      private var addP3Btn:FSimpleButton;
      
      private var subP3Btn:FSimpleButton;
      
      private var allSubP3Btn:FSimpleButton;
      
      private var allAddP4Btn:FSimpleButton;
      
      private var addP4Btn:FSimpleButton;
      
      private var subP4Btn:FSimpleButton;
      
      private var allSubP4Btn:FSimpleButton;
      
      private var okBtn:SmallButton;
      
      private var autoBtn:SmallButton;
      
      private var pointContainer:Sprite;
      
      private var arr1:Array;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var flag:MovieClip;
      
      private var yupei:ItemFace;
      
      private var yuPeiSpr:Sprite;
      
      private var zanwenBtn:FSimpleButton;
      
      private var zanwenMask:Sprite;
      
      public var zanwenValue:OtherAttributeCanvas;
      
      private var kuafuMask:Sprite;
      
      private var jianSelectConstiner:Sprite;
      
      private var jianNum:int;
      
      private var nowShowJian:DisplayObject;
      
      private var img:Bitmap;
      
      private var imgShiZhuang:Bitmap;
      
      private var starSpr:Sprite;
      
      private var starSta:int = 0;
      
      private var starMc:MovieClip;
      
      private var tianGangZhengQiSpr:Sprite;
      
      private var tianGangZhengQiSta:int = 0;
      
      private var tianGangZhengQiMc:MovieClip;
      
      private var tianGangZhengQiBmp:DisplayObject;
      
      private var mcObj:Array;
      
      private var wushuangBo:Boolean = false;
      
      private var zhizuntianxiaBo:Boolean = false;
      
      public var equipList:EquipList;
      
      private var img1:Bitmap;
      
      private var colorBarBg:Bitmap;
      
      private var zhandouBg:Bitmap;
      
      private var colorBarBg1:Bitmap;
      
      private var colorBarBg2:Bitmap;
      
      private var isDiZi:Boolean = false;
      
      public var specialAttributeTitle:FTextArea;
      
      public var specialValue0:FTextArea;
      
      public var specialValue1:FTextArea;
      
      public var specialValue2:FTextArea;
      
      public var specialValue3:FTextArea;
      
      private var arrOK:Array;
      
      private var nowIndex:int = 0;
      
      private var nowIndex2:int = 0;
      
      public var NB_WEAPON_SHOW_COUNT:int = 5;
      
      private var upButton:FSimpleButton;
      
      private var upButton2:FSimpleButton;
      
      private var downButton:FSimpleButton;
      
      private var downButton2:FSimpleButton;
      
      private var jianGoodsArr:Array;
      
      private var yuPeiSelectConstiner:Sprite;
      
      private var yuPeiGoodsArr:Array;
      
      private var equipSearchPanel:EquipSearchList;
      
      private var cheng1:Boolean;
      
      private var cheng2:Boolean;
      
      public function Attribute()
      {
         var searchBtn:FSimpleButton;
         this.arr1 = [];
         this.jianGoodsArr = [];
         this.yuPeiGoodsArr = [];
         super();
         this.initChar();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
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
         this.mcObj = new Array();
         searchBtn = new FSimpleButton();
         searchBtn.skin = "searchButton";
         addChild(searchBtn);
         searchBtn.x = 153;
         searchBtn.y = 235;
         searchBtn.addEventListener(MouseEvent.CLICK,this.onSearch);
         this.equipSearchPanel = new EquipSearchList();
         this.equipSearchPanel.x = -385;
         this.equipSearchPanel.y = -54;
         addChild(this.equipSearchPanel);
         this.equipSearchPanel.visible = false;
      }
      
      private function onSearch(param1:MouseEvent) : void
      {
         this.equipSearchPanel.visible = !this.equipSearchPanel.visible;
      }
      
      private function initChar() : void
      {
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.char.attribute.ui";
         addChild(this.bgImg);
         this.diZiBgImg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/diZiAttributeBg.swf");
         this.diZiBgImg.visible = false;
         addChild(this.diZiBgImg);
         this.colorBarBg = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         addChild(this.colorBarBg);
         this.colorBarBg.x = 80;
         this.colorBarBg.y = 42;
         this.zhandouBg = StaticValue.getBitmapByClassName("ui.char.attribute.text.zhandou");
         addChild(this.zhandouBg);
         this.zhandouBg.x = 250;
         this.zhandouBg.y = 63;
         this.colorBarBg1 = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         addChild(this.colorBarBg1);
         this.colorBarBg1.x = 260;
         this.colorBarBg1.y = 42;
         this.colorBarBg2 = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         addChild(this.colorBarBg2);
         this.colorBarBg2.x = 52;
         this.colorBarBg2.y = 77;
         this.colorBarBg2.width = 168;
         this.colorBarBg2.visible = false;
         this._mask = new Shape();
         with(this._mask)
         {
            graphics.beginFill(0,1);
            graphics.drawRect(0,0,1000,280);
            graphics.endFill();
         }
         this._mask.x = -500;
         this._mask.y = -16;
         addChild(this._mask);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this._avatar.mask = this._mask;
         this.baseAttributeTitle = new FTextArea();
         with(this.baseAttributeTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 4;
            textColor = StaticValue.BlUE20;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"人物基本属性标题",null,false) + "</textformat>";
         }
         addChild(this.baseAttributeTitle);
         this.baseAttributeTitle.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.baseAttributeTitle.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 13;
         this.equipContainer.y = 66;
         with(this.equipContainer.graphics)
         {
            beginFill(0,0.1);
            drawRect(0,0,203,240);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.charName = new FTextArea();
         with(this.charName)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 50 - 20 - 15;
            y = 4;
            textColor = StaticValue.WHITE;
         }
         addChild(this.charName);
         this.level = new FTextArea();
         with(this.level)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 190;
            y = 4;
            textColor = StaticValue.WHITE;
         }
         addChild(this.level);
         this.party = new FTextArea();
         with(this.party)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 329;
            y = 4;
            textColor = StaticValue.WHITE;
            visible = false;
         }
         addChild(this.party);
         this.hpTitle = new FTextArea();
         with(this.hpTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20 + 10;
            y = 45;
            textColor = StaticValue.BlUE20;
            visible = false;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"生命内力体力",null,false) + "</textformat>";
         }
         addChild(this.hpTitle);
         this.hpTitle.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip2);
         this.hpTitle.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip2);
         this.hpBar = new ColorBar(1,156,5);
         this.hpBar.visible = false;
         addChild(this.hpBar);
         this.hpBar.x = 58;
         this.hpBar.y = 50;
         this.mpBar = new ColorBar(2,156,5);
         addChild(this.mpBar);
         this.mpBar.visible = false;
         this.mpBar.x = 58;
         this.mpBar.y = this.hpBar.y + 15;
         this.nqBar = new ColorBar(4,156,5);
         this.nqBar.visible = false;
         addChild(this.nqBar);
         this.nqBar.x = 58;
         this.nqBar.y = this.hpBar.y + 30;
         this.skillTitle = new FTextArea();
         with(this.skillTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 256;
            y = 80;
            textColor = StaticValue.GOLD;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"攻击防御暴击闪避",[StaticValue.GREEN_HTML],false) + "</textformat>";
         }
         addChild(this.skillTitle);
         this.skillTitle.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.skillTitle.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         this.skillValue = new FTextArea();
         with(this.skillValue)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 335;
            y = 80;
            textColor = StaticValue.WHITE;
         }
         addChild(this.skillValue);
         this.skillValue.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip6);
         this.skillValue.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip6);
         this.pointContainer = new Sprite();
         this.pointContainer.x = 0;
         this.pointContainer.y = 0;
         addChild(this.pointContainer);
         this.pointTitle = new FTextArea();
         with(this.pointTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 230 - 5;
            y = 238;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'10\'>" + LanResManager.getLanTextWords(this,"进攻型防御型轻身型健体型潜能点",null,false) + "</textformat>";
         }
         this.pointContainer.addChild(this.pointTitle);
         this.pointTitle.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip4);
         this.pointTitle.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip4);
         this.pointValue = new FTextArea();
         with(this.pointValue)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 277;
            y = 238;
            textColor = StaticValue.ORANGE;
         }
         this.pointContainer.addChild(this.pointValue);
         this.allAddP1Btn = new FSimpleButton();
         this.allAddP1Btn.skin = "upButton";
         this.allAddP1Btn.toolTip = LanResManager.getLanTextWords(this,"将剩余的潜能点全部分配到进攻型",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.allAddP1Btn);
         this.allAddP1Btn.x = 308;
         this.allAddP1Btn.y = 237;
         this.allAddP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP1Btn = new FSimpleButton();
         this.addP1Btn.skin = "sumButton";
         this.addP1Btn.toolTip = LanResManager.getLanTextWords(this,"将1点潜能点分配到进攻型",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.addP1Btn);
         this.addP1Btn.x = 330;
         this.addP1Btn.y = 237;
         this.addP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP1Btn = new FSimpleButton();
         this.subP1Btn.skin = "subButton";
         this.addP1Btn.toolTip = LanResManager.getLanTextWords(this,"将未确定分配的1个点数还原到潜能点上",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.subP1Btn);
         this.subP1Btn.x = 352;
         this.subP1Btn.y = 237;
         this.subP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP1Btn = new FSimpleButton();
         this.allSubP1Btn.skin = "bottomButton";
         this.allSubP1Btn.toolTip = LanResManager.getLanTextWords(this,"将全部未确定分配的点数还原到潜能点上",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.allSubP1Btn);
         this.allSubP1Btn.x = 374;
         this.allSubP1Btn.y = 237;
         this.allSubP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allAddP2Btn = new FSimpleButton();
         this.allAddP2Btn.skin = "upButton";
         this.allAddP2Btn.toolTip = LanResManager.getLanTextWords(this,"将剩余的潜能点全部分配到防御型",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.allAddP2Btn);
         this.allAddP2Btn.x = 308;
         this.allAddP2Btn.y = 262;
         this.allAddP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP2Btn = new FSimpleButton();
         this.addP2Btn.skin = "sumButton";
         this.addP2Btn.toolTip = LanResManager.getLanTextWords(this,"将1点潜能点分配到防御型",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.addP2Btn);
         this.addP2Btn.x = 330;
         this.addP2Btn.y = 262;
         this.addP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP2Btn = new FSimpleButton();
         this.subP2Btn.skin = "subButton";
         this.subP2Btn.toolTip = LanResManager.getLanTextWords(this,"将未确定分配的1个点数还原到潜能点上",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.subP2Btn);
         this.subP2Btn.x = 352;
         this.subP2Btn.y = 262;
         this.subP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP2Btn = new FSimpleButton();
         this.allSubP2Btn.skin = "bottomButton";
         this.allSubP2Btn.toolTip = LanResManager.getLanTextWords(this,"将全部未确定分配的点数还原到潜能点上",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.allSubP2Btn);
         this.allSubP2Btn.x = 374;
         this.allSubP2Btn.y = 262;
         this.allSubP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allAddP3Btn = new FSimpleButton();
         this.allAddP3Btn.skin = "upButton";
         this.allAddP3Btn.toolTip = LanResManager.getLanTextWords(this,"将剩余的潜能点全部分配到轻身型",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.allAddP3Btn);
         this.allAddP3Btn.x = 308;
         this.allAddP3Btn.y = 289;
         this.allAddP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP3Btn = new FSimpleButton();
         this.addP3Btn.skin = "sumButton";
         this.addP3Btn.toolTip = LanResManager.getLanTextWords(this,"将1点潜能点分配到轻身型",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.addP3Btn);
         this.addP3Btn.x = 330;
         this.addP3Btn.y = 289;
         this.addP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP3Btn = new FSimpleButton();
         this.subP3Btn.skin = "subButton";
         this.addP3Btn.toolTip = LanResManager.getLanTextWords(this,"将未确定分配的1个点数还原到潜能点上",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.subP3Btn);
         this.subP3Btn.x = 352;
         this.subP3Btn.y = 289;
         this.subP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP3Btn = new FSimpleButton();
         this.allSubP3Btn.skin = "bottomButton";
         this.allSubP3Btn.toolTip = LanResManager.getLanTextWords(this,"将全部未确定分配的点数还原到潜能点上",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.allSubP3Btn);
         this.allSubP3Btn.x = 374;
         this.allSubP3Btn.y = 289;
         this.allSubP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allAddP4Btn = new FSimpleButton();
         this.allAddP4Btn.skin = "upButton";
         this.allAddP4Btn.toolTip = LanResManager.getLanTextWords(this,"将剩余的潜能点全部分配到健体型",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.allAddP4Btn);
         this.allAddP4Btn.x = 308;
         this.allAddP4Btn.y = 314;
         this.allAddP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP4Btn = new FSimpleButton();
         this.addP4Btn.skin = "sumButton";
         this.addP4Btn.toolTip = LanResManager.getLanTextWords(this,"将1点潜能点分配到健体型",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.addP4Btn);
         this.addP4Btn.x = 330;
         this.addP4Btn.y = 314;
         this.addP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP4Btn = new FSimpleButton();
         this.subP4Btn.skin = "subButton";
         this.addP4Btn.toolTip = LanResManager.getLanTextWords(this,"将未确定分配的1个点数还原到潜能点上2",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.subP4Btn);
         this.subP4Btn.x = 352;
         this.subP4Btn.y = 314;
         this.subP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP4Btn = new FSimpleButton();
         this.allSubP4Btn.skin = "bottomButton";
         this.allSubP4Btn.toolTip = LanResManager.getLanTextWords(this,"将全部未确定分配的点数还原到潜能点上2",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         this.pointContainer.addChild(this.allSubP4Btn);
         this.allSubP4Btn.x = 374;
         this.allSubP4Btn.y = 314;
         this.allSubP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.okBtn = new SmallButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         this.okBtn.toolTip = LanResManager.getLanTextWords(this,"分配潜能点之后，点确定按钮让分配方案生效",[StaticValue.WHITE_HTML]);
         this.pointContainer.addChild(this.okBtn);
         this.okBtn.x = 310;
         this.okBtn.y = 339;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.autoBtn = new SmallButton();
         this.autoBtn.label = LanResManager.getLanCommonTextWords("推荐");
         this.autoBtn.toolTip = LanResManager.getLanTextWords(this,"推荐新手",[StaticValue.WHITE_HTML]);
         this.pointContainer.addChild(this.autoBtn);
         this.autoBtn.x = 354;
         this.autoBtn.y = 339;
         this.autoBtn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.specialAttributeTitle = new FTextArea();
         with(this.specialAttributeTitle)
         {
            x = 240;
            y = 158;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("攻击增强比例") + "<br>" + LanResManager.getLanCommonTextWords("伤害反弹比例") + "<br>" + LanResManager.getLanCommonTextWords("忽视防御比例") + "<br>" + LanResManager.getLanCommonTextWords("伤害减免比例") + "<br>" + LanResManager.getLanCommonTextWords("爆击伤害减免比例") + "<br>" + LanResManager.getLanCommonTextWords("暗器伤害减免比例") + "<br>" + LanResManager.getLanCommonTextWords("抵抗对方暗器几率") + "<br>" + LanResManager.getLanCommonTextWords("抵抗对方弓箭几率") + "<br>" + LanResManager.getLanCommonTextWords("抵抗丹田武学几率") + "<br>" + LanResManager.getLanCommonTextWords("武功层数") + "</textformat>";
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            visible = false;
            addChild(specialAttributeTitle);
         }
         this.specialAttributeTitle.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip5);
         this.specialAttributeTitle.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip5);
         this.specialValue0 = new FTextArea();
         with(this.specialValue0)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 340;
            y = 158;
            textColor = StaticValue.WHITE;
            visible = false;
         }
         addChild(this.specialValue0);
         this.specialValue1 = new FTextArea();
         with(this.specialValue1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 370;
            y = 158;
            textColor = StaticValue.WHITE;
            visible = false;
         }
         addChild(this.specialValue1);
         this.specialValue2 = new FTextArea();
         with(this.specialValue2)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 340;
            y = 242;
            textColor = StaticValue.WHITE;
            visible = false;
         }
         addChild(this.specialValue2);
         this.specialValue3 = new FTextArea();
         with(this.specialValue3)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 370;
            y = 242;
            textColor = StaticValue.WHITE;
            visible = false;
         }
         addChild(this.specialValue3);
         this.expBar = new ColorBar(5,99,5,true,true,true,LanResManager.getLanCommonTextWords("当前经验"),LanResManager.getLanCommonTextWords("本级经验"),LanResManager.getLanTextWords(this,"经验获得途径",[StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]));
         addChild(this.expBar);
         this.expBar.visible = false;
         this.expBar.x = 85;
         this.expBar.y = 45;
         this.zhenqiBar = new ColorBar(5,99,5,true,true,true,LanResManager.getLanCommonTextWords("当前真气"),LanResManager.getLanCommonTextWords("修炼上限"),LanResManager.getLanTextWords(this,"真气获得途径",[StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]));
         this.zhenqiBar.visible = false;
         addChild(this.zhenqiBar);
         this.zhenqiBar.x = 265;
         this.zhenqiBar.y = 43;
         this.ico = new CharAttributeOccultIco();
         this.ico.visible = false;
         this.ico.isMainChar = true;
         addChild(this.ico);
         this.ico.x = 147;
         this.ico.y = 75;
         this.zanwenMask = new Sprite();
         addChild(this.zanwenMask);
         this.zanwenMask.x = 414;
         this.zanwenMask.y = 13;
         this.zanwenMask.mouseEnabled = false;
         with(this.zanwenMask.graphics)
         {
            beginFill(0);
            drawRect(0,0,182 + 24,364);
            endFill();
         }
         this.zanwenValue = new OtherAttributeCanvas(true);
         this.zanwenValue.x = 414;
         this.zanwenValue.y = 13;
         this.zanwenValue.mask = this.zanwenMask;
         this.zanwenBtn = new FSimpleButton();
         this.zanwenBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级在60级以上的玩家将拥有更多战斗属性") + "</font>";
         this.zanwenBtn.skin = "attribute_otherBtn";
         this.zanwenBtn.visible = false;
         addChild(this.zanwenBtn);
         this.zanwenBtn.x = 320;
         this.zanwenBtn.y = 63;
         this.zanwenBtn.addEventListener(MouseEvent.CLICK,this.onShowLv);
         this.starSpr = new Sprite();
         this.starSpr.x = 375;
         this.starSpr.y = 25;
         this.starSpr.visible = false;
         addChild(this.starSpr);
         this.starSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onStarMouseTip);
         this.starSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onStarMouseTip);
         this.tianGangZhengQiSpr = new Sprite();
         this.tianGangZhengQiSpr.x = 220;
         this.tianGangZhengQiSpr.y = 4;
         this.tianGangZhengQiSpr.visible = false;
         addChild(this.tianGangZhengQiSpr);
         ToolTips.createToolTips(this.tianGangZhengQiSpr,this,function(param1:*, param2:MouseEvent):String
         {
            var _loc3_:String = "";
            if(cheng2)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("英雄传说1") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说2") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说3") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说4") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说5") + "</font>";
               _loc3_ += "</textformat>";
            }
            else if(cheng1)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("武林传奇1") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇2") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇3") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇4") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇5") + "</font>";
               _loc3_ += "</textformat>";
            }
            else if(zhizuntianxiaBo)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("至尊天下") + "<br>" + LanResManager.getLanCommonTextWords("攻击防御血量暴击闪避所有武功：至尊天下") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：至尊天下") + "</font>";
               _loc3_ += "</textformat>";
            }
            else if(wushuangBo)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("乱世无双") + "<br>" + LanResManager.getLanCommonTextWords("攻击10888888888888 防御8888888888888 血量12888888888888暴击 88888闪避88888   所有武功1800000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：受到攻击时，有几率使对手内力体力全失，自身有10%几率恢复满血状态！") + "</font>";
               _loc3_ += "</textformat>";
            }
            else
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + (tianGangZhengQiSta == 0 ? StaticValue.HUISE_HTML : StaticValue.RED_HTML) + "\'>" + LanResManager.getLanCommonTextWords("帝王天罡正气") + (tianGangZhengQiSta == 0 ? LanResManager.getLanCommonTextWords("未激活") : LanResManager.getLanCommonTextWords("已激活")) + "<br></font>" + "<font color=\'" + (tianGangZhengQiSta == 0 ? StaticValue.HUISE_HTML : StaticValue.ORANGE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("攻击：14888、防御：10888、血量：68888、暴击：88、闪避：88") + "<br></font>" + "<font color=\'" + (tianGangZhengQiSta == 0 ? StaticValue.HUISE_HTML : StaticValue.RED_HTML) + "\'>" + LanResManager.getLanCommonTextWords("特殊属性：受到攻击时，有10%几率恢复满血状态（技能冻结时间10分钟）") + "</font>";
               _loc3_ += "</textformat>";
            }
            return _loc3_;
         });
         this.equipList = new EquipList();
         this.equipList.x = 20;
         this.equipList.y = 320;
         this.equipList.$parent = this;
         this.equipList.setClickSta(true,true);
         addChild(this.equipList);
         this.img1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.upButton = new FSimpleButton();
         this.upButton.skin = "equipListRightBtn";
         this.upButton.rotation = -90;
         this.upButton.addEventListener(MouseEvent.CLICK,this.onUpDownClick);
         this.downButton = new FSimpleButton();
         this.downButton.skin = "equipListRightBtn";
         this.downButton.rotation = 90;
         this.downButton.addEventListener(MouseEvent.CLICK,this.onUpDownClick);
         this.upButton2 = new FSimpleButton();
         this.upButton2.skin = "equipListRightBtn";
         this.upButton2.rotation = -90;
         this.upButton2.addEventListener(MouseEvent.CLICK,this.onUpDownClick2);
         this.downButton2 = new FSimpleButton();
         this.downButton2.skin = "equipListRightBtn";
         this.downButton2.rotation = 90;
         this.downButton2.addEventListener(MouseEvent.CLICK,this.onUpDownClick2);
         this.imgShiZhuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
      }
      
      private function onShowLv(param1:MouseEvent = null) : void
      {
         if(GameInstance.mainCharData.attributeInfo.lv < 60)
         {
            if(this.zanwenValue.parent)
            {
               this.zanwenValue.parent.removeChild(this.zanwenValue);
            }
            return;
         }
         if(!this.zanwenValue.parent)
         {
            addChild(this.zanwenValue);
            this.zanwenValue.x = 242;
            TweenMax.to(this.zanwenValue,1,{"x":414});
         }
         else
         {
            TweenMax.to(this.zanwenValue,1,{
               "x":242,
               "onComplete":this.onCom
            });
         }
      }
      
      private function onCom() : void
      {
         if(this.zanwenValue.parent)
         {
            this.zanwenValue.parent.removeChild(this.zanwenValue);
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.baseAttributeTitle.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.baseAttributeTitle.getCharIndexAtPoint(this.baseAttributeTitle.mouseX,this.baseAttributeTitle.mouseY);
               if(_loc2_ >= this.baseAttributeTitle.text.indexOf(LanResManager.getLanCommonTextWords("帮派")) && _loc2_ <= this.baseAttributeTitle.text.indexOf(LanResManager.getLanCommonTextWords("帮派")) + 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"帮派提示信息",[StaticValue.GREEN_HTML,StaticValue.RED_HTML]));
               }
               else if(_loc2_ >= this.baseAttributeTitle.text.indexOf(LanResManager.getLanCommonTextWords("配偶")) && _loc2_ <= this.baseAttributeTitle.text.indexOf(LanResManager.getLanCommonTextWords("配偶")) + 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"配偶提示信息",[StaticValue.GREEN_HTML,StaticValue.RED_HTML]));
               }
               else if(_loc2_ >= this.baseAttributeTitle.text.indexOf(LanResManager.getLanCommonTextWords("当前经验")) && _loc2_ <= this.baseAttributeTitle.text.indexOf(LanResManager.getLanCommonTextWords("当前经验")) + 3)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"当前经验提示信息",[StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]));
               }
               else if(_loc2_ >= this.baseAttributeTitle.text.indexOf(LanResManager.getLanCommonTextWords("真气修炼")) && _loc2_ <= this.baseAttributeTitle.text.indexOf(LanResManager.getLanCommonTextWords("真气修炼")) + 3)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"在线打坐，离线闭关均可以获得真气",[StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]));
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.baseAttributeTitle.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function onMouseTip2(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.hpTitle.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.hpTitle.getCharIndexAtPoint(this.hpTitle.mouseX,this.hpTitle.mouseY);
               if(_loc2_ >= this.hpTitle.text.indexOf(LanResManager.getLanCommonTextWords("生命")) && _loc2_ <= this.hpTitle.text.indexOf(LanResManager.getLanCommonTextWords("生命")) + 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"生命为0将会死亡复活",[StaticValue.WHITE_HTML]));
               }
               else if(_loc2_ >= this.hpTitle.text.indexOf(LanResManager.getLanCommonTextWords("内力")) && _loc2_ <= this.hpTitle.text.indexOf(LanResManager.getLanCommonTextWords("内力")) + 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"使用武功攻击时将会消耗内力",[StaticValue.WHITE_HTML]));
               }
               else if(_loc2_ >= this.hpTitle.text.indexOf(LanResManager.getLanCommonTextWords("体力")) && _loc2_ <= this.hpTitle.text.indexOf(LanResManager.getLanCommonTextWords("体力")) + 1)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"使用轻功跳跃时将会消耗体力",[StaticValue.WHITE_HTML]));
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.hpTitle.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
         }
      }
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.skillTitle.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.skillTitle.getCharIndexAtPoint(this.skillTitle.mouseX,this.skillTitle.mouseY);
               if(_loc2_ >= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("攻　　击")) && _loc2_ <= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("攻　　击")) + 3)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"攻击值越高则战斗中造成的伤害越大",[StaticValue.WHITE_HTML]));
               }
               else if(_loc2_ >= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("防　　御")) && _loc2_ <= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("防　　御")) + 3)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"防御值越高则战斗中受到的伤害越小",[StaticValue.WHITE_HTML]));
               }
               else if(_loc2_ >= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("暴　　击")) && _loc2_ <= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("暴　　击")) + 3)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"爆击值越高则战斗中出现爆击的几率越大",[StaticValue.WHITE_HTML]));
               }
               else if(_loc2_ >= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("闪　　避")) && _loc2_ <= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("闪　　避")) + 3)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"闪避值越高则战斗中出现闪避的几率越大",[StaticValue.WHITE_HTML]));
               }
               else if(_loc2_ >= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("攻击速度")) && _loc2_ <= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("攻击速度")) + 3)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"攻击速度值越高则出招的速度就会越快",[StaticValue.WHITE_HTML]));
               }
               else if(_loc2_ >= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("移动速度")) && _loc2_ <= this.skillTitle.text.indexOf(LanResManager.getLanCommonTextWords("移动速度")) + 3)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"移动速度值越高则跑动或跳跃时的速度就会越快",[StaticValue.WHITE_HTML]));
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.skillTitle.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
         }
      }
      
      private function onMouseTip4(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.pointTitle.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.pointTitle.getCharIndexAtPoint(this.pointTitle.mouseX,this.pointTitle.mouseY);
               if(_loc2_ >= this.pointTitle.text.indexOf(LanResManager.getLanTextWords(this,"进攻型")) && _loc2_ <= this.pointTitle.text.indexOf(LanResManager.getLanTextWords(this,"进攻型")) + 2)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"进攻型加点将提高您的攻击力",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]));
               }
               else if(_loc2_ >= this.pointTitle.text.indexOf(LanResManager.getLanTextWords(this,"防御型")) && _loc2_ <= this.pointTitle.text.indexOf(LanResManager.getLanTextWords(this,"防御型")) + 2)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"防御型加点将提高您的防御力",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]));
               }
               else if(_loc2_ >= this.pointTitle.text.indexOf(LanResManager.getLanTextWords(this,"轻身型")) && _loc2_ <= this.pointTitle.text.indexOf(LanResManager.getLanTextWords(this,"轻身型")) + 2)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"轻身型加点将提高您的闪避和爆击能力",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]));
               }
               else if(_loc2_ >= this.pointTitle.text.indexOf(LanResManager.getLanTextWords(this,"健体型")) && _loc2_ <= this.pointTitle.text.indexOf(LanResManager.getLanTextWords(this,"健体型")) + 2)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"健体型加点将提高生命，内力与体力值",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]));
               }
               else if(_loc2_ >= this.pointTitle.text.indexOf(LanResManager.getLanTextWords(this,"潜能点")) && _loc2_ <= this.pointTitle.text.indexOf(LanResManager.getLanTextWords(this,"潜能点")) + 2)
               {
                  this.showTip(LanResManager.getLanTextWords(this,"人物升级后将获得一定数量的潜能点",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]));
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.pointTitle.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
         }
      }
      
      private function onMouseTip5(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.specialAttributeTitle.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = LanResManager.getLanCommonTextWords("攻击增强比例");
               _loc3_ = LanResManager.getLanCommonTextWords("伤害反弹比例");
               _loc4_ = LanResManager.getLanCommonTextWords("忽视防御比例");
               _loc5_ = LanResManager.getLanCommonTextWords("伤害减免比例");
               _loc6_ = LanResManager.getLanCommonTextWords("爆击伤害减免比例");
               _loc7_ = LanResManager.getLanCommonTextWords("暗器伤害减免比例");
               _loc8_ = LanResManager.getLanCommonTextWords("抵抗对方暗器几率");
               _loc9_ = LanResManager.getLanCommonTextWords("抵抗对方弓箭几率");
               _loc10_ = LanResManager.getLanCommonTextWords("抵抗丹田武学几率");
               _loc11_ = this.specialAttributeTitle.getCharIndexAtPoint(this.specialAttributeTitle.mouseX,this.specialAttributeTitle.mouseY);
               if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc2_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc2_) + _loc2_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"攻击增强比例提示",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc3_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc3_) + _loc3_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"伤害反弹比例提示1",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc4_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc4_) + _loc4_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"忽视防御比例提示",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc5_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc5_) + _loc5_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"伤害减免比例提示",[StaticValue.RED_HTML,StaticValue.GREEN_STRONG_HTML,StaticValue.YELLOW_HTML]));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc6_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc6_) + _loc6_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"爆击伤害减免比例提示"));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc7_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc7_) + _loc7_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"暗器伤害减免比例提示"));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc8_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc8_) + _loc8_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"抵抗对方暗器几率提示"));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc9_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc9_) + _loc9_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"抵抗对方弓箭几率提示"));
               }
               else if(_loc11_ >= this.specialAttributeTitle.text.indexOf(_loc10_) && _loc11_ <= this.specialAttributeTitle.text.indexOf(_loc10_) + _loc10_.length - 1)
               {
                  this.showTip(LanResManager.getLanTextWords(OtherAttributeCanvas,"抵抗丹田武学几率"));
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.specialAttributeTitle.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
         }
      }
      
      private function onMouseTip6(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.skillValue.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               _loc2_ = LanResManager.getLanCommonTextWords("攻　　击") + "：" + this._skillValue1.toString() + "<br>" + LanResManager.getLanCommonTextWords("防　　御") + "：" + this._skillValue2.toString() + "<br>" + LanResManager.getLanCommonTextWords("暴　　击") + "：" + this._skillValue3.toString() + "<br>" + LanResManager.getLanCommonTextWords("闪　　避") + "：" + this._skillValue4.toString() + "<br>" + LanResManager.getLanCommonTextWords("攻击速度") + "：" + this._skillValue5.toString() + "<br>" + LanResManager.getLanCommonTextWords("移动速度") + "：" + this._skillValue6.toString();
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.skillValue.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
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
      
      private function onPoint(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.allAddP1Btn:
               if(this._point5 > 0)
               {
                  this._point1 += this._point5;
                  this._point5 = 0;
               }
               break;
            case this.addP1Btn:
               if(this._point5 > 0)
               {
                  this._point1 += 1;
                  --this._point5;
               }
               break;
            case this.subP1Btn:
               if(this._point1 > this.point1)
               {
                  --this._point1;
                  this._point5 += 1;
               }
               break;
            case this.allSubP1Btn:
               if(this._point1 > this.point1)
               {
                  this._point5 += this._point1 - this.point1;
                  this._point1 = this.point1;
               }
               break;
            case this.allAddP2Btn:
               if(this._point5 > 0)
               {
                  this._point2 += this._point5;
                  this._point5 = 0;
               }
               break;
            case this.addP2Btn:
               if(this._point5 > 0)
               {
                  this._point2 += 1;
                  --this._point5;
               }
               break;
            case this.subP2Btn:
               if(this._point2 > this.point2)
               {
                  --this._point2;
                  this._point5 += 1;
               }
               break;
            case this.allSubP2Btn:
               if(this._point2 > this.point2)
               {
                  this._point5 += this._point2 - this.point2;
                  this._point2 = this.point2;
               }
               break;
            case this.allAddP3Btn:
               if(this._point5 > 0)
               {
                  this._point3 += this._point5;
                  this._point5 = 0;
               }
               break;
            case this.addP3Btn:
               if(this._point5 > 0)
               {
                  this._point3 += 1;
                  --this._point5;
               }
               break;
            case this.subP3Btn:
               if(this._point3 > this.point3)
               {
                  --this._point3;
                  this._point5 += 1;
               }
               break;
            case this.allSubP3Btn:
               if(this._point3 > this.point3)
               {
                  this._point5 += this._point3 - this.point3;
                  this._point3 = this.point3;
               }
               break;
            case this.allAddP4Btn:
               if(this._point5 > 0)
               {
                  this._point4 += this._point5;
                  this._point5 = 0;
               }
               break;
            case this.addP4Btn:
               if(this._point5 > 0)
               {
                  this._point4 += 1;
                  --this._point5;
               }
               break;
            case this.subP4Btn:
               if(this._point4 > this.point4)
               {
                  --this._point4;
                  this._point5 += 1;
               }
               break;
            case this.allSubP4Btn:
               if(this._point4 > this.point4)
               {
                  this._point5 += this._point4 - this.point4;
                  this._point4 = this.point4;
               }
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHARATTRIBUTE_ARRRIBUT_POINT_OK,"",[this._point1,this._point2,this._point3,this._point4]));
               break;
            case this.autoBtn:
               if(this.point5 == 0)
               {
                  return;
               }
               this._point5 = this.point5;
               this._point1 = this.point1;
               this._point1 += this._point5 - Math.floor(this._point5 * 0.2) - Math.floor(this._point5 * 0.2) - Math.floor(this._point5 * 0.2);
               this._point2 = this.point2;
               this._point2 += Math.floor(this._point5 * 0.2);
               this._point3 = this.point3;
               this._point3 += Math.floor(this._point5 * 0.2);
               this._point4 = this.point4;
               this._point4 += Math.floor(this._point5 * 0.2);
               this._point5 = 0;
         }
         this.pointValue.htmlText = "<textformat leading=\'10\'>" + this._point1 + "<br>" + this._point2 + "<br>" + this._point3 + "<br>" + this._point4 + "<br>" + this._point5 + "<br>" + "</textformat>";
      }
      
      public function setBaseAttribute(param1:String, param2:String, param3:Number, param4:Number, param5:int, param6:String, param7:String, param8:String, param9:Number, param10:int, param11:int, param12:int, param13:int) : void
      {
         if(this.arr1.length == 0)
         {
            this.arr1.push(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
         }
         else
         {
            this.arr1[0] = param1;
            this.arr1[1] = param2;
            this.arr1[2] = param3;
            this.arr1[3] = param4;
            this.arr1[4] = param5;
            this.arr1[5] = param6;
            this.arr1[6] = param7;
            this.arr1[7] = param8;
            this.arr1[8] = param9;
            this.arr1[9] = param10;
            this.arr1[10] = param11;
            this.arr1[11] = param12;
            this.arr1[12] = param13;
         }
         if(this.arr1[2] > 100000000000)
         {
            this.expBar.type = 3;
         }
         else if(this.arr1[2] > 200000000000)
         {
            this.expBar.type = 4;
         }
         this.expBar.setValue(this.arr1[2],this.arr1[3]);
         this.charName.htmlText = "<textformat leading=\'0\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.arr1[0] + "</font><br>" + this.arr1[5] + "</textformat>";
         this.level.htmlText = "<textformat leading=\'0\'>" + this.arr1[4] + "<br>" + this.arr1[7] + "</textformat>";
         this.party.htmlText = "<textformat leading=\'0\'>" + this.arr1[6] + "<br>" + this.arr1[9] + "</textformat>";
         this.zanwenValue.setShengWang(this.arr1[1],this.arr1[8],this.arr1[10],this.arr1[11],this.arr1[12]);
      }
      
      public function setShowItem(param1:Array) : void
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 2068
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      private function resizeXuanyuanjianYlzr() : void
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 6952
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      public function setZhuangbeiKaiqi() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < OtherConst.zhuangbei_dakong)
         {
            this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.equipContainer.addChildAt(this.img,0);
            if(OtherConst.zhuangbei_dakong == 3)
            {
               this.img.x = 42 + 42 * _loc1_;
            }
            else
            {
               this.img.x = 42 * _loc1_;
            }
            this.img.y = 254;
            _loc1_++;
         }
      }
      
      public function setHPMP(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.hpBar.setValue(Math.floor(param1),Math.floor(param2));
         this.mpBar.setValue(Math.floor(param3),Math.floor(param4));
         this.nqBar.setValue(Math.floor(param5),Math.floor(param6));
      }
      
      public function setSkillValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:int, param6:int) : void
      {
         this._skillValue1 = param1;
         this._skillValue2 = param2;
         this._skillValue3 = param3;
         this._skillValue4 = param4;
         this._skillValue5 = param5;
         this._skillValue6 = param6;
         if(param1 > 999999999999)
         {
            this._skillValue1TT = int(param1 / 1000000000000) + "VIP";
         }
         else if(param1 > 99999999)
         {
            this._skillValue1TT = int(param1 / 100000000) + "TT";
         }
         else
         {
            this._skillValue1TT = param1 + "";
         }
         if(param2 > 999999999999)
         {
            this._skillValue2TT = int(param2 / 1000000000000) + "VIP";
         }
         else if(param2 > 99999999)
         {
            this._skillValue2TT = int(param2 / 100000000) + "TT";
         }
         else
         {
            this._skillValue2TT = param2 + "";
         }
         if(param3 > 999999999999)
         {
            this._skillValue3TT = int(param3 / 1000000000000) + "VIP";
         }
         else if(param3 > 99999999)
         {
            this._skillValue3TT = int(param3 / 100000000) + "TT";
         }
         else
         {
            this._skillValue3TT = param3 + "";
         }
         if(param4 > 999999999999)
         {
            this._skillValue4TT = int(param4 / 1000000000000) + "VIP";
         }
         else if(param4 > 99999999)
         {
            this._skillValue4TT = int(param4 / 100000000) + "TT";
         }
         else
         {
            this._skillValue4TT = param4 + "";
         }
         if(param5 > 999999999999)
         {
            this._skillValue5TT = int(param5 / 1000000000000) + "VIP";
         }
         else if(param5 > 99999999)
         {
            this._skillValue5TT = int(param5 / 100000000) + "TT";
         }
         else
         {
            this._skillValue5TT = param5 + "";
         }
         if(param6 > 999999999999)
         {
            this._skillValue6TT = int(param6 / 1000000000000) + "VIP";
         }
         else if(param6 > 99999999)
         {
            this._skillValue6TT = int(param6 / 100000000) + "TT";
         }
         else
         {
            this._skillValue6TT = param6 + "";
         }
         this.skillValue.htmlText = "<textformat leading=\'6\'>" + this._skillValue1TT + "<br>" + this._skillValue2TT + "<br>" + this._skillValue3TT + "<br>" + this._skillValue4TT + "<br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + this._skillValue5TT + "<br>" + this._skillValue6TT + "</font></textformat>";
      }
      
      public function setPoint(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this._point1 = this.point1 = param1;
         this._point2 = this.point2 = param2;
         this._point3 = this.point3 = param3;
         this._point4 = this.point4 = param4;
         this._point5 = this.point5 = param5;
         this.pointValue.htmlText = "<textformat leading=\'10\'>" + this._point1 + "<br>" + this._point2 + "<br>" + this._point3 + "<br>" + this._point4 + "<br>" + this._point5 + "<br>" + "</textformat>";
      }
      
      public function setZhenQi(param1:int, param2:int) : void
      {
         this.zhenqiBar.setValue(param1,param2);
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 115 - this._avatar.width / 2;
         this._avatar.y = 240 - this._avatar.height + 20;
      }
      
      public function setFlag(param1:int) : void
      {
         var onCom:Function = null;
         var value:int = param1;
         onCom = function():void
         {
            if(Boolean(flag) && Boolean(flag.parent))
            {
               flag.parent.removeChild(flag);
               flag.stop();
            }
            if(value != 0 && !isDiZi)
            {
               flag = StaticValue.getMCByClassName(StaticValue.conversionFlagID(value)) as MovieClip;
               addChildAt(flag,1);
               flag.x = 80 - flag.width / 2;
               flag.y = 70;
            }
         };
         RslLoaderManager.lazyLoad(onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      public function setYupei(param1:Goods) : void
      {
         if(Boolean(this.yuPeiSelectConstiner) && this.yuPeiSelectConstiner.parent != null)
         {
            this.yuPeiSelectConstiner.parent.removeChild(this.yuPeiSelectConstiner);
         }
         if(Boolean(this.yuPeiSpr) && this.yuPeiSpr.numChildren != 0)
         {
            while(this.yuPeiSpr.numChildren != 0)
            {
               this.yuPeiSpr.removeChildAt(0);
            }
         }
         if(this.yuPeiSpr == null)
         {
            this.yuPeiSpr = new Sprite();
         }
         if(!param1)
         {
            return;
         }
         this.yupei = new ItemFace(param1);
         this.yuPeiSpr.addChild(this.yupei);
         this.yuPeiSpr.x = 134;
         this.yuPeiSpr.y = 271;
         addChild(this.yuPeiSpr);
         this.yuPeiSpr.addEventListener(MouseEvent.CLICK,this.showSelectYuPeiBar);
      }
      
      public function hideZanWen() : void
      {
         if(this.zanwenValue.parent)
         {
            this.zanwenValue.parent.removeChild(this.zanwenValue);
         }
      }
      
      private function isShowZanWenBtn(param1:Boolean) : void
      {
      }
      
      public function setZanWenValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.zanwenValue.setZanWen(param1,param2,param3,param4,param5,param6,param7,param8);
         this.specialValue0.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "%" + "<br>" + param3 + "%" + "<br>" + param5 + "%" + "<br>" + param7 + "%" + "</font>" + "</textformat>";
         this.specialValue1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + (param2 > 0 ? "+" + param2 + "%" : "") + "<br>" + (param4 > 0 ? "+" + param4 + "%" : "") + "<br>" + (param6 > 0 ? "+" + param6 + "%" : "") + "<br>" + (param8 > 0 ? "+" + param8 + "%" : "") + "<br>" + "</font>" + "</textformat>";
      }
      
      public function set9JianJianCheng(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number) : void
      {
         this.zanwenValue.set9JIanJiaCheng(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.specialValue2.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "%<br>" + param2 + "%<br>" + param3 + "%<br>" + param4 + "%<br>" + param5 + "%<br>" + "</font>" + "</textformat>";
         this.specialValue3.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + (param6 > 0 ? "+" + param6 / 100 + "%" : "") + "<br>" + (param7 > 0 ? "+" + param7 / 100 + "%" : "") + "<br>" + (param8 > 0 ? "+" + param8 / 100 + "%" : "") + "<br>" + (param9 > 0 ? "+" + param9 / 100 + "%" : "") + "<br>" + (param10 > 0 ? "+" + param10 / 100 + "%" : "") + "<br>" + "</font>" + "</textformat>";
      }
      
      public function showMask(param1:Boolean) : void
      {
         var _loc2_:Bitmap = null;
         if(param1)
         {
            this.kuafuMask = new Sprite();
            this.kuafuMask.graphics.beginFill(6052956,0.9);
            this.kuafuMask.graphics.drawRect(0,0,90,130);
            this.kuafuMask.graphics.endFill();
            _loc2_ = StaticValue.getBitmapByClassName("ui.mask.lock");
            this.kuafuMask.addChild(_loc2_);
            _loc2_.x = (90 - _loc2_.width) / 2;
            _loc2_.y = (130 - _loc2_.height) / 2;
            addChild(this.kuafuMask);
            this.kuafuMask.x = 305;
            this.kuafuMask.y = 234;
         }
         else if(Boolean(this.kuafuMask) && Boolean(this.kuafuMask.parent))
         {
            this.kuafuMask.parent.removeChild(this.kuafuMask);
            this.kuafuMask = null;
         }
      }
      
      public function closeJianSelectSpr() : void
      {
         if(!this.jianSelectConstiner)
         {
            return;
         }
         this.jianSelectConstiner.removeEventListener(MouseEvent.MOUSE_DOWN,this.selectJianEvent);
         if(this.jianSelectConstiner.parent)
         {
            this.jianSelectConstiner.parent.removeChild(this.jianSelectConstiner);
         }
      }
      
      public function showJiaoSelect() : void
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 2814
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      public function showSelectJianBar() : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.jianSelectConstiner.numChildren > 0)
         {
            this.jianSelectConstiner.removeChildAt(0);
         }
         if(this.nowIndex < 0)
         {
            this.nowIndex += this.jianGoodsArr.length;
         }
         else if(this.nowIndex >= this.jianGoodsArr.length)
         {
            this.nowIndex -= this.jianGoodsArr.length;
         }
         this.upButton.x = 10;
         this.upButton.y = 68;
         this.downButton.x = 28;
         this.downButton.y = 256;
         this.jianSelectConstiner.addChild(this.upButton);
         this.jianSelectConstiner.addChild(this.downButton);
         var _loc1_:int = 0;
         var _loc2_:int = this.nowIndex;
         while(_loc2_ % this.jianGoodsArr.length < this.jianGoodsArr.length)
         {
            _loc2_ %= this.jianGoodsArr.length;
            _loc3_ = this.jianGoodsArr[_loc2_];
            if(_loc3_ != null)
            {
               _loc4_ = new ItemFace(_loc3_);
               this.jianSelectConstiner.addChild(_loc4_);
               _loc4_.y = 72 + 36 * _loc1_;
               _loc1_++;
            }
            if(_loc1_ == this.NB_WEAPON_SHOW_COUNT)
            {
               break;
            }
            _loc2_++;
         }
      }
      
      private function onUpDownClick(param1:Event) : void
      {
         switch(param1.target)
         {
            case this.upButton:
               ++this.nowIndex;
               this.showSelectJianBar();
               break;
            case this.downButton:
               --this.nowIndex;
               this.showSelectJianBar();
         }
      }
      
      private function selectJianEvent(param1:Event) : void
      {
         var _loc2_:ItemFace = null;
         if(param1.target is ItemFace)
         {
            _loc2_ = param1.target as ItemFace;
            this.jianSelectConstiner.removeEventListener(MouseEvent.MOUSE_DOWN,this.selectJianEvent);
            if(this.jianSelectConstiner.parent)
            {
               this.jianSelectConstiner.parent.removeChild(this.jianSelectConstiner);
            }
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_SELECT_SHOW_JIAN,"",_loc2_.getBaseItem().id));
         }
      }
      
      public function showSelectYuPeiBar(param1:* = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:ItemFace = null;
         this.yuPeiGoodsArr = GameInstance.mainCharData.attributeInfo.yuPeiGoodsIDArr;
         if(!this.yuPeiSelectConstiner)
         {
            this.yuPeiSelectConstiner = new Sprite();
            this.yuPeiSelectConstiner.x = 134;
         }
         while(this.yuPeiSelectConstiner.numChildren > 0)
         {
            this.yuPeiSelectConstiner.removeChildAt(0);
         }
         if(this.yuPeiGoodsArr.length <= 1)
         {
            return;
         }
         if(this.yuPeiGoodsArr.length > this.NB_WEAPON_SHOW_COUNT)
         {
            if(this.nowIndex2 < 0)
            {
               this.nowIndex2 += this.yuPeiGoodsArr.length;
            }
            else if(this.nowIndex2 >= this.yuPeiGoodsArr.length)
            {
               this.nowIndex2 -= this.yuPeiGoodsArr.length;
            }
            this.upButton2.x = 10;
            this.upButton2.y = 68;
            this.downButton2.x = 28;
            this.downButton2.y = 256;
            this.yuPeiSelectConstiner.addChild(this.upButton2);
            this.yuPeiSelectConstiner.addChild(this.downButton2);
            _loc2_ = 0;
            _loc3_ = this.nowIndex2;
            while(_loc3_ % this.yuPeiGoodsArr.length < this.yuPeiGoodsArr.length)
            {
               _loc3_ %= this.yuPeiGoodsArr.length;
               _loc4_ = this.yuPeiGoodsArr[_loc3_];
               if(_loc4_ != null)
               {
                  _loc5_ = new ItemFace(_loc4_);
                  this.yuPeiSelectConstiner.addChild(_loc5_);
                  _loc5_.y = 72 + 36 * _loc2_;
                  _loc2_++;
               }
               if(_loc2_ == this.NB_WEAPON_SHOW_COUNT)
               {
                  break;
               }
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < this.yuPeiGoodsArr.length)
            {
               _loc4_ = this.yuPeiGoodsArr[_loc3_];
               if(_loc4_ != null)
               {
                  _loc5_ = new ItemFace(_loc4_);
                  this.yuPeiSelectConstiner.addChild(_loc5_);
                  _loc5_.y = 234 - 36 * _loc3_;
               }
               _loc3_++;
            }
         }
         this.yuPeiSelectConstiner.addEventListener(MouseEvent.MOUSE_DOWN,this.selectYuPeiEvent);
         addChild(this.yuPeiSelectConstiner);
      }
      
      private function onUpDownClick2(param1:Event) : void
      {
         switch(param1.target)
         {
            case this.upButton2:
               ++this.nowIndex2;
               this.showSelectYuPeiBar();
               break;
            case this.downButton2:
               --this.nowIndex2;
               this.showSelectYuPeiBar();
         }
      }
      
      private function selectYuPeiEvent(param1:Event = null) : void
      {
         var _loc2_:ItemFace = null;
         if(param1.target is ItemFace)
         {
            _loc2_ = param1.target as ItemFace;
            this.yuPeiSelectConstiner.removeEventListener(MouseEvent.MOUSE_DOWN,this.selectYuPeiEvent);
            if(this.yuPeiSelectConstiner.parent)
            {
               this.yuPeiSelectConstiner.parent.removeChild(this.yuPeiSelectConstiner);
            }
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_SELECT_SHOW_YUPEI,"",_loc2_.getBaseItem().id));
         }
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         if(param1)
         {
            this._avatar.x = 115 - this._avatar.width / 2;
            this._avatar.y = 240 - this._avatar.height - 15;
         }
         else
         {
            this._avatar.x = param2;
            this._avatar.y = param3;
         }
      }
      
      public function setStarSta(param1:int) : void
      {
         var bmp:Bitmap = null;
         var loadUrl:String = null;
         var type:int = param1;
         while(this.starSpr.numChildren > 0)
         {
            this.starSpr.removeChildAt(0);
         }
         this.starSta = type;
         if(this.starSta >= 1)
         {
            if(this.starMc == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/longhun/fire.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  starMc = _loc2_.content as MovieClip;
                  if(starMc)
                  {
                     starMc.x = -19;
                     starMc.y = -41;
                     starSpr.addChild(starMc);
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.starSpr.addChild(this.starMc);
            }
            bmp = StaticValue.getBitmapByClassName("ui.biwuDahui.star.liang");
            this.starSpr.addChild(bmp);
         }
         else
         {
            bmp = StaticValue.getBitmapByClassName("ui.biwuDahui.star.an");
            this.starSpr.addChild(bmp);
         }
      }
      
      public function setStatusByString(param1:String) : void
      {
         var _loc4_:Array = null;
         if(param1 == null || param1.length == 0)
         {
            this.setTianGangZhenQi(0);
            return;
         }
         var _loc2_:Array = param1.split(";");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_].split(",");
            switch(parseInt(_loc4_[0]))
            {
               case 1:
                  this.setTianGangZhenQi(parseInt(_loc4_[1]));
            }
            _loc3_++;
         }
      }
      
      private function setTianGangZhenQi(param1:int) : void
      {
         var loadUrl:String = null;
         var sta:int = param1;
         while(this.tianGangZhengQiSpr.numChildren > 0)
         {
            this.tianGangZhengQiSpr.removeChildAt(0);
         }
         this.wushuangBo = GameState.dictMainStatus[41983];
         this.zhizuntianxiaBo = GameState.dictMainStatus[726291];
         this.cheng1 = GameState.dictMainStatus[729746];
         this.cheng2 = GameState.dictMainStatus[729747];
         if(this.cheng2)
         {
            if(this.mcObj[4] == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/2.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  tianGangZhengQiMc = _loc2_.content as MovieClip;
                  if(tianGangZhengQiMc)
                  {
                     tianGangZhengQiMc.x = -4;
                     tianGangZhengQiMc.y = 0;
                     tianGangZhengQiSpr.addChild(tianGangZhengQiMc);
                  }
                  mcObj[3] = tianGangZhengQiMc;
               },null,false,loadUrl);
            }
            else
            {
               this.tianGangZhengQiSpr.addChild(this.tianGangZhengQiMc);
            }
         }
         else if(this.cheng1)
         {
            if(this.mcObj[5] == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/1.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  tianGangZhengQiMc = _loc2_.content as MovieClip;
                  if(tianGangZhengQiMc)
                  {
                     tianGangZhengQiMc.x = -4;
                     tianGangZhengQiMc.y = 0;
                     tianGangZhengQiSpr.addChild(tianGangZhengQiMc);
                  }
                  mcObj[3] = tianGangZhengQiMc;
               },null,false,loadUrl);
            }
            else
            {
               this.tianGangZhengQiSpr.addChild(this.tianGangZhengQiMc);
            }
         }
         else if(this.zhizuntianxiaBo)
         {
            if(this.mcObj[3] == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/zhizuntianxia2.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  tianGangZhengQiMc = _loc2_.content as MovieClip;
                  if(tianGangZhengQiMc)
                  {
                     tianGangZhengQiMc.x = -4;
                     tianGangZhengQiMc.y = 0;
                     tianGangZhengQiSpr.addChild(tianGangZhengQiMc);
                  }
                  mcObj[3] = tianGangZhengQiMc;
               },null,false,loadUrl);
            }
            else
            {
               this.tianGangZhengQiSpr.addChild(this.tianGangZhengQiMc);
            }
         }
         else if(this.wushuangBo)
         {
            if(this.mcObj[2] == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/luanshiwushuang.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  tianGangZhengQiMc = _loc2_.content as MovieClip;
                  if(tianGangZhengQiMc)
                  {
                     tianGangZhengQiMc.x = -4;
                     tianGangZhengQiMc.y = 0;
                     tianGangZhengQiSpr.addChild(tianGangZhengQiMc);
                  }
                  mcObj[2] = tianGangZhengQiMc;
               },null,false,loadUrl);
            }
            else
            {
               this.tianGangZhengQiSpr.addChild(this.tianGangZhengQiMc);
            }
         }
         else
         {
            this.tianGangZhengQiSta = sta;
            if(this.tianGangZhengQiSta >= 1)
            {
               if(this.mcObj[1] == null)
               {
                  loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/tiangangzhengqi.swf";
                  LoaderManager.lazyLoad(function(param1:Event):void
                  {
                     var _loc2_:LoadingItem = param1.target as LoadingItem;
                     tianGangZhengQiMc = _loc2_.content as MovieClip;
                     if(tianGangZhengQiMc)
                     {
                        tianGangZhengQiMc.x = -19;
                        tianGangZhengQiMc.y = -21;
                        tianGangZhengQiSpr.addChild(tianGangZhengQiMc);
                     }
                     mcObj[1] = tianGangZhengQiMc;
                  },null,false,loadUrl);
               }
               else
               {
                  this.tianGangZhengQiSpr.addChild(this.tianGangZhengQiMc);
               }
            }
            else
            {
               if(this.tianGangZhengQiBmp == null)
               {
                  this.tianGangZhengQiBmp = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/tiangangzhengqi/tiangangzhengqi.png",68,19);
               }
               this.tianGangZhengQiBmp.y = -2;
               this.tianGangZhengQiBmp.x = -3;
               this.tianGangZhengQiSpr.addChild(this.tianGangZhengQiBmp);
            }
         }
      }
      
      private function onStarMouseTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.starSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onStarMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.starSta == 0)
               {
                  _loc2_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙魂未激活") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：2888、防御：2888、攻击速度：88、暴击伤害加成20%") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帝王龙魂(最终)未激活") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：12000、防御：10000、血量：68888") + "<br></font>";
               }
               else if(this.starSta == 1)
               {
                  _loc2_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙魂已激活") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：2888、防御：2888、攻击速度：88、暴击伤害加成20%") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帝王龙魂(最终)未激活") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：12000、防御：10000、血量：68888") + "<br></font>";
               }
               else if(this.starSta == 2)
               {
                  _loc2_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙魂未激活") + "<br></font>" + "<font color=\'" + StaticValue.HUISE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：2888、防御：2888、攻击速度：88、暴击伤害加成20%") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帝王龙魂(最终)已激活") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：12000、防御：10000、血量：68888") + "<br></font>";
               }
               else if(this.starSta == 3)
               {
                  _loc2_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙魂已激活") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：2888、防御：2888、攻击速度：88、暴击伤害加成20%") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帝王龙魂(最终)已激活") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：12000、防御：10000、血量：68888") + "<br></font>";
               }
               _loc3_ = false;
               _loc3_ = Boolean(GameInstance.mainCharData.goodsInfo.goodsBodyDict[10000]) && Boolean(GameInstance.mainCharData.goodsInfo.goodsBodyDict[10001]) && Boolean(GameInstance.mainCharData.goodsInfo.goodsBodyDict[10002]) && Boolean(GameInstance.mainCharData.goodsInfo.goodsBodyDict[10003]) && Boolean(GameInstance.mainCharData.goodsInfo.goodsBodyDict[10004]);
               if(GameState.dictMainStatus[SpecialGoodsID.QINGLONG_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("青龙精魄：") + "<br>" + LanResManager.getLanCommonTextWords("人物可吸收青龙精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活青龙印技能.") + "<br>" + LanResManager.getLanCommonTextWords("青龙印：攻击时100%触发青龙印，持续10秒； 在此状态下，人物将瞬间飞跃至天空中，消") + "<br>" + LanResManager.getLanCommonTextWords("失至对手视线之中。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictMainStatus[SpecialGoodsID.BAIHU_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("白虎精魄：") + "<br>" + LanResManager.getLanCommonTextWords("人物可吸收白虎精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活白虎印技能.") + "<br>" + LanResManager.getLanCommonTextWords("白虎印：被攻击时100%触发白虎印，持续10秒；在此状态下，100%破除对手所有效果，对") + "<br>" + LanResManager.getLanCommonTextWords("手在此状态下，将无法触发任何抵抗BUFF，直至状态解除为止。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictMainStatus[SpecialGoodsID.ZHUQUE_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("朱雀精魄：") + "<br>" + LanResManager.getLanCommonTextWords("人物可吸收朱雀精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活朱雀印技能.") + "<br>" + LanResManager.getLanCommonTextWords("朱雀印：攻击时100%触发朱雀印，持续10秒；对手在此状态下，将受到地狱之火不断灼烧，") + "<br>" + LanResManager.getLanCommonTextWords("每秒掉血60%，且对手双手受火焰燃烧，无法继续攻击操作。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictMainStatus[SpecialGoodsID.XUANWU_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("玄武精魄：") + "<br>" + LanResManager.getLanCommonTextWords("人物可吸收玄武精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活玄武印技能.") + "<br>" + LanResManager.getLanCommonTextWords("玄武印：被攻击时100%触发玄武印，持续10秒；在此状态下，自身所受到的所有攻击、所有") + "<br>" + LanResManager.getLanCommonTextWords("百分比伤害、所有负面状态都将免疫，使自身进入无敌的状态，让对手不可侵犯。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictMainStatus[SpecialGoodsID.SHISHITAOZHUANGJIHUOSHI_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("史诗套装激活石：") + "<br>" + LanResManager.getLanCommonTextWords("套装属性：攻击88888亿 防御62888亿 血量90888亿 暴击 88888闪避88888 ") + "<br>" + LanResManager.getLanCommonTextWords("青龙战纹100%、白虎战纹100%、朱雀战纹80%、所有武功1400000层") + "<br>" + LanResManager.getLanCommonTextWords("史诗侵蚀：攻击时100%触发史诗侵蚀，持续10秒；自身在此状态下，对手所有攻击施发的技") + "<br>" + LanResManager.getLanCommonTextWords("能效果都将被史诗装备侵蚀，使自身达到免疫的状态；每受到对手一次，都将立即反噬对手") + "<br>" + LanResManager.getLanCommonTextWords("一次侵蚀效果，瞬间掉血80%，且使对手所有攻击都被立即停止，持续10秒。冷却60秒。") + "<br></font>";
               }
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.starSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStarMouseTip);
         }
      }
      
      public function addSlot(param1:Boolean) : void
      {
         if(param1)
         {
            this.img1.visible = true;
            addChildAt(this.img1,1);
            this.img1.x = 132;
            this.img1.y = 232;
         }
         else if(this.img1)
         {
            this.img1.visible = false;
            if(this.img1.parent != null)
            {
               this.img1.parent.removeChild(this.img1);
            }
         }
      }
      
      public function deleteSlot() : void
      {
         if(this.img1)
         {
            this.img1.visible = false;
            if(this.img1.parent != null)
            {
               this.img1.parent.removeChild(this.img1);
            }
         }
      }
      
      public function setLayout(param1:Boolean = false) : void
      {
         this.isDiZi = param1;
         if(!param1)
         {
            this.bgImg.visible = true;
            this.diZiBgImg.visible = false;
            this.colorBarBg.x = 80;
            this.colorBarBg.y = 42;
            this.colorBarBg.width = 109;
            this.colorBarBg1.x = 260;
            this.colorBarBg1.y = 42;
            this.colorBarBg1.width = 109;
            this.colorBarBg2.visible = false;
            this.zhandouBg.x = 250;
            this.zhandouBg.y = 63;
            this.baseAttributeTitle.htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"人物基本属性标题") + "</textformat>";
            this.baseAttributeTitle.x = 20;
            this.charName.x = 50;
            this.level.x = 190;
            this.equipContainer.x = 13;
            this.equipContainer.y = 66;
            this.hpTitle.visible = false;
            this.hpBar.visible = false;
            this.mpBar.visible = false;
            this.nqBar.visible = false;
            this.skillTitle.x = 256;
            this.skillTitle.y = 82;
            this.skillValue.x = 326;
            this.skillValue.y = 82;
            this.skillTitle.htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"攻击防御暴击闪避",[StaticValue.GREEN_HTML]) + "</textformat>";
            this.expBar.visible = true;
            this.zhenqiBar.visible = true;
            this.ico.visible = true;
            this.zanwenBtn.visible = true;
            this.starSpr.visible = true;
            this.tianGangZhengQiSpr.visible = true;
            this.party.visible = true;
            this.pointContainer.visible = true;
            this.specialAttributeTitle.visible = false;
            this.specialValue0.visible = false;
            this.specialValue1.visible = false;
            this.specialValue2.visible = false;
            this.specialValue3.visible = false;
            if(this.flag)
            {
               this.flag.visible = true;
            }
         }
         else
         {
            this.bgImg.visible = false;
            this.diZiBgImg.visible = true;
            this.colorBarBg.x = 52;
            this.colorBarBg.y = 47;
            this.colorBarBg.width = 168;
            this.colorBarBg1.x = 52;
            this.colorBarBg1.y = 62;
            this.colorBarBg1.width = 168;
            this.colorBarBg2.visible = true;
            this.zhandouBg.x = 285;
            this.zhandouBg.y = 8;
            this.baseAttributeTitle.htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanCommonTextWords("姓名:") + "                          " + LanResManager.getLanCommonTextWords("等级:") + "                  <br>" + LanResManager.getLanCommonTextWords("门派:") + "                          " + LanResManager.getLanCommonTextWords("祖师:") + "                  <br>" + "</textformat>";
            this.baseAttributeTitle.x = 5;
            this.charName.x = 50 - 20;
            this.level.x = 150;
            this.equipContainer.x = 13;
            this.equipContainer.y = 106;
            this.hpTitle.visible = true;
            this.hpBar.visible = true;
            this.mpBar.visible = true;
            this.nqBar.visible = true;
            this.skillTitle.x = 240;
            this.skillTitle.y = 32;
            this.skillValue.x = 340;
            this.skillValue.y = 32;
            this.skillTitle.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"攻击防御暴击闪避",[StaticValue.GREEN_HTML]) + "</textformat>";
            this.expBar.visible = false;
            this.zhenqiBar.visible = false;
            this.ico.visible = false;
            this.zanwenBtn.visible = false;
            this.starSpr.visible = false;
            this.tianGangZhengQiSpr.visible = false;
            this.party.visible = false;
            this.pointContainer.visible = false;
            this.specialAttributeTitle.visible = true;
            this.specialValue0.visible = true;
            this.specialValue1.visible = true;
            this.specialValue2.visible = true;
            this.specialValue3.visible = true;
            if(this.flag)
            {
               this.flag.visible = false;
            }
            if(Boolean(this.jianSelectConstiner) && Boolean(this.jianSelectConstiner.parent))
            {
               this.jianSelectConstiner.parent.removeChild(this.jianSelectConstiner);
            }
            if(Boolean(this.yuPeiSelectConstiner) && Boolean(this.yuPeiSelectConstiner.parent))
            {
               this.yuPeiSelectConstiner.parent.removeChild(this.yuPeiSelectConstiner);
            }
         }
      }
      
      public function setDiZiData(param1:String, param2:String, param3:int) : void
      {
         this.charName.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.GREEN_HTML + "\'>    " + this.arr1[0] + "</font><br>" + param1 + "</textformat>";
         this.level.htmlText = "<textformat leading=\'1\'>" + this.arr1[4] + "<br>" + param2 + "</textformat>";
         this.specialValue2.htmlText += "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param3 + "</font>" + "</textformat>";
      }
   }
}

