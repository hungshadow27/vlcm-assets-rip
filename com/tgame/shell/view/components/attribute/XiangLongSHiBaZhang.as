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
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.XiangLong.info.XiangLongMainPanelVO;
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
   
   public class XiangLongSHiBaZhang extends Sprite
   {
      
      public static const UI_DUGUJIUJIANTIPO_GUANBI_CLICK:String = "UI_DUGUJIUJIANTIPO_GUANBI_CLICK";
      
      private var _$parent:DisplayObject;
      
      private var gongMc:MovieClip;
      
      private var gongMcSpr:Sprite;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fta6:FTextArea;
      
      private var fta7:FTextArea;
      
      private var fta8:FTextArea;
      
      private var fta9:FTextArea;
      
      private var tf:TextFormat;
      
      private var lingWuBtn:SmallButton;
      
      private var img:Bitmap;
      
      private var img1:Bitmap;
      
      private var img2:Bitmap;
      
      private var loadUrl:String;
      
      private var ftArr:Array;
      
      private var wuXueTfa:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var tipsMsg1:String = "";
      
      private var tipsMsg2:String = "";
      
      private var tipsMsg3:String = "";
      
      private var tipsMsg4:String = "";
      
      private var tootips1:String = "";
      
      private var lockImg:Bitmap;
      
      private var lockImgArr:Array;
      
      private var lockImg4:Bitmap;
      
      private var equipContainer:Sprite;
      
      private var SkillCount:int;
      
      private var SkillAr:Array;
      
      private var dugujiujiantupoCanvas:XianglongshibazhangTupoCanvas;
      
      private var tupoBo:Boolean = false;
      
      private var isLockOn:Boolean = false;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var isDragMainSkill:Boolean = false;
      
      private var fc:FCanvas;
      
      public var bgImg:Bitmap;
      
      private var fc1:FCanvas;
      
      private var nowLevel:int;
      
      private var lockImg1:Bitmap;
      
      private var equipContainers:Sprite;
      
      private var xlsbz:Bitmap;
      
      private var mcObj:Object;
      
      private var mainSkill2:Skill;
      
      private var mainSkillItemFace2:ItemFace;
      
      private var mainSkillContainer2:Sprite;
      
      private var isDragMainSkill2:Boolean = false;
      
      private var currSkill2:ItemFace;
      
      private var doubleText:FTextArea;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var qinlong:Boolean = false;
      
      private var qianlong:Boolean = false;
      
      private var youlong:Boolean = false;
      
      private var feilong:Boolean = false;
      
      private var zhenlong:Boolean = false;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var fts7:FTextArea;
      
      private var checkHz1:FCheckBox;
      
      private var fts8:FTextArea;
      
      private var checkHz2:FCheckBox;
      
      public function XiangLongSHiBaZhang()
      {
         var tf1:TextFormat;
         var $mask:Sprite;
         this.ftArr = [];
         this.lockImgArr = [];
         this.SkillAr = new Array();
         this.mcObj = {};
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.18zhang.kuang";
         addChild(this.bgImg);
         this.fc = new FCanvas();
         this.fc.x = 0;
         this.fc.y = 1;
         this.fc.width = 403;
         this.fc.height = 366;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.fc1 = new FCanvas();
         this.fc1.x = 3;
         this.fc1.y = 302;
         this.fc1.width = 398;
         this.fc1.height = 64;
         this.fc1.skin = "box";
         addChild(this.fc1);
         this.img1 = StaticValue.getBitmapByClassName("ui.18zhang.tiao");
         addChild(this.img1);
         this.img1.x = 10;
         this.img1.y = 206;
         this.img2 = StaticValue.getBitmapByClassName("ui.18zhang.tiao");
         addChild(this.img2);
         this.img2.x = 10;
         this.img2.y = 262;
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
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 20;
            x = 10;
            y = 208;
            textColor = StaticValue.ORANGE;
            htmlText = "    " + LanResManager.getLanCommonTextWords("人物属性加成：");
         }
         addChild(this.fta1);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 20;
            x = 10;
            y = 264;
            textColor = StaticValue.ORANGE;
            htmlText = "    " + LanResManager.getLanCommonTextWords("武学层数加成：");
         }
         addChild(this.fta2);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 145;
            height = 19;
            x = 250 - 17;
            y = 167;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            htmlText = LanResManager.getLanCommonTextWords("第问问式：顶顶顶顶");
         }
         addChild(this.fta3);
         this.fta4 = new FTextArea();
         with(this.fta4)
         {
            wordWrap = true;
            filters = StaticValue.filter;
            width = 175;
            height = 200;
            x = 220;
            y = 26;
            textColor = 65276;
            htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanCommonTextWords("降龙十八掌乃丐帮镇帮神技。掌法共十八式，是天下最刚猛的武功。修炼此绝学需要坚韧的毅力，一旦练成，不仅能提升攻防能力，还会增加已经掌握的武学修为，待至大成，更可与其他武学融会贯通，打出意想不到的效果。") + "</textformat>";
         }
         addChild(this.fta4);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            filters = StaticValue.filter;
            width = 450;
            height = 20;
            x = 10;
            y = 305;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("技能组合：放入         技能图标，使用掌法时，会附加武学特殊效果") + "</font>";
         }
         addChild(this.fta5);
         this.fta7 = new FTextArea();
         with(this.fta7)
         {
            filters = StaticValue.filter;
            width = 100;
            height = 20;
            x = 95 + 10;
            y = 305;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'3\'><font color=\'#00FF00\'><a href=\'event:" + LanResManager.getLanCommonTextWords("特殊武学") + "\'><u>" + LanResManager.getLanCommonTextWords("特殊武学") + "</u></a></font>";
         }
         addChild(this.fta7);
         this.fta7.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTips2);
         this.fta7.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTips2);
         this.fta6 = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 18;
         with(this.fta6)
         {
            filters = StaticValue.filter;
            defaultTextFormat = tf1;
            width = 230;
            height = 40;
            x = 238;
            y = 5;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("降龙十八掌");
         }
         addChild(this.fta6);
         this.fta8 = new FTextArea();
         with(this.fta8)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 190;
            y = 260;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("顶级激活进度：");
         }
         addChild(this.fta8);
         this.fta8.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
         this.fta8.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
         this.doubleText = new FTextArea();
         with(this.doubleText)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 190;
            y = 208;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("终极招式已激活");
         }
         this.doubleText.visible = false;
         addChild(this.doubleText);
         this.doubleText.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.doubleText.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         this.fta9 = new FTextArea();
         with(this.fta9)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 272 + 32;
            y = 260;
            textColor = StaticValue.RED;
            htmlText = "";
         }
         addChild(this.fta9);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 227 - 15;
         this.previousButton.y = 167;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 355 + 26;
         this.nextButton.y = 167;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟招式");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 275;
         this.lingWuBtn.y = 190;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.img = StaticValue.getBitmapByClassName("ui.18zhang.jiantouKuang");
         addChild(this.img);
         this.img.x = 12;
         this.img.y = 322;
         this.lockImg4 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.lockImg4);
         this.lockImg4.x = 228;
         this.lockImg4.y = 322;
         this.wuXueTfa = new FTextArea();
         this.wuXueTfa.defaultTextFormat = new TextFormat(null,null,65276);
         this.wuXueTfa.width = 450;
         this.wuXueTfa.height = 17;
         this.wuXueTfa.x = 10;
         this.wuXueTfa.y = 283;
         this.wuXueTfa.filters = StaticValue.filter;
         this.wuXueTfa.htmlText = "<textformat leading=\'3\'><font color=\'#00FFFF\'>" + "<a href=\'event:" + LanResManager.getLanCommonTextWords("所有门派武学") + "\'><u>" + LanResManager.getLanCommonTextWords("所有门派武学") + "</u></a>" + 0 + LanResManager.getLanCommonTextWords("层") + "<a href=\'event:" + LanResManager.getLanCommonTextWords("所有门派武学") + "\'><u>" + LanResManager.getLanCommonTextWords("所有江湖武学") + "</u></a>" + 0 + LanResManager.getLanCommonTextWords("层") + "<a href=\'event:" + LanResManager.getLanCommonTextWords("所有门派武学") + "\'><u>" + LanResManager.getLanCommonTextWords("所有其他武学") + "</u></a>" + 0 + LanResManager.getLanCommonTextWords("层");
         this.addChild(this.wuXueTfa);
         this.wuXueTfa.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTips);
         this.wuXueTfa.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTips);
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 6;
         this.gongMcSpr.y = 8;
         addChild(this.gongMcSpr);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 12;
         this.equipContainer.y = 322;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,185,40);
            endFill();
         }
         this.equipContainer.x = 87;
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onEquip,false,30);
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 15;
         this.mainSkillContainer.y = 324;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.img.x = 15 + 230 - 2 + 30;
         this.img.y = 322;
         this.mainSkillContainer2 = new Sprite();
         this.mainSkillContainer2.x = 15 + 230 + 30;
         this.mainSkillContainer2.y = 324;
         this.mainSkillContainer2.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown2);
         this.mainSkillContainer2.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp2);
         this.dugujiujiantupoCanvas = new XianglongshibazhangTupoCanvas();
         this.dugujiujiantupoCanvas._parent2 = this;
         addChild(this.dugujiujiantupoCanvas);
         this.dugujiujiantupoCanvas.x = 138;
         this.dugujiujiantupoCanvas.y = -10;
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
         this.dugujiujiantupoCanvas.mask = $mask;
         addEventListener(UI_DUGUJIUJIANTIPO_GUANBI_CLICK,this.aa1);
         this.lockImg1 = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         this.addChild(this.lockImg1);
         this.lockImg1.x = 295 + 2 + 20;
         this.lockImg1.y = 322 + 2;
         this.lockImg1 = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         this.addChild(this.lockImg1);
         this.lockImg1.x = 295 + 40 + 2 + 20;
         this.lockImg1.y = 322 + 2;
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 + 15;
         this.equipContainers.y = 322;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainers);
         this.fts = new FTextArea();
         this.fts.x = 289;
         this.fts.y = 208;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.filters = StaticValue.filter;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("龙神功已激活");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击8888888、防御7888888、血量888888888、暴击8888、闪避8888 武功提升十二层") + "<br>" + LanResManager.getLanCommonTextWords("龙神功：使用降龙十八掌时，每次攻击到第十八次时，都将有一定几率迫使对手") + "<br>" + LanResManager.getLanCommonTextWords("在龙神功的作用下内力、体力两者属性全失，并且持续5秒") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 325;
         this.fts1.y = 250;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 50;
         addChild(this.fts1);
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.height = 50;
         this.fts2.visible = false;
         this.fts2.htmlText = this.fts2.htmlText = LanResManager.getLanCommonTextWords("降龙五式（已激活）");
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>";
            if(qinlong)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("擒龙式：攻击：1222亿、防御988亿、血量2222亿、所有武功提升 20000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊能力：使用降龙十八掌时有几率触发，使对手降低60%的当前血量！") + "<br>";
            }
            if(qianlong)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("潜龙式：攻击：1222亿、防御988亿、血量2222亿、所有武功提升 20000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊能力：使用降龙十八掌时有几率触发，使对手无法跳跃5秒！") + "<br>";
            }
            if(youlong)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("游龙式：攻击：1222亿、防御988亿、血量2222亿、所有武功提升 20000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊能力：使用降龙十八掌时有几率触发，使对手在5秒内无法回复血量！") + "<br>";
            }
            if(feilong)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("飞龙式：攻击：1222亿、防御988亿、血量2222亿、所有武功提升 20000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊能力：使用降龙十八掌时有几率触发，使对手每次攻击都损失30%的当前血量持续5秒！") + "<br>";
            }
            if(zhenlong)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("真龙式：攻击：1222亿、防御988亿、血量2222亿、所有武功提升 20000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊能力：使用降龙十八掌时有几率触发，使对手武功冻结无法攻击持续5秒！") + "<br>";
            }
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 200;
         this.fts3.height = 50;
         this.fts3.visible = false;
         this.fts3.htmlText = this.fts3.htmlText = LanResManager.getLanCommonTextWords("风雷护身秘籍（已激活）");
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>";
            _loc1_ += LanResManager.getLanCommonTextWords("特殊属性：攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 1880000层 攻速+188 ") + "<br>" + LanResManager.getLanCommonTextWords("施放速度+2%") + "<br>" + LanResManager.getLanCommonTextWords("风雷四圣：攻击时有几率触发风雷四圣状态，持续10秒；在此状态下，四大风雷兽将齐聚天") + "<br>" + LanResManager.getLanCommonTextWords("空，同时施发风雷祝福BUFF施加到自身，在风雷祝福BUFF下，自身将免疫所有状态，即使") + "<br>" + LanResManager.getLanCommonTextWords("对手的效果在强，都将不可打破。");
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 200;
         this.fts4.height = 50;
         this.fts4.visible = false;
         this.fts4.htmlText = this.fts4.htmlText = LanResManager.getLanCommonTextWords("降龙十八掌奥义式（已激活）");
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>";
            _loc1_ += LanResManager.getLanCommonTextWords("特殊属性：攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("奥义式：每攻击18次都可将对手的屏幕撕开裂痕特效；每次撕开一次裂痕，对手在该场") + "<br>" + LanResManager.getLanCommonTextWords("景将被去除于三界之外呆滞原地，只剩一俱空壳；且被去除的玩家全身的所有能力都将") + "<br>" + LanResManager.getLanCommonTextWords("失去，持续3秒。冷却60秒。") + "<br>" + LanResManager.getLanCommonTextWords("降龙十八掌奥义心法：当降龙十八掌升到顶级的玩家，只要激活降龙十八掌奥义式，即") + "<br>" + LanResManager.getLanCommonTextWords("将自动获得降龙十八掌奥义心法，使奥义式的技能冷却时间60秒缩短至18秒。");
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 175;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("幻炎") + "•" + LanResManager.getLanCommonTextWords("螭吻");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击88888闪避88888") + "<br>" + LanResManager.getLanCommonTextWords("螭吻：龙之子，上古镇邪灵兽之一，平生好吞，即殿脊的兽头之形。") + "<br>" + LanResManager.getLanCommonTextWords("螭吻吞噬：攻击时100%触发螭吻吞噬，持续10秒；自身在此状态下，") + "<br>" + LanResManager.getLanCommonTextWords("每攻击一个对手，都可将对手吞噬到螭吻体内进行合体，持续10秒；") + "<br>" + LanResManager.getLanCommonTextWords("每吞噬合体一个对手，自身的所有勋章触发几率翻倍，吞噬的越多，") + "<br>" + LanResManager.getLanCommonTextWords("自身的勋章触发几率越高；被吞噬的对手将消失在场景内，当状态触") + "<br>" + LanResManager.getLanCommonTextWords("除后，被吞噬的对手从螭吻涌出，瞬间掉血80%,且10秒内无法在使用") + "<br>" + LanResManager.getLanCommonTextWords("任何武功。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 75;
         this.checkZq.y = 175;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 7 + 20 + 20 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 200;
         this.fts6.height = 20;
         this.fts6.visible = false;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("降龙总诀（已激活）");
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("降龙神诀：同时拥有济公和降龙罗汉的玩家，可获得降龙罗汉渡劫升") + "<br>" + LanResManager.getLanCommonTextWords("仙真身。且人物才可施发降龙神诀。攻击或被攻击都将瞬间施发降龙") + "<br>" + LanResManager.getLanCommonTextWords("神诀，持续30秒；在此状态下，自身将神谕附体，每次使用降龙攻击") + "<br>" + LanResManager.getLanCommonTextWords("都将100%触发济公降龙摆尾，降龙罗汉降龙总诀式。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 175 - 25;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 110;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("济公");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("济公降临：乃十八罗汉之首降龙罗汉转世，人物可自己切换。") + "<br>" + LanResManager.getLanCommonTextWords("神龙摆尾：拥有济公的玩家，可开启降龙十八掌最后一式隐藏技能；只要使") + "<br>" + LanResManager.getLanCommonTextWords("用降龙技能攻击时，有几率触发神龙摆尾，持续10秒；在此状态下，每攻击") + "<br>" + LanResManager.getLanCommonTextWords("对手一次，可瞬间触发幻龙封印，幻龙可瞬间飞跃至对手的体内使其封印，") + "<br>" + LanResManager.getLanCommonTextWords("无法继续战斗；且对手在幻龙状态下，每受到一次攻击，幻龙将对手体内吐") + "<br>" + LanResManager.getLanCommonTextWords("息，使对手欲动不能瞬间失去所有知觉。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkHz1 = new FCheckBox();
         addChild(this.checkHz1);
         this.checkHz1.x = 75;
         this.checkHz1.y = 175 - 25;
         this.checkHz1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts8 = new FTextArea();
         this.fts8.x = 10;
         this.fts8.y = 175 - 25 - 25;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 110;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("降龙罗汉");
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("降龙转世：十八罗汉的第十七位，即是「迦叶尊者」降龙罗汉乃佛祖座下弟子，") + "<br>" + LanResManager.getLanCommonTextWords("法力无边，助佛祖降龙伏妖，人物可自己转换降龙罗汉金身。") + "<br>" + LanResManager.getLanCommonTextWords("降龙总诀式：拥有降龙罗汉的玩家，可开启降龙十八掌降龙总诀式技能；只要") + "<br>" + LanResManager.getLanCommonTextWords("使用降龙技能攻击时，有几率触发降龙总诀式，持续10秒；自身在此状态下，") + "<br>" + LanResManager.getLanCommonTextWords("九龙环绕，所有攻击都将瞬间将九龙吞噬，使自身；且自身每受到一个负面状") + "<br>" + LanResManager.getLanCommonTextWords("态，都将瞬间转移给对手，使对手命中同等的效果。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkHz2 = new FCheckBox();
         addChild(this.checkHz2);
         this.checkHz2.x = 75;
         this.checkHz2.y = 175 - 25 - 25;
         this.checkHz2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,31]));
               break;
            case this.checkHz1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz1.selectState,64]));
               break;
            case this.checkHz2:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz2.selectState,65]));
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(!this.isLockOn)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.dugujiujiantupoCanvas._parent2 = param1;
         this.dugujiujiantupoCanvas._parent3 = this;
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
      }
      
      public function initilizeUI(param1:Boolean, param2:XiangLongMainPanelVO) : void
      {
         this.checkZq.selectState = param2.isZuoQi;
         this.checkHz1.selectState = param2.isHuanZhuang1;
         this.checkHz2.selectState = param2.isHuanZhuang2;
         this.setMainMsg(param2.info);
         this.setZhaoShiMsg(param2.curLevelName,param2.curShowLevel,param2.curLearnLevel + 1,param2.curLearnLevel >= 19);
         this.setChatShuXing(param2.jiacheng);
         this.setChatWuGong(param2.addWuxue1,param2.addWuxue2,param2.addWuxue3);
         this.setSkill(param2.unlockNum,param2.skill,param2.mixSkill1,param2.mixSkill2,param2.mixSkill3,param2.skill2,param2.canUseSkll2,param2.mixSkill4,param2.curLearnLevel);
         this.setTips(param2.addWuxueTip1,param2.addWuxueTip2,param2.addWuxueTip3,param2.addWuxueTip4);
         if(param2.isDouble)
         {
            this.doubleText.visible = true;
         }
         else
         {
            this.doubleText.visible = false;
         }
         this.setLongshengong(param2.isLongshengong);
         this.setXiangLongMenghuanJindan(param1);
      }
      
      public function setMainMsg(param1:String) : void
      {
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1, param4:Boolean = false) : void
      {
         var str1:String = param1;
         var int1:int = param2;
         var int2:int = param3;
         var isAllColplete:Boolean = param4;
         this.fta3.htmlText = str1;
         if(int1 == 19)
         {
            this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/18zhang/long" + 18 + ".swf";
         }
         else
         {
            this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/18zhang/long" + int1 + ".swf";
         }
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
         while(this.gongMcSpr.numChildren > 0)
         {
            this.gongMcSpr.removeChildAt(0);
         }
         if(this.mcObj[int1] != null)
         {
            this.gongMc = this.mcObj[int1];
            this.gongMc.play();
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
                  gongMc.play();
                  gongMcSpr.addChild(gongMc);
               }
            },null,false,this.loadUrl);
         }
         this.nowLevel = int1;
         this.previousButtonEnabled(true);
         this.lingWuButtonEnabled(true);
         this.nextButtonEnabled(true);
         if(int1 == int2)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟招式");
            this.lingWuButtonEnabled(true);
         }
         else if(int1 < int2)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.lingWuButtonEnabled(false);
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.lingWuButtonEnabled(false);
         }
         if(isAllColplete || int2 == -1)
         {
            this.lingWuButtonEnabled(false);
         }
         if(this.isLockOn)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟招式");
         }
         if(int1 == 1)
         {
            this.previousButtonEnabled(false);
         }
         if(int1 == 18)
         {
            this.nextButtonEnabled(false);
         }
      }
      
      public function setChatShuXing(param1:String) : void
      {
         var _loc5_:FTextArea = null;
         var _loc2_:* = int(this.ftArr.length - 1);
         while(_loc2_ >= 0)
         {
            this.removeChild(this.ftArr[_loc2_]);
            _loc2_--;
         }
         this.ftArr = [];
         if(!param1 || param1 == "")
         {
            return;
         }
         var _loc3_:Array = param1.split(";");
         _loc3_.splice(-1,1);
         var _loc4_:TextFormat = new TextFormat();
         _loc4_.color = 65276;
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            _loc5_ = new FTextArea();
            _loc5_.defaultTextFormat = _loc4_;
            _loc5_.filters = StaticValue.filter;
            _loc5_.text = _loc3_[_loc2_];
            _loc5_.height = 20;
            _loc5_.width = 100;
            if(_loc2_ >= 4)
            {
               _loc5_.x = 15 + (_loc2_ - 4) * 90;
               _loc5_.y = 244;
            }
            else
            {
               _loc5_.x = 15 + _loc2_ * 90;
               _loc5_.y = 228;
            }
            this.ftArr.push(_loc5_);
            this.addChild(_loc5_);
            _loc2_++;
         }
      }
      
      public function setChatWuGong(param1:int, param2:int, param3:int) : void
      {
         this.wuXueTfa.htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + "<a href=\'event:" + LanResManager.getLanCommonTextWords("所有门派武学") + "\'><u>" + LanResManager.getLanCommonTextWords("所有门派武学") + "</u></a>" + "：</font><font color=\'#00FFFF\'>+" + param1 + LanResManager.getLanCommonTextWords("层") + "  " + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:" + LanResManager.getLanCommonTextWords("所有江湖武学") + "\'><u>" + LanResManager.getLanCommonTextWords("所有江湖武学") + "</u></a>" + "：</font><font color=\'#00FFFF\'>+" + param2 + LanResManager.getLanCommonTextWords("层") + "  " + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:" + LanResManager.getLanCommonTextWords("所有其他武学") + "\'><u>" + LanResManager.getLanCommonTextWords("所有其他武学") + "</u></a>" + "：</font><font color=\'#00FFFF\'>+" + param3 + LanResManager.getLanCommonTextWords("层") + "  </font>";
      }
      
      public function setSkill(param1:int, param2:Skill, param3:Skill, param4:Skill, param5:Skill, param6:Skill, param7:Boolean, param8:Skill, param9:int = 0) : void
      {
         var _loc11_:* = 0;
         var _loc13_:ItemFace = null;
         var _loc14_:BaseItem = null;
         this.SkillCount = param1;
         var _loc10_:Array = [87,135,183,228];
         _loc11_ = int(this.lockImgArr.length - 1);
         while(_loc11_ >= 0)
         {
            this.removeChild(this.lockImgArr[_loc11_]);
            _loc11_--;
         }
         this.lockImgArr = [];
         var _loc12_:int = param1;
         while(_loc12_ < 4)
         {
            this.lockImg = StaticValue.getBitmapByClassName("ui.ride.skill.assembled.skill.slot.lock");
            this.addChild(this.lockImg);
            this.lockImg.x = _loc10_[_loc12_];
            this.lockImg.y = 322;
            this.lockImgArr.push(this.lockImg);
            _loc12_++;
         }
         if(this.mainSkillItemFace)
         {
            this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
         }
         this.mainSkill = param2;
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
         if(param9 >= 6)
         {
            this.isDragMainSkill = true;
            this.mainSkillItemFace.filters = [];
         }
         else
         {
            this.isDragMainSkill = false;
            this.mainSkillItemFace.filters = Tools.blackWhiteFilter;
         }
         this.SkillAr = [param3,param4,param5,param8];
         while(this.equipContainer.numChildren > 0)
         {
            _loc13_ = this.equipContainer.getChildAt(0) as ItemFace;
            this.equipContainer.removeChildAt(0);
            _loc13_.destroy();
         }
         _loc11_ = 0;
         while(_loc11_ < this.SkillAr.length)
         {
            if(this.SkillAr[_loc11_])
            {
               _loc14_ = this.SkillAr[_loc11_];
               param2 = this.SkillAr[_loc11_] as Skill;
               _loc13_ = new ItemFace(param2);
               _loc13_.x = _loc10_[_loc11_] - 85;
               _loc13_.y = 0 + 2;
               if(param2.position <= 4)
               {
                  this.equipContainer.addChild(_loc13_);
               }
            }
            _loc11_++;
         }
      }
      
      public function setTips(param1:String, param2:String, param3:String, param4:String) : void
      {
         this.tipsMsg1 = param1;
         this.tipsMsg2 = param2;
         this.tipsMsg3 = param3;
         this.tipsMsg4 = param4;
      }
      
      public function showXiangLongLingWuPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.dugujiujiantupoCanvas.x == 138)
            {
               TweenMax.to(this.dugujiujiantupoCanvas,1,{"x":410});
               this.tupoBo = true;
               this.previousButtonEnabled(false);
               this.nextButtonEnabled(false);
               this.lingWuButtonEnabled(false);
            }
         }
         else if(this.dugujiujiantupoCanvas.x == 410)
         {
            TweenMax.to(this.dugujiujiantupoCanvas,1,{"x":138});
            this.tupoBo = false;
            this.previousButtonEnabled(true);
            this.nextButtonEnabled(true);
            this.lingWuButtonEnabled(true);
            if(this.nowLevel == 1)
            {
               this.previousButtonEnabled(false);
            }
            if(this.nowLevel == 19)
            {
               this.nextButtonEnabled(false);
            }
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIANGLONGSHIBAZHANG_CLOSEJ));
         }
      }
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.dugujiujiantupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.dugujiujiantupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.dugujiujiantupoCanvas.setGoods(param1,param2);
      }
      
      public function setShuoming(param1:String) : void
      {
         this.dugujiujiantupoCanvas.setShuoming(param1);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         this.dugujiujiantupoCanvas.setBtn(param1);
      }
      
      public function closeMiniPanel() : void
      {
         if(this.dugujiujiantupoCanvas.x == 410)
         {
            TweenMax.to(this.dugujiujiantupoCanvas,1,{"x":138});
            this.tupoBo = false;
            this.previousButtonEnabled(true);
            this.nextButtonEnabled(true);
            this.lingWuButtonEnabled(true);
            if(this.nowLevel == 1)
            {
               this.previousButtonEnabled(false);
            }
            if(this.nowLevel == 19)
            {
               this.nextButtonEnabled(false);
            }
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showXiangLongLingWuPanel(false);
      }
      
      private function onEquip(param1:MouseEvent) : void
      {
         var _loc3_:Skill = null;
         var _loc4_:ItemFace = null;
         var _loc5_:BaseItem = null;
         var _loc6_:Boolean = false;
         if(this.isLockOn)
         {
            return;
         }
         var _loc2_:int = param1.currentTarget.mouseX / 47;
         if(_loc2_ < this.SkillCount)
         {
            _loc6_ = false;
            if(this.SkillAr[_loc2_])
            {
               _loc6_ = true;
            }
            if(_loc6_)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.XIANGLONGSHIBAZHANG_SKILL_INSTALL,"",{
                  "isInstall":false,
                  "skillPos":_loc2_,
                  "skillID":this.SkillAr[_loc2_].id
               }));
            }
            else
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.XIANGLONGSHIBAZHANG_SKILL_INSTALL,"",{
                  "isInstall":true,
                  "skillPos":_loc2_,
                  "skillID":null
               }));
            }
         }
      }
      
      private function onMouseTips(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.wuXueTfa.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTips);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = LanResManager.getLanCommonTextWords("所有门派武学");
               _loc3_ = LanResManager.getLanCommonTextWords("所有江湖武学");
               _loc4_ = LanResManager.getLanCommonTextWords("所有其他武学");
               _loc5_ = this.wuXueTfa.getCharIndexAtPoint(this.wuXueTfa.mouseX,this.wuXueTfa.mouseY);
               if(_loc5_ >= this.wuXueTfa.text.indexOf(_loc2_) && _loc5_ <= this.wuXueTfa.text.indexOf(_loc2_) + (_loc2_.length - 1))
               {
                  this.showTip(this.tipsMsg1,1);
               }
               else if(_loc5_ >= this.wuXueTfa.text.indexOf(_loc3_) && _loc5_ <= this.wuXueTfa.text.indexOf(_loc3_) + (_loc3_.length - 1))
               {
                  this.showTip(this.tipsMsg2,2);
               }
               else if(_loc5_ >= this.wuXueTfa.text.indexOf(_loc4_) && _loc5_ <= this.wuXueTfa.text.indexOf(_loc4_) + (_loc4_.length - 1))
               {
                  this.showTip(this.tipsMsg3,3);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.wuXueTfa.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTips);
         }
      }
      
      private function onMouseTips2(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.showTip(this.tipsMsg4,4);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.wuXueTfa.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTips);
         }
      }
      
      private function showTip(param1:String, param2:int) : void
      {
         if(param1 == "")
         {
            return;
         }
         switch(param2)
         {
            case 1:
               this.tip.htmlText = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所有门派武学包含：") + "</font>\n<font color=\'" + StaticValue.GREEN_HTML + "\'>";
               break;
            case 2:
               this.tip.htmlText = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所有江湖绝学包含：") + "</font>\n<font color=\'" + StaticValue.GREEN_HTML + "\'>";
               break;
            case 3:
               this.tip.htmlText = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所有其他绝学包含：") + "</font>\n<font color=\'" + StaticValue.GREEN_HTML + "\'>";
               break;
            case 4:
               this.tip.htmlText = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所有特殊武学包含：") + "</font>\n<font color=\'" + StaticValue.GREEN_HTML + "\'>";
         }
         this.tip.htmlText += param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.fta8.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip1(this.tootips1);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.fta8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.doubleText.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip1(LanResManager.getLanCommonTextWords("降龙所有属性进行翻倍（包括所有武功，并无需顶级即可使用）"));
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.doubleText.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
         }
      }
      
      private function showTip1(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.XIANGLONGSHIBAZHANG_ARROW_CLICK,"",true));
               break;
            case this.nextButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.XIANGLONGSHIBAZHANG_ARROW_CLICK,"",false));
               break;
            case this.lingWuBtn:
               if(this.tupoBo)
               {
                  return;
               }
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.XIANGLONGSHIBAZHANG_LINGWU_SHOW,""));
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         if(this.isLockOn || !this.isDragMainSkill)
         {
            return;
         }
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.isLockOn || !this.isDragMainSkill)
         {
            return;
         }
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.XIANGLONGSHIBAZHANG_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         if(this.isLockOn || !this.isDragMainSkill)
         {
            return;
         }
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onMouseDown2(param1:MouseEvent) : void
      {
         if(this.isLockOn || !this.isDragMainSkill2)
         {
            return;
         }
         this.mainSkillContainer2.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove2);
         this.p = new Point(mouseX,mouseY);
         this.currSkill2 = param1.target as ItemFace;
      }
      
      private function onMouseMove2(param1:MouseEvent) : void
      {
         if(this.isLockOn || !this.isDragMainSkill2)
         {
            return;
         }
         if(this.currSkill2 != param1.target)
         {
            this.mainSkillContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove2);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill2.getBaseItem() as Skill).res.useway == 1 && (this.currSkill2.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.XIANGLONGSHIBAZHANG_SKILL_DRAG,"",this.currSkill2));
            }
            this.mainSkillContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove2);
         }
      }
      
      private function onMouseUp2(param1:MouseEvent) : void
      {
         if(this.isLockOn || !this.isDragMainSkill2)
         {
            return;
         }
         this.mainSkillContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove2);
      }
      
      public function lockOn() : void
      {
         this.isLockOn = true;
         this.isDragMainSkill = true;
         this.isDragMainSkill2 = true;
         this.previousButtonEnabled(false);
         this.nextButtonEnabled(false);
         this.lingWuButtonEnabled(false);
         this.equipContainer.removeEventListener(MouseEvent.MOUSE_UP,this.onEquip);
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
         this.lingWuBtn.enabled = param1;
      }
      
      public function menuToolTip(param1:String) : void
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
      
      public function set_XLSBZ(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_XIANGLONGSHIBAZHANG1)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            if(_loc3_.res.position == ItemPositionRange.POSTION_20180926XUNZHANG_15)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            if(_loc3_.res.position == ItemPositionRange.POSTION_XIANGLONGSHIBAZHANG2)
            {
               _loc4_.x = 40 + 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            if(_loc3_.res.position == ItemPositionRange.POSTION_20180926XUNZHANG_16)
            {
               _loc4_.x = 40 + 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      private function setLongshengong(param1:Boolean) : void
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
      
      public function setXiangLongMenghuanJindan(param1:Boolean) : void
      {
         var isMainChar:Boolean = param1;
         if(isMainChar)
         {
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_XIANGLONGSHIBAZHANG_ID] + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("梦幻降龙石");
            ToolTips.createToolTips(this.fts1,this,function():String
            {
               var _loc1_:String = "";
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_XIANGLONGSHIBAZHANG_ID] * 10000 + "," + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_XIANGLONGSHIBAZHANG_ID] * 1 + "</font>";
               return _loc1_ + "</textformat>";
            });
            this.qinlong = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_QINLONGSHI_ID];
            this.qianlong = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_QIANLONGSHI_ID];
            this.youlong = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_YOULONGSHI_ID];
            this.feilong = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_FEILONGSHI_ID];
            this.zhenlong = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_ZHENLONGSHI_ID];
            if(this.qinlong || this.qianlong || this.youlong || this.feilong || this.zhenlong)
            {
               this.fts2.visible = true;
            }
            else
            {
               this.fts2.visible = false;
            }
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_FENGLEIHUSHEN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_LIWEN_ID])
            {
               this.fts5.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.checkZq.visible = false;
            }
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_ZONGJUE_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_JIGONG_ID];
            this.checkHz1.visible = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_JIGONG_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_LUOHAN_ID];
            this.checkHz2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_LUOHAN_ID];
         }
         else
         {
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_XIANGLONGSHIBAZHANG_ID] + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("梦幻降龙石");
            ToolTips.createToolTips(this.fts1,this,function():String
            {
               var _loc1_:String = "";
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_XIANGLONGSHIBAZHANG_ID] * 10000 + "," + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_XIANGLONGSHIBAZHANG_ID] * 1 + "</font>";
               return _loc1_ + "</textformat>";
            });
            this.qinlong = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_QINLONGSHI_ID];
            this.qianlong = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_QIANLONGSHI_ID];
            this.youlong = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_YOULONGSHI_ID];
            this.feilong = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_FEILONGSHI_ID];
            this.zhenlong = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_ZHENLONGSHI_ID];
            if(this.qinlong || this.qianlong || this.youlong || this.feilong || this.zhenlong)
            {
               this.fts2.visible = true;
            }
            else
            {
               this.fts2.visible = false;
            }
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_FENGLEIHUSHEN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_LIWEN_ID])
            {
               this.fts5.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.checkZq.visible = false;
            }
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_ZONGJUE_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_JIGONG_ID];
            this.checkHz1.visible = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_JIGONG_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_LUOHAN_ID];
            this.checkHz2.visible = GameState.dictTargetStatus[SpecialGoodsID.XIANGLONGSHIBAZHANG_LUOHAN_ID];
         }
      }
   }
}

