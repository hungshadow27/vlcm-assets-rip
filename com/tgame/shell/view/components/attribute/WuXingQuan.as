package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
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
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import gs.TweenMax;
   
   public class WuXingQuan extends Sprite
   {
      
      public static const UI_TUPO_GUANBI_CLICK:String = "UI_TUPO_GUANBI_CLICK";
      
      public var _parent:DisplayObject;
      
      private var classBtn1:SimpleButton;
      
      private var classBtn2:SimpleButton;
      
      private var classBtn3:SimpleButton;
      
      private var classBtn4:SimpleButton;
      
      private var classBtn5:SimpleButton;
      
      private var classBtn6:SimpleButton;
      
      private var fc1:FCanvas;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var fta:FTextArea;
      
      private var miaoshuFta:FTextArea;
      
      private var mingchengFta:FTextArea;
      
      private var jieshaoFta:FTextArea;
      
      private var jihuoBtn:SecondButton;
      
      private var jiachengFta:FTextArea;
      
      private var img:Bitmap;
      
      private var bit1:DisplayObject;
      
      private var WuXingQuanTupo:WuXingQuanTupoCanvas;
      
      private var yanhuaMc:MovieClip;
      
      private var shujuArr:Array;
      
      private var dangqianId:int;
      
      private var item:ItemFace;
      
      private var btnEnd:Boolean = true;
      
      private var mianbanBo:Boolean = false;
      
      private var nameFta:FTextArea;
      
      private var dianjiId:int;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var skillSpr:Sprite;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var isDrag:Boolean = false;
      
      private var skillArr:Array;
      
      private var ft:FTextArea;
      
      private var fts2:FTextArea;
      
      private var wulishi:int = 0;
      
      private var wuxueshi:int = 0;
      
      private var dongxie:Boolean = false;
      
      private var xidu:Boolean = false;
      
      private var nandi:Boolean = false;
      
      private var beigai:Boolean = false;
      
      private var zhongshentong:Boolean = false;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var fts5:FTextArea;
      
      private var check1:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts7:FTextArea;
      
      private var fts8:FTextArea;
      
      private var fts9:FTextArea;
      
      private var fts10:FTextArea;
      
      private var fts11:FTextArea;
      
      private var fts12:FTextArea;
      
      public function WuXingQuan()
      {
         var $class:Class;
         var $mask:Sprite;
         var tf:TextFormat = null;
         this.skillArr = [52001,52002,52003,52004,52005];
         super();
         this.fc1 = new FCanvas();
         this.fc1.width = 403;
         this.fc1.height = 365;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         $class = getDefinitionByName("ui.wuxingquan.btn.1") as Class;
         this.classBtn1 = new $class() as SimpleButton;
         addChild(this.classBtn1);
         this.classBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn1.x = 35;
         this.classBtn1.y = 10;
         this.classBtn1.name = "1";
         this.classBtn1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.wuxingquan.btn.2") as Class;
         this.classBtn2 = new $class() as SimpleButton;
         addChild(this.classBtn2);
         this.classBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn2.x = 50 + 40;
         this.classBtn2.y = 10;
         this.classBtn2.name = "2";
         this.classBtn2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.wuxingquan.btn.3") as Class;
         this.classBtn3 = new $class() as SimpleButton;
         addChild(this.classBtn3);
         this.classBtn3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn3.x = 100 + 40 + 10;
         this.classBtn3.y = 10;
         this.classBtn3.name = "3";
         this.classBtn3.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn3.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.wuxingquan.btn.4") as Class;
         this.classBtn4 = new $class() as SimpleButton;
         addChild(this.classBtn4);
         this.classBtn4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn4.x = 150 + 40 + 15;
         this.classBtn4.y = 10;
         this.classBtn4.name = "4";
         this.classBtn4.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn4.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.wuxingquan.btn.5") as Class;
         this.classBtn5 = new $class() as SimpleButton;
         addChild(this.classBtn5);
         this.classBtn5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn5.x = 200 + 40 + 20;
         this.classBtn5.y = 10;
         this.classBtn5.name = "5";
         this.classBtn5.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn5.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         $class = getDefinitionByName("ui.wuxingquan.btn.6") as Class;
         this.classBtn6 = new $class() as SimpleButton;
         addChild(this.classBtn6);
         this.classBtn6.addEventListener(MouseEvent.CLICK,this.onClick);
         this.classBtn6.x = 250 + 40 + 25;
         this.classBtn6.y = 10;
         this.classBtn6.name = "6";
         this.classBtn6.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.classBtn6.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         tf = new TextFormat();
         tf.align = "center";
         this.nameFta = new FTextArea();
         this.nameFta.x = 300 - 30;
         this.nameFta.y = 150 - 90;
         this.nameFta.textColor = StaticValue.ORANGE;
         this.nameFta.filters = StaticValue.filter;
         this.nameFta.width = 125;
         this.nameFta.height = 20;
         this.nameFta.defaultTextFormat = tf;
         this.nameFta.htmlText = "";
         addChild(this.nameFta);
         this.jihuoBtn = new SecondButton();
         this.jihuoBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.jihuoBtn);
         this.jihuoBtn.x = 275;
         this.jihuoBtn.y = 233;
         this.jihuoBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.miaoshuFta = new FTextArea();
         this.miaoshuFta.x = 5;
         this.miaoshuFta.y = 260;
         this.miaoshuFta.textColor = StaticValue.ORANGE;
         this.miaoshuFta.filters = StaticValue.filter;
         this.miaoshuFta.htmlText = "";
         this.miaoshuFta.width = 210;
         this.miaoshuFta.height = 140;
         this.miaoshuFta.wordWrap = true;
         addChild(this.miaoshuFta);
         this.skillSpr = new Sprite();
         this.skillSpr.x = 10;
         this.skillSpr.y = 270;
         addChild(this.skillSpr);
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 10;
         this.mainSkillContainer.y = 275;
         addChild(this.mainSkillContainer);
         this.mingchengFta = new FTextArea();
         this.mingchengFta.x = 250;
         this.mingchengFta.y = 100;
         this.mingchengFta.textColor = StaticValue.ORANGE;
         this.mingchengFta.filters = StaticValue.filter;
         this.mingchengFta.htmlText = "";
         this.jieshaoFta = new FTextArea();
         this.jieshaoFta.x = 250;
         this.jieshaoFta.y = 120;
         this.jieshaoFta.autoSize = TextFieldAutoSize.LEFT;
         this.jieshaoFta.textColor = StaticValue.ORANGE;
         this.jieshaoFta.filters = StaticValue.filter;
         this.jieshaoFta.htmlText = "";
         this.fta = new FTextArea();
         this.fta.x = 225;
         this.fta.y = 260;
         this.fta.autoSize = TextFieldAutoSize.LEFT;
         this.fta.textColor = StaticValue.ORANGE;
         this.fta.filters = StaticValue.filter;
         this.fta.htmlText = LanResManager.getLanCommonTextWords("人物属性加成：");
         addChild(this.fta);
         this.jiachengFta = new FTextArea();
         this.jiachengFta.x = 225;
         this.jiachengFta.y = 275;
         this.jiachengFta.autoSize = TextFieldAutoSize.LEFT;
         this.jiachengFta.textColor = StaticValue.SKY_BLUE;
         this.jiachengFta.filters = StaticValue.filter;
         this.jiachengFta.htmlText = "";
         addChild(this.jiachengFta);
         this.fta = new FTextArea();
         this.fta.x = 340 - 5;
         this.fta.y = 310 - 23;
         this.fta.autoSize = TextFieldAutoSize.LEFT;
         this.fta.textColor = StaticValue.ORANGE;
         this.fta.filters = StaticValue.filter;
         this.fta.htmlText = LanResManager.getLanCommonTextWords("附带技能");
         addChild(this.fta);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 340;
         this.img.y = 310;
         this.WuXingQuanTupo = new WuXingQuanTupoCanvas();
         this.WuXingQuanTupo._parent2 = this;
         addChild(this.WuXingQuanTupo);
         this.WuXingQuanTupo.x = 138;
         this.WuXingQuanTupo.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,280,390);
            endFill();
         }
         this.WuXingQuanTupo.mask = $mask;
         addEventListener(UI_TUPO_GUANBI_CLICK,this.aa1);
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 60;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("五形拳终极属性(未激活)");
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击3288888、防御 2288888、血量800000000 、暴击888、闪避 888。提升人物攻击、防御、血量、暴击、闪避属性10%") + "<br>" + LanResManager.getLanCommonTextWords("五形拳终极伤害：永久三倍伤害") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 80;
         this.fts1.textColor = StaticValue.RED;
         this.fts1.width = 170;
         this.fts1.height = 20;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击12888888、防御6888888、血量18888888、暴击888、闪避888、所有武功提升12层") + "<br>" + LanResManager.getLanCommonTextWords("牛鬼蛇神：攻击时有几率命中对手，使对手在5秒内陷入极度恐慌状态，无法使用任何技能！");
            return _loc1_ + "</textformat>";
         });
         this.ft = new FTextArea();
         this.ft.x = 50;
         this.ft.y = 285;
         this.ft.textColor = StaticValue.GREEN;
         this.ft.visible = false;
         this.ft.width = 150;
         this.ft.height = 30;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("虎鹤双形最终心法已激活");
         addChild(this.ft);
         ToolTips.createToolTips(this.ft,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击3000亿、防御2000亿、血量5000亿、暴击48888、闪避48888、所有武功提升50000层");
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 100;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("五侠（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>";
            if(dongxie)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("东邪") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("养成属性：佩戴东邪的玩家，可使用武力石×1对东邪进行养成，每次养成可增加攻击500亿！（最多可养成100次！）") + "<br>" + LanResManager.getLanCommonTextWords("当前已养成") + wulishi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + wulishi * 500 + LanResManager.getLanCommonTextWords("亿") + "<br>";
            }
            if(xidu)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("西毒") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("养成属性：佩戴西毒的玩家，可使用武学石×1对西毒进行养成，每次养成可增加武功25000层！（最多可养成100次！）") + "<br>" + LanResManager.getLanCommonTextWords("当前已养成") + wuxueshi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + wuxueshi * 25000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            }
            if(nandi)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("南帝") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("南帝（特殊技能）：攻击时有几率触发南帝武学状态，持续10秒。对手在此状态下将全身乏力，武功将全失任人宰割，且瞬间") + "<br>" + LanResManager.getLanCommonTextWords("掉血60%。当对手血量低于30%时，对手将失去任何操作能力，持续5秒！") + "<br>";
            }
            if(beigai)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("北丐") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("北丐（特殊技能）：攻击时有几率触发北丐之滴水穿石状态，持续10秒。在此状态下每次攻击对手都必定令对手命中一个滴水") + "<br>" + LanResManager.getLanCommonTextWords("状态。对手命中一个滴水状态，将被束缚于原地，命中3个水滴状态，对手将被禁武3秒。当对手命中7个水滴时，必定触发滴") + "<br>" + LanResManager.getLanCommonTextWords("水石穿效果，瞬间爆发致命一击，掉90%血量！") + "<br>";
            }
            if(zhongshentong)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("中神通") + "<br>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("中神通（特殊技能）：攻击时有几率触发中神通状态，瞬间释放出6只擎天巨手，使对手命中各个") + "<br>" + LanResManager.getLanCommonTextWords("巨手的技能效果：1. 困龙手：令对手武功全失  2.锁天手：令对手体力内力全失  3. 冰玄手：攻") + "<br>" + LanResManager.getLanCommonTextWords("速，移速下降至1点  4. 火鸣手：每秒掉血30%  5. 悲郁手：无法跳跃，无法锁定  6. 星辰手：") + "<br>" + LanResManager.getLanCommonTextWords("所有勋章失效！") + "<br>";
            }
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 120;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("五侠特技秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("属性提升：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("五侠特技（特殊技能）：攻击时有几率触发五侠特技状态，持续30秒。在此状态下自身的东邪，西") + "<br>" + LanResManager.getLanCommonTextWords("毒，南帝，北丐，中神通 技能效果触发几率将提升至100%");
            return _loc1_ + "</textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 150;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 170;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("银蛇秘籍（已激活）");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("银蛇秘籍效果");
            return _loc1_ + "</textformat>";
         });
         this.fts8 = new FTextArea();
         this.fts8.x = 10;
         this.fts8.y = 168;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 170;
         this.fts8.height = 20;
         this.fts8.htmlText = new Goods(729239).res.name;
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("雷豹秘籍效果");
            return _loc1_ + "</textformat>";
         });
         this.fts9 = new FTextArea();
         this.fts9.x = 10;
         this.fts9.y = 186;
         this.fts9.textColor = StaticValue.GREEN;
         this.fts9.width = 170;
         this.fts9.height = 20;
         this.fts9.htmlText = new Goods(729904).res.name;
         this.fts9.visible = false;
         addChild(this.fts9);
         ToolTips.createToolTips(this.fts9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("白瞎秘籍效果1") + "<br>" + LanResManager.getLanCommonTextWords("白瞎秘籍效果2");
            return _loc1_ + "</textformat>";
         });
         this.fts10 = new FTextArea();
         this.fts10.x = 10;
         this.fts10.y = 204;
         this.fts10.textColor = StaticValue.GREEN;
         this.fts10.width = 170;
         this.fts10.height = 20;
         this.fts10.htmlText = new Goods(729905).res.name;
         this.fts10.visible = false;
         addChild(this.fts10);
         ToolTips.createToolTips(this.fts10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("黑虎秘籍效果1") + "<br>" + LanResManager.getLanCommonTextWords("黑虎秘籍效果2");
            return _loc1_ + "</textformat>";
         });
         this.fts11 = new FTextArea();
         this.fts11.x = 10;
         this.fts11.y = 222;
         this.fts11.textColor = StaticValue.GREEN;
         this.fts11.width = 170;
         this.fts11.height = 20;
         this.fts11.htmlText = new Goods(729906).res.name;
         this.fts11.visible = false;
         addChild(this.fts11);
         ToolTips.createToolTips(this.fts11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("青龙摆尾秘籍效果1") + "<br>" + LanResManager.getLanCommonTextWords("青龙摆尾秘籍效果2");
            return _loc1_ + "</textformat>";
         });
         this.fts12 = new FTextArea();
         this.fts12.x = 10;
         this.fts12.y = 240;
         this.fts12.textColor = StaticValue.GREEN;
         this.fts12.width = 170;
         this.fts12.height = 20;
         this.fts12.htmlText = new Goods(729907).res.name;
         this.fts12.visible = false;
         addChild(this.fts12);
         ToolTips.createToolTips(this.fts12,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("无形卷秘籍终极效果1") + "<br>" + LanResManager.getLanCommonTextWords("无形卷秘籍终极效果2");
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 28 + 20 + 100;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("魔龙精灵");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords(" 特殊属性：攻击56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords(" 魔龙召唤：玩家可随意召唤魔龙精灵出来战斗。攻击时有几率触发魔龙吐息，可瞬间使全场5") + "<br>" + LanResManager.getLanCommonTextWords(" 格内的所有玩家都将受吐息的影响瞬间无法移动，且魔龙吐息状态下，对手将无法施发技能，") + "<br>" + LanResManager.getLanCommonTextWords(" 每次都将受到吐息的冲击瞬间掉血60%，持续10秒；当状态解除后，对手全身经骨松散，5") + "<br>" + LanResManager.getLanCommonTextWords(" 秒内无法在继续攻击。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 10;
         this.check.y = 28 + 20 + 20 + 100;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8;
         this.equipContainers.y = 12 + 30 + 135 + 35 - 30;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 295;
         this.fts5.y = 28 + 20 + 100 + 40;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 42;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("炼妖壶");
         this.fts5.visible = false;
         addChild(this.fts5);
         this.check1 = new FCheckBox();
         this.check1.x = 10 + 295;
         this.check1.y = 28 + 20 + 20 + 100 + 40;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 28 + 20 + 100 + 25 + 15;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 82;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("穷奇（凶兽）");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击128888亿防御108888亿血量138888亿暴击 88888闪避 88888所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("穷奇：传说中古代“四凶”之一，传说中抑善扬恶的恶神；穷奇，古代传说中的一种猛兽名，人物可自己骑乘。") + "<br>" + LanResManager.getLanCommonTextWords("邪魔吞噬：攻击时100%触发邪魔吞噬，持续10秒；在此状态下，可召唤穷奇元神附于自己头顶，无须自己攻击，") + "<br>" + LanResManager.getLanCommonTextWords("每秒自身5格范围内的对手都将瞬间被震晕持续10秒；且对手在此眩晕状态下，所有勋章将受穷奇元神压制无法") + "<br>" + LanResManager.getLanCommonTextWords("触发，直到效果解除为止；当状态解除后，穷奇元神可瞬间爆发吞噬一击，使对手从该场景内消失，持续10秒。") + "<br>" + LanResManager.getLanCommonTextWords("冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 10 + 70 + 10;
         this.checkZq.y = 28 + 20 + 100 + 25 + 15;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,18]));
               break;
            case this.check1:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check1.selectState,61]));
               break;
            case this.checkZq:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,75]));
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.btnEnd)
         {
            if(this.dianjiId != int(param1.currentTarget.name) - 1)
            {
               this.setData(int(param1.currentTarget.name) - 1);
               this.showPanel(false);
            }
            this.dianjiId = int(param1.currentTarget.name) - 1;
         }
      }
      
      private function loadImg(param1:int) : void
      {
         if(this.bit1 != null && this.bit1.parent != null)
         {
            this.bit1.parent.removeChild(this.bit1);
         }
         this.bit1 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/wuxingquan/" + param1 + ".jpg",400,259);
         this.bit1.x = 2;
         this.bit1.y = 2;
         addChildAt(this.bit1,1);
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.WUXINGQUAN_LINGWU));
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:int = Number(_loc2_);
         var _loc4_:DisplayObject = this.getChildByName(_loc2_);
         var _loc5_:String = "";
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc4_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.shujuArr[_loc3_ - 1].zhuangtai == 0)
               {
                  _loc6_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("未领悟") + "</font>";
               }
               else if(this.shujuArr[_loc3_ - 1].zhuangtai == 2)
               {
                  _loc6_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可领悟") + "</font>";
               }
               else if(this.shujuArr[_loc3_ - 1].zhuangtai == 1)
               {
                  _loc6_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已领悟") + "</font>";
               }
               if(_loc3_ == 1)
               {
                  _loc7_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("无") + "</font>";
               }
               else if(this.shujuArr[_loc3_ - 1].zhuangtai == 0)
               {
                  _loc7_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + this.shujuArr[_loc3_ - 2].name + "</font>";
               }
               else if(this.shujuArr[_loc3_ - 1].zhuangtai == 2)
               {
                  _loc7_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.shujuArr[_loc3_ - 2].name + "</font>";
               }
               else if(this.shujuArr[_loc3_ - 1].zhuangtai == 1)
               {
                  _loc7_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.shujuArr[_loc3_ - 2].name + "</font>";
               }
               _loc5_ += "<textformat leading=\'6\'>";
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("招式名称") + "：" + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + this.shujuArr[_loc3_ - 1].name + "</font><br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("领悟状态") + "：" + "</font>" + _loc6_ + "<br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("领悟前提") + "：" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + _loc7_ + "</font><br>");
               _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("招式说明") + "：" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.shujuArr[_loc3_ - 1].miaoshu + "</font>");
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
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.WuXingQuanTupo._parent2 = param1;
         this.WuXingQuanTupo._parent3 = this;
      }
      
      private function setData(param1:int) : void
      {
         this.miaoshuFta.htmlText = this.shujuArr[param1].jieshao;
         var _loc2_:String = this.setShuxingFun(this.shujuArr[param1].shuxing);
         this.jiachengFta.htmlText = _loc2_;
         this.nameFta.htmlText = "<textformat leading=\'2\'>" + "<font size=\'15\'>" + this.shujuArr[param1].name + "</font></textformat>";
         this.loadImg(param1 + 1);
         if(this.dangqianId < param1)
         {
            this.jihuoBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.jihuoBtn.enabled = false;
         }
         else if(this.dangqianId == param1)
         {
            if(this.dangqianId == 5)
            {
               if(this.shujuArr[this.dangqianId].zhuangtai == 1)
               {
                  this.jihuoBtn.label = LanResManager.getLanCommonTextWords("已领悟");
                  this.jihuoBtn.enabled = false;
               }
               else
               {
                  this.jihuoBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
                  this.jihuoBtn.enabled = true;
               }
            }
            else
            {
               this.jihuoBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
               this.jihuoBtn.enabled = true;
            }
         }
         else if(this.dangqianId > param1)
         {
            this.jihuoBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.jihuoBtn.enabled = false;
         }
      }
      
      private function setShuxingFun(param1:Array) : String
      {
         var _loc2_:String = "<textformat leading=\'2\'>";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_] != 0)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("攻击：") + param1[_loc3_] + "<br>";
               }
               else if(_loc3_ == 1)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("防御：") + param1[_loc3_] + "<br>";
               }
               else if(_loc3_ == 2)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("生命：") + param1[_loc3_] + "<br>";
               }
               else if(_loc3_ == 3)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("暴击：") + param1[_loc3_] + "<br>";
               }
               else if(_loc3_ == 4)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("闪避：") + param1[_loc3_] + "<br>";
               }
            }
            _loc3_++;
         }
         _loc2_ += "</textformat>";
         if(param1.length > 0)
         {
            return _loc2_;
         }
         return "";
      }
      
      public function setInitialize(param1:Array, param2:Skill, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean) : void
      {
         var _loc10_:DisplayObject = null;
         this.shujuArr = param1;
         this.isMain = param4;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:int = 0;
         while(_loc11_ < this.shujuArr.length)
         {
            _loc10_ = this.getChildByName(String(_loc11_ + 1));
            if(this.shujuArr[_loc11_].zhuangtai == 0)
            {
               _loc9_++;
               _loc10_.filters = Tools.blackWhiteFilter;
            }
            else if(this.shujuArr[_loc11_].zhuangtai == 1)
            {
               _loc8_++;
               _loc10_.filters = [];
            }
            else if(this.shujuArr[_loc11_].zhuangtai == 2)
            {
               this.dangqianId = _loc11_;
               _loc10_.filters = [];
            }
            _loc11_++;
         }
         if(_loc9_ == 6)
         {
            this.dangqianId = 0;
         }
         else if(_loc8_ == 6)
         {
            this.dangqianId = this.shujuArr.length - 1;
         }
         this.setData(this.dangqianId);
         this.dianjiId = this.dangqianId;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param2);
         this.item.setShowCount(false);
         this.item.x = 342;
         this.item.y = 312;
         addChild(this.item);
         if(!param3)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item.filters = [];
         }
         this.setJiHuoSKill(param4);
         this.setJiHuoWUXING(param4);
         this.check.selectState = param5;
         this.check1.selectState = param6;
         this.checkZq.selectState = param7;
      }
      
      public function setJiHuoWUXING(param1:Boolean) : void
      {
         if(param1)
         {
            this.wulishi = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_WULISHI_ID];
            this.wuxueshi = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_WUXUESHI_ID];
            this.dongxie = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_DONGXIE_ID];
            this.xidu = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_XIDU_ID];
            this.nandi = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_NANDI_ID];
            this.beigai = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_BEIGAI_ID];
            this.zhongshentong = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_ZHONGSHENTONG_ID];
            if(this.dongxie || this.xidu || this.nandi || this.beigai || this.zhongshentong)
            {
               this.fts2.visible = true;
            }
            else
            {
               this.fts2.visible = false;
            }
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_WUXIAMIJI_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_YINSHEMIJI_ID];
            this.fts8.visible = GameState.dictMainStatus[729239];
            this.fts9.visible = GameState.dictMainStatus[729904];
            this.fts10.visible = GameState.dictMainStatus[729905];
            this.fts11.visible = GameState.dictMainStatus[729906];
            this.fts12.visible = GameState.dictMainStatus[729907];
            if(GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_MOLONGJINGLING_ID])
            {
               this.fts4.visible = true;
               this.check.visible = true;
               this.checkLabel.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_QIONGQI_ID];
            this.checkZq.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_QIONGQI_ID];
         }
         else
         {
            this.wulishi = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_WULISHI_ID];
            this.wuxueshi = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_WUXUESHI_ID];
            this.dongxie = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_DONGXIE_ID];
            this.xidu = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_XIDU_ID];
            this.nandi = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_NANDI_ID];
            this.beigai = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_BEIGAI_ID];
            this.zhongshentong = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_ZHONGSHENTONG_ID];
            if(this.dongxie || this.xidu || this.nandi || this.beigai || this.zhongshentong)
            {
               this.fts2.visible = true;
            }
            else
            {
               this.fts2.visible = false;
            }
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_WUXIAMIJI_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_YINSHEMIJI_ID];
            this.fts8.visible = GameState.dictTargetStatus[729239];
            this.fts9.visible = GameState.dictTargetStatus[729904];
            this.fts10.visible = GameState.dictTargetStatus[729905];
            this.fts11.visible = GameState.dictTargetStatus[729906];
            this.fts12.visible = GameState.dictTargetStatus[729907];
            if(GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_MOLONGJINGLING_ID])
            {
               this.fts4.visible = true;
               this.check.visible = true;
               this.checkLabel.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_QIONGQI_ID];
            this.checkZq.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_QIONGQI_ID];
         }
      }
      
      public function bofangJiuyinYanhua() : void
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
      
      public function showPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.WuXingQuanTupo.x == 138)
            {
               TweenMax.to(this.WuXingQuanTupo,1,{"x":410});
               this.mianbanBo = true;
            }
         }
         else if(this.WuXingQuanTupo.x == 410)
         {
            TweenMax.to(this.WuXingQuanTupo,1,{"x":138});
            this.mianbanBo = false;
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.WUXINGQUAN_LINGWUMIANBAN_ZIDONGLINGWU,"",false));
         }
      }
      
      public function setInitializeWxqTupo(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int) : void
      {
         this.WuXingQuanTupo.setInitialize(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setZhufuzhiWxqTupo(param1:int, param2:int, param3:int = 0) : void
      {
         this.WuXingQuanTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoodsWxqTupo(param1:Goods, param2:Boolean = true) : void
      {
         this.WuXingQuanTupo.setGoods(param1,param2);
      }
      
      public function setShuomingWxqTupo(param1:String) : void
      {
         this.WuXingQuanTupo.setShuoming(param1);
      }
      
      public function setBtnWxqTupo(param1:Boolean) : void
      {
         this.WuXingQuanTupo.setBtn(param1);
      }
      
      public function reManbanBo() : Boolean
      {
         return this.mianbanBo;
      }
      
      public function setWuXingQuanEnabledFun() : void
      {
         var _loc3_:DisplayObject = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < this.shujuArr.length)
         {
            _loc3_ = this.getChildByName(String(_loc4_ + 1));
            if(this.shujuArr[_loc4_].zhuangtai == 0)
            {
               _loc2_++;
               _loc3_.filters = Tools.blackWhiteFilter;
            }
            else if(this.shujuArr[_loc4_].zhuangtai == 1)
            {
               _loc1_++;
               _loc3_.filters = [];
            }
            else if(this.shujuArr[_loc4_].zhuangtai == 2)
            {
               this.dangqianId = _loc4_;
               _loc3_.filters = Tools.blackWhiteFilter;
            }
            _loc4_++;
         }
         if(_loc2_ == 6)
         {
            this.dangqianId = 0;
         }
         else if(_loc1_ == 6)
         {
            this.dangqianId = this.shujuArr.length - 1;
         }
         if(_loc2_ == 6 || _loc1_ == 6)
         {
            this.setData(this.dangqianId);
         }
         else if(this.dangqianId != 0)
         {
            this.setData(this.dangqianId - 1);
         }
         else
         {
            this.setData(0);
         }
         this.jihuoBtn.enabled = false;
         this.btnEnd = false;
         this.jihuoBtn.visible = false;
      }
      
      public function setJiHuo(param1:Boolean, param2:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("五形拳终极属性(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("五形拳终极属性(未激活)");
         }
         if(param2)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("五形拳谱总纲(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("五形拳谱总纲(未激活)");
         }
      }
      
      public function setJiHuoSKill(param1:Boolean) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Skill = null;
         var _loc6_:ItemFace = null;
         while(this.skillSpr.numChildren != 0)
         {
            this.skillSpr.removeChildAt(0);
         }
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(Boolean(this.mainSkillItemFace) && Boolean(this.mainSkillItemFace.parent))
         {
            this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
         }
         if(param1)
         {
            _loc2_ = Boolean(GameState.dictMainStatus[SpecialGoodsID.WUXINGQUAN_HUHESHUANGXING_ID]);
         }
         else
         {
            _loc2_ = Boolean(GameState.dictTargetStatus[SpecialGoodsID.WUXINGQUAN_HUHESHUANGXING_ID]);
         }
         if(_loc2_)
         {
            this.mainSkill = new Skill(OtherConst.WUXINGQUAN_HUHESHUANGXING_SKILL_ID);
            this.mainSkill.isLearn = 1;
            this.mainSkill.isLevelUp = 0;
            this.mainSkillItemFace = new ItemFace(this.mainSkill);
            this.mainSkillItemFace.showKungFuTag();
            this.mainSkillItemFace.setShowCount(false);
            this.mainSkillContainer.addChild(this.mainSkillItemFace);
            _loc3_ = int(this.skillArr.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = new Skill(this.skillArr[_loc4_]);
               _loc5_.isLearn = 1;
               _loc5_.isLevelUp = 0;
               _loc6_ = new ItemFace(_loc5_);
               _loc6_.showKungFuTag();
               _loc6_.setShowCount(false);
               _loc6_.x = 42 * _loc4_;
               _loc6_.y = 50;
               _loc6_.removeListener();
               this.skillSpr.addChild(_loc6_);
               _loc4_++;
            }
            this.ft.visible = true;
            this.mainSkillContainer.visible = true;
            this.skillSpr.visible = true;
            this.miaoshuFta.visible = false;
            if(param1)
            {
               this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
               this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            }
         }
         else
         {
            this.ft.visible = false;
            this.mainSkillContainer.visible = false;
            this.skillSpr.visible = false;
            this.miaoshuFta.visible = true;
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
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
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.WUXINGQUAN_SKILL_DRAG,"",this.currSkill));
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_WuXingQuan(param1:Array) : void
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
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGQUAN_LIANYAOHU_ID)
            {
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.fts5.visible = true;
                  this.check1.visible = true;
               }
               else
               {
                  this.fts5.visible = false;
                  this.check1.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

