package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
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
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class JinZhongZhao extends Sprite
   {
      
      public static const UI_JINZHONGZHAOTUPO_GUANBI_CLICK:String = "UI_JINZHONGZHAOTUPO_GUANBI_CLICK";
      
      private var _$parent:DisplayObject;
      
      private var gongMc:MovieClip;
      
      private var gongMcSpr:Sprite;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var lb1:FLabel;
      
      private var lb2:FLabel;
      
      private var lb3:FLabel;
      
      private var lb4:FLabel;
      
      private var barBg1:Bitmap;
      
      private var barBg2:Bitmap;
      
      private var barBg3:Bitmap;
      
      private var barBg4:Bitmap;
      
      private var barBar1:ColorBar;
      
      private var barBar2:ColorBar;
      
      private var barBar3:ColorBar;
      
      private var barBar4:ColorBar;
      
      private var spr1:Sprite;
      
      private var chatText:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fta6:FTextArea;
      
      private var url:String;
      
      private var miaoshu:FTextArea;
      
      private var shuxing:FTextArea;
      
      private var skillName:FTextArea;
      
      private var skillDesc:FTextArea;
      
      private var bit1:DisplayObject;
      
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
      
      private var equipContainer:Sprite;
      
      private var SkillCount:int;
      
      private var SkillAr:Array;
      
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
      
      private var jinzhongzhaotupoCanvas:JinZhongZhaoTupoCanvas;
      
      private var mcObj:Object;
      
      private var chiPd:Boolean;
      
      private var lwcs:int = 0;
      
      private var fy:Boolean = false;
      
      private var dyc:int = 0;
      
      private var qiangHuaFta:FTextArea;
      
      private var qiangHuaBtn:SecondButton;
      
      private var cj_tbs:Bitmap;
      
      private var tbs:Bitmap;
      
      private var yanhuaMc:MovieClip;
      
      private var fumozhaoSpr:Sprite;
      
      private var fumozhao:FTextArea;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var kuang:Bitmap;
      
      private var mainSkillItemFace1:ItemFace;
      
      private var mainSkillContainer1:Sprite;
      
      private var fts3:FTextArea;
      
      private var kuang2:Bitmap;
      
      private var mainSkillItemFace2:ItemFace;
      
      public function JinZhongZhao()
      {
         var $mask:Sprite;
         var tf1:TextFormat = null;
         this.ftArr = [];
         this.lockImgArr = [];
         this.SkillAr = new Array();
         this.mcObj = {};
         super();
         this.dyc += 1;
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 2;
         this.fc1.width = 402;
         this.fc1.height = 365;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 2;
         this.fc1.y = 300 - 5;
         this.fc1.width = 398;
         this.fc1.height = 72;
         this.fc1.skin = "box";
         addChild(this.fc1);
         this.img1 = StaticValue.getBitmapByClassName("ui.18zhang.tiao");
         addChild(this.img1);
         this.img1.x = 10;
         this.img1.y = 202;
         this.img1.width = 240;
         this.fta1 = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 12;
         tf1.color = 65276;
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = tf1;
            width = 110;
            height = 20;
            x = 10;
            y = 205;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("当前金钟罩层数下最大可以得到如下提升：");
         }
         addChild(this.fta1);
         this.qiangHuaFta = new FTextArea();
         with(this.qiangHuaFta)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 200;
            x = 240;
            y = 205;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("强化后属性加成：攻击+2888");
         }
         addChild(this.qiangHuaFta);
         this.qiangHuaBtn = new SecondButton();
         this.qiangHuaBtn.label = LanResManager.getLanCommonTextWords("强化");
         addChild(this.qiangHuaBtn);
         this.qiangHuaBtn.x = 328;
         this.qiangHuaBtn.y = 204;
         this.qiangHuaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr1 = new Sprite();
         this.spr1.x = 5;
         this.spr1.y = 205;
         addChild(this.spr1);
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 10;
            y = 20;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SmithingBody,"生命");
         }
         this.spr1.addChild(this.lb1);
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg1);
         this.barBg1.x = this.lb1.x + this.lb1.width;
         this.barBg1.y = this.lb1.y + 2;
         this.barBar1 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar1);
         this.barBar1.x = this.lb1.x + this.lb1.width + 4;
         this.barBar1.y = this.lb1.y + 5;
         this.lb2 = new FLabel();
         with(this.lb2)
         {
            x = 10;
            y = 35;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SmithingBody,"内力");
         }
         this.spr1.addChild(this.lb2);
         this.barBg2 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg2);
         this.barBg2.x = this.lb2.x + this.lb2.width;
         this.barBg2.y = this.lb2.y + 2;
         this.barBar2 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar2);
         this.barBar2.x = this.lb2.x + this.lb2.width + 4;
         this.barBar2.y = this.lb2.y + 5;
         this.lb3 = new FLabel();
         with(this.lb3)
         {
            x = 200;
            y = 20;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SmithingBody,"防御");
         }
         this.spr1.addChild(this.lb3);
         this.barBg3 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg3);
         this.barBg3.x = this.lb3.x + this.lb3.width;
         this.barBg3.y = this.lb3.y + 2;
         this.barBar3 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar3);
         this.barBar3.x = this.lb3.x + this.lb3.width + 4;
         this.barBar3.y = this.lb3.y + 5;
         this.lb4 = new FLabel();
         with(this.lb4)
         {
            x = 200;
            y = 35;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SmithingBody,"体力");
         }
         this.spr1.addChild(this.lb4);
         this.barBg4 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.spr1.addChild(this.barBg4);
         this.barBg4.x = this.lb4.x + this.lb4.width;
         this.barBg4.y = this.lb4.y + 2;
         this.barBar4 = new ColorBar(5,123,5);
         this.spr1.addChild(this.barBar4);
         this.barBar4.x = this.lb4.x + this.lb4.width + 4;
         this.barBar4.y = this.lb4.y + 5;
         this.fta3 = new FTextArea();
         this.tf = new TextFormat();
         this.tf.align = "center";
         with(this.fta3)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 116 + 6 + 10 + 6;
            height = 16;
            x = 265 - 9 - 20 + 5 - 5 - 3;
            y = 167 + 20 - 10 - 28 + 15;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            htmlText = LanResManager.getLanCommonTextWords("金钟罩第一层");
         }
         addChild(this.fta3);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            filters = StaticValue.filter;
            width = 90;
            height = 20;
            x = 318 + 20;
            y = 300 + 5 - 5;
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
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("金钟罩技能说明");
         }
         addChild(this.skillName);
         this.skillDesc = new FTextArea();
         with(this.skillDesc)
         {
            filters = StaticValue.filter;
            width = 253;
            height = 60;
            wordWrap = true;
            x = 11;
            y = 320 - 2 - 5;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'0\'><font>123" + LanResManager.getLanCommonTextWords("金钟罩最强防御招式，以无上神通将内力凝聚成护体真气，与对手交战之时，护体真气会自动外放，化解所受伤害。") + "</font></textformat>";
         }
         addChild(this.skillDesc);
         this.lockImg = StaticValue.getBitmapByClassName("ui.ride.skill.assembled.skill.slot.lock");
         this.addChild(this.lockImg);
         this.lockImg.x = 325 + 20;
         this.lockImg.y = 318 + 5 - 5;
         this.fta6 = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 18;
         with(this.fta6)
         {
            filters = StaticValue.filter;
            defaultTextFormat = tf1;
            width = 230;
            height = 40;
            x = 260 + 12;
            y = 5;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("金钟罩");
         }
         addChild(this.fta6);
         this.miaoshu = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 12;
         tf1.color = 65276;
         with(this.miaoshu)
         {
            filters = StaticValue.filter;
            defaultTextFormat = tf1;
            width = 175;
            height = 135;
            x = 215 - 3;
            y = 50 - 12 - 4;
            wordWrap = true;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("金钟罩是防御力最强的无上神功。练成之后，体内真气外放，如金钟倒扣，可抵御外力一切的袭击，成为真正的金刚不坏之躯。此功内外兼修，须服用【护体神丹】打通百骸，再研习【金钟罩密卷】练体强身，如此反复，终能大成。") + "</textformat>";
         }
         addChild(this.miaoshu);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 227 + 18 - 9 - 20 + 5 - 5 - 3;
         this.previousButton.y = 167 + 20 - 10 - 28 + 15;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 355 + 18 - 20 + 5 + 6 + 5 + 3;
         this.nextButton.y = 167 + 20 - 10 - 28 + 15;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 275 + 15 - 35;
         this.lingWuBtn.y = 190 + 20 - 5 - 28 + 6;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 4;
         this.gongMcSpr.y = 4;
         addChild(this.gongMcSpr);
         this.fumozhaoSpr = new Sprite();
         this.fumozhaoSpr.x = 7;
         this.fumozhaoSpr.y = 7;
         addChild(this.fumozhaoSpr);
         this.fumozhao = new FTextArea();
         with(this.fumozhao)
         {
            multiline = true;
            filters = StaticValue.filter;
            textColor = StaticValue.RED;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("金钟伏魔罩(未激活)");
         }
         ToolTips.createToolTips(this.fumozhaoSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("顶级玩家双击使用之后，将可以使护体真气发挥出伏魔作用") + "<br>" + LanResManager.getLanCommonTextWords("（受到对手攻击时有70%的几率将不会使护体真气破损）") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.jinzhongzhaotupoCanvas = new JinZhongZhaoTupoCanvas();
         this.jinzhongzhaotupoCanvas._parent3 = this;
         addChild(this.jinzhongzhaotupoCanvas);
         this.jinzhongzhaotupoCanvas.x = 138;
         this.jinzhongzhaotupoCanvas.y = -10;
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
         this.jinzhongzhaotupoCanvas.mask = $mask;
         addEventListener(UI_JINZHONGZHAOTUPO_GUANBI_CLICK,this.onCloseSmall);
         this.chatText = new FTextArea();
         this.chatText.filters = StaticValue.filter;
         this.chatText.x = 5 + 5;
         this.chatText.y = 60 + 200;
         this.chatText.width = 390;
         this.chatText.height = 60;
         this.chatText.wordWrap = true;
         this.chatText.autoSize = TextFieldAutoSize.LEFT;
         this.chatText.defaultTextFormat = new TextFormat(null,null,16777215);
         addChild(this.chatText);
         this.chatText.addEventListener(TextEvent.LINK,this.onLink);
         this.chatText.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseTipft2);
         this.chatText.addEventListener(MouseEvent.CLICK,this.onMouseTipft2);
         this.chatText.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTipft2);
         this.lockImg = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         this.addChild(this.lockImg);
         this.lockImg.x = 325 + 20 - 80 + 1 - 10;
         this.lockImg.y = 318 + 5 - 5;
         this.lockImg = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         this.addChild(this.lockImg);
         this.lockImg.x = 325 + 20 - 40 + 1 - 10;
         this.lockImg.y = 318 + 5 - 5;
         this.equipContainer = new Sprite();
         this.equipContainer.x = 325 + 20 - 80 - 10;
         this.equipContainer.y = 318 + 5 - 5;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,100,40);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainer);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 330 + 23 - 340;
         this.kuang.y = 305 - 270 + 12 + 95;
         this.kuang2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang2);
         this.kuang2.x = 53;
         this.kuang2.y = 142;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 325 + 2 + 20;
         this.mainSkillContainer.y = 318 + 2 + 5 - 5;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.fts = new FTextArea();
         this.fts.x = 200;
         this.fts.y = 300 + 3 - 5;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.filters = StaticValue.filter;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("朱雀金钟图纹已激活");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("朱雀金钟图纹已激活") + "<br>" + LanResManager.getLanCommonTextWords("攻击2888888、防御2288888、血量388888888、暴击888、闪避888") + "<br>" + LanResManager.getLanCommonTextWords("朱雀金钟图腾技能") + "<br>" + LanResManager.getLanCommonTextWords("朱雀金钟图纹将有几率触发金钟朱雀，能将所受到的攻击伤害100%反弹于发功者。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10 + 30 - 5;
         this.fts1.y = 205 - 15 - 5;
         this.fts1.textColor = StaticValue.RED;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("东皇钟超级属性(未激活)");
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击28888888、防御16888888、血量488888888、暴击888、闪避888、所有武功提升12层、人物防御属性提升30%") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：每当PK时被对手击破一次护体真气，则100%触发东皇钟反震之力，立即对对手触发造成20%血量伤害的强悍攻击。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 10 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("不死金身术(已激活)");
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("不死金身（特殊技能）：双击使用该主动技能后将在原地变身成传闻中的人物，持续30秒。将不会受") + "<br>" + LanResManager.getLanCommonTextWords("龙爪或其他技能影响，在城里可不会被抓，冷却120秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 10 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("佛法无边(已激活)");
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性： 攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("佛法无边：激活佛法无边的玩家金钟罩三个护体真气将渡仙成佛法真气，每个佛法真气都将抵抗对") + "<br>" + LanResManager.getLanCommonTextWords("手的一次技能。且被攻击时还有几率触发佛法无边状态，持续10秒。在此状态下，可瞬间清除自身") + "<br>" + LanResManager.getLanCommonTextWords("的所有负面BUFF，且当在次被攻击时将瞬间产生佛祖守护无敌状态，此状态保持到佛法无边结束为") + "<br>" + LanResManager.getLanCommonTextWords("止。") + "</font>";
            return _loc1_ + "</textformat>";
         });
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
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(!this.isLockOn)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
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
                           this._$parent.dispatchEvent(new BaseEvent(CharAttribute.ITEM_LINK_CLICK,"",[_loc4_[1],Tools.currentStage.mouseX,Tools.currentStage.mouseY]));
                        }
                     }
                     else
                     {
                        this._$parent.dispatchEvent(new BaseEvent(CharAttribute.CHAT_ITEM_LINK_HIDE));
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
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.CHAT_ITEM_LINK_HIDE));
            GameInstance.scene.sceneDispatchEvent(param1);
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
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HAMAGONG_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onCloseSmall(param1:BaseEvent) : void
      {
         this.showJinZhongZhaoLingWuPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.JINZHONGZHAO_ARROW_CLICK,"",0));
               this.fy = true;
               break;
            case this.nextButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.JINZHONGZHAO_ARROW_CLICK,"",1));
               this.fy = true;
               break;
            case this.lingWuBtn:
               if(this.tupoBo)
               {
                  return;
               }
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.JINZHONGZHAO_DENGJITUPO,""));
               break;
            case this.qiangHuaBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.JINZHONGZHAO_QIANGHUA_CLICK,""));
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
         this.lingWuBtn.enabled = param1;
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.jinzhongzhaotupoCanvas._parent2 = param1;
         this.jinzhongzhaotupoCanvas._parent3 = this;
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
         while(this.gongMcSpr.numChildren > 0)
         {
            this.gongMcSpr.removeChildAt(0);
         }
      }
      
      public function initilizeUI(param1:String, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean) : void
      {
         this.setZhaoShiMsg(param2,param3,param7,param4,param3 >= 12);
         this.setSkill(new Skill(param5),param3);
         this.miaoshu.htmlText = "<textformat leading=\'1\'>" + param1 + "</textformat>";
         this.skillDesc.htmlText = "<textformat leading=\'1\'>" + param6 + "</textformat>";
         if(this.dyc != 1)
         {
            if(!this.fy)
            {
               if(param4 - param3 == 1 && param7)
               {
                  this.bofangYanhua();
               }
            }
            this.dyc = 1;
         }
         this.setFumozhao(param8);
      }
      
      private function loadImg(param1:int) : void
      {
         var swf:int = param1;
         this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/jinzhongzhao/JZZ" + swf + ".swf";
         if(this.mcObj[swf] != null)
         {
            if(Boolean(this.gongMc) && this.gongMc.parent != null)
            {
               this.gongMc.stop();
               this.gongMc.parent.removeChild(this.gongMc);
            }
            while(this.gongMcSpr.numChildren > 0)
            {
               this.gongMcSpr.removeChildAt(0);
            }
            this.gongMc = this.mcObj[swf];
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
               mcObj[swf] = gongMc;
               if(gongMc)
               {
                  gongMc.play();
                  gongMcSpr.addChild(gongMc);
               }
            },null,false,this.loadUrl);
         }
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:Boolean, param4:int = -1, param5:Boolean = false) : void
      {
         this.fta3.htmlText = param1;
         var _loc6_:int = 0;
         if(param4 == 1 || param4 == 2 || param4 == 3 || param4 == 4 || param4 == 0)
         {
            _loc6_ = 1;
         }
         else if(param4 == 5 || param4 == 6 || param4 == 7 || param4 == 8)
         {
            _loc6_ = 2;
         }
         else if(param4 == 9 || param4 == 10 || param4 == 11)
         {
            _loc6_ = 3;
         }
         else
         {
            _loc6_ = 4;
         }
         this.loadImg(_loc6_);
         this.nowLevel = param2;
         this.previousButtonEnabled(true);
         this.lingWuButtonEnabled(true);
         this.nextButtonEnabled(true);
         if(param2 == 0 && param4 == 1)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
            this.lingWuButtonEnabled(true);
         }
         else if(param2 >= param4 || param5)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.lingWuButtonEnabled(false);
         }
         else if(param4 - param2 == 1 && param2 != 12)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
            this.lingWuButtonEnabled(true);
         }
         else if(param2 < param4 && param4 - param2 != 1 && param2 != 12)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.lingWuButtonEnabled(false);
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.lingWuButtonEnabled(false);
         }
         if(param4 == 1)
         {
            this.previousButtonEnabled(false);
            this.nextButtonEnabled(true);
         }
         else if(param4 == 12)
         {
            this.nextButtonEnabled(false);
            this.previousButtonEnabled(true);
         }
         if(param2 != param4 && param2 == 1 && !param3 || param2 == 12)
         {
            this.lingWuButtonEnabled(false);
         }
         else
         {
            this.lingWuButtonEnabled(param3);
         }
         if(this.lingWuBtn.label == LanResManager.getLanCommonTextWords("已领悟") || this.lingWuBtn.label == LanResManager.getLanCommonTextWords("未领悟"))
         {
            this.lingWuButtonEnabled(false);
         }
         if(this.isLockOn)
         {
            if(param2 == 0)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            }
            else
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            }
            this.lockOn();
         }
      }
      
      public function setFumozhao(param1:Boolean) : void
      {
         if(param1)
         {
            this.fumozhao.textColor = StaticValue.GREEN;
            this.fumozhao.htmlText = LanResManager.getLanCommonTextWords("金钟伏魔罩(已激活)");
         }
         else
         {
            this.fumozhao.textColor = StaticValue.RED;
            this.fumozhao.htmlText = LanResManager.getLanCommonTextWords("金钟伏魔罩(未激活)");
         }
      }
      
      public function setMainMsgSBTR(param1:String) : void
      {
         this.miaoshu.htmlText = param1;
      }
      
      public function setMiaoshu(param1:String) : void
      {
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
      
      public function showJinZhongZhaoLingWuPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.jinzhongzhaotupoCanvas.x == 138)
            {
               TweenMax.to(this.jinzhongzhaotupoCanvas,1,{"x":410});
               this.tupoBo = true;
               this.previousButtonEnabled(false);
               this.nextButtonEnabled(false);
               this.lingWuButtonEnabled(false);
               this.jinzhongzhaotupoCanvas.BtnEnableTrue();
            }
         }
         else if(this.jinzhongzhaotupoCanvas.x == 410)
         {
            TweenMax.to(this.jinzhongzhaotupoCanvas,1,{"x":138});
            this.tupoBo = false;
            this.previousButtonEnabled(true);
            this.nextButtonEnabled(true);
            this.lingWuButtonEnabled(true);
            if(this.nowLevel == 0)
            {
               this.previousButtonEnabled(false);
            }
            if(this.nowLevel == 11)
            {
               this.nextButtonEnabled(false);
            }
            this.jinzhongzhaotupoCanvas.BtnEnableFalse();
         }
      }
      
      public function hideChuangguanPanel() : void
      {
         this.showJinZhongZhaoLingWuPanel(false);
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.JINZHONGZHAO_DENGJITUPO_CLOSE));
      }
      
      public function setSkill(param1:Skill, param2:int) : void
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
         if(param2 >= 6)
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
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.jinzhongzhaotupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jinzhongzhaotupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.jinzhongzhaotupoCanvas.setGoods(param1,param2);
      }
      
      public function setShuoming(param1:String) : void
      {
         this.jinzhongzhaotupoCanvas.setShuoming(param1);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         this.jinzhongzhaotupoCanvas.setBtn(param1);
      }
      
      public function closeMiniPanel() : void
      {
         if(this.jinzhongzhaotupoCanvas.x == 410)
         {
            TweenMax.to(this.jinzhongzhaotupoCanvas,1,{"x":138});
            this.tupoBo = false;
            this.previousButtonEnabled(true);
            this.nextButtonEnabled(true);
            this.lingWuButtonEnabled(true);
            if(this.nowLevel == 1)
            {
               this.previousButtonEnabled(false);
            }
            if(this.nowLevel == 18)
            {
               this.nextButtonEnabled(false);
            }
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
            yanhuaMc.x = 300 - yanhuaMc.width / 2;
            yanhuaMc.y = 100 - yanhuaMc.height / 2;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/wabao.swf");
      }
      
      public function lockOn() : void
      {
         this.isLockOn = true;
         this.isDragMainSkill = true;
         this.previousButtonEnabled(false);
         this.nextButtonEnabled(false);
         this.lingWuButtonEnabled(false);
         this.qiangHuaBtn.enabled = false;
      }
      
      public function setQiangHuaSta(param1:Boolean) : void
      {
         if(param1)
         {
            this.qiangHuaBtn.visible = false;
            this.qiangHuaFta.visible = true;
         }
         else
         {
            this.qiangHuaBtn.visible = true;
            this.qiangHuaFta.visible = false;
         }
      }
      
      public function set_CJTBS(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_JINZHONGZHAO1)
            {
               _loc4_.x = 4;
               _loc4_.y = 4 - 1;
               this.equipContainer.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_JINZHONGZHAO2)
            {
               _loc4_.x = 40 + 4;
               _loc4_.y = 4 - 1;
               this.equipContainer.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      public function setZhuqueTuwen(param1:Boolean) : void
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
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("东皇钟超级属性(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("东皇钟超级属性(未激活)");
         }
      }
      
      public function setDingJiJiHuo(param1:Boolean) : void
      {
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         var _loc2_:Skill = new Skill(80200302);
         _loc2_.isLearn = 1;
         this.mainSkillItemFace2 = new ItemFace(_loc2_);
         this.mainSkillItemFace2.showKungFuTag();
         this.mainSkillItemFace2.setShowCount(false);
         this.mainSkillItemFace2.x = 55 - 347;
         this.mainSkillItemFace2.y = 144 - 320;
         this.mainSkillContainer.addChild(this.mainSkillItemFace2);
         if(param1)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.JINZHONGZHAO_BUSIJINSHENSHU_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.JINZHONGZHAO_BUSIJINSHENSHU_ID])
            {
               this.setSkillJiHuo(200256,true);
               this.mainSkillItemFace1.visible = true;
               this.kuang.visible = true;
            }
            else
            {
               this.mainSkillItemFace1 = null;
               this.kuang.visible = false;
            }
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.JINZHONGZHAO_FOFAWUBIAN_ID];
            this.kuang2.visible = this.mainSkillItemFace2.visible = GameState.dictMainStatus[730538];
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.JINZHONGZHAO_BUSIJINSHENSHU_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.JINZHONGZHAO_BUSIJINSHENSHU_ID])
            {
               this.setSkillJiHuo(200256,true);
               this.mainSkillItemFace1.visible = true;
               this.kuang.visible = true;
            }
            else
            {
               this.mainSkillItemFace1 = null;
               this.kuang.visible = false;
            }
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.JINZHONGZHAO_FOFAWUBIAN_ID];
            this.kuang2.visible = this.mainSkillItemFace2.visible = GameState.dictTargetStatus[730538];
         }
      }
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
      {
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
         this.mainSkillItemFace1 = new ItemFace(this.mainSkill);
         this.mainSkillItemFace1.showKungFuTag();
         this.mainSkillItemFace1.setShowCount(false);
         this.mainSkillItemFace1.x = 23 - 340 - 15;
         this.mainSkillItemFace1.y = 12 - 270 + 95 - 10 - 2 - 1;
         this.mainSkillContainer.addChild(this.mainSkillItemFace1);
      }
   }
}

