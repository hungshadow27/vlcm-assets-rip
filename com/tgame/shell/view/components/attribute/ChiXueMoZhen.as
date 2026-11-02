package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class ChiXueMoZhen extends Sprite
   {
      
      public static const UI_CHIXUEMOZHEN_TUPO_CLOSE:String = "UI_CHIXUEMOZHEN_TUPO_CLOSE";
      
      public const CHIXUEMOZHEN_MAX:int = 30;
      
      private var _$parent:DisplayObject;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      public var bgImg:Bitmap;
      
      private var tupoBo:Boolean = false;
      
      private var isLockOn:Boolean = false;
      
      private var fc:FCanvas;
      
      private var curNameFta:FTextArea;
      
      private var jiaChengFta:FTextArea;
      
      private var miaoShuFta:FTextArea;
      
      private var tf:TextFormat;
      
      private var tupoBtn:SmallButton;
      
      private var fta:FTextArea;
      
      private var p:Point;
      
      private var tupoCanvas:ChiXueMoZhenTupoCanvas;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var skillImg:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var mainSkill2:Skill;
      
      private var mainSkillItemFace2:ItemFace;
      
      private var mainSkillContainer2:Sprite;
      
      private var currSkill2:ItemFace;
      
      private var moxueSpr:Sprite;
      
      private var moxueContainer:Sprite;
      
      private var moxueCircle:MovieClip;
      
      private var fireMc:MovieClip;
      
      private var equipContainer1:Sprite;
      
      private var equipContainer2:Sprite;
      
      private var equipContainer3:Sprite;
      
      private var equipContainer4:Sprite;
      
      private var bmp:Bitmap;
      
      private var tiShengBtn:NewButton;
      
      private var tiQuBtn:NewButton;
      
      private var juseSprite:Sprite;
      
      private var _avatar:Bitmap;
      
      private var nowMoXue:int;
      
      private var maxMoXue:int;
      
      private var isMainChar:Boolean;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var $class:Class;
      
      private var shuoMingBtn:SmallButton;
      
      private var shuoMingCanvas:FCanvas;
      
      private var xsjc:FTextArea;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var gongxun:FTextArea;
      
      private var fts4:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var checkZq2:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var fts6:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var fts7:FTextArea;
      
      private var checkWq2:FCheckBox;
      
      public function ChiXueMoZhen()
      {
         var $mask:Sprite;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
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
         this.fc = new FCanvas();
         this.fc.x = 1;
         this.fc.y = 1;
         this.fc.width = 404;
         this.fc.height = 366;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc = new FCanvas();
         this.fc.x = 220;
         this.fc.y = 290;
         this.fc.width = 184;
         this.fc.height = 75;
         this.fc.skin = "box";
         addChild(this.fc);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 4;
         this.bloodMcSpr.y = 4;
         addChild(this.bloodMcSpr);
         this.initShuoMingCanvas();
         this.juseSprite = new Sprite();
         this.juseSprite.x = -59 + 5;
         this.juseSprite.y = 170;
         addChild(this.juseSprite);
         this._avatar = new Bitmap();
         this.juseSprite.addChild(this._avatar);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 145;
         this.previousButton.y = 260;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 240;
         this.nextButton.y = 260;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.curNameFta = new FTextArea();
         with(this.curNameFta)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 75;
            height = 16;
            x = 165;
            y = 260;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            htmlText = "";
         }
         addChild(this.curNameFta);
         this.xsjc = new FTextArea();
         with(this.xsjc)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 90;
            height = 16;
            x = 10;
            y = 20;
            textColor = StaticValue.RED;
            htmlText = "";
         }
         this.xsjc.visible = false;
         addChild(this.xsjc);
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 90;
            height = 16;
            x = 230;
            y = 300;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("人物属性加成：");
         }
         addChild(this.fta);
         this.jiaChengFta = new FTextArea();
         with(this.jiaChengFta)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 150;
            height = 70;
            x = 230;
            y = 320;
            textColor = StaticValue.BLUE_HTML;
            htmlText = "";
         }
         addChild(this.jiaChengFta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 90;
            height = 16;
            x = 325;
            y = 300;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("附带技能：");
         }
         addChild(this.fta);
         this.skillImg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.addChild(this.skillImg);
         this.skillImg.x = 348;
         this.skillImg.y = 318;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 350;
         this.mainSkillContainer.y = 320;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.skillImg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.skillImg.x = 348;
         this.skillImg.y = 18;
         this.mainSkillContainer2 = new Sprite();
         this.mainSkillContainer2.x = 350;
         this.mainSkillContainer2.y = 20;
         this.mainSkillContainer2.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown2);
         this.mainSkillContainer2.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp2);
         this.moxueContainer = new Sprite();
         this.moxueSpr = new Sprite();
         this.moxueContainer.x = 15;
         this.moxueContainer.y = 190;
         this.moxueContainer.addChild(this.moxueSpr);
         this.moxueSpr.buttonMode = true;
         this.moxueSpr.addEventListener(MouseEvent.CLICK,this.onMoXueBtnClick);
         this.moxueSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onBallTip);
         this.moxueSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onBallTip);
         this.tiQuBtn = new NewButton();
         this.tiQuBtn.label = LanResManager.getLanCommonTextWords("提取");
         this.tiQuBtn.color = 9699267;
         this.tiQuBtn.setSkin("chixuemozhenBtn");
         this.tiQuBtn.setPandding(12,0,5,0);
         this.tiQuBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用魔血娃娃（空）可将血池内魔血提取至道具中。并与其他玩家交易。当拥有其他玩家的魔血娃娃（满）道具时，亦可将道具中魔血充入血池。") + "</font>";
         this.tiQuBtn.visible = false;
         this.tiQuBtn.x = 8;
         this.tiQuBtn.y = -35;
         this.tiQuBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.moxueContainer.addChild(this.tiQuBtn);
         this.tiShengBtn = new NewButton();
         this.tiShengBtn.label = LanResManager.getLanCommonTextWords("提升");
         this.tiShengBtn.color = 9699267;
         this.tiShengBtn.setSkin("chixuemozhenBtn");
         this.tiShengBtn.setPandding(12,0,5,0);
         this.tiShengBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当魔血值满值时，可提升魔血最大值。每次提升魔血容量扩充点。扩充血池会消耗当前所有魔血值。") + "</font>";
         this.tiShengBtn.x = 76;
         this.tiShengBtn.y = 55;
         this.tiShengBtn.visible = false;
         this.tiShengBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.moxueContainer.addChild(this.tiShengBtn);
         addChild(this.moxueContainer);
         this.tupoBtn = new SmallButton();
         this.tupoBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
         addChild(this.tupoBtn);
         this.tupoBtn.x = 270;
         this.tupoBtn.y = 260;
         this.tupoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.miaoShuFta = new FTextArea();
         with(this.miaoShuFta)
         {
            multiline = true;
            wordWrap = true;
            filters = StaticValue.filter;
            width = 190;
            height = 30;
            x = 10;
            y = 285;
            textColor = StaticValue.ORANGE;
            htmlText = "<font size = \'15\'>" + LanResManager.getLanCommonTextWords("赤血魔阵") + "</font>";
         }
         addChild(this.miaoShuFta);
         this.miaoShuFta = new FTextArea();
         with(this.miaoShuFta)
         {
            multiline = true;
            wordWrap = true;
            filters = StaticValue.filter;
            width = 210;
            height = 100;
            x = 10;
            y = 300;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'0\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("赤血魔阵，历代奇人从鲜血之中领悟之阵法，可将他人血脉据为己用，危机之时，亦可将血气爆发，发挥惊人之力。") + "</font></textformat>";
         }
         addChild(this.miaoShuFta);
         this.setEquipContainer();
         this.tupoCanvas = new ChiXueMoZhenTupoCanvas();
         this.tupoCanvas._parent2 = this;
         addChild(this.tupoCanvas);
         this.tupoCanvas.x = 138;
         this.tupoCanvas.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.tupoCanvas.mask = $mask;
         addEventListener(UI_CHIXUEMOZHEN_TUPO_CLOSE,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 230;
         this.fts3.y = 10 + 211;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("红名秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("属性提升：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：使用红名秘籍的玩家，每击杀一名任意玩家可为自身增加10点恶魔功勋，击杀同一个玩家") + "<br>" + LanResManager.getLanCommonTextWords("每天最多击杀10次，超过10次将不再获得恶魔功勋，必须继续去击杀其他玩家，每天击杀玩家获得的") + "<br>" + LanResManager.getLanCommonTextWords("恶魔功勋无上限。") + "<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 255 + 40 - 40;
         this.fts4.y = 7 + 20 + 105 - 66 + 175;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("火凤凰涅槃");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("经历烈火的煎熬和痛苦的考验，获得重生，并在重生中达到升华。") + "<br>" + LanResManager.getLanCommonTextWords("可将人物的所有坐骑重新涅槃，涅槃后提升人物所有属性2000%，且人物骑上坐骑将") + "<br>" + LanResManager.getLanCommonTextWords("转化成火凤凰，火凤凰每次翅膀挥动都将产生不灭之火，当人物进入战斗状态时，翅") + "<br>" + LanResManager.getLanCommonTextWords("膀都将挥动，每次挥动都将瞬间造成范围五格内的所有玩家瞬间掉血30%，不灭之火") + "<br>" + LanResManager.getLanCommonTextWords("无法抵抗，即使不可清除的BUFF都会产生掉血。火凤凰翅膀拥有火焰特效，永久存在。");
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 256 + 117;
         this.checkZq.y = 7 + 20 + 105 - 66 + 175;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 255 + 40;
         this.fts5.y = 7 + 20 + 105 - 66 + 25;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("赤血魔龙");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("赤血魔龙：激活赤血魔龙的玩家，可在赤血魔阵上开启魔龙转换功能。") + "<br>" + LanResManager.getLanCommonTextWords("魔龙吐息：攻击时有几率触发魔龙吐息，持续10秒；对手在此状态，所有") + "<br>" + LanResManager.getLanCommonTextWords("内力，体力、武学都将被魔龙封印，且每秒都将受到魔龙的吸血大法影响，") + "<br>" + LanResManager.getLanCommonTextWords("瞬间掉血60%。");
            return _loc1_ + "</textformat>";
         });
         this.checkZq2 = new FCheckBox();
         addChild(this.checkZq2);
         this.checkZq2.x = 256 + 117;
         this.checkZq2.y = 7 + 20 + 105 - 66 + 25;
         this.checkZq2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8;
         this.equipContainers.y = 12 + 30 + 135 + 35 - 30 - 20;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
         this.fts6 = new FTextArea();
         this.fts6.x = 10 + 295 + 12;
         this.fts6.y = 28 + 20 + 100 + 40 - 20 - 5;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 42;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("魔剑");
         this.fts6.visible = false;
         addChild(this.fts6);
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 10 + 295 + 12;
         this.checkWq.y = 28 + 20 + 20 + 100 + 40 - 20 - 5;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts7 = new FTextArea();
         this.fts7.x = 10 + 45 + 12 - 50;
         this.fts7.y = 28 + 20 + 100 + 40 - 20 - 5 - 150 + 60 + 10;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 80;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("邪龙魔剑");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("邪龙魔剑：古代魔龙为噬神精心锻造而成的邪龙魔剑，用千万的龙骨之魂锻造而成。") + "<br>" + LanResManager.getLanCommonTextWords("邪龙附体：攻击时有几率真触发邪龙附体，持续10秒；对手在此状态下，将受到邪") + "<br>" + LanResManager.getLanCommonTextWords("龙邪念侵蚀，无法使用任何技能；且邪龙是由邪念创造的生命体，剧毒无比，对手") + "<br>" + LanResManager.getLanCommonTextWords("在邪龙附体状态下，会受到剧毒伤害，每秒掉血50%；当邪龙附体状态解除时，被") + "<br>" + LanResManager.getLanCommonTextWords("邪龙剥夺行动能力，无法移动、跳跃和回复血量，持续10秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq2 = new FCheckBox();
         addChild(this.checkWq2);
         this.checkWq2.visible = false;
         this.checkWq2.x = 10 + 45 + 12;
         this.checkWq2.y = 28 + 20 + 100 + 40 - 20 - 5 - 150 + 70;
         this.checkWq2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this.checkZq2.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,14]));
               break;
            case this.checkZq2:
               this.checkZq.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq2.selectState,35]));
               break;
            case this.checkWq:
               this.checkWq2.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,63]));
               break;
            case this.checkWq2:
               this.checkWq.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq2.selectState,98]));
         }
      }
      
      private function initShuoMingCanvas() : void
      {
         var ft:FTextArea;
         this.shuoMingCanvas = new FCanvas();
         this.shuoMingCanvas.skin = "menuBg";
         this.shuoMingCanvas.width = 165 + 20;
         this.shuoMingCanvas.height = 360 - 70;
         ft = new FTextArea();
         ft.width = 193;
         ft.height = 20;
         ft.x = -20 + 10;
         ft.y = 5;
         ft.textColor = StaticValue.YELLOW;
         ft.filters = StaticValue.filter;
         ft.defaultTextFormat = StaticValue.format;
         ft.htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("阵法升级") + "</font>";
         this.shuoMingCanvas.addChild(ft);
         ft = new FTextArea();
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.x = 8;
         ft.y = 25;
         ft.textColor = StaticValue.GREEN;
         ft.filters = StaticValue.filter;
         ft.width = 170;
         ft.wordWrap = true;
         this.shuoMingCanvas.addChild(ft);
         ft.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("阵法升级，需要向血魔四个部位：左臂，元神，心脏，右臂的镶嵌槽内，放入血魂道具。（背包中拥有则自动放入）放入道具后，可点击阵法提升打开阵法提升界面。使用道具“血神经”进行阵法升级。") + "<br><br>" + "</textformat>";
         ft = new FTextArea();
         ft.width = 193;
         ft.height = 20;
         ft.x = -20 + 10;
         ft.y = 150 + 5;
         ft.textColor = StaticValue.YELLOW;
         ft.filters = StaticValue.filter;
         ft.defaultTextFormat = StaticValue.format;
         ft.htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("血魔附体") + "</font>";
         this.shuoMingCanvas.addChild(ft);
         ft = new FTextArea();
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.x = 8;
         ft.y = 170;
         ft.width = 170;
         ft.wordWrap = true;
         ft.textColor = StaticValue.BLUE;
         ft.filters = StaticValue.filter;
         this.shuoMingCanvas.addChild(ft);
         ft.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("使用血魔附体技能，减少当前生命，大幅提升攻击，阵法等级越高，发挥血量百分比越高，获得攻击力越高。同时，魔血同样影响攻击力。当前魔血值越高，则攻击力提升越多。") + "<br><br>" + "</textformat>";
         this.shuoMingBtn = new SmallButton();
         this.shuoMingBtn.label = LanResManager.getLanCommonTextWords("阵法说明");
         addChild(this.shuoMingBtn);
         this.shuoMingBtn.x = 330;
         this.shuoMingBtn.y = 260;
         this.shuoMingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 10;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("赤血魔阵终极阵法已激活");
         this.fts.visible = false;
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("赤血魔阵终极阵法：") + "<br>" + LanResManager.getLanCommonTextWords("提升赤血魔阵属性（攻击8888888、防御6888888、血量88888888、暴击3888、") + "<br>" + LanResManager.getLanCommonTextWords("闪避3888、所有武功提升十二层），并且只要启动魔血变身效果后，") + "<br>" + LanResManager.getLanCommonTextWords("将可以使用魔血秘药对自身血量产生回血效果（永久有效）。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10 + 230;
         this.fts1.y = 10 + 20 + 211;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("嗜血魔王最终秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击3000亿、防御2000亿、血量6000亿、暴击48888、闪避48888、所有武功提升50000层") + "<br>" + LanResManager.getLanCommonTextWords("嗜血狂战（特殊技能）：攻击时有几率触发嗜血狂战，受到赤血魔王附体，在此状态下将100%无视对手") + "<br>" + LanResManager.getLanCommonTextWords("所有防御及减免伤害效果，对对手造成重度伤害，状态将持续20秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 230 - 30;
         this.fts2.y = 10;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("赤血返杀秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("赤血返杀秘籍：攻击5688888888900 防御4288888888900 血量6088888888900暴击 88888闪避88888") + "<br>" + LanResManager.getLanCommonTextWords("★  赤血返杀秘籍特殊属性：青龙战纹5%、朱雀战纹4%、白虎战纹5% 所有武功1000000层") + "<br>" + LanResManager.getLanCommonTextWords("★  赤血返杀 —— 当自身血量低于30%，自身将触发一个赤血返杀状态，持续10秒。在此状态期间，") + "<br>" + LanResManager.getLanCommonTextWords("一旦受到对手5次攻击，将反弹给对手一次秒杀攻击。技能冷却时间30秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.gongxun = new FTextArea();
         this.gongxun.x = 10 + 230;
         this.gongxun.y = 201;
         this.gongxun.textColor = StaticValue.GREEN;
         this.gongxun.width = 170;
         this.gongxun.height = 20;
         this.gongxun.visible = false;
         addChild(this.gongxun);
      }
      
      private function setEquipContainer() : void
      {
         this.equipContainer1 = new Sprite();
         this.equipContainer1.x = 120;
         this.equipContainer1.y = 45;
         this.equipContainer1.name = "1";
         this.equipContainer1.addEventListener(MouseEvent.MOUSE_OVER,this.onItemTip);
         this.equipContainer1.addEventListener(MouseEvent.MOUSE_OUT,this.onItemTip);
         addChild(this.equipContainer1);
         this.equipContainer2 = new Sprite();
         this.equipContainer2.x = 250;
         this.equipContainer2.y = 45;
         this.equipContainer2.name = "2";
         this.equipContainer2.addEventListener(MouseEvent.MOUSE_OVER,this.onItemTip);
         this.equipContainer2.addEventListener(MouseEvent.MOUSE_OUT,this.onItemTip);
         addChild(this.equipContainer2);
         this.equipContainer3 = new Sprite();
         this.equipContainer3.x = 50;
         this.equipContainer3.y = 120;
         this.equipContainer3.name = "3";
         this.equipContainer3.addEventListener(MouseEvent.MOUSE_OVER,this.onItemTip);
         this.equipContainer3.addEventListener(MouseEvent.MOUSE_OUT,this.onItemTip);
         addChild(this.equipContainer3);
         this.equipContainer4 = new Sprite();
         this.equipContainer4.x = 320;
         this.equipContainer4.y = 120;
         this.equipContainer4.name = "4";
         this.equipContainer4.addEventListener(MouseEvent.MOUSE_OVER,this.onItemTip);
         this.equipContainer4.addEventListener(MouseEvent.MOUSE_OUT,this.onItemTip);
         addChild(this.equipContainer4);
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         if(!this.isMainChar)
         {
            return;
         }
         switch(param1.target)
         {
            case this.tiQuBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIXUEMOZHEN_MOXUE_GUANZHU));
               break;
            case this.tiShengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIXUEMOZHEN_MOXUE_TISHENG));
         }
      }
      
      private function onBallTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               param1.currentTarget.addEventListener(MouseEvent.MOUSE_MOVE,this.onBallTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               _loc2_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前魔血：") + this.nowMoXue + "/" + this.maxMoXue + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("击杀其他玩家可获得魔血点魔血用于使用血魔附体技能可通过与其他玩家交易获得魔血娃娃(满)来补充血量点击弹出提取与升级按钮") + "</font><br>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               this.moxueCircle.filters = [];
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               param1.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this.onBallTip);
         }
      }
      
      private function onMoXueBtnClick(param1:MouseEvent) : void
      {
         if(!this.isMainChar)
         {
            return;
         }
         this.tiShengBtn.visible = !this.tiShengBtn.visible;
         this.tiQuBtn.visible = !this.tiQuBtn.visible;
         this.showBigBall(this.tiQuBtn.visible);
      }
      
      private function showBigBall(param1:Boolean) : void
      {
         if(param1)
         {
            this.moxueSpr.x = 0;
            this.moxueSpr.y = 0;
            if(this.fireMc)
            {
               this.fireMc.x = -25;
               this.fireMc.y = -35;
               this.fireMc.scaleX = 1;
               this.fireMc.scaleY = 1;
            }
            if(this.moxueCircle)
            {
               this.moxueCircle.scaleX = 1;
               this.moxueCircle.scaleY = 1;
            }
         }
         else
         {
            this.moxueSpr.x = 20;
            this.moxueSpr.y = 20;
            if(this.fireMc)
            {
               this.fireMc.x = -12;
               this.fireMc.y = -18;
               this.fireMc.scaleX = 0.5;
               this.fireMc.scaleY = 0.5;
            }
            if(this.moxueCircle)
            {
               this.moxueCircle.scaleX = 0.5;
               this.moxueCircle.scaleY = 0.5;
            }
         }
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseDown2(param1:MouseEvent) : void
      {
         this.mainSkillContainer2.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove2);
         this.p = new Point(mouseX,mouseY);
         this.currSkill2 = param1.target as ItemFace;
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIXUEMOZHEN_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseMove2(param1:MouseEvent) : void
      {
         if(this.currSkill2 != param1.target)
         {
            this.mainSkillContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove2);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill2.getBaseItem() as Skill).res.useway == 1 && (this.currSkill2.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIXUEMOZHEN_SKILL_DRAG,"",this.currSkill2));
            }
            this.mainSkillContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove2);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      private function onSkillMouseUp2(param1:MouseEvent) : void
      {
         this.mainSkillContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove2);
      }
      
      private function onItemTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:DisplayObject = null;
         if(!this.isMainChar)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               param1.currentTarget.addEventListener(MouseEvent.MOUSE_MOVE,this.onItemTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>";
               _loc3_ = param1.target as DisplayObject;
               switch(_loc3_.name)
               {
                  case "1":
                     _loc2_ += LanResManager.getLanCommonTextWords("血魔元神");
                     break;
                  case "2":
                     _loc2_ += LanResManager.getLanCommonTextWords("血魔心脏");
                     break;
                  case "3":
                     _loc2_ += LanResManager.getLanCommonTextWords("血魔右臂");
                     break;
                  case "4":
                     _loc2_ += LanResManager.getLanCommonTextWords("血魔左臂");
               }
               _loc2_ += "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>";
               _loc2_ += LanResManager.getLanCommonTextWords("此为血魔四个极重要部位，将血魂注入其中可强化血魔体魄与元神。当背包中拥有强化血魔的个道具，即可提升赤血魔阵。") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("系统自动搜索背包中对应道具。") + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("在阵法升级过程中，血魔对应部位随时可能破碎，届时需要购买新的血魂才能继续升级。") + "</font>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               param1.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this.onItemTip);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.tupoCanvas._parent2 = param1;
         this.tupoCanvas._parent3 = this;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(!this.isMainChar)
         {
            return;
         }
         switch(param1.target)
         {
            case this.shuoMingBtn:
               if(Boolean(this.shuoMingCanvas) && Boolean(this.shuoMingCanvas.parent))
               {
                  if(this.shuoMingCanvas.parent)
                  {
                     this.shuoMingCanvas.parent.removeChild(this.shuoMingCanvas);
                  }
               }
               else
               {
                  addChild(this.shuoMingCanvas);
                  this.shuoMingCanvas.x = 415;
                  this.shuoMingCanvas.y = 0;
               }
               break;
            case this.previousButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIXUEMOZHEN_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.nextButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIXUEMOZHEN_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tupoBtn:
               if(this.tupoBo)
               {
                  return;
               }
               if(this.tupoCanvas.x > 138)
               {
                  return;
               }
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIXUEMOZHEN_TUPO_CLICK));
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
      
      public function removeMc() : void
      {
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         if(Boolean(this.fireMc) && this.fireMc.parent != null)
         {
            this.fireMc.stop();
            this.fireMc.parent.removeChild(this.fireMc);
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.tupoCanvas._parent2 = param1;
         this.tupoCanvas._parent3 = this;
      }
      
      public function initilizeUI(param1:Boolean, param2:int, param3:String, param4:int, param5:Array, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:Boolean, param15:int, param16:Boolean, param17:Boolean, param18:Boolean, param19:Boolean) : void
      {
         this.isMainChar = param1;
         this.setUI(param2);
         this.setZhaoShiMsg(param3,param2,param4);
         this.setMoXue(param6,param7);
         this.setJiaCheng(param8,param9);
         this.setSkill(new Skill(param10),param11,new Skill(param12),param13);
         this.setEquip(param5);
         this.setJihuo(param14);
         this.setJiHuochixue(this.isMainChar);
         this.gongxun.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前恶魔功勋：") + param15 + LanResManager.getLanCommonTextWords("点") + "</font>";
         this.checkZq.selectState = param16;
         this.checkZq2.selectState = param17;
         this.checkWq.selectState = param18;
         this.checkWq2.selectState = param19;
      }
      
      public function setJiHuochixue(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.CHIXUEMOZHEN_ZUIZHONGMOWANG_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.CHIXUEMOZHEN_CHIXUEFANSHA_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.CHIXUEMOZHEN_HONGMINGMIJI_ID];
            this.gongxun.visible = GameState.dictMainStatus[SpecialGoodsID.CHIXUEMOZHEN_HONGMINGMIJI_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.CHIXUEMOZHEN_FENGHUANGNIEPAN_ID])
            {
               this.fts4.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.checkZq.visible = false;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.CHIXUEMOZHEN_CHIXUEMOLONG_ID])
            {
               this.fts5.visible = true;
               this.checkZq2.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.checkZq2.visible = false;
            }
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.CHIXUEMOZHEN_ZUIZHONGMOWANG_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.CHIXUEMOZHEN_CHIXUEFANSHA_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.CHIXUEMOZHEN_HONGMINGMIJI_ID];
            this.gongxun.visible = GameState.dictTargetStatus[SpecialGoodsID.CHIXUEMOZHEN_HONGMINGMIJI_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.CHIXUEMOZHEN_FENGHUANGNIEPAN_ID])
            {
               this.fts4.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.checkZq.visible = false;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.CHIXUEMOZHEN_CHIXUEMOLONG_ID])
            {
               this.fts5.visible = true;
               this.checkZq2.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.checkZq2.visible = false;
            }
         }
      }
      
      private function setEquip(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         var _loc4_:Goods = null;
         var _loc5_:ItemFace = null;
         _loc2_ = 1;
         while(_loc2_ < 5)
         {
            while(Boolean(this["equipContainer" + _loc2_]) && this["equipContainer" + _loc2_].numChildren > 0)
            {
               this["equipContainer" + _loc2_].removeChildAt(0);
            }
            this.bmp = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.bmp.x = -2;
            this.bmp.y = -2;
            this["equipContainer" + _loc2_].addChild(this.bmp);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            _loc4_ = new Goods(_loc3_.goodsId);
            _loc4_.count = _loc3_.num;
            _loc5_ = new ItemFace(_loc4_);
            _loc5_.removeListener();
            _loc5_.name = "" + _loc3_.index;
            if(_loc3_.num == 0)
            {
               _loc5_.filters = Tools.darkFilter;
            }
            this["equipContainer" + _loc3_.index].addChild(_loc5_);
            _loc2_++;
         }
      }
      
      private function setUI(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var lookId:int = param1;
         mcId = 0;
         if(lookId < 6)
         {
            mcId = 0;
         }
         else if(lookId >= 6 && lookId <= 15)
         {
            mcId = 1;
         }
         else if(lookId > 15 && lookId <= 20)
         {
            mcId = 2;
         }
         else if(lookId > 20 && lookId <= 29)
         {
            mcId = 3;
         }
         else if(lookId == 30)
         {
            mcId = 4;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/chixuemozhen/" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function setMoXue(param1:int, param2:int) : void
      {
         var loadUrl1:String = null;
         var loadUrl:String = null;
         var nowMoxue:int = param1;
         var maxMoxue:int = param2;
         this.nowMoXue = nowMoxue;
         this.maxMoXue = maxMoxue;
         if(this.nowMoXue == this.maxMoXue)
         {
            loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/chixuemozhen/fire.swf";
            if(Boolean(this.fireMc) && this.fireMc.parent != null)
            {
               this.fireMc.stop();
               this.fireMc.parent.removeChild(this.fireMc);
            }
            if(this.fireMc != null)
            {
               this.fireMc.play();
               this.moxueSpr.addChildAt(this.fireMc,this.moxueSpr.numChildren);
               this.showBigBall(this.tiQuBtn.visible);
            }
            else
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl)
                  {
                     return;
                  }
                  if(Boolean(fireMc) && fireMc.parent != null)
                  {
                     fireMc.stop();
                     fireMc.parent.removeChild(fireMc);
                  }
                  fireMc = _loc2_.content as MovieClip;
                  if(fireMc)
                  {
                     fireMc.play();
                     fireMc.x = -25;
                     fireMc.y = -25;
                     moxueSpr.addChildAt(fireMc,moxueSpr.numChildren);
                     showBigBall(tiQuBtn.visible);
                  }
               },null,false,loadUrl);
            }
         }
         else if(Boolean(this.fireMc) && this.fireMc.parent != null)
         {
            this.fireMc.stop();
            this.fireMc.parent.removeChild(this.fireMc);
         }
         loadUrl1 = GameConfig.fileBaseFolder + "res/ui/UIditu/chixuemozhen/ball.swf";
         if(Boolean(this.moxueCircle) && this.moxueCircle.parent != null)
         {
            this.moxueCircle.stop();
            this.moxueCircle.parent.removeChild(this.moxueCircle);
         }
         if(this.moxueCircle != null)
         {
            this.showBigBall(this.tiQuBtn.visible);
            this.moxueSpr.addChildAt(this.moxueCircle,0);
            this.moxueCircle.gotoAndStop(int(this.nowMoXue / this.maxMoXue * 100));
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
               if(Boolean(moxueCircle) && moxueCircle.parent != null)
               {
                  moxueCircle.stop();
                  moxueCircle.parent.removeChild(moxueCircle);
               }
               moxueCircle = _loc2_.content as MovieClip;
               if(moxueCircle)
               {
                  showBigBall(tiQuBtn.visible);
                  moxueSpr.addChildAt(moxueCircle,0);
                  moxueCircle.gotoAndStop(int(nowMoXue / maxMoXue * 100));
               }
            },null,false,loadUrl1);
         }
      }
      
      private function setJiaCheng(param1:int, param2:int) : void
      {
         this.jiaChengFta.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("血魔附体增强：") + param1 / 100 + "%<br>" + LanResManager.getLanCommonTextWords("生命：") + param2 + "</font>";
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.curNameFta.htmlText = param1;
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.previousButtonEnabled(false);
            this.lingWuButtonEnabled(false);
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
            this.nextButtonEnabled(false);
         }
         else
         {
            if(param2 <= 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(param2 >= this.CHIXUEMOZHEN_MAX)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.tupoBtn.label = LanResManager.getLanCommonTextWords("已提升");
               this.tupoBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.tupoBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
               this.tupoBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.tupoBtn.label = LanResManager.getLanCommonTextWords("未提升");
               this.tupoBtn.enabled = false;
            }
         }
      }
      
      public function setSkill(param1:Skill, param2:Boolean, param3:Skill, param4:Boolean) : void
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
         this.mainSkill = param1;
         if(param2)
         {
            this.mainSkill.isLearn = 1;
         }
         else
         {
            this.mainSkill.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
         while(this.mainSkillContainer2.numChildren > 0)
         {
            this.mainSkillContainer2.removeChildAt(0);
         }
         if(this.mainSkillItemFace2)
         {
            if(this.mainSkillItemFace2.parent)
            {
               this.mainSkillItemFace2.parent.removeChild(this.mainSkillItemFace2);
            }
         }
         this.mainSkill2 = param3;
         if(param4)
         {
            this.mainSkill2.isLearn = 1;
         }
         else
         {
            this.mainSkill2.isLearn = 0;
         }
         this.mainSkillItemFace2 = new ItemFace(this.mainSkill2);
         this.mainSkillItemFace2.showKungFuTag();
         this.mainSkillItemFace2.setShowCount(false);
         this.mainSkillContainer2.addChild(this.mainSkillItemFace2);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tupoCanvas.x == 138)
            {
               TweenMax.to(this.tupoCanvas,1,{"x":410});
            }
            this.tupoBo = true;
            this.previousButtonEnabled(false);
            this.nextButtonEnabled(false);
            this.lingWuButtonEnabled(false);
            this.shuoMingBtn.enabled = false;
            this.showShuoMing(false);
         }
         else
         {
            if(this.tupoCanvas.x == 410)
            {
               TweenMax.to(this.tupoCanvas,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHIXUEMOZHEN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.previousButtonEnabled(true);
            this.nextButtonEnabled(true);
            this.lingWuButtonEnabled(true);
            this.shuoMingBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.previousButtonEnabled(false);
            }
            if(this.lookingId >= this.CHIXUEMOZHEN_MAX)
            {
               this.nextButtonEnabled(false);
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.tupoCanvas.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.tupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.tupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.tupoCanvas.setGoods(param1,param2);
      }
      
      public function setShuoming(param1:String) : void
      {
         this.tupoCanvas.setShuoming(param1);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.tupoCanvas.setBtn(param1);
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      public function setEnableFun() : void
      {
         if(this.mainSkillContainer.hasEventListener(MouseEvent.MOUSE_DOWN))
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         }
         if(this.mainSkillContainer.hasEventListener(MouseEvent.MOUSE_UP))
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         }
         if(this.mainSkillContainer2.hasEventListener(MouseEvent.MOUSE_DOWN))
         {
            this.mainSkillContainer2.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown2);
         }
         if(this.mainSkillContainer2.hasEventListener(MouseEvent.MOUSE_UP))
         {
            this.mainSkillContainer2.removeEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp2);
         }
         if(this.moxueSpr.hasEventListener(MouseEvent.CLICK))
         {
            this.moxueSpr.addEventListener(MouseEvent.CLICK,this.onMoXueBtnClick);
         }
         this.previousButtonEnabled(false);
         this.nextButtonEnabled(false);
         this.lingWuButtonEnabled(false);
         this.shuoMingBtn.enabled = false;
      }
      
      public function showShuoMing(param1:Boolean) : void
      {
         if(!param1)
         {
            if(Boolean(this.shuoMingCanvas) && Boolean(this.shuoMingCanvas.parent))
            {
               this.shuoMingCanvas.parent.removeChild(this.shuoMingCanvas);
            }
         }
      }
      
      private function previousButtonEnabled(param1:Boolean) : void
      {
         this.previousButton.enabled = param1;
      }
      
      private function nextButtonEnabled(param1:Boolean) : void
      {
         this.nextButton.enabled = param1;
      }
      
      private function lingWuButtonEnabled(param1:Boolean) : void
      {
         this.tupoBtn.enabled = param1;
      }
      
      public function set_XSJC(param1:int) : void
      {
      }
      
      public function setJihuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.visible = true;
         }
         else
         {
            this.fts.visible = false;
         }
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMainChar)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_ChiXueMoZhen(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_CHIXUEMOZHEN_MOJIAN_ID)
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
                  this.fts6.visible = true;
                  this.checkWq.visible = true;
               }
               else
               {
                  this.fts6.visible = false;
                  this.checkWq.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_CHIXUEMOZHEN_XIELONGMOJIAN_ID)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = -340;
               this.kuangHD.y = 0 - 122;
               _loc4_.x = 2 - 340;
               _loc4_.y = 2 - 122;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.fts7.visible = true;
                  this.checkWq2.visible = true;
               }
               else
               {
                  this.fts7.visible = false;
                  this.checkWq2.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

