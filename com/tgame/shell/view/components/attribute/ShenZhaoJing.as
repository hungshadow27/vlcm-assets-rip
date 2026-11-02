package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class ShenZhaoJing extends FCanvas
   {
      
      public static const UI_SHENZHAOJING_GUANBI_CLICK:String = "UI_SHENZHAOJING_GUANBI_CLICK";
      
      public var $parent:DisplayObject;
      
      public var img:Bitmap;
      
      private var img1:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var fta:FTextArea;
      
      private var gongMc:MovieClip;
      
      private var gongMcSpr:Sprite;
      
      private var check1:FCheckBox;
      
      private var lb:FLabel;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var tf:TextFormat;
      
      private var TssdBtn:SmallButton;
      
      private var loadUrl:String;
      
      private var jianshuContainer:Sprite;
      
      private var xldjBar:ColorBar;
      
      private var dengjiId:int;
      
      private var check:FCheckBox;
      
      private var ycsx:FTextArea;
      
      private var mcObj:Object;
      
      private var fta8:FTextArea;
      
      private var fta9:FTextArea;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var skillName:FTextArea;
      
      private var skillDesc:FTextArea;
      
      private var lockImg:Bitmap;
      
      private var fta1:FTextArea;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var ftTitle:FTextArea;
      
      private var ftSX1:FTextArea;
      
      private var ftSX2:FTextArea;
      
      private var ftSX3:FTextArea;
      
      private var ftSX4:FTextArea;
      
      private var ftSX5:FTextArea;
      
      private var ftSX6:FTextArea;
      
      private var ftSX7:FTextArea;
      
      private var shenzhaojingTupo:ShenZhaoJingTopoCanvas;
      
      private var shenzhaojingTisu:ShenZhaoJingTisuPanel;
      
      private var yanhuaMc:MovieClip;
      
      public var tupoBo:Boolean = false;
      
      private var CurrLV:Boolean = false;
      
      private var isDrag:Boolean = false;
      
      private var gongImg:DisplayObject;
      
      private var renwuArr:Array;
      
      private var renwuBitmap:Bitmap;
      
      private var juseSprite:Sprite;
      
      private var tootips1:String = "";
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var mainSkillContainer1:Sprite;
      
      private var kuang1:Bitmap;
      
      private var mainSkillItemFace1:ItemFace;
      
      private var mainSkill1:Skill;
      
      private var fts5:FTextArea;
      
      private var checkHuanZhuang:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var fts7:FTextArea;
      
      private var fts8:FTextArea;
      
      private var fts8num:int;
      
      private var checkDt:FCheckBox;
      
      public function ShenZhaoJing()
      {
         var $mask:Sprite;
         this.mcObj = {};
         this.renwuArr = new Array();
         super();
         this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/shenzhaojing/shenzhaojing.jpg",404,366);
         this.gongImg.x = 0;
         this.gongImg.y = 0;
         addChild(this.gongImg);
         this.shenzhaojingTisu = new ShenZhaoJingTisuPanel();
         this.shenzhaojingTisu.$parent = this;
         addChild(this.shenzhaojingTisu);
         this.shenzhaojingTisu.visible = false;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ftTitle = new FTextArea();
         this.ftTitle.x = 290;
         this.ftTitle.y = 10;
         this.ftTitle.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("神照经") + "</font>";
         addChild(this.ftTitle);
         this.renwuBitmap = new Bitmap();
         this.renwuBitmap.x = -142;
         this.renwuBitmap.y = 70;
         addChild(this.renwuBitmap);
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 8 - 52;
         this.gongMcSpr.y = 12;
         addChild(this.gongMcSpr);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 90;
            x = 10;
            y = 280;
            textColor = StaticValue.ORANGE;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 460;
            height = 25;
            x = 10;
            y = 235;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("当前神照经层数下最大可以得到如下属性加成：");
         }
         addChild(this.fta1);
         this.ftSX1 = new FTextArea();
         with(this.ftSX1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            height = 60;
            x = 10;
            y = 255;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("攻击：") + "                " + LanResManager.getLanCommonTextWords("防御：") + "                " + LanResManager.getLanCommonTextWords("暴击：") + "                " + LanResManager.getLanCommonTextWords("闪避：");
         }
         addChild(this.ftSX1);
         this.ftSX2 = new FTextArea();
         with(this.ftSX2)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            height = 60;
            x = 10;
            y = 278;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("生命上限：") + "                       " + LanResManager.getLanCommonTextWords("内力上限：") + "                      " + LanResManager.getLanCommonTextWords("体力上限：");
         }
         addChild(this.ftSX2);
         this.ftSX3 = new FTextArea();
         with(this.ftSX3)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            height = 60;
            x = 55;
            y = 255;
            textColor = StaticValue.YELLOW;
            htmlText = "";
         }
         addChild(this.ftSX3);
         this.ftSX4 = new FTextArea();
         with(this.ftSX4)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            height = 60;
            x = 170;
            y = 255;
            textColor = StaticValue.YELLOW;
            htmlText = "";
         }
         addChild(this.ftSX4);
         this.ftSX5 = new FTextArea();
         with(this.ftSX5)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            height = 60;
            x = 265;
            y = 255;
            textColor = StaticValue.YELLOW;
            htmlText = "10000<br>10000<br>";
         }
         addChild(this.ftSX5);
         this.ftSX6 = new FTextArea();
         with(this.ftSX6)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 460;
            height = 60;
            x = 365;
            y = 255;
            textColor = StaticValue.YELLOW;
            htmlText = "10000<br>10000<br>";
         }
         addChild(this.ftSX6);
         this.ftSX7 = new FTextArea();
         with(this.ftSX7)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 460;
            height = 60;
            x = 230;
            y = 278;
            textColor = StaticValue.YELLOW;
            htmlText = "10000<br>10000<br>";
         }
         addChild(this.ftSX7);
         this.fta = new FTextArea();
         with(this.fta)
         {
            wordWrap = true;
            filters = StaticValue.filter;
            width = 165;
            height = 170;
            x = 230;
            y = 40;
            textColor = StaticValue.ORANGE;
            htmlText = "";
         }
         addChild(this.fta);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 245;
         this.previousButton.y = 155;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 64 + 50;
            height = 16;
            x = previousButton.x + previousButton.width;
            y = 155;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            htmlText = LanResManager.getLanCommonTextWords("一层(1/10段)");
         }
         addChild(this.fta3);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = this.fta3.x + this.fta3.width;
         this.nextButton.y = 155;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 230;
            y = 183;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("熟练度");
         }
         addChild(this.lb);
         this.img1 = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img1);
         this.img1.width = 105;
         this.img1.x = 278;
         this.img1.y = 183;
         this.xldjBar = new ColorBar(1,80,11);
         addChild(this.xldjBar);
         this.xldjBar.x = 278 + 5 + 5 + 3;
         this.xldjBar.y = 180 + 1 + 1 + 4;
         this.TssdBtn = new SmallButton();
         this.TssdBtn.label = LanResManager.getLanCommonTextWords("提升速度");
         addChild(this.TssdBtn);
         this.TssdBtn.x = 302;
         this.TssdBtn.y = 205;
         this.TssdBtn.addEventListener(MouseEvent.MOUSE_UP,this.onBtnClick);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            filters = StaticValue.filter;
            width = 90;
            height = 20;
            x = 340;
            y = 300;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("附加技能");
         }
         addChild(this.fta5);
         this.skillName = new FTextArea();
         with(this.skillName)
         {
            filters = StaticValue.filter;
            width = 90;
            height = 20;
            x = 11;
            y = 300 + 3 - 5;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanCommonTextWords("神照经技能说明");
         }
         addChild(this.skillName);
         this.skillDesc = new FTextArea();
         with(this.skillDesc)
         {
            filters = StaticValue.filter;
            width = 283;
            height = 60;
            wordWrap = true;
            x = 11;
            y = 320 - 2 - 5;
            textColor = StaticValue.ORANGE;
            htmlText = "";
         }
         addChild(this.skillDesc);
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 355 - 1;
         this.mainSkillContainer.y = 315 + 2 + 2 + 1;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.shenzhaojingTupo = new ShenZhaoJingTopoCanvas();
         this.shenzhaojingTupo._parent = this;
         addChild(this.shenzhaojingTupo);
         this.shenzhaojingTupo.x = 138;
         this.shenzhaojingTupo.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = 0;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,410,390);
            endFill();
         }
         this.shenzhaojingTupo.mask = $mask;
         addEventListener(UI_SHENZHAOJING_GUANBI_CLICK,this.closeTupo);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("神照护体先天罡气（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击2688888888900 防御2288888888900 血量3088888888900暴击 88888闪避88888   所有武功400000层") + "<br>" + LanResManager.getLanCommonTextWords("★  先天罡气 —— 为神照经至强护体秘技，有起死回生之效。被攻击时，有几率触发先天罡气状态，瞬间反弹造成") + "<br>" + LanResManager.getLanCommonTextWords("对手90%的当前血量伤害，无法进行跳跃，且立即清除自身所有的负面状态！") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts8 = new FTextArea();
         this.fts8.x = 10;
         this.fts8.y = 7;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 170;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("神照经真元（已激活）");
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("已使用") + fts8num + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("每使用一个增加攻击+1.000.000防守+1.000.000武功层+1") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("神照三罡神功（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：15888亿、防御12888亿、血量16888亿、所有武功提升 80000层") + "<br>" + LanResManager.getLanCommonTextWords("技能效果（三罡神功）：激活三罡神功的玩家将获得三个永久秘技，将会轮流出现，每5分钟将自动转换一种。") + "<br>" + LanResManager.getLanCommonTextWords("1.烈炎决：攻击时有几率触发，使对手无法恢复血量，持续3秒！") + "<br>" + LanResManager.getLanCommonTextWords("2.流星决：攻击时有几率触发，使对手无法进行攻击，持续3秒！") + "<br>" + LanResManager.getLanCommonTextWords("3.浩气决：攻击时有几率触发，使对手无法移动，并需要跳跃6次方可解除，且每次跳跃降低自身20%的血量，持续10秒！");
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("神照双元罡气诀（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击5688888888888 防御4288888888888 血量6088888888888暴击 88888闪避88888   所有武功1000000层") + "<br>" + LanResManager.getLanCommonTextWords("双元罡气 —— 被攻击时有几率触发双元罡气，瞬间将5格范围内所有对手弹开，并造成70%的血量伤害。且清除自身所有") + "<br>" + LanResManager.getLanCommonTextWords("的负面BUFF，无法被对方锁定，持续5秒！");
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 20 + 160;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("紫金钵（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特珠属性：攻击88888亿 防御62888亿 血量90888亿 暴击 88888闪避88888 所有武功1400000层") + "<br>" + LanResManager.getLanCommonTextWords("紫金乾坤：双击使用紫金钵，钵体将放大，在自将周围产生金色光罩特效，可将范围5格内的所有玩") + "<br>" + LanResManager.getLanCommonTextWords("家都吸收至钵内无法逃离；钵内容有混沌之气，在混沌之气下，钵内所有玩家都将无法在看清视线，") + "<br>" + LanResManager.getLanCommonTextWords("持续10秒；自身在此状态下，将立即触发紫金乾坤，持续10秒；每经过一秒，5格范围的所有玩家都") + "<br>" + LanResManager.getLanCommonTextWords("将立即停止所有攻击操作，持续5秒。技能冷却90秒。（紫金钵可在城里施发）.");
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324 - 340;
         this.kuang1.y = 160 + 35 - 186 + 155;
         this.mainSkillContainer1 = new Sprite();
         this.mainSkillContainer1.x = 25 + 2 + 324 - 340;
         this.mainSkillContainer1.y = 160 + 2 + 35 - 186 + 155;
         addChild(this.mainSkillContainer1);
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown1);
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp1);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 7 + 20 + 20 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 120;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("紫灵兽套装");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Tấn công + 100.000.000, Phòng thủ + 100.000.000, Sinh lực + 100.000.000.000, Tầng võ + 50.000." + "<br>" + LanResManager.getLanCommonTextWords("紫灵兽套装：上古战神，紫衣魔王套装，攻无不克，战无不胜。双击使用人物将激活华丽变装效果。") + "<br>" + LanResManager.getLanCommonTextWords("紫气破天：攻击时有几率触发紫气破天状态，持续10秒；天空中到处散发着紫气包围，对手受到紫") + "<br>" + LanResManager.getLanCommonTextWords("气绕眼，无法看清；且对手在此紫气内，每次呼吸，都将受到紫气毒害，筋脉混乱，失去所有武学") + "<br>" + LanResManager.getLanCommonTextWords("修为，每次攻击对手，对手受到双重伤害，将每秒掉血30%。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkHuanZhuang = new FCheckBox();
         addChild(this.checkHuanZhuang);
         this.checkHuanZhuang.x = 10 + 70;
         this.checkHuanZhuang.y = 7 + 20 + 20 + 20;
         this.checkHuanZhuang.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 7 + 20 + 20 + 20 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 120 + 10;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("无字天书秘籍(已激活)");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("天书护体：拥有天界灵兽的玩家，才可开启无字天书秘技。攻击时有几率触发天书护体，持续30秒；") + "<br>" + LanResManager.getLanCommonTextWords("在此状态下，每被攻击5次只要自身有命中负面状态，天字都可召唤天界祈福可瞬间清除自己所有负") + "<br>" + LanResManager.getLanCommonTextWords("面状态。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 7 + 20 + 20 + 20 + 20 + 25;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 120;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("天界灵兽（传说）");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("天界灵兽：王母专属坐骑，眩丽外观，金光庇护，人家可自由召唤守护自身。") + "<br>" + LanResManager.getLanCommonTextWords("灵兽庇护：攻击时有几率触发灵兽庇护，持续10秒；在此状态下，天门大开金光照射，") + "<br>" + LanResManager.getLanCommonTextWords("自身在金光庇护下，所有玩家对自己的攻击都将立即停止；且自身在此效果下，每攻") + "<br>" + LanResManager.getLanCommonTextWords("击对手一次，对的都将瞬间被净化，杀气全失所有对任何人攻击，所有免伤及百分比") + "<br>" + LanResManager.getLanCommonTextWords("伤害抵抗都将失去，持续10秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.x = 10 + 70 + 25;
         this.checkDt.y = 7 + 20 + 20 + 20 + 20 + 25;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkHuanZhuang:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHuanZhuang.selectState,56]));
               break;
            case this.checkDt:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,80]));
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if(this.isDrag)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENZHAOJING_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target.label)
         {
            case LanResManager.getLanCommonTextWords("提升速度"):
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENZHAOJING_TISHENGSUDU_CLICK));
               break;
            case LanResManager.getLanCommonTextWords("突破瓶颈"):
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENZHAOJING_TUPOPINGJING_CLICK));
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.shenzhaojingTupo._parent2 = param1;
         this.shenzhaojingTupo._parent = this;
         this.shenzhaojingTisu.$parent = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENZHAOJING_PREVIOUS_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENZHAOJING_NEXT_CLICK));
         }
      }
      
      private function closeTupo(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function setDengji(param1:String) : void
      {
         this.fta3.htmlText = param1;
      }
      
      public function setJindu(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Boolean = false;
         if(param4 == 20 && param6 == 5 && param2 == param3)
         {
            _loc8_ = true;
         }
         if(param4 >= 1)
         {
            this.CurrLV = true;
         }
         param4--;
         this.isDrag = this.CurrLV;
         var _loc9_:Boolean = true;
         this.dengjiId = param2;
         this.xldjBar.setValue(param2,param3);
         this.TssdBtn.label = LanResManager.getLanCommonTextWords("提升速度");
         this.TssdBtn.enabled = true;
         if(param2 == param3)
         {
            if(param6 == 5 && param7 == 5 && param5 - param4 == 1)
            {
               _loc9_ = true;
               this.TssdBtn.label = LanResManager.getLanCommonTextWords("突破瓶颈");
            }
            else if(param6 == 5 && param7 < 5 && param4 > param5)
            {
               _loc9_ = false;
               this.TssdBtn.label = LanResManager.getLanCommonTextWords("已达成");
            }
            else if(param7 <= 5)
            {
               _loc9_ = false;
               this.TssdBtn.label = LanResManager.getLanCommonTextWords("已达成");
            }
         }
         else if(param4 < param5)
         {
            if(param7 - param6 == 1 && param5 - param4 == 1)
            {
               _loc9_ = true;
            }
            else
            {
               _loc9_ = false;
            }
         }
         this.TssdBtn.enabled = _loc9_;
         if(param5 == 1 && param7 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param5 == 20 && param7 == 5)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         if(_loc8_)
         {
            this.TssdBtn.label = LanResManager.getLanCommonTextWords("已达成");
            this.TssdBtn.enabled = false;
         }
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_HUTIGANGQI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_SANGANG_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_SHUANGYUAN_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_ZIJINBO_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_ZIJINBO_ID])
            {
               this.setSkillJiHuo1(200276,true);
               this.mainSkillContainer1.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer1.visible = false;
               this.kuang1.visible = false;
            }
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_ZILINGSHOU_ID];
            this.checkHuanZhuang.visible = GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_ZILINGSHOU_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_WUZITIANSHU_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_TIANJIELINGSHOU_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_TIANJIELINGSHOU_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.SHENZHAOJING_ZHENYUANJIHUOSHI_ID];
            this.fts8num = GameState.dictMainStatus[725536];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_HUTIGANGQI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_SANGANG_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_SHUANGYUAN_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_ZIJINBO_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_ZIJINBO_ID])
            {
               this.setSkillJiHuo1(200276,true);
               this.mainSkillContainer1.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer1.visible = false;
               this.kuang1.visible = false;
            }
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_ZILINGSHOU_ID];
            this.checkHuanZhuang.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_ZILINGSHOU_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_WUZITIANSHU_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_TIANJIELINGSHOU_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_TIANJIELINGSHOU_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENZHAOJING_ZHENYUANJIHUOSHI_ID];
            this.fts8num = GameState.dictTargetStatus[725536];
         }
      }
      
      public function setSkill(param1:Skill, param2:String) : void
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
         if(this.CurrLV)
         {
            this.mainSkill.isLearn = 1;
         }
         else
         {
            this.mainSkill.isLearn = 0;
         }
         this.mainSkill.isLevelUp = 0;
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
         this.skillDesc.htmlText = param2;
      }
      
      public function setShuxing(param1:Array, param2:Array) : void
      {
         var int1:int = 0;
         var arr:Array = param1;
         var bitArr:Array = param2;
         var mcBo:Boolean = true;
         if(this.renwuArr.length > 0)
         {
            mcBo = false;
         }
         this.renwuArr = bitArr;
         this.ftSX3.htmlText = "<textformat leading=\'8\'>   " + arr[0] + "<br>           " + arr[4] + "</textformat>";
         this.ftSX4.htmlText = arr[1];
         this.ftSX5.htmlText = arr[2];
         this.ftSX6.htmlText = "<textformat leading=\'8\'>" + arr[3] + "<br>" + arr[6] + "</textformat>";
         this.ftSX7.htmlText = arr[5];
         this.fta.htmlText = arr[7];
         this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/shenzhaojing/1.swf";
         if(mcBo)
         {
            if(Boolean(this.gongMc) && this.gongMc.parent != null)
            {
               this.gongMc.removeEventListener(Event.ENTER_FRAME,this.aa11);
               this.gongMc.stop();
               this.gongMc.parent.removeChild(this.gongMc);
            }
            while(this.gongMcSpr.numChildren > 0)
            {
               this.gongMcSpr.removeChildAt(0);
            }
            int1 = int(arr[8]);
            if(this.mcObj[int1] != null)
            {
               this.gongMc = this.mcObj[int1];
               this.gongMc.gotoAndPlay(1);
               this.gongMc.addEventListener(Event.ENTER_FRAME,this.aa11);
               this.gongMcSpr.addChild(this.gongMc);
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
                  if(Boolean(gongMc) && gongMc.parent != null)
                  {
                     gongMc.removeEventListener(Event.ENTER_FRAME,aa11);
                     gongMc.stop();
                     gongMc.parent.removeChild(gongMc);
                  }
                  while(gongMcSpr.numChildren > 0)
                  {
                     gongMcSpr.removeChildAt(0);
                  }
                  gongMc = _loc2_.content as MovieClip;
                  mcObj[int1] = gongMc;
                  if(gongMc)
                  {
                     gongMc.gotoAndPlay(1);
                     gongMc.addEventListener(Event.ENTER_FRAME,aa11);
                     gongMcSpr.addChild(gongMc);
                  }
               },null,false,this.loadUrl);
            }
         }
      }
      
      private function aa11(param1:Event) : void
      {
         if(this.renwuArr.length < 1)
         {
            return;
         }
         var _loc2_:MovieClip = param1.target as MovieClip;
         if(_loc2_.currentFrame <= 4)
         {
            this.renwuBitmap.bitmapData = this.renwuArr[0];
         }
         else if(_loc2_.currentFrame <= 8)
         {
            this.renwuBitmap.bitmapData = this.renwuArr[1];
         }
         else if(_loc2_.currentFrame <= 12)
         {
            this.renwuBitmap.bitmapData = this.renwuArr[2];
         }
         else if(_loc2_.currentFrame <= 16)
         {
            this.renwuBitmap.bitmapData = this.renwuArr[3];
         }
         else if(_loc2_.currentFrame <= 20)
         {
            this.renwuBitmap.bitmapData = this.renwuArr[4];
         }
         else if(_loc2_.currentFrame <= 24)
         {
            this.renwuBitmap.bitmapData = this.renwuArr[4];
         }
         else if(_loc2_.currentFrame <= 28)
         {
            this.renwuBitmap.bitmapData = this.renwuArr[5];
         }
         else if(_loc2_.currentFrame <= 32)
         {
            this.renwuBitmap.bitmapData = this.renwuArr[5];
         }
         else if(_loc2_.currentFrame <= 33)
         {
            this.renwuBitmap.bitmapData = this.renwuArr[1];
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.removeEventListener(Event.ENTER_FRAME,this.aa11);
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
         while(this.gongMcSpr.numChildren > 0)
         {
            this.gongMcSpr.removeChildAt(0);
         }
         this.renwuArr = [];
      }
      
      public function setShenZhaoJingEnabledFun() : void
      {
         this.TssdBtn.enabled = false;
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.shenzhaojingTupo.x == 138)
            {
               TweenMax.to(this.shenzhaojingTupo,1,{"x":410});
               this.tupoBo = true;
               this.TssdBtn.enabled = false;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
            }
         }
         else
         {
            if(this.shenzhaojingTupo.x == 410)
            {
               TweenMax.to(this.shenzhaojingTupo,1,{"x":138});
               this.tupoBo = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENZHAOJING_ZIDONGTISHENG_CLICKJ,"",false));
               this.TssdBtn.enabled = true;
               this.previousButton.enabled = true;
               this.nextButton.enabled = true;
            }
            this.shenzhaojingTupo.check.selectState = false;
            this.shenzhaojingTupo.check.enabled = true;
            this.shenzhaojingTupo.zdlwBtn.enabled = true;
         }
      }
      
      public function setJiujianLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.shenzhaojingTupo.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setJiujianLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.shenzhaojingTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setJiujianLingwuGoods(param1:Goods) : void
      {
         this.shenzhaojingTupo.setGoods(param1);
      }
      
      public function setJiujianLingwuShuoming(param1:String) : void
      {
         this.shenzhaojingTupo.setShuoming(param1);
      }
      
      public function setJiujianLingwuBtn(param1:Boolean) : void
      {
         this.shenzhaojingTupo.setBtn(param1);
      }
      
      public function bofangDuguYanhua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = 300 - yanhuaMc.width / 2;
            yanhuaMc.y = 100 - yanhuaMc.height / 2;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/wabao.swf");
      }
      
      public function istupoCanvasShow() : Boolean
      {
         if(this.shenzhaojingTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      private function onSkillMouseDown1(param1:MouseEvent) : void
      {
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove1(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
         }
      }
      
      private function onSkillMouseUp1(param1:MouseEvent) : void
      {
         this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
      }
      
      public function setSkillJiHuo1(param1:int, param2:Boolean) : void
      {
         while(this.mainSkillContainer1.numChildren > 0)
         {
            this.mainSkillContainer1.removeChildAt(0);
         }
         if(this.mainSkillItemFace1)
         {
            if(this.mainSkillItemFace1.parent)
            {
               this.mainSkillItemFace1.parent.removeChild(this.mainSkillItemFace1);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill1 = _loc3_;
         if(param2)
         {
            this.mainSkill1.isLearn = 1;
         }
         else
         {
            this.mainSkill1.isLearn = 0;
         }
         this.mainSkillItemFace1 = new ItemFace(this.mainSkill1);
         this.mainSkillItemFace1.showKungFuTag();
         this.mainSkillItemFace1.setShowCount(false);
         this.mainSkillContainer1.addChild(this.mainSkillItemFace1);
      }
      
      public function huanzhuang(param1:Boolean, param2:Boolean) : void
      {
         this.checkHuanZhuang.selectState = param1;
         this.checkDt.selectState = param2;
      }
   }
}

