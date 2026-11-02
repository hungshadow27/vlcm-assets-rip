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
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.getDefinitionByName;
   import gs.TweenMax;
   
   public class QiMenZhen extends Sprite
   {
      
      public var _$parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var lb:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var buf:FTextArea;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      private var barBg1:Bitmap;
      
      private var barBar1:ColorBar;
      
      private var fireBarMC:MovieClip = null;
      
      private var fb1:FLabel;
      
      private var img:Bitmap;
      
      private var jieShao:SecondButton;
      
      private var buyBtn:SecondButton;
      
      private var kslwBtn:SecondButton;
      
      private var zdlwBtn:SecondButton;
      
      private var goodsId:int;
      
      private var item:ItemFace;
      
      private var Obj:Object;
      
      private var yanhuaMc:MovieClip;
      
      private var posXofYanhua:int = 90;
      
      private var t:int;
      
      private var n:int;
      
      private var buffSpr:Sprite;
      
      private var gongImg:DisplayObject;
      
      private var selectedQuan:MovieClip;
      
      private var lastLevel:int = 1;
      
      private var container:Sprite;
      
      private var containerMask:Sprite;
      
      public var bgImg:Bitmap;
      
      private var classBtn1:SimpleButton;
      
      private var classBtn2:SimpleButton;
      
      private var classBtn3:SimpleButton;
      
      private var classBtn4:SimpleButton;
      
      private var classBtn5:SimpleButton;
      
      private var classBtn6:SimpleButton;
      
      private var classBtn7:SimpleButton;
      
      private var classBtn8:SimpleButton;
      
      private var learnNum:int;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var bit1:DisplayObject;
      
      private var btnEnd:Boolean = true;
      
      private var mianbanBo:Boolean = false;
      
      private var nameFta:FTextArea;
      
      private var dianjiId:int;
      
      private var shujuArr:Array;
      
      private var qimenzhenshuoming:QiMenZhenShuoMing;
      
      private var fanBeiFta:FTextArea;
      
      private var qmSkillContainer:Sprite;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts3:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts2:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var fts4:FTextArea;
      
      private var checkDt:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var checkZq1:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var suipian:int = 0;
      
      public function QiMenZhen()
      {
         var bg:DisplayObject;
         var $class:Class;
         var tf1:TextFormat = null;
         this.Obj = {};
         this.selectedQuan = new MovieClip();
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 2;
         this.fc1.width = 402;
         this.fc1.height = 365;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 2;
         this.fc1.y = 4;
         this.fc1.width = 398;
         this.fc1.height = 265 - 45 + 8;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 2;
         this.fc1.y = 231;
         this.fc1.width = 203;
         this.fc1.height = 134;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 204;
         this.fc1.y = 231;
         this.fc1.width = 196;
         this.fc1.height = 134;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qimenzhen/qimenzhen.bg.swf");
         bg.x = 0;
         bg.y = 0;
         addChild(bg);
         $class = getDefinitionByName("ui.qimenzhen.btn.1") as Class;
         this.classBtn1 = new $class() as SimpleButton;
         addChild(this.classBtn1);
         this.classBtn1.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.classBtn1.x = 10;
         this.classBtn1.y = 10;
         this.classBtn1.name = "1";
         this.classBtn1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.qimenzhen.btn.2") as Class;
         this.classBtn2 = new $class() as SimpleButton;
         addChild(this.classBtn2);
         this.classBtn2.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.classBtn2.x = this.classBtn1.x + 45;
         this.classBtn2.y = 10;
         this.classBtn2.name = "2";
         this.classBtn2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.qimenzhen.btn.3") as Class;
         this.classBtn3 = new $class() as SimpleButton;
         addChild(this.classBtn3);
         this.classBtn3.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.classBtn3.x = this.classBtn2.x + 45;
         this.classBtn3.y = 10;
         this.classBtn3.name = "3";
         this.classBtn3.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn3.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.qimenzhen.btn.4") as Class;
         this.classBtn4 = new $class() as SimpleButton;
         addChild(this.classBtn4);
         this.classBtn4.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.classBtn4.x = this.classBtn3.x + 45;
         this.classBtn4.y = 10;
         this.classBtn4.name = "4";
         this.classBtn4.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn4.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.qimenzhen.btn.5") as Class;
         this.classBtn5 = new $class() as SimpleButton;
         addChild(this.classBtn5);
         this.classBtn5.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.classBtn5.x = this.classBtn4.x + 45;
         this.classBtn5.y = 10;
         this.classBtn5.name = "5";
         this.classBtn5.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn5.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.qimenzhen.btn.6") as Class;
         this.classBtn6 = new $class() as SimpleButton;
         addChild(this.classBtn6);
         this.classBtn6.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.classBtn6.x = this.classBtn5.x + 45;
         this.classBtn6.y = 10;
         this.classBtn6.name = "6";
         this.classBtn6.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn6.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.qimenzhen.btn.7") as Class;
         this.classBtn7 = new $class() as SimpleButton;
         addChild(this.classBtn7);
         this.classBtn7.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.classBtn7.x = this.classBtn6.x + 45;
         this.classBtn7.y = 10;
         this.classBtn7.name = "7";
         this.classBtn7.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn7.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.qimenzhen.btn.8") as Class;
         this.classBtn8 = new $class() as SimpleButton;
         addChild(this.classBtn8);
         this.classBtn8.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.classBtn8.x = this.classBtn7.x + 45;
         this.classBtn8.y = 10;
         this.classBtn8.name = "8";
         this.classBtn8.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn8.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.container = new Sprite();
         this.container.x = 200;
         this.container.y = 48 + 15;
         addChild(this.container);
         this.containerMask = new Sprite();
         addChild(this.containerMask);
         this.containerMask.graphics.beginFill(0);
         this.containerMask.graphics.drawRect(0 + 40,15,385 - 40,212);
         this.containerMask.graphics.endFill();
         this.container.mask = this.containerMask;
         this.ft = new FTextArea();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tf.size = 14;
         with(this.ft)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 116 + 6 + 10 + 6;
            height = 35;
            x = 10;
            y = 235 + 5 + 7;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("奇门阵领悟说明");
         }
         addChild(this.ft);
         this.barBar1 = new ColorBar(5,373 + 4,8);
         addChild(this.barBar1);
         this.barBar1.x = 15;
         this.barBar1.y = 220 + 15;
         this.fta2 = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 12;
         tf1.color = 65276;
         with(this.fta2)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = tf1;
            width = 110;
            height = 20;
            x = 20;
            y = 100;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("奇门属性加成");
         }
         addChild(this.fta2);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 120;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta3);
         this.fanBeiFta = new FTextArea();
         with(this.fanBeiFta)
         {
            filters = StaticValue.filter;
            x = 20 + 75;
            y = 120;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fanBeiFta);
         this.fts = new FTextArea();
         this.fts.x = 20;
         this.fts.y = 120 + 30;
         this.fts.textColor = StaticValue.GREEN;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("奇门遁甲术（已激活）");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2288888、防御1888888、血量10888888、暴击888、闪避888") + "<br>" + LanResManager.getLanCommonTextWords("奇门阵顶级效果：奇门阵到达顶级时玩家每次攻击时，当第八次攻击命中对手后将有50%的几率让对手进入定身状态3秒") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 20;
         this.fts1.y = 60 + 109;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("奇门阵究极激活秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2088888888 防御1688888888 暴击2888 闪避2888血量2088888888、所有武功提升2180层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fta4 = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 12;
         tf1.color = 65276;
         with(this.fta4)
         {
            filters = StaticValue.filter;
            defaultTextFormat = tf1;
            width = 200;
            wordWrap = true;
            x = 10;
            y = 275 - 14 + 3;
            htmlText = "<textformat leading=\'2\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当天领悟前100次，每次增加6点攻击，100次之后点燃火焰，继续领悟每次增加16点攻击。") + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("每天凌晨6点清空火焰(进度保留)，重新领悟按6点攻击计数。") + "</font>" + "</textformat>";
         }
         addChild(this.fta4);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 275 - 5;
            y = 235 + 20;
            width = 120;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fb1 = new FLabel();
         with(this.fb1)
         {
            x = 214 + 10 - 1 - 5;
            y = 235 + 20;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.fb1);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 218 + 10 - 5;
         this.img.y = 252 + 20;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 216 + 10 - 5;
         this.buyBtn.y = 293 + 20;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            filters = StaticValue.filter;
            x = 275 - 5;
            y = 320;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta5);
         this.buf = new FTextArea();
         with(this.buf)
         {
            filters = StaticValue.filter;
            x = 295 + 10;
            y = 300;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.buf);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 216 + 10;
         this.kslwBtn.y = 340;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 325;
         this.zdlwBtn.y = 340;
         this.zdlwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jieShao = new SecondButton();
         this.jieShao.label = LanResManager.getLanCommonTextWords("奇门阵介绍");
         addChild(this.jieShao);
         this.jieShao.x = 105;
         this.jieShao.y = 340;
         this.jieShao.addEventListener(MouseEvent.CLICK,this.onJieShaoBtnClick);
         this.qmSkillContainer = new Sprite();
         this.qmSkillContainer.x = 354;
         this.qmSkillContainer.y = 54;
         with(this.qmSkillContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         addChild(this.qmSkillContainer);
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 255 + 40 - 280;
         this.fts3.y = 7 + 20 + 105 + 34 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("天马（仙）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("天马：天河中拥有最有灵性的马，乃玉皇大帝之专属坐骑。") + "<br>" + LanResManager.getLanCommonTextWords("万马奔腾：攻击时有几率触发万马奔腾，持续10秒；自身在此状态下，每受到对手一次攻击，") + "<br>" + LanResManager.getLanCommonTextWords("都将瞬间击退对手的坐骑，且当对手骑乘在坐骑上时，可瞬间反震对手造成60%掉血，且受到") + "<br>" + LanResManager.getLanCommonTextWords("反震的对手及对手附近5格内的所有玩家都将受到天马封印，使对手在10秒内无法在使用任何") + "<br>" + LanResManager.getLanCommonTextWords("技能。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 256 + 117 - 280;
         this.checkZq.y = 7 + 20 + 105 + 34 + 20;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 255 + 40 - 280;
         this.fts2.y = 7 + 20 + 105 + 34 + 20 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 110 + 30;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("次元移除秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("次元移除秘籍（技）：激活次元移除的玩家将可锁定任意一个玩家，施发次元") + "<br>" + LanResManager.getLanCommonTextWords("移除秘术将对手从襄阳城移除掉，消失在襄阳城内，只剩下对手侍从、骑兽、") + "<br>" + LanResManager.getLanCommonTextWords("或弟子在原地呆滞。在城里使用，冷却60秒！") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324 + 2;
         this.kuang1.y = 160 + 35 - 186 + 122;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324 + 2;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 122;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8;
         this.equipContainers.y = 12 + 30 + 135;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 255 + 40 - 280;
         this.fts4.y = 60;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("紫气混元斧");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("移动，任由混元斧砍杀。") + "<br>" + LanResManager.getLanCommonTextWords("混元斧：一把可容纳混沌万物的神兵，紫气围绕，人物可将其斧灵抽出守护自身。") + "<br>" + LanResManager.getLanCommonTextWords("紫气混元：攻击时有几率触发紫气混元，持续10秒；在此状态下，自身将瞬间清") + "<br>" + LanResManager.getLanCommonTextWords("除所有负面状态，且自身立即触发混沌万物，使5格范围内的所有玩家进入混沌") + "<br>" + LanResManager.getLanCommonTextWords("之内瞬间黑暗，持续10秒；且对手在混沌内，将无法进行任何攻击，任何跳跃，") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.x = 10;
         this.checkDt.y = 60;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 255 + 40 - 280 - 10;
         this.fts5.y = 85;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("龙族之神?幻龙");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000 ") + "<br>" + LanResManager.getLanCommonTextWords("暴击88888闪避88888 所有武功2800000层") + "<br>" + LanResManager.getLanCommonTextWords("龙族之神：八荒神龙，赐我神力。龙战八荒，天下无敌。龙族之神，傲视苍穹。龙族的创始人，") + "<br>" + LanResManager.getLanCommonTextWords("经历四万八千年的上古无数大战依旧存活下来的异族，拥有召唤大海之力，天空之权。") + "<br>" + LanResManager.getLanCommonTextWords("幻龙影魔：攻击时100%触发幻龙影魔，持续10秒；对手在此状态下，将受到幻龙影魔的包裹全") + "<br>" + LanResManager.getLanCommonTextWords("身四周被影魔牵制；天魔，可使对手所有能力受限，无法运用；地魔，可召唤大地之触，捆绑") + "<br>" + LanResManager.getLanCommonTextWords("对手无法移动；光魔，可净化对手，使对手所有勋章失效；暗魔，可瞬间吞噬对手的视线，使") + "<br>" + LanResManager.getLanCommonTextWords("对手一片黑暗，冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq1 = new FCheckBox();
         addChild(this.checkZq1);
         this.checkZq1.visible = false;
         this.checkZq1.x = 256 + 117 - 280 + 10;
         this.checkZq1.y = 85;
         this.checkZq1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 290;
         this.fts6.y = 85 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 110;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("乱魔时代秘籍(已激活)");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：206888亿、防御202888亿、血量200888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("战纹属性：青龙战纹提升20%，白虎战纹提升20%，朱雀战纹提升20%") + "<br>" + LanResManager.getLanCommonTextWords("特殊技能：终结乱魔时代，降伏群魔，开启新的篇章。每次攻击几率触发，可释放群魔助战，") + "<br>" + LanResManager.getLanCommonTextWords("对对手造成侵蚀，每秒掉血50%且无法攻击，持续10秒。") + "<br>" + LanResManager.getLanCommonTextWords("四界碎片：玩家可使用四界碎片为乱魔时代养在，每次养成消耗一个四界碎片增加500亿攻击，") + "<br>" + LanResManager.getLanCommonTextWords("所有武功提升10000层（最多可使用1000个）") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("颗四界碎片") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + suipian * 500 + LanResManager.getLanCommonTextWords("亿，所有武功") + suipian * 10000 + LanResManager.getLanCommonTextWords("层");
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,28]));
               break;
            case this.checkDt:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,66]));
               break;
            case this.checkZq1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq1.selectState,69]));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kslwBtn:
               this.posXofYanhua = 90;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QIMENZHEN_KAISHITISHENG_CLICKJ));
               break;
            case this.zdlwBtn:
               this.posXofYanhua = 190;
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QIMENZHEN_ZIDONGTISHENG_CLICKJ,"",true));
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QIMENZHEN_ZIDONGTISHENG_CLICKJ,"",false));
               }
               break;
            case this.buyBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.QIMENZHEN_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function onClicks(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.btnEnd)
         {
            _loc2_ = int(param1.currentTarget.name);
            if(this.dianjiId != _loc2_ - 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.QIMENZHEN_ARROW_CLICK,"",_loc2_));
               this.loadImg(_loc2_);
            }
            this.dianjiId = int(param1.currentTarget.name) - 1;
         }
      }
      
      private function loadImg(param1:int) : void
      {
         var _loc2_:int = param1;
         if(param1 <= 0)
         {
            _loc2_ = 1;
         }
         else
         {
            _loc2_ = param1;
         }
         if(this.bit1 != null && this.bit1.parent != null)
         {
            this.bit1.parent.removeChild(this.bit1);
         }
         this.bit1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/qimenzhen/" + _loc2_ + ".swf");
         if(param1 > this.learnNum)
         {
            this.bit1.filters = Tools.blackWhiteFilter;
         }
         this.bit1.x = 0;
         this.bit1.y = 50;
         addChildAt(this.bit1,5);
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         _loc2_ = param1.currentTarget.name;
         var _loc3_:int = Number(_loc2_);
         var _loc4_:DisplayObject = this.getChildByName(_loc2_);
         var _loc5_:String = "";
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc4_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(_loc3_ >= this.learnNum)
               {
                  _loc6_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("未开启") + "</font>";
               }
               else
               {
                  _loc6_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已开启") + "</font>";
               }
               _loc7_ = this.getNaum(int(_loc2_));
               _loc5_ += "<textformat leading=\'6\'>";
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("名称") + "：" + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + _loc7_.name + "</font><br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("级别") + "：" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc7_.lev + "</font><br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("状态") + "：" + "</font>" + _loc6_ + "<br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("说明") + "：" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + _loc7_.desc + "</font>");
               _loc5_ = _loc5_ + "</textformat>";
               if(this.btnEnd)
               {
                  this.showTip(String(_loc5_));
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               _loc4_.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function getNaum(param1:int) : Object
      {
         var _loc2_:Object = new Object();
         switch(param1)
         {
            case 1:
               _loc2_.name = LanResManager.getLanCommonTextWords("【休门】");
               _loc2_.lev = LanResManager.getLanCommonTextWords("一重");
               _loc2_.desc = LanResManager.getLanCommonTextWords("休门居北方坎宫，属水，坎水得乾金之生，万物休养生息为主，进此门者，不可乱动，需仔细推断，明察秋毫，方可出阵。");
               break;
            case 2:
               _loc2_.name = LanResManager.getLanCommonTextWords("【生门】");
               _loc2_.lev = LanResManager.getLanCommonTextWords("二重");
               _loc2_.desc = LanResManager.getLanCommonTextWords("生门居东北方艮宫，属土，万物复苏，阳气回转，进入此门者，犹如天人相助，出阵自如。");
               break;
            case 3:
               _loc2_.name = LanResManager.getLanCommonTextWords("【伤门】");
               _loc2_.lev = LanResManager.getLanCommonTextWords("三重");
               _loc2_.desc = LanResManager.getLanCommonTextWords("伤门居东方震宫，属木，此门为凶门，进入者，会遭遇各种天象，如天雷，地火，最终被困死。但凡有大智慧者在此门会有一线生机，成就无上法身，可脱困。");
               break;
            case 4:
               _loc2_.name = LanResManager.getLanCommonTextWords("【杜门】");
               _loc2_.lev = LanResManager.getLanCommonTextWords("四重");
               _loc2_.desc = LanResManager.getLanCommonTextWords("杜门居东南巽宫，属木，与开门相对，一开一杜，二者对立统一。为小凶，四季变换，直到为春季方可出阵。");
               break;
            case 5:
               _loc2_.name = LanResManager.getLanCommonTextWords("【景门】");
               _loc2_.lev = LanResManager.getLanCommonTextWords("五重");
               _loc2_.desc = LanResManager.getLanCommonTextWords("景门居南方离宫，属火，正北坎宫休门相对，一个万物闭藏休息，一个万物繁茂争长，进入此门者，虽景色优美，但难免会面临酷暑之忧，唯有凭借望梅止渴之毅力可走出阵法。");
               break;
            case 6:
               _loc2_.name = LanResManager.getLanCommonTextWords("【死门】");
               _loc2_.lev = LanResManager.getLanCommonTextWords("六重");
               _loc2_.desc = LanResManager.getLanCommonTextWords("死门居中西南坤宫，属土，与艮宫生门相对，万物春生秋死，进入此门者，会面临大军围困，斩杀所有敌人，一鼓作气，可破阵。");
               break;
            case 7:
               _loc2_.name = LanResManager.getLanCommonTextWords("【惊门】");
               _loc2_.lev = LanResManager.getLanCommonTextWords("七重");
               _loc2_.desc = LanResManager.getLanCommonTextWords("惊门居西方兑位，属金，东方震宫伤门相对应，为凶门，金秋寒气肃杀，草木皆兵，一片惊恐萧瑟之象。须知一切皆为幻象，需忍耐，保持灵台空明，阵可破。");
               break;
            default:
               _loc2_.name = LanResManager.getLanCommonTextWords("【开门】");
               _loc2_.lev = LanResManager.getLanCommonTextWords("八重");
               _loc2_.desc = LanResManager.getLanCommonTextWords("开门居西北乾宫，属金，喻万物开始之意，古代能人，大贤开帮立派首选方位。为大吉，从此门走出，方可脱困。");
         }
         return _loc2_;
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
      
      private function aa(param1:Event = null) : void
      {
         var e:Event = param1;
         var ftaw1:FTextArea = new FTextArea();
         with(ftaw1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 145;
            y = 216;
            textColor = StaticValue.YELLOW;
            width = 132;
            htmlText = LanResManager.getLanCommonTextWords("攻击力+") + String(n);
         }
         addChildAt(ftaw1,numChildren - 1);
         TweenMax.to(ftaw1,1.5,{
            "y":181,
            "onComplete":this.onCom1,
            "onCompleteParams":[ftaw1]
         });
      }
      
      private function showOnceText() : void
      {
         var ftaw1:FTextArea = null;
         ftaw1 = new FTextArea();
         with(ftaw1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 30;
            y = 216;
            textColor = StaticValue.RED_HTML;
            width = 350;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.RED_HTML + "\' size=\'16\'>" + LanResManager.getLanCommonTextWords("当天的心法已领悟满100次，将开始领悟阵法学习！") + "</font>" + "</textformat>";
         }
         addChild(ftaw1);
         TweenMax.to(ftaw1,4,{
            "y":80,
            "onComplete":function():void
            {
               TweenMax.to(ftaw1,3,{
                  "alpha":0,
                  "onComplete":onCom1,
                  "onCompleteParams":[ftaw1]
               });
            }
         });
      }
      
      private function onCom1(param1:FTextArea) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      private function onJieShaoBtnClick(param1:MouseEvent) : void
      {
         if(!this.qimenzhenshuoming)
         {
            this.qimenzhenshuoming = new QiMenZhenShuoMing();
         }
         GameInstance.uiInstance.uiContainer.addChild(this.qimenzhenshuoming);
         this.qimenzhenshuoming.visible = true;
         this.qimenzhenshuoming.x = (GameConfig.sceneWidth - this.qimenzhenshuoming.width) / 2;
         this.qimenzhenshuoming.y = (GameConfig.sceneHeight - this.qimenzhenshuoming.height) / 2;
      }
      
      public function setInitializeText(param1:Boolean, param2:String, param3:int) : void
      {
         this.isMain = param1;
         this.fta1.htmlText = "<textformat leading=\'0\'>" + param2 + "</textformat>";
         this.fta3.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param3 + "</font><br>" + "</textformat>";
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.QIMENZHEN_JIUJI_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.QIMENZHEN_TIANMA_ID])
            {
               this.fts3.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkZq.visible = false;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.QIMENZHEN_CIYUANYICHU_ID])
            {
               this.fts2.visible = true;
               this.setSkillJiHuo(200332,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.fts2.visible = false;
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.QIMENZHEN_ZIQIHUNYUANFU_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.QIMENZHEN_ZIQIHUNYUANFU_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.QIMENZHEN_LUANMOSHIDAI_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.QIMENZHEN_SIJIESUIPIAN_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.QIMENZHEN_JIUJI_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.QIMENZHEN_TIANMA_ID])
            {
               this.fts3.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkZq.visible = false;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.QIMENZHEN_CIYUANYICHU_ID])
            {
               this.fts2.visible = true;
               this.setSkillJiHuo(200332,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.fts2.visible = false;
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.QIMENZHEN_ZIQIHUNYUANFU_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.QIMENZHEN_ZIQIHUNYUANFU_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.QIMENZHEN_LUANMOSHIDAI_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.QIMENZHEN_SIJIESUIPIAN_ID];
         }
      }
      
      public function setFanBei(param1:int, param2:Boolean) : void
      {
         if(param1 == 0)
         {
            this.fanBeiFta.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + "" + "</font><br>" + "</textformat>";
         }
         else
         {
            this.fanBeiFta.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + "x2" + "</font><br>" + "</textformat>";
         }
         if(param2)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("奇门遁甲术(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("奇门遁甲术(未激活)");
         }
      }
      
      public function setGoods(param1:Goods, param2:String, param3:int, param4:Boolean) : void
      {
         this.goodsId = param1.id;
         this.fb1.text = param2;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 220 + 10 - 5;
         this.item.y = 254 + 20;
         addChild(this.item);
         if(param1.count > 0)
         {
            this.item.filters = [];
         }
         else
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         if(param4)
         {
            this.fta5.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗") + "：" + param3 + LanResManager.getLanCommonTextWords("本") + "</textformat>";
         }
         else
         {
            this.fta5.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗") + "：" + param3 + LanResManager.getLanCommonTextWords("本") + "</textformat>";
         }
      }
      
      public function setJinduNum(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean) : *
      {
         this.n = param3;
         if(param1 > param2)
         {
            this.barBar1.setValue(param2,param2);
         }
         else
         {
            this.barBar1.setValue(param1,param2);
         }
         this.showFireBar(param4);
         if(!param5)
         {
            this.showOnceText();
         }
         if(this.n > 0)
         {
            this.aa();
         }
      }
      
      public function setZhaoShiMsg(param1:int, param2:int) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc5_:int = 0;
         this.loadImg(param1);
         if(param1 == param2)
         {
            this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.kslwBtn.enabled = true;
            this.zdlwBtn.visible = true;
            this.zdlwBtn.enabled = true;
            this.bit1.filters = [];
         }
         else if(param1 < param2)
         {
            this.kslwBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.kslwBtn.enabled = false;
            this.zdlwBtn.visible = false;
            this.bit1.filters = [];
         }
         else
         {
            this.kslwBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.kslwBtn.enabled = false;
            this.zdlwBtn.visible = true;
            this.zdlwBtn.enabled = false;
            this.bit1.filters = Tools.blackWhiteFilter;
         }
         var _loc4_:int = 0;
         while(_loc4_ < 8)
         {
            _loc3_ = this.getChildByName(String(_loc4_ + 1));
            _loc5_ = int(_loc3_.name);
            if(param2 < _loc5_)
            {
               _loc3_.filters = Tools.blackWhiteFilter;
            }
            else
            {
               _loc3_.filters = [];
            }
            _loc4_++;
         }
         this.learnNum = param2;
         this.lastLevel = param1;
      }
      
      private function showFireBar(param1:Boolean) : void
      {
         var b:Boolean = param1;
         if(b)
         {
            this.barBar1.type = 6;
            if(!this.fireBarMC)
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  if(fireBarMC)
                  {
                     return;
                  }
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  fireBarMC = _loc2_.content as MovieClip;
                  fireBarMC.x = -11;
                  fireBarMC.y = 143 + 15;
                  fireBarMC.visible = true;
                  fireBarMC.mouseChildren = false;
                  fireBarMC.mouseEnabled = false;
                  addChild(fireBarMC);
                  if(container.contains(fireBarMC))
                  {
                     setChildIndex(fireBarMC,6);
                  }
               },null,false,GameConfig.fileBaseFolder + "res/data/mc/qishangquan/firebar.swf");
            }
            if(Boolean(this.fireBarMC) && this.fireBarMC.parent != null)
            {
               this.fireBarMC.visible = true;
               if(this.container.contains(this.fireBarMC))
               {
                  setChildIndex(this.fireBarMC,6);
               }
            }
         }
         else
         {
            this.barBar1.type = 5;
            if(Boolean(this.fireBarMC) && this.fireBarMC.parent != null)
            {
               this.fireBarMC.visible = false;
            }
         }
      }
      
      public function setBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         }
         else
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("停止领悟");
         }
      }
      
      public function bofangYanhua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = posXofYanhua;
            yanhuaMc.y = 156;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/qishangquan/yanhua.swf");
      }
      
      public function setQiShangQuanEnabledFun() : void
      {
         this.kslwBtn.visible = false;
         this.zdlwBtn.visible = false;
         this.buyBtn.enabled = false;
      }
      
      public function removeShuoming() : void
      {
         if(this.qimenzhenshuoming != null && this.qimenzhenshuoming.parent != null)
         {
            this.qimenzhenshuoming.parent.removeChild(this.qimenzhenshuoming);
         }
      }
      
      public function set_QMDJ(param1:Boolean, param2:Skill) : void
      {
      }
      
      public function setZuoQi(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.checkZq.selectState = param1;
         this.checkDt.selectState = param2;
         this.checkZq1.selectState = param3;
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
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
         this.mainSkill = _loc3_;
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
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_QiMenZhen(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD.x = 0;
         this.kuangHD.y = 0;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD.x = -40;
         this.kuangHD.y = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_QIMENZHEN_CIYUANHU)
            {
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QIMENZHEN_LONGZUZHISHEN)
            {
               _loc4_.x = 2 - 40;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkZq1.visible = true;
                  this.fts5.visible = true;
               }
               else
               {
                  this.checkZq1.visible = false;
                  this.fts5.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

