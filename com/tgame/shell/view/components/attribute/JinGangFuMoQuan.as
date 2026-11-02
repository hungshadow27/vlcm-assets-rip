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
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.jingangfumoquan.model.info.JingangfumoquanVo;
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
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class JinGangFuMoQuan extends Sprite
   {
      
      public static const UI_JINGANGFUMOQUAN_GUANBI_CLICK:String = "UI_JINGANGFUMOQUAN_GUANBI_CLICK";
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var lingWuBtn:SmallButton;
      
      private var miaoshu:FTextArea;
      
      private var zuoshuxing:FTextArea;
      
      private var youshuxing:FTextArea;
      
      private var tsshuxing:FTextArea;
      
      public var $parent:DisplayObject;
      
      private var p:Point;
      
      private var kuang:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var jingangfumoquanTupo:JinGangFuMoQuanTupoCanvas;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var _avatar:Bitmap;
      
      private var bloodMc0:MovieClip;
      
      private var mcObj0:Array;
      
      private var bloodMcSpr0:Sprite;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var ZHENFA_MAX:int = 5;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var checkTx:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var equipContainers1:Sprite;
      
      private var fts5:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var fts6:FTextArea;
      
      public function JinGangFuMoQuan()
      {
         var fujia:FTextArea;
         var jineng:FTextArea;
         var $mask:Sprite;
         var jingang:FTextArea = null;
         super();
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jingangfumoquan/bg.swf");
         this.bg.visible = true;
         this.bg.x = 1;
         this.bg.y = 1;
         this.bgSpr.addChild(this.bg);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 282 - 5 - 50 + 23 + 9 + 2;
         this.fc1.width = 403 - 4;
         this.fc1.height = 80 + 5 + 2 + 50 - 23 - 9 - 2;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 15;
         this.bloodMcSpr.y = 15;
         addChild(this.bloodMcSpr);
         this._avatar = new Bitmap();
         addChildAt(this._avatar,1);
         this.bloodMcSpr0 = new Sprite();
         this.bloodMcSpr0.x = 15 - 134;
         this.bloodMcSpr0.y = 15 - 120;
         addChild(this.bloodMcSpr0);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 245 + 35 - 12 + 10;
         this.previousButton.y = 155 + 25;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.multiline = true;
         this.cengshu.autoSize = TextFieldAutoSize.CENTER;
         this.cengshu.wordWrap = true;
         this.cengshu.width = 60;
         this.cengshu.height = 30;
         this.cengshu.x = this.previousButton.x + this.previousButton.width + 15;
         this.cengshu.y = 155 + 25;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("第一层") + "</font>";
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = this.cengshu.x + this.cengshu.width;
         this.nextButton.y = 155 + 25;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 335 - 23 - 14 + 1 + 15 - 5;
         this.lingWuBtn.y = 195 - 1 - 5 + 10 + 23 - 7;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         jingang = new FTextArea();
         addChild(jingang);
         jingang.multiline = true;
         jingang.autoSize = TextFieldAutoSize.CENTER;
         jingang.wordWrap = true;
         jingang.width = 150;
         jingang.height = 30;
         jingang.x = 270 + 15 + 15;
         jingang.y = 12;
         jingang.htmlText = "<font size = \'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("金刚伏魔圈") + "</font>";
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.CENTER;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160 - 20 - 18;
         this.miaoshu.height = 120;
         this.miaoshu.x = 230 + 30 + 18;
         this.miaoshu.y = 40;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("由真武大帝搞出来的") + "</font>";
         fujia = new FTextArea();
         addChild(fujia);
         fujia.multiline = true;
         fujia.autoSize = TextFieldAutoSize.CENTER;
         fujia.wordWrap = true;
         fujia.width = 150;
         fujia.height = 30;
         fujia.x = 25;
         fujia.y = 260 + 8;
         fujia.htmlText = "<font size = \'14\' color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("属性加成") + "</font>";
         this.zuoshuxing = new FTextArea();
         addChild(this.zuoshuxing);
         this.zuoshuxing.multiline = true;
         this.zuoshuxing.autoSize = TextFieldAutoSize.CENTER;
         this.zuoshuxing.wordWrap = true;
         this.zuoshuxing.width = 120;
         this.zuoshuxing.height = 40;
         this.zuoshuxing.x = 25;
         this.zuoshuxing.y = 260 + 25 + 8;
         this.zuoshuxing.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命：") + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + "</font>";
         this.youshuxing = new FTextArea();
         addChild(this.youshuxing);
         this.youshuxing.multiline = true;
         this.youshuxing.autoSize = TextFieldAutoSize.CENTER;
         this.youshuxing.wordWrap = true;
         this.youshuxing.width = 120;
         this.youshuxing.height = 40;
         this.youshuxing.x = 25 + 135;
         this.youshuxing.y = 260 + 25 + 8;
         this.youshuxing.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + "</font>";
         this.tsshuxing = new FTextArea();
         addChild(this.tsshuxing);
         this.tsshuxing.multiline = true;
         this.tsshuxing.autoSize = TextFieldAutoSize.CENTER;
         this.tsshuxing.wordWrap = true;
         this.tsshuxing.width = 270;
         this.tsshuxing.height = 130;
         this.tsshuxing.x = 25 + 135 - 30;
         this.tsshuxing.y = 260 + 25 + 30 + 15 + 5;
         this.tsshuxing.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊属性：减免999%的暴击伤害") + "</font>";
         jineng = new FTextArea();
         addChild(jineng);
         jineng.multiline = true;
         jineng.autoSize = TextFieldAutoSize.CENTER;
         jineng.wordWrap = true;
         jineng.width = 70;
         jineng.height = 16;
         jineng.x = 355 - 15 - 30 + 8;
         jineng.y = 315 - 20 - 20;
         jineng.htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶级技能") + "</font>";
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 355 - 30;
         this.kuang.y = 315 - 20;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 355 + 2 - 30;
         this.mainSkillContainer.y = 315 + 2 - 20;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.jingangfumoquanTupo = new JinGangFuMoQuanTupoCanvas();
         addChild(this.jingangfumoquanTupo);
         this.jingangfumoquanTupo.x = 138;
         this.jingangfumoquanTupo.y = -10;
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
         this.jingangfumoquanTupo.mask = $mask;
         addEventListener(UI_JINGANGFUMOQUAN_GUANBI_CLICK,this.aa1);
         this.mcObj = new Array();
         this.mcObj0 = new Array();
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 7;
         this.fts.textColor = StaticValue.GREEN;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.filters = StaticValue.filter;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("伏魔战神(已激活)");
         this.fts.visible = false;
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击26888888 防御 20888888 血量30888888 暴击 888 闪避888 所有武功提升15层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10 + 103;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.filters = StaticValue.filter;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("金刚伏魔最终式秘籍(已激活)");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击388888888防御88888888血量1088888888暴击 8888闪避8888 所有武功提升108层") + "<br>" + LanResManager.getLanCommonTextWords("金刚伏魔最终式（特殊技能）：激活金刚伏魔最终式后每次攻击都将有10%的几率使对手命中金刚伏魔最终式BUFF，") + "<br>" + LanResManager.getLanCommonTextWords("在该BUFF状态中，无法触发任何无敌效果，效果持续60秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 103;
         this.fts2.y = 7 + 263;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.filters = StaticValue.filter;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("金刚伏魔神将心法(已激活)");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：3288亿、防御2588亿、血量6000亿、所有武功提升 40888层") + "<br>" + LanResManager.getLanCommonTextWords("伏魔枷锁：伏魔枷锁可使金刚伏魔诀的技能效果延长到10分钟，冷却时间13分钟！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 103;
         this.fts3.y = 7 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.filters = StaticValue.filter;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("金刚伏魔隐藏心法(已激活)");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("金刚伏魔隐藏心法（特殊技能）：双击使用金刚伏魔决后，可使人物自身外围形成超炫蓝色气场！") + "<br>" + LanResManager.getLanCommonTextWords("战斗时，每次攻击无论是否命中都必定恢复自身血量5%，且被攻击时100%触发金刚刺杀状态，令对") + "<br>" + LanResManager.getLanCommonTextWords("手瞬间掉血50%且禁武3秒，状态持续10秒，冷却120秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 103;
         this.fts4.y = 7 + 20 + 25 + 155;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.filters = StaticValue.filter;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("噬血护罩");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御 60888亿、血量 80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("噬血护罩：拥有血一样颜色的护罩，传闻魔界大战后留下的上古道具，人物可自己切换该护罩。") + "<br>" + LanResManager.getLanCommonTextWords("噬血：攻击时有几率触发噬血，持续10秒；在此状态下，自身血量将不断补充，每受到一次伤") + "<br>" + LanResManager.getLanCommonTextWords("害就将立即恢复受到的伤害数值，值自身的血量一直保持在100%；且自身每攻击对手一次，对") + "<br>" + LanResManager.getLanCommonTextWords("手都将立即惊恐，所有攻击立即停止，且眩晕无法看清方向，持续10秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.checkTx = new FCheckBox();
         addChild(this.checkTx);
         this.checkTx.x = 200 - 15;
         this.checkTx.y = 7 + 20 + 25 + 155;
         this.checkTx.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 103;
         this.fts5.y = 7 + 20 + 25 + 25 + 155;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 75;
         this.fts5.height = 20;
         this.fts5.filters = StaticValue.filter;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("风雷（神器）");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("风雷电击：攻击时有几率触发风雷电击，持续10秒；对手在此状态下，将无法进") + "<br>" + LanResManager.getLanCommonTextWords("入隐身状态，且每秒将受到电击，所有攻击能力下降至0点，无法使用任何技能；") + "<br>" + LanResManager.getLanCommonTextWords("所有技能受到电击的影响，将无法触发，且对手在此效果下，时间将受到限制，") + "<br>" + LanResManager.getLanCommonTextWords("每次移动都将慢慢的迟缓前进。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 200 - 15;
         this.checkWq.y = 7 + 20 + 25 + 25 + 155;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 13;
         this.fts6.y = 7 + 20 + 25 + 25 + 155;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 120;
         this.fts6.height = 20;
         this.fts6.filters = StaticValue.filter;
         this.fts6.htmlText = new Goods(729152).res.name;
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("伏魔诀1") + "<br>" + LanResManager.getLanCommonTextWords("伏魔诀2") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8 - 133;
         this.equipContainers.y = 12 + 30 + 135 + 35;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuangHD);
         this.kuangHD.x = 280;
         this.kuangHD.y = 140;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuangHD);
         this.kuangHD.x = 280 + 60;
         this.kuangHD.y = 140;
         this.equipContainers1 = new Sprite();
         this.equipContainers1.x = 280;
         this.equipContainers1.y = 140;
         with(this.equipContainers1.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,100,40);
            endFill();
         }
         this.equipContainers1.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick1,false,30);
         addChild(this.equipContainers1);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkTx:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkTx.selectState,91]));
               break;
            case this.checkWq:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,89]));
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGANGFUMOQUAN_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGANGFUMOQUAN_XIAYIYE_CLICK));
               break;
            case this.lingWuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGANGFUMOQUAN_LINGWU_SHOW));
               this.showTuPoPanel(true);
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
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGANGFUMOQUAN_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.jingangfumoquanTupo._parent2 = param1;
         this.jingangfumoquanTupo._parent3 = this;
      }
      
      public function setInitialize(param1:Boolean, param2:JingangfumoquanVo) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.jbShuxingStr,param2.tsShuxingStr);
         this.setZhenFaTiSheng(param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skill);
         this.setJiHuo(param1);
         this.checkTx.selectState = param2.isTeXiao;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.visible = GameState.dictMainStatus[SpecialGoodsID.JINGANGFEUMOQUAN_FUMOZHANSHEN_ID];
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.JINGANGFUMOQUAN_ZUIZHONGSHI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.JINGANGFUMOQUAN_SHENJIANGXINFA_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.JINGANGFUMOQUAN_YINCANGXINFA_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.JINGANGFUMOQUAN_SHIXUEHUZHAO_ID];
            this.checkTx.visible = GameState.dictMainStatus[SpecialGoodsID.JINGANGFUMOQUAN_SHIXUEHUZHAO_ID];
            this.fts6.visible = GameState.dictMainStatus[729152];
         }
         else
         {
            this.fts.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGANGFEUMOQUAN_FUMOZHANSHEN_ID];
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGANGFUMOQUAN_ZUIZHONGSHI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGANGFUMOQUAN_SHENJIANGXINFA_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGANGFUMOQUAN_YINCANGXINFA_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGANGFUMOQUAN_SHIXUEHUZHAO_ID];
            this.checkTx.visible = GameState.dictTargetStatus[SpecialGoodsID.JINGANGFUMOQUAN_SHIXUEHUZHAO_ID];
            this.fts6.visible = GameState.dictTargetStatus[729152];
         }
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 100 - this._avatar.width / 2 + 35 + 8 - 6;
         this._avatar.y = 110 - this._avatar.height + 40 + 13 + 21 + 7;
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var loadUrl0:String = null;
         var id:int = param1;
         mcId = id;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/jingangfumoquan/" + mcId + ".swf";
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
         loadUrl0 = GameConfig.fileBaseFolder + "res/ui/UIditu/jingangfumoquan/bg1.swf";
         if(Boolean(this.bloodMc0) && this.bloodMc0.parent != null)
         {
            this.bloodMc0.stop();
            this.bloodMc0.parent.removeChild(this.bloodMc0);
         }
         while(this.bloodMcSpr0.numChildren > 0)
         {
            this.bloodMcSpr0.removeChildAt(0);
         }
         if(this.mcObj0[mcId] != null)
         {
            this.bloodMc0 = this.mcObj0[mcId];
            this.bloodMc0.play();
            this.bloodMcSpr0.addChild(this.bloodMc0);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl0)
               {
                  return;
               }
               if(Boolean(bloodMc0) && bloodMc0.parent != null)
               {
                  bloodMc0.stop();
                  bloodMc0.parent.removeChild(bloodMc0);
               }
               while(bloodMcSpr0.numChildren > 0)
               {
                  bloodMcSpr0.removeChildAt(0);
               }
               bloodMc0 = _loc2_.content as MovieClip;
               mcObj0[mcId] = bloodMc0;
               if(bloodMc0)
               {
                  bloodMcSpr0.addChild(bloodMc0);
               }
            },null,false,loadUrl0);
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         if(Boolean(this.bloodMc0) && this.bloodMc0.parent != null)
         {
            this.bloodMc0.stop();
            this.bloodMc0.parent.removeChild(this.bloodMc0);
         }
      }
      
      public function setShuxingJiacheng(param1:String, param2:String, param3:String) : void
      {
         var _loc8_:String = null;
         var _loc9_:Array = null;
         if(param2 == "")
         {
            return;
         }
         var _loc4_:String = "";
         var _loc5_:String = "";
         var _loc6_:Array = param2.split(";");
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc8_ = _loc6_[_loc7_];
            _loc9_ = _loc8_.split(",");
            if(_loc7_ % 2)
            {
               _loc4_ += this.setValue(_loc9_[0]) + ":" + _loc9_[1] + "<br>";
            }
            else
            {
               _loc5_ += this.setValue(_loc9_[0]) + ":" + _loc9_[1] + "<br>";
            }
            _loc7_++;
         }
         this.youshuxing.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc4_ + "</font>";
         this.zuoshuxing.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc5_ + "</font>";
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
         this.tsshuxing.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊属性：") + param3 + "</font>";
      }
      
      private function setValue(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("攻击");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("防御");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("暴击");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("闪避");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("生命");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("体力");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("内力");
               break;
            case 8:
               _loc2_ = LanResManager.getLanCommonTextWords("攻击速度");
               break;
            case 9:
               _loc2_ = LanResManager.getLanCommonTextWords("移动速度");
               break;
            case 10:
               _loc2_ = LanResManager.getLanCommonTextWords("命中");
               break;
            case 20:
               _loc2_ = LanResManager.getLanCommonTextWords("青龙站纹");
               break;
            case 21:
               _loc2_ = LanResManager.getLanCommonTextWords("朱雀站纹");
               break;
            case 22:
               _loc2_ = LanResManager.getLanCommonTextWords("白虎站纹");
               break;
            case 23:
               _loc2_ = LanResManager.getLanCommonTextWords("玄武站纹");
               break;
            case 25:
               _loc2_ = LanResManager.getLanCommonTextWords("爆击免伤比例");
               break;
            case 32:
               _loc2_ = LanResManager.getLanCommonTextWords("暗器免伤比例");
               break;
            case 33:
               _loc2_ = LanResManager.getLanCommonTextWords("抵抗弓箭比例");
               break;
            case 34:
               _loc2_ = LanResManager.getLanCommonTextWords("抵抗丹田比例");
               break;
            case 47:
               _loc2_ = LanResManager.getLanCommonTextWords("抵抗暴击伤害几率");
               break;
            case 48:
               _loc2_ = LanResManager.getLanCommonTextWords("被攻击时有几率触发狂暴技能（3秒内增加人物攻击伤害30%）");
               break;
            case 49:
               _loc2_ = LanResManager.getLanCommonTextWords("武功层数");
         }
         return _loc2_;
      }
      
      public function setZhenFaTiSheng(param1:int, param2:int = -1) : void
      {
         if(param1 == 1)
         {
            this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第一层") + "</font>";
         }
         else if(param1 == 2)
         {
            this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第二层") + "</font>";
         }
         else if(param1 == 3)
         {
            this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第三层") + "</font>";
         }
         else if(param1 == 4)
         {
            this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第四层") + "</font>";
         }
         else if(param1 == 5)
         {
            this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第五层") + "</font>";
         }
         this.nowId = param2;
         this.lookingId = param1;
         if(this.tupoBo)
         {
            this.previousButton.enabled = false;
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
            this.lingWuBtn.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(param1 <= 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(param1 >= this.ZHENFA_MAX)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
            if(param1 < param2 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.lingWuBtn.enabled = false;
            }
            else if(param1 == param2 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
               this.lingWuBtn.enabled = true;
            }
            else if(param1 > param2 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
               this.lingWuBtn.enabled = false;
            }
         }
      }
      
      public function setSkill(param1:Skill) : void
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
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         if(param1.isLearn)
         {
            this.mainSkillItemFace.filters = [];
         }
         else
         {
            this.mainSkillItemFace.filters = Tools.blackWhiteFilter;
         }
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.jingangfumoquanTupo.x == 138)
            {
               TweenMax.to(this.jingangfumoquanTupo,1,{"x":410});
               this.tupoBo = true;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
               this.lingWuBtn.enabled = false;
            }
         }
         else
         {
            if(this.jingangfumoquanTupo.x == 410)
            {
               TweenMax.to(this.jingangfumoquanTupo,1,{"x":138});
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGANGFUMOQUAN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.previousButton.enabled = true;
            this.nextButton.enabled = true;
            this.lingWuBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.previousButton.enabled = false;
            }
            if(this.lookingId >= this.ZHENFA_MAX)
            {
               this.nextButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.jingangfumoquanTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.jingangfumoquanTupo.setTupoInit(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jingangfumoquanTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.jingangfumoquanTupo.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.jingangfumoquanTupo.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.lingWuBtn.enabled = false;
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      private function onItemClick1(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_JinGangFuMoQuan(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_JINGANGFUMOQUAN_FENGLEI)
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
                  this.checkWq.visible = true;
                  this.fts5.visible = true;
               }
               else
               {
                  this.checkWq.visible = false;
                  this.fts5.visible = false;
               }
            }
            _loc2_++;
         }
      }
      
      public function set_JinGangFuMoQuan1(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers1.numChildren > 0)
         {
            this.equipContainers1.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSITION_JGFMQ1)
            {
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers1.addChild(_loc4_);
            }
            if(_loc3_.res.position == ItemPositionRange.POSTION_20180926XUNZHANG_17)
            {
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers1.addChild(_loc4_);
            }
            if(_loc3_.res.position == ItemPositionRange.POSITION_JGFMQ2)
            {
               _loc4_.x = 62;
               _loc4_.y = 2;
               this.equipContainers1.addChild(_loc4_);
            }
            if(_loc3_.res.position == ItemPositionRange.POSTION_20180926XUNZHANG_14)
            {
               _loc4_.x = 62;
               _loc4_.y = 2;
               this.equipContainers1.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

