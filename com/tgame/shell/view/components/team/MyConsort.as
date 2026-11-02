package com.tgame.shell.view.components.team
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.TeamPanel;
   import com.tgame.shell.view.components.attribute.EquipList;
   import com.tgame.shell.view.components.attribute.OtherAttributeCanvas;
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
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.Dictionary;
   import gs.TweenMax;
   
   public class MyConsort extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var bgImg2:Bitmap;
      
      public var bgImg3:Bitmap;
      
      public var $parent:DisplayObject;
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      public var ico:CharAttributeOccultIco;
      
      private var equipContainer:Sprite;
      
      private var baseAttributeTitle:FTextArea;
      
      private var charName:FTextArea;
      
      private var level:FTextArea;
      
      private var party:FTextArea;
      
      private var hpTitle:FTextArea;
      
      private var ft:FTextArea;
      
      private var expBar:ColorBar;
      
      private var zhenqiBar:ColorBar;
      
      private var wugongBar:ColorBar;
      
      private var jingmaiBar:ColorBar;
      
      private var chengjiuBar:ColorBar;
      
      private var hpBar:ColorBar;
      
      private var mpBar:ColorBar;
      
      private var nqBar:ColorBar;
      
      private var skillTitle:FTextArea;
      
      private var skillValue:FTextArea;
      
      private var _skillValue1:Number;
      
      private var _skillValue2:Number;
      
      private var _skillValue3:Number;
      
      private var _skillValue4:Number;
      
      private var _skillValue5:int;
      
      private var _skillValue6:int;
      
      private var pointTitle:FTextArea;
      
      private var pointValue1:FTextArea;
      
      private var pointValue2:FTextArea;
      
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
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var flag:MovieClip;
      
      private var chengZhuWuQi:ItemFace;
      
      private var xuayuanjian:ItemFace;
      
      private var arr1:Array;
      
      private var tcxxzlBtn:SecondButton;
      
      private var biankuang:FCanvas;
      
      private var content1:Sprite;
      
      private var content2:Sprite;
      
      private var content3:Sprite;
      
      private var xinzengqingyuBtn:SmallButton;
      
      private var listContainer:Sprite;
      
      private var Scroll:FVScorllBar;
      
      private var giftList:FList;
      
      private var ghypBtn:SecondButton;
      
      private var yzxsBtn:SecondButton;
      
      private var tdjmBtn:SecondButton;
      
      private var jbhyBtn:SecondButton;
      
      private var tdwgBtn:SecondButton;
      
      private var dtyxBtn:SecondButton;
      
      private var wuxueContainer:Sprite;
      
      private var yupeiContainer:Sprite;
      
      public var xinzengxinyuPanel:XinzengxinyuPanel;
      
      public var yupeiswapPanel:YupeiSwapPanel;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      public var lihunxiushuPanel:LihunxiushuPanel;
      
      private var zanwenBtn:FSimpleButton;
      
      private var zanwenMask:Sprite;
      
      public var zanwenValue:OtherAttributeCanvas;
      
      private var img:Bitmap;
      
      private var starSpr:Sprite;
      
      private var starSta:int = 0;
      
      private var starMc:MovieClip;
      
      private var tianGangZhengQiSpr:Sprite;
      
      private var tianGangZhengQiSta:int = 0;
      
      private var tianGangZhengQiMc:MovieClip;
      
      private var mcObj:Array;
      
      private var wushuangBo:Boolean = false;
      
      private var zhizuntianxiaBo:Boolean = false;
      
      public var equipList:EquipList;
      
      private var wuShengQiDict:Dictionary;
      
      private var yupei:ItemFace;
      
      private var cheng1:Boolean;
      
      private var cheng2:Boolean;
      
      public function MyConsort()
      {
         this.arr1 = [];
         super();
         this.init();
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
      }
      
      private function init() : void
      {
         var bg:Bitmap;
         var bd:BitmapData;
         var csft:FTextArea;
         this.biankuang = new FCanvas();
         this.biankuang.skin = "box_transparence";
         this.biankuang.width = 557;
         this.biankuang.height = 366;
         addChild(this.biankuang);
         this.content1 = new Sprite();
         this.content1.x = 0;
         this.content1.y = 0;
         addChild(this.content1);
         this.bgImg = new Bitmap();
         this.content1.addChild(this.bgImg);
         this.bgImg.name = "ui.marriage.TA.2.ui";
         bg = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         this.content1.addChild(bg);
         bg.x = 80 - 17;
         bg.y = 38;
         bg = StaticValue.getBitmapByClassName("ui.char.attribute.text.zhandou");
         this.content1.addChild(bg);
         bg.x = 250 - 17;
         bg.y = 58;
         bg = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         this.content1.addChild(bg);
         bg.x = 260 - 17;
         bg.y = 38;
         this._avatar = new Bitmap();
         this.content1.addChild(this._avatar);
         this.baseAttributeTitle = new FTextArea();
         with(this.baseAttributeTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20 - 17;
            y = 4;
            textColor = StaticValue.BlUE20;
         }
         this.baseAttributeTitle.htmlText = "<textformat leading=\'0.5\'>" + LanResManager.getLanTextWords(this,"配偶详细标题",[],false) + "</textformat>";
         this.content1.addChild(this.baseAttributeTitle);
         this.equipContainer = new Sprite();
         this.content1.addChild(this.equipContainer);
         this.equipContainer.x = 4;
         this.equipContainer.y = 62;
         with(this.equipContainer.graphics)
         {
            beginFill(0,0.1);
            drawRect(0,0,203,300);
            endFill();
         }
         this.charName = new FTextArea();
         with(this.charName)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 48 - 17;
            y = 4;
            textColor = StaticValue.WHITE;
         }
         this.content1.addChild(this.charName);
         this.level = new FTextArea();
         with(this.level)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 193 - 27;
            y = 4;
            textColor = StaticValue.WHITE;
         }
         this.content1.addChild(this.level);
         this.party = new FTextArea();
         with(this.party)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 362 - 17 - 27;
            y = 3;
            textColor = StaticValue.WHITE;
         }
         this.content1.addChild(this.party);
         this.starSpr = new Sprite();
         this.starSpr.x = 357;
         this.starSpr.y = 27;
         bd = RslLoaderManager.getInstance("itemtip.s1",10,10) as BitmapData;
         this.starSpr.addChild(new Bitmap(bd));
         this.content1.addChild(this.starSpr);
         this.starSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onStarMouseTip);
         this.starSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onStarMouseTip);
         this.tianGangZhengQiSpr = new Sprite();
         this.tianGangZhengQiSpr.x = 220 - 10;
         this.tianGangZhengQiSpr.y = 4;
         addChild(this.tianGangZhengQiSpr);
         ToolTips.createToolTips(this.tianGangZhengQiSpr,this,function(param1:*, param2:MouseEvent):String
         {
            var _loc3_:String = "";
            if(cheng1)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("武林传奇1") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇2") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇3") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇4") + "<br>" + LanResManager.getLanCommonTextWords("武林传奇5") + "</font>";
               _loc3_ += "</textformat>";
            }
            else if(cheng2)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("英雄传说1") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说2") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说3") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说4") + "<br>" + LanResManager.getLanCommonTextWords("英雄传说5") + "</font>";
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
         this.hpTitle = new FTextArea();
         with(this.hpTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20 - 17;
            y = 313;
            textColor = StaticValue.BlUE20;
         }
         this.hpTitle.htmlText = LanResManager.getLanTextWords(this,"生命");
         this.expBar = new ColorBar(5,99,5,true,true,true,LanResManager.getLanTextWords(this,"当前经验"),LanResManager.getLanTextWords(this,"本级经验"),LanResManager.getLanTextWords(this,"经验获得途径",[StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]));
         this.content1.addChild(this.expBar);
         this.expBar.x = 85 - 17;
         this.expBar.y = 41;
         this.zhenqiBar = new ColorBar(5,99,5,true,true,true,LanResManager.getLanTextWords(this,"当前真气"),LanResManager.getLanTextWords(this,"修炼上限"),LanResManager.getLanTextWords(this,"真气获得途径",[StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]));
         this.content1.addChild(this.zhenqiBar);
         this.zhenqiBar.x = 265 - 17;
         this.zhenqiBar.y = 41;
         this.hpBar = new ColorBar(1,156,5);
         this.hpBar.x = 58 - 17;
         this.hpBar.y = 318;
         this.mpBar = new ColorBar(2,156,5);
         this.mpBar.x = 58 - 17;
         this.mpBar.y = 333;
         this.nqBar = new ColorBar(4,156,5);
         this.nqBar.x = 58 - 17;
         this.nqBar.y = 348;
         this.skillTitle = new FTextArea();
         with(this.skillTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 256 - 17;
            y = 79;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'5\'>" + LanResManager.getLanCommonTextWords("生命上限") + "<br>" + LanResManager.getLanCommonTextWords("内力上限") + "<br>" + LanResManager.getLanCommonTextWords("体力上限") + "<br>" + LanResManager.getLanCommonTextWords("攻　　击") + "<br>" + LanResManager.getLanCommonTextWords("防　　御") + "<br>" + LanResManager.getLanCommonTextWords("暴　　击") + "<br>" + LanResManager.getLanCommonTextWords("闪　　避") + "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击速度") + "<br>" + LanResManager.getLanCommonTextWords("移动速度") + "</font></textformat>";
         }
         this.content1.addChild(this.skillTitle);
         this.skillValue = new FTextArea();
         with(this.skillValue)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 326 - 17;
            y = 79;
            textColor = StaticValue.WHITE;
         }
         this.content1.addChild(this.skillValue);
         this.ft = new FTextArea();
         with(this.ft)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 230 - 17;
            y = 265;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'5\'>" + LanResManager.getLanCommonTextWords("武功境界") + "<br></textformat>";
         }
         this.content1.addChild(this.ft);
         this.wugongBar = new ColorBar(5,99,5);
         this.content1.addChild(this.wugongBar);
         this.wugongBar.x = 290 - 17;
         this.wugongBar.y = 271;
         this.jingmaiBar = new ColorBar(5,99,5);
         this.jingmaiBar.x = 290 - 17;
         this.jingmaiBar.y = 231;
         this.chengjiuBar = new ColorBar(5,99,5);
         this.chengjiuBar.x = 290 - 17;
         this.chengjiuBar.y = 249;
         this.pointTitle = new FTextArea();
         with(this.pointTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 233 - 17;
            y = 315;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'7\'>" + LanResManager.getLanCommonTextWords("进攻型") + "<br>" + LanResManager.getLanCommonTextWords("防御型") + "<br></textformat>";
         }
         this.content1.addChild(this.pointTitle);
         this.pointTitle = new FTextArea();
         with(this.pointTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 323 - 17;
            y = 315;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'7\'>" + LanResManager.getLanCommonTextWords("轻身型") + "<br>" + LanResManager.getLanCommonTextWords("健体型") + "</textformat>";
         }
         this.content1.addChild(this.pointTitle);
         this.pointValue1 = new FTextArea();
         with(this.pointValue1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 278 - 17;
            y = 315;
            textColor = StaticValue.WHITE;
         }
         this.content1.addChild(this.pointValue1);
         this.pointValue2 = new FTextArea();
         with(this.pointValue2)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 368 - 17;
            y = 315;
            textColor = StaticValue.WHITE;
         }
         this.content1.addChild(this.pointValue2);
         this.ico = new CharAttributeOccultIco();
         this.content1.addChild(this.ico);
         this.ico.isMainChar = false;
         this.ico.x = 137;
         this.ico.y = 70;
         this.zanwenMask = new Sprite();
         this.content1.addChild(this.zanwenMask);
         this.zanwenMask.x = 384;
         this.zanwenMask.y = 3;
         this.zanwenMask.mouseEnabled = false;
         with(this.zanwenMask.graphics)
         {
            beginFill(0);
            drawRect(0,0,182 + 24,364);
            endFill();
         }
         this.zanwenValue = new OtherAttributeCanvas();
         this.zanwenValue.x = 384;
         this.zanwenValue.y = 3;
         this.zanwenValue.mask = this.zanwenMask;
         this.zanwenBtn = new FSimpleButton();
         this.zanwenBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级在60级以上的玩家将拥有更多战斗属性") + "</font>";
         this.zanwenBtn.skin = "attribute_otherBtn";
         this.content1.addChild(this.zanwenBtn);
         this.zanwenBtn.x = 305;
         this.zanwenBtn.y = 58;
         this.zanwenBtn.addEventListener(MouseEvent.CLICK,this.onShowLv);
         this.tcxxzlBtn = new SecondButton();
         this.tcxxzlBtn.label = LanResManager.getLanTextWords(this,"弹出详细资料");
         this.tcxxzlBtn.x = 306 - 10;
         this.tcxxzlBtn.y = 334;
         this.tcxxzlBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.content2 = new Sprite();
         this.content2.x = 385;
         this.content2.y = 1;
         addChild(this.content2);
         this.bgImg2 = new Bitmap();
         this.content2.addChild(this.bgImg2);
         this.bgImg2.name = "ui.marriage.TA.ui";
         this.wuxueContainer = new Sprite();
         this.content2.addChild(this.wuxueContainer);
         with(this.wuxueContainer)
         {
            x = 7;
            y = 26;
         }
         this.wuxueContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.wuxueContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.xinzengqingyuBtn = new SmallButton();
         this.xinzengqingyuBtn.label = LanResManager.getLanTextWords(this,"新增轻语");
         this.content2.addChild(this.xinzengqingyuBtn);
         this.xinzengqingyuBtn.x = 75 + 40;
         this.xinzengqingyuBtn.y = 70;
         this.xinzengqingyuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         XinzengqingyuListRender.$parent = this.$parent;
         this.listContainer = new Sprite();
         this.content2.addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 5;
            y = 95;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,145,120);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new XinzengqingyuListRender();
         this.giftList.listWidth = 140;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.Scroll = new FVScorllBar(this.listContainer,120);
         this.content2.addChild(this.Scroll);
         this.Scroll.x = 150;
         this.Scroll.y = 95;
         this.yupeiContainer = new Sprite();
         this.content2.addChild(this.yupeiContainer);
         with(this.yupeiContainer)
         {
            x = 19;
            y = 243;
         }
         this.yupeiContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown1);
         this.yupeiContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp1);
         this.ghypBtn = new SecondButton();
         this.ghypBtn.label = LanResManager.getLanTextWords(this,"更换玉佩");
         this.content2.addChild(this.ghypBtn);
         this.ghypBtn.width = 70;
         this.ghypBtn.x = 10;
         this.ghypBtn.y = 290;
         this.ghypBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yzxsBtn = new SecondButton();
         this.yzxsBtn.label = LanResManager.getLanTextWords(this,"一纸休书");
         this.yzxsBtn.width = 75;
         this.content2.addChild(this.yzxsBtn);
         this.yzxsBtn.x = 90;
         this.yzxsBtn.y = 290;
         this.yzxsBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tdjmBtn = new SecondButton();
         this.tdjmBtn.label = LanResManager.getLanCommonTextWords("TA的资料");
         this.content2.addChild(this.tdjmBtn);
         this.tdjmBtn.x = 10;
         this.tdjmBtn.y = 313;
         this.tdjmBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jbhyBtn = new SecondButton();
         this.jbhyBtn.label = LanResManager.getLanTextWords(this,"举办婚宴");
         this.content2.addChild(this.jbhyBtn);
         this.jbhyBtn.x = 90;
         this.jbhyBtn.y = 313;
         this.jbhyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tdwgBtn = new SecondButton();
         this.tdwgBtn.label = LanResManager.getLanTextWords(this,"TA的武功");
         this.content2.addChild(this.tdwgBtn);
         this.tdwgBtn.x = 10;
         this.tdwgBtn.y = 336;
         this.tdwgBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.dtyxBtn = new SecondButton();
         this.dtyxBtn.label = LanResManager.getLanCommonTextWords("神雕情缘");
         this.dtyxBtn.x = 90;
         this.dtyxBtn.y = 336;
         this.dtyxBtn.enabled = false;
         this.dtyxBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.content3 = new Sprite();
         this.content3.x = 0;
         this.content3.y = 0;
         addChild(this.content3);
         this.bgImg3 = new Bitmap();
         this.content3.addChild(this.bgImg3);
         this.bgImg3.name = "ui.marriage.TA.1.ui";
         csft = new FTextArea();
         with(csft)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 7;
            y = 25;
            textColor = StaticValue.WHITE;
         }
         csft.htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"选择一个您心仪的另一半",[StaticValue.PURPLE_HTML,StaticValue.PURPLE_HTML,StaticValue.PURPLE_HTML,StaticValue.PURPLE_HTML,StaticValue.PURPLE_HTML,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML],false) + "</textformat>";
         this.content3.addChild(csft);
         csft = new FTextArea();
         with(csft)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 7;
            y = 167;
            textColor = StaticValue.WHITE;
         }
         csft.htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"和合双修",[StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,StaticValue.BLUE_HTML,StaticValue.BLUE_HTML,StaticValue.BLUE_HTML],false) + "</textformat>";
         this.content3.addChild(csft);
         this.content3.visible = false;
         this.equipList = new EquipList();
         this.equipList.x = 20 - 5;
         this.equipList.y = 320 - 5;
         this.equipList.$parent = this;
         this.equipList.$parent2 = this.$parent;
         this.equipList.setClickSta(false,true);
         addChild(this.equipList);
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
            this.zanwenValue.x = 212;
            TweenMax.to(this.zanwenValue,1,{"x":384});
         }
         else
         {
            TweenMax.to(this.zanwenValue,1,{
               "x":212,
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
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.tcxxzlBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYCONSORT_TANCHUXIANGXIZILIAO_CLICK));
               break;
            case this.xinzengqingyuBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYCONSORT_XINZENGQINGYU_CLICK));
               break;
            case this.ghypBtn:
               this.showYupeiSwapPanelFun();
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYCONSORT_GENGHUANYUPEI_CLICK));
               break;
            case this.yzxsBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYCONSORT_YIZHIXIUSHU_CLICK));
               break;
            case this.tdjmBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYCONSORT_TANCHUXIANGXIZILIAO_CLICK));
               break;
            case this.jbhyBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYCONSORT_JUBANHUNYAN_CLICK));
               break;
            case this.tdwgBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYCONSORT_TADEWUGONG_CLICK));
               break;
            case this.dtyxBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYCONSORT_SHENDIAOXIALV_CLICK));
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.wuxueContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.wuxueContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_MYCONSORT_SKILL_DRAG_START,"",this.currSkill));
            }
            this.wuxueContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.wuxueContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onMouseDown1(param1:MouseEvent) : void
      {
         if((param1.target as ItemFace).getBaseItem() is Goods)
         {
            return;
         }
         this.yupeiContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove1(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.yupeiContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_MYCONSORT_SKILL_DRAG_START,"",this.currSkill));
            }
            this.yupeiContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
         }
      }
      
      private function onMouseUp1(param1:MouseEvent) : void
      {
         this.yupeiContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
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
         this.party.htmlText = "<textformat leading=\'4\'>" + this.arr1[6] + "<br>" + this.arr1[9] + "</textformat>";
         this.zanwenValue.setShengWang(this.arr1[1],this.arr1[8],this.arr1[10],this.arr1[11],this.arr1[12]);
      }
      
      public function setZhenQi(param1:int, param2:int) : void
      {
         this.zhenqiBar.setValue(param1,param2);
      }
      
      public function setHPMP(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.hpBar.setValue(param1,param2);
         this.mpBar.setValue(param3,param4);
         this.nqBar.setValue(param5,param6);
      }
      
      public function setSkillValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:int, param6:int, param7:Number, param8:Number, param9:Number) : void
      {
         this._skillValue1 = param1;
         this._skillValue2 = param2;
         this._skillValue3 = param3;
         this._skillValue4 = param4;
         this._skillValue5 = param5;
         this._skillValue6 = param6;
         this.skillValue.htmlText = "<textformat leading=\'5\'>" + param7 + "<br>" + param8 + "<br>" + param9 + "<br>" + param1 + "<br>" + param2 + "<br>" + param3 + "<br>" + param4 + "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param5 + "<br>" + param6 + "</font></textformat>";
      }
      
      public function setPoint(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this._point1 = this.point1 = param1;
         this._point2 = this.point2 = param2;
         this._point3 = this.point3 = param3;
         this._point4 = this.point4 = param4;
         this._point5 = this.point5 = param5;
         this.pointValue1.htmlText = "<textformat leading=\'7\'>" + param1 + "<br>" + param2 + "<br>" + "</textformat>";
         this.pointValue2.htmlText = "<textformat leading=\'7\'>" + param3 + "<br>" + param4 + "<br>" + "</textformat>";
      }
      
      public function setJingjie(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.wugongBar.setValue(param1,param2);
         this.jingmaiBar.setValue(param3,param4);
         this.chengjiuBar.setValue(param5,param6);
      }
      
      public function setShowItem(param1:Array, param2:int = 0) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         var _loc7_:Boolean = false;
         var _loc8_:DisplayObject = null;
         var _loc9_:DisplayObject = null;
         this.wuShengQiDict = new Dictionary();
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.equipList.initEquipList();
         var _loc4_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_] as Goods;
            if(!(_loc5_.res.position == ItemPositionRange.POSTION_BOW || _loc5_.res.position == ItemPositionRange.POSTION_ZHENHUN))
            {
               _loc6_ = new ItemFace(_loc5_);
               _loc7_ = true;
               switch(_loc5_.res.position)
               {
                  case ItemPositionRange.POSTION_WUQI:
                     _loc6_.x = 0;
                     _loc6_.y = 0;
                     break;
                  case ItemPositionRange.POSTION_QIBING:
                     _loc6_.x = 0;
                     _loc6_.y = 41;
                     break;
                  case ItemPositionRange.POSTION_YIFU:
                     _loc6_.x = 0;
                     _loc6_.y = 82;
                     break;
                  case ItemPositionRange.POSTION_HUSHOU:
                     _loc6_.x = 0;
                     _loc6_.y = 123;
                     break;
                  case ItemPositionRange.POSTION_HUYAO:
                     _loc6_.x = 0;
                     _loc6_.y = 164;
                     break;
                  case ItemPositionRange.POSTION_HUXUE:
                     _loc6_.x = 0;
                     _loc6_.y = 205;
                     break;
                  case ItemPositionRange.POSTION_TOUSHI:
                     _loc6_.x = 168;
                     _loc6_.y = 0;
                     break;
                  case ItemPositionRange.POSTION_XIANGLIAN:
                     _loc6_.x = 168;
                     _loc6_.y = 41;
                     break;
                  case ItemPositionRange.POSTION_JIEZHI:
                     _loc6_.x = 168;
                     _loc6_.y = 82;
                     break;
                  case ItemPositionRange.POSTION_SHOUZHUO:
                     _loc6_.x = 168;
                     _loc6_.y = 123;
                     break;
                  case ItemPositionRange.POSTION_YAOZHUI:
                     _loc6_.x = 168;
                     _loc6_.y = 164;
                     break;
                  case ItemPositionRange.POSTION_PIFENG:
                     _loc6_.x = 168;
                     _loc6_.y = 205;
                     break;
                  case ItemPositionRange.POSTION_WULINGONGDIXUNZHANG:
                     _loc6_.x = 121;
                     _loc6_.y = 168;
                     break;
                  case ItemPositionRange.POSTION_TESHU:
                     _loc8_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_FUZHIPIN));
                     _loc9_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_PEIJIAN));
                     if(_loc8_ != null && _loc9_ != null)
                     {
                        _loc8_.x = 84;
                        _loc8_.y = 205 - 37;
                        _loc9_.x = 84;
                        _loc9_.y = 205 - 37 - 37;
                     }
                     else if(_loc8_ == null && _loc9_ != null)
                     {
                        _loc9_.x = 84;
                        _loc9_.y = 205 - 37;
                     }
                     else if(_loc8_ != null && _loc9_ == null)
                     {
                        _loc8_.x = 84;
                        _loc8_.y = 205 - 37;
                     }
                     _loc6_.x = 84;
                     _loc6_.y = 205;
                     break;
                  case ItemPositionRange.POSTION_HUIZHANG:
                  case ItemPositionRange.POSTION_JINIANXUNZHANG:
                  case ItemPositionRange.POSTION_KUAPINGTAI_BIWU_XUNZHANG:
                  case ItemPositionRange.POSTION_ZHUANGBEIWEIZHI1:
                  case ItemPositionRange.POSTION_ZHUANGBEIWEIZHI2:
                  case ItemPositionRange.POSTION_FUZHIPIN:
                  case ItemPositionRange.POSTION_ZHANJIA:
                  case ItemPositionRange.POSTION_CIQING:
                  case ItemPositionRange.POSTION_DWJSHUIZHANG:
                  case ItemPositionRange.POSTION_PEIJIAN:
                  case ItemPositionRange.POSTION_BOSS_HUIZHANG:
                  case ItemPositionRange.POSTION_HUIZHANG2:
                  case ItemPositionRange.POSTION_HUIZHANG3:
                  case ItemPositionRange.POSTION_HUIZHANG4:
                  case ItemPositionRange.POSTION_HUIZHANG5:
                  case ItemPositionRange.POSTION_HUIZHANG6:
                  case ItemPositionRange.POSTION_HUIZHANG7:
                  case ItemPositionRange.POSTION_HUIZHANG8:
                  case ItemPositionRange.POSTION_HUIZHANG9:
                  case ItemPositionRange.POSTION_HUIZHANG10:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI1:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI2:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI3:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI4:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI5:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI6:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI7:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI8:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI9:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI10:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI11:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI12:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI13:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI14:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI15:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI16:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI17:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI18:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI19:
                  case ItemPositionRange.POSTION_HUODONG_ZHUANGBEI20:
                     this.equipList.addEuqip(_loc5_);
                     _loc7_ = false;
                     break;
                  default:
                     _loc7_ = false;
               }
               if(_loc5_.res.position >= ItemPositionRange.POSTION_XUNZHANG_2018_ARR.x && _loc5_.res.position <= ItemPositionRange.POSTION_XUNZHANG_2018_ARR.y || _loc5_.res.position >= ItemPositionRange.POSTION_HUODONG_ARR.x && _loc5_.res.position <= ItemPositionRange.POSTION_HUODONG_ARR.y || _loc5_.res.position >= ItemPositionRange.POSTION_HUODONG_ARR1.x && _loc5_.res.position <= ItemPositionRange.POSTION_HUODONG_ARR1.y)
               {
                  this.equipList.addEuqip(_loc5_);
                  _loc7_ = false;
               }
               if(_loc5_.id == param2)
               {
                  _loc6_.x = 84 - 37;
                  _loc6_.y = 205;
                  _loc7_ = true;
               }
               if(_loc5_.res.position >= ItemPositionRange.POSITON_XINWEIZHI_XUNZHANG_ARR.x && _loc5_.res.position <= ItemPositionRange.POSITON_XINWEIZHI_XUNZHANG_ARR.y)
               {
                  this.wuShengQiDict[_loc5_.res.position] = _loc5_;
                  _loc7_ = false;
               }
               if(_loc7_)
               {
                  _loc6_.showRedMask();
                  _loc6_.showStrengthenLv = true;
                  _loc6_.name = String(_loc5_.res.position);
                  this.equipContainer.addChild(_loc6_);
               }
            }
            _loc3_++;
         }
         this.equipList.setEquipItem();
      }
      
      private function resizeXuanyuanjianYlzr() : void
      {
         var _loc24_:DisplayObject = null;
         var _loc1_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_SHENQI));
         var _loc2_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_YLZR));
         var _loc3_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_STDRJ));
         var _loc4_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_AOJIAN));
         var _loc5_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_GJMY));
         var _loc6_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_LONGYA));
         var _loc7_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_POJUN));
         var _loc8_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_DAGOUBANG));
         var _loc9_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_XUANTIEZHONGJIAN));
         var _loc10_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_XINGTIAN_GUOFU));
         var _loc11_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_GUXING_GUOFU));
         var _loc12_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_JINWUMINGGUANGTANG_GUOFU));
         var _loc13_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSTION_LIETIANBAWANGJI_GUOFU));
         var _loc14_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_ZILINGHUANYUEJI_GUOFU));
         var _loc15_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_WUYINGJIAN_GUOFU));
         var _loc16_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_SHENGXIAOSHENQI));
         var _loc17_:DisplayObject = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_HUOYUN_GUOFU));
         var _loc18_:int = 36;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:Array = [];
         var _loc22_:int = 0;
         while(_loc22_ < ItemPositionRange.POSITION_NB_WEAPON_ARR.length)
         {
            _loc24_ = this.equipContainer.getChildByName(String(ItemPositionRange.POSITION_NB_WEAPON_ARR[_loc22_]));
            if(_loc24_)
            {
               _loc21_.push(_loc24_);
            }
            _loc22_++;
         }
         var _loc23_:int = 0;
         while(_loc23_ < _loc21_.length)
         {
            if(_loc21_[_loc23_])
            {
               if(_loc19_ > 5)
               {
                  _loc21_[_loc23_].x = 272 - 226 + 36;
                  _loc21_[_loc23_].y = 211 - 6 - _loc18_ * _loc20_ - 36;
                  _loc20_++;
               }
               else
               {
                  _loc21_[_loc23_].x = 272 - 226;
                  _loc21_[_loc23_].y = 211 - 6 - _loc18_ * _loc19_;
                  _loc19_++;
               }
            }
            _loc23_++;
         }
         if(_loc1_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc1_.x = 60 - 4 - 9 + 36;
               _loc1_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc1_.x = 60 - 4 - 9;
               _loc1_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc2_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc2_.x = 60 - 4 - 9 + 36;
               _loc2_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc2_.x = 60 - 4 - 9;
               _loc2_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc3_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc3_.x = 60 - 4 - 9 + 36;
               _loc3_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc3_.x = 60 - 4 - 9;
               _loc3_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc4_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc4_.x = 60 - 4 - 9 + 36;
               _loc4_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc4_.x = 60 - 4 - 9;
               _loc4_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc5_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc5_.x = 60 - 4 - 9 + 36;
               _loc5_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc5_.x = 60 - 4 - 9;
               _loc5_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc6_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc6_.x = 272 - 226 + 36;
               _loc6_.y = 211 - 6 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc6_.x = 272 - 226;
               _loc6_.y = 211 - 6 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc7_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc7_.x = 60 - 4 - 9 + 36;
               _loc7_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc7_.x = 60 - 4 - 9;
               _loc7_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc8_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc8_.x = 60 - 4 - 9 + 36;
               _loc8_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc8_.x = 60 - 4 - 9;
               _loc8_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc9_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc9_.x = 60 - 4 - 9 + 36;
               _loc9_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc9_.x = 60 - 4 - 9;
               _loc9_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc10_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc10_.x = 60 - 4 - 9 + 36;
               _loc10_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc10_.x = 60 - 4 - 9;
               _loc10_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc11_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc11_.x = 60 - 4 - 9 + 36;
               _loc11_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc11_.x = 60 - 4 - 9;
               _loc11_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc12_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc12_.x = 60 - 4 - 9 + 36;
               _loc12_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc12_.x = 60 - 4 - 9;
               _loc12_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc13_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc13_.x = 60 - 4 - 9 + 36;
               _loc13_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc13_.x = 60 - 4 - 9;
               _loc13_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc14_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc14_.x = 60 - 4 - 9 + 36;
               _loc14_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc14_.x = 60 - 4 - 9;
               _loc14_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc15_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc15_.x = 60 - 4 - 9 + 36;
               _loc15_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc15_.x = 60 - 4 - 9;
               _loc15_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc16_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc16_.x = 60 - 4 - 9 + 36;
               _loc16_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc16_.x = 60 - 4 - 9;
               _loc16_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
         if(_loc17_ != null)
         {
            if(_loc19_ > 5)
            {
               _loc17_.x = 60 - 4 - 9 + 36;
               _loc17_.y = 271 - 62 - 4 - _loc18_ * _loc20_ - 36;
               _loc20_++;
            }
            else
            {
               _loc17_.x = 60 - 4 - 9;
               _loc17_.y = 271 - 62 - 4 - _loc18_ * _loc19_;
               _loc19_++;
            }
         }
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
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
            if(value != 0)
            {
               flag = StaticValue.getMCByClassName(StaticValue.conversionFlagID(value)) as MovieClip;
               content1.addChildAt(flag,1);
               flag.x = 80 - flag.width / 2;
               flag.y = 70;
            }
         };
         RslLoaderManager.lazyLoad(onCom,null,GameConfig.fileBaseFolder + "res/data/mc/flag/lv1flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv2flag.swf",GameConfig.fileBaseFolder + "res/data/mc/flag/lv3flag.swf");
      }
      
      public function setYupei(param1:Goods = null) : void
      {
         if(Boolean(this.yupei) && Boolean(this.yupei.parent))
         {
            this.yupei.parent.removeChild(this.yupei);
         }
         if(!param1)
         {
            return;
         }
         this.yupei = new ItemFace(param1);
         this.content1.addChildAt(this.yupei,this.content1.getChildIndex(this.equipContainer) + 1);
         this.yupei.x = 125;
         this.yupei.y = 267;
      }
      
      public function setFuwiwuxueFun(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         while(this.wuxueContainer.numChildren > 0)
         {
            this.wuxueContainer.removeChildAt(0);
         }
         while(_loc3_ < param1.length)
         {
            _loc2_ = new ItemFace(param1[_loc3_]);
            _loc2_.x = _loc3_ * 40;
            _loc2_.showKungFuTag();
            this.wuxueContainer.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function setYupeiFun(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         while(this.yupeiContainer.numChildren > 0)
         {
            this.yupeiContainer.removeChildAt(0);
         }
         while(_loc3_ < param1.length)
         {
            _loc2_ = new ItemFace(param1[_loc3_]);
            if(_loc3_ == 0)
            {
               _loc2_.x = 0;
            }
            else if(_loc3_ == 1)
            {
               _loc2_.x = 63;
            }
            else if(_loc3_ == 2)
            {
               _loc2_.x = 103;
            }
            this.yupeiContainer.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function setChatContent(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
         this.Scroll.update();
      }
      
      public function showXinzenqingyuFun() : void
      {
         if(!this.xinzengxinyuPanel)
         {
            this.xinzengxinyuPanel = new XinzengxinyuPanel();
            this.xinzengxinyuPanel.$parent = this.$parent;
         }
         this.xinzengxinyuPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.xinzengxinyuPanel);
         this.xinzengxinyuPanel.ft1.text = "";
         this.xinzengxinyuPanel.x = (GameConfig.sceneWidth - this.xinzengxinyuPanel.width) / 2;
         this.xinzengxinyuPanel.y = (GameConfig.sceneHeight - this.xinzengxinyuPanel.height) / 2;
      }
      
      public function showYupeiSwapPanelFun() : void
      {
         if(!this.yupeiswapPanel)
         {
            this.yupeiswapPanel = new YupeiSwapPanel();
            this.yupeiswapPanel.$parent = this.$parent;
         }
         this.yupeiswapPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.yupeiswapPanel);
         this.yupeiswapPanel.x = (GameConfig.sceneWidth - this.yupeiswapPanel.width) / 2;
         this.yupeiswapPanel.y = (GameConfig.sceneHeight - this.yupeiswapPanel.height) / 2;
      }
      
      public function showLihunxiushuPanelFun() : void
      {
         if(!this.lihunxiushuPanel)
         {
            this.lihunxiushuPanel = new LihunxiushuPanel();
            this.lihunxiushuPanel.$parent = this.$parent;
         }
         this.lihunxiushuPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.lihunxiushuPanel);
         this.lihunxiushuPanel.x = (GameConfig.sceneWidth - this.lihunxiushuPanel.width) / 2;
         this.lihunxiushuPanel.y = (GameConfig.sceneHeight - this.lihunxiushuPanel.height) / 2;
      }
      
      public function setDangqianyupei(param1:Array) : void
      {
         this.yupeiswapPanel.setDangqianyupei(param1);
      }
      
      public function setSwapyupei(param1:Array) : void
      {
         if(!this.yupeiswapPanel)
         {
            this.yupeiswapPanel = new YupeiSwapPanel();
            this.yupeiswapPanel.$parent = this.$parent;
         }
         this.yupeiswapPanel.setSwapyupei(param1);
      }
      
      public function noOnlineFun() : void
      {
         this.content1.visible = true;
         this.content3.visible = false;
         this.expBar.setValue(0,0);
         this.charName.htmlText = "";
         this.level.htmlText = "";
         this.party.htmlText = "";
         this.zhenqiBar.setValue(0,0);
         this.hpBar.setValue(0,0);
         this.mpBar.setValue(0,0);
         this.nqBar.setValue(0,0);
         this.skillValue.htmlText = "";
         this.pointValue1.htmlText = "";
         this.pointValue2.htmlText = "";
         this.wugongBar.setValue(0,0);
         this.jingmaiBar.setValue(0,0);
         this.chengjiuBar.setValue(0,0);
         this.setShowItem([]);
         this.setYupeiFun([]);
         this.setFuwiwuxueFun([]);
         this.setYupei();
         this.setFlag(0);
         this.avatar = null;
         this.ico.setState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         this.ico.setSiShengShouState(0,0,0,0);
         this.ico.setXiantian(false,0,0,-1);
         this.ico.setHuXinYao(false);
         this.ico.setRouti(false);
         this.ico.setWuhun(0,false,false,0,false,0,false,false,0);
         this.xinzengqingyuBtn.enabled = true;
         this.ghypBtn.enabled = true;
         this.yzxsBtn.enabled = true;
         this.tdjmBtn.enabled = false;
         this.jbhyBtn.enabled = true;
         this.tdwgBtn.enabled = false;
         this.tcxxzlBtn.enabled = false;
         this.setStarSta(0);
         this.setStatusByString(null);
      }
      
      public function isMarriageFun(param1:Boolean) : void
      {
         if(param1)
         {
            this.content1.visible = true;
            this.content3.visible = false;
            this.xinzengqingyuBtn.enabled = true;
            this.ghypBtn.enabled = true;
            this.yzxsBtn.enabled = true;
            this.tdjmBtn.enabled = true;
            this.jbhyBtn.enabled = true;
            this.tdwgBtn.enabled = true;
            this.tcxxzlBtn.enabled = true;
            this.equipList.visible = true;
         }
         else
         {
            this.content1.visible = false;
            this.content3.visible = true;
            this.xinzengqingyuBtn.enabled = false;
            this.ghypBtn.enabled = false;
            this.yzxsBtn.enabled = false;
            this.tdjmBtn.enabled = false;
            this.jbhyBtn.enabled = false;
            this.tdwgBtn.enabled = false;
            this.equipList.visible = false;
         }
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
      }
      
      public function set9JianJianCheng(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number) : void
      {
         this.zanwenValue.set9JIanJiaCheng(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
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
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
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
                     starMc.x = -20;
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
         var bmp:DisplayObject = null;
         var sta:int = param1;
         while(this.tianGangZhengQiSpr.numChildren > 0)
         {
            this.tianGangZhengQiSpr.removeChildAt(0);
         }
         this.wushuangBo = GameState.dictTargetStatus[SpecialGoodsID.ZHU_LUANSHIWUSHUANG_ID];
         this.zhizuntianxiaBo = GameState.dictTargetStatus[SpecialGoodsID.ZHU_ZHIZUNTIANXIA_ID];
         this.cheng1 = GameState.dictTargetStatus[729746];
         this.cheng2 = GameState.dictTargetStatus[729747];
         if(this.cheng1)
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
         else if(this.cheng2)
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
         else if(this.wushuangBo)
         {
            if(this.zhizuntianxiaBo)
            {
               if(this.mcObj[3] == null)
               {
                  loadUrl = GameConfig.fileBaseFolder + "res/data/mc/tiangangzhengqi/zhizuntianxia.swf";
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
            else if(this.mcObj[2] == null)
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
               bmp = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/tiangangzhengqi/tiangangzhengqi.png",68,19);
               bmp.y = -2;
               bmp.y = -3;
               this.tianGangZhengQiSpr.addChild(bmp);
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
               _loc3_ = Boolean(this.wuShengQiDict[10001]) && Boolean(this.wuShengQiDict[10002]) && Boolean(this.wuShengQiDict[10002]) && Boolean(this.wuShengQiDict[10003]) && Boolean(this.wuShengQiDict[10004]);
               if(GameState.dictTargetStatus[SpecialGoodsID.QINGLONG_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("青龙精魄：") + "<br>" + "   " + LanResManager.getLanCommonTextWords("人物可吸收青龙精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + "   " + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活青龙印技能.") + "<br>" + "   " + LanResManager.getLanCommonTextWords("青龙印：攻击时100%触发青龙印，持续10秒； 在此状态下，人物将瞬间飞跃至天空中，消") + "<br>" + "   " + LanResManager.getLanCommonTextWords("失至对手视线之中。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictTargetStatus[SpecialGoodsID.BAIHU_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("白虎精魄：") + "<br>" + "   " + LanResManager.getLanCommonTextWords("人物可吸收白虎精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + "   " + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活白虎印技能.") + "<br>" + "   " + LanResManager.getLanCommonTextWords("白虎印：被攻击时100%触发白虎印，持续10秒；在此状态下，100%破除对手所有效果，对") + "<br>" + "   " + LanResManager.getLanCommonTextWords("手在此状态下，将无法触发任何抵抗BUFF，直至状态解除为止。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictTargetStatus[SpecialGoodsID.ZHUQUE_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("朱雀精魄：") + "<br>" + "   " + LanResManager.getLanCommonTextWords("人物可吸收朱雀精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + "   " + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活朱雀印技能.") + "<br>" + "   " + LanResManager.getLanCommonTextWords("朱雀印：攻击时100%触发朱雀印，持续10秒；对手在此状态下，将受到地狱之火不断灼烧，") + "<br>" + "   " + LanResManager.getLanCommonTextWords("每秒掉血60%，且对手双手受火焰燃烧，无法继续攻击操作。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictTargetStatus[SpecialGoodsID.XUANWU_JINGPO_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("玄武精魄：") + "<br>" + "   " + LanResManager.getLanCommonTextWords("人物可吸收玄武精魄提升攻击5888888889000 防御5888888889000 血量6888888889000 暴击") + "<br>" + "   " + LanResManager.getLanCommonTextWords("88888闪避 88888所有武功600000层且可激活玄武印技能.") + "<br>" + "   " + LanResManager.getLanCommonTextWords("玄武印：被攻击时100%触发玄武印，持续10秒；在此状态下，自身所受到的所有攻击、所有") + "<br>" + "   " + LanResManager.getLanCommonTextWords("百分比伤害、所有负面状态都将免疫，使自身进入无敌的状态，让对手不可侵犯。冷却60秒。") + "<br></font>";
               }
               if(GameState.dictTargetStatus[SpecialGoodsID.SHISHITAOZHUANGJIHUOSHI_ID])
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("史诗套装激活石：") + "<br>" + LanResManager.getLanCommonTextWords("套装属性：攻击88888亿 防御62888亿 血量90888亿 暴击 88888闪避88888") + "<br>" + LanResManager.getLanCommonTextWords("青龙战纹100%、白虎战纹100%、朱雀战纹80%、所有武功1400000层") + "<br>" + LanResManager.getLanCommonTextWords("史诗侵蚀：攻击时100%触发史诗侵蚀，持续10秒；自身在此状态下，对手所有攻击施发的技") + "<br>" + LanResManager.getLanCommonTextWords("能效果都将被史诗装备侵蚀，使自身达到免疫的状态；每受到对手一次，都将立即反噬对手") + "<br>" + LanResManager.getLanCommonTextWords("一次侵蚀效果，瞬间掉血80%，且使对手所有攻击都被立即停止，持续10秒。冷却60秒。") + "<br></font>";
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
   }
}

