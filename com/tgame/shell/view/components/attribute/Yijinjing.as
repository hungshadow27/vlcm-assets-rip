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
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.yiJinJing.model.info.YiJinJingVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class Yijinjing extends Sprite
   {
      
      public static const UI_YIJINJING_GUANBI_CLICK:String = "UI_YIJINJING_GUANBI_CLICK";
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var lingWuBtn:SmallButton;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fb1:FLabel;
      
      private var img:Bitmap;
      
      private var item:ItemFace;
      
      private var gongImg:DisplayObject;
      
      private var yijinjingtupoCanvas:YijinjingTupoCanvas;
      
      public var tupoBo:Boolean = false;
      
      private var jianshuContainer:Sprite;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      private var isDrag:Boolean;
      
      public var bg:Bitmap;
      
      private var gongImgObj:Object;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var shendan:int = 0;
      
      private var fts3:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var fujia:FTextArea;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var fts6:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var mainSkillItemFace:ItemFace;
      
      private var kuang1:Bitmap;
      
      private var fts7:FTextArea;
      
      private var suipian:int = 0;
      
      private var fts8:FTextArea;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var fts9:FTextArea;
      
      private var check2:FCheckBox;
      
      private var checkLabel2:FLabel;
      
      private var mainSkillItemFace2:ItemFace;
      
      private var kuang2:Bitmap;
      
      private var fts10:FTextArea;
      
      private var fts11:FTextArea;
      
      private var fts11num:int;
      
      private var isLearn1:Boolean;
      
      private var isLearn2:Boolean;
      
      public function Yijinjing()
      {
         var $mask:Sprite;
         var i:int;
         this.gongImgObj = {};
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.char.yijinjing.bg";
         addChild(this.bg);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 0;
         this.fc1.width = 402;
         this.fc1.height = 212;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc2 = new FCanvas();
         this.fc2.x = 0;
         this.fc2.y = 305;
         this.fc2.width = 403;
         this.fc2.height = 63;
         this.fc2.skin = "box";
         addChild(this.fc2);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "yijinjingBtn";
         addChild(this.previousButton);
         this.previousButton.scaleX = -1;
         this.previousButton.x = 30;
         this.previousButton.y = 84;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "yijinjingBtn";
         addChild(this.nextButton);
         this.nextButton.x = 370;
         this.nextButton.y = 84;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 185;
            y = 210;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("领悟本式获得如下提升：");
         }
         addChild(this.fta);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 310;
         this.lingWuBtn.y = 183;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 185;
            y = 225;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            filters = StaticValue.filter;
            x = 277;
            y = 225;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "";
         }
         addChild(this.fta5);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 5;
            y = 212;
            width = 182;
            height = 95;
            wordWrap = true;
            multiline = true;
            htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanTextWords(this,"易筋经乃达摩老祖所创威力极大数百年来非有大机缘者不传功法共分十二式习之可脱胎换骨无碍无障身中绵骨大法唯易筋经可解") + "</font>" + "</textformat>";
         }
         addChild(this.fta2);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 8;
         this.img.y = 320;
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            filters = StaticValue.filter;
            x = 50;
            y = 310;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"使用技能可立即解除绵骨大法状态，同时获得“易筋活血”效果，持续时间内，完全免疫绵骨大法的封禁体力效果。将技能拖放至快捷栏中可以使用") + "</font>" + "</textformat>";
         }
         addChild(this.fta3);
         this.jianshuContainer = new Sprite();
         addChild(this.jianshuContainer);
         with(this.jianshuContainer)
         {
            x = 10;
            y = 322;
         }
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.yijinjingtupoCanvas = new YijinjingTupoCanvas();
         addChild(this.yijinjingtupoCanvas);
         this.yijinjingtupoCanvas._parent2 = this;
         this.yijinjingtupoCanvas.x = 138;
         this.yijinjingtupoCanvas.y = -10;
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
         this.yijinjingtupoCanvas.mask = $mask;
         addEventListener(UI_YIJINJING_GUANBI_CLICK,this.aa1);
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 10;
         this.fts.textColor = StaticValue.RED;
         this.fts.filters = StaticValue.filter;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = "";
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("易筋活血终极心法") + "<br>" + LanResManager.getLanCommonTextWords("攻击2288888、防御1888888、血量488888888、暴击888、闪避888") + "<br>" + LanResManager.getLanCommonTextWords("易筋经达到顶级后，易筋活血技能效果100%升级 为 “使用后立即解除 绵骨大法、吸星大法、") + "<br>" + LanResManager.getLanCommonTextWords("化功大法、白手格刃以及脱袍裂甲状态，且在易筋活血状态下免疫五种江湖武学技能。”") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 27;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("易筋经最终秘籍（未激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击688888888、防御488888888、暴击888、闪避888、血量1088888888、所有武功提升608层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts11 = new FTextArea();
         this.fts11.x = 10;
         this.fts11.y = 27;
         this.fts11.textColor = StaticValue.GREEN;
         this.fts11.width = 170;
         this.fts11.height = 20;
         this.fts11.htmlText = LanResManager.getLanCommonTextWords("易筋经真元（未激活）");
         this.fts11.visible = false;
         addChild(this.fts11);
         ToolTips.createToolTips(this.fts11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("已使用") + fts11num + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("每使用一个增加攻击+1.000.000防守+1.000.000武功层+1") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 27 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("易筋经神炼心法（已激活）");
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("属性提升：攻击 5888亿、防御3888亿、血量6888亿 、所有武功提升 58888层") + "<br>" + LanResManager.getLanCommonTextWords("养成属性：玩家可使用易筋神炼丹×1对其进行养成，每次养成可增加攻击50亿，防御30亿，血量60亿、暴击 28888、闪避 28888！（最多可养成5000次！）") + "<br>" + LanResManager.getLanCommonTextWords("已使用") + shendan + LanResManager.getLanCommonTextWords("颗");
            return _loc1_ + "</font></textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("易筋特技秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("属性提升：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 400000层") + "<br>" + LanResManager.getLanCommonTextWords("易筋特技 （特殊技能）：此乃天竺和尚达摩所传真经，只身东来，一路扬经颂法，后落迹于少林") + "<br>" + LanResManager.getLanCommonTextWords("寺。激活该秘籍后，弟子将不再受到空体，空蓝效果，仗剑于江湖！");
            return _loc1_ + "</font></textformat>";
         });
         this.kuangSpr = new Sprite();
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288;
         this.equipContainers.y = 322 - 73 + 1 - 85;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainers);
         i = 0;
         while(i < 5)
         {
            this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.kuangSpr.addChild(this.kuangHD);
            this.kuangHD.x = 10 + 40 * i;
            this.kuangHD.y = 266 - 2 - 1 - 10 - 85;
            i++;
         }
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("替身之术（已激活）");
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("替身秘技：当人物进入战斗阶段时，自身的血量低于50%时，100%触发替身之术，在") + "<br>" + LanResManager.getLanCommonTextWords("原地变幻个稻草人，任由对手攻击，真身消失在对手视线，无法被捕捉。冷却90秒。");
            return _loc1_ + "</font></textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 7 + 20 + 20 + 20 + 20 + 30;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("钻石VIP令（已激活）");
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("钻石权威：攻击时有几率触发钻石权威，持续10秒；在此状态下，每秒将对范围5格") + "<br>" + LanResManager.getLanCommonTextWords("内的所有进行一次判定，非VIp或是VIP的玩家都将瞬间被反弹击退至5格之外；且自") + "<br>" + LanResManager.getLanCommonTextWords("身每攻击一次都可将对手瞬间击退；自身每受到一次攻击，都将瞬间反噬对手击退。");
            return _loc1_ + "</font></textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 20 + 208 - 50;
         this.fts6.y = 20 + 159;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("轩辕古炮(已激活)");
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("轩辕古炮：拥有军旗的玩家，可使用轩辕古炮，该仙具乃黄帝为统一华夏时专用，威力巨大。") + "<br>" + LanResManager.getLanCommonTextWords("可锁定任意一个玩家施发轩辕古炮；从天而降一轩辕古炮落入对手旁边，持续15秒；对手在此") + "<br>" + LanResManager.getLanCommonTextWords("状态下，轩辕炮每3秒对对手进行一次轰炸，每次轰炸都可将瞬间造成对手掉血30%。（可在城") + "<br>" + LanResManager.getLanCommonTextWords("里使用）冷却90秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324 - 58;
         this.kuang1.y = 160 + 35 - 186 + 156;
         this.kuang2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang2);
         this.kuang2.x = 25 + 324 - 58;
         this.kuang2.y = 160 + 35 - 186 + 156;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324 - 58;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186 + 156;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 7 + 20 + 20 + 20 + 20 + 30 + 20;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 170;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("人灯合一秘籍（已激活）");
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("人灯合一：每次攻击都有几率触发人灯合一，持续10秒；在此状态下，") + "<br>" + LanResManager.getLanCommonTextWords("自身将瞬间清除命中的所有负面状态。冷却30秒。") + "<br>" + LanResManager.getLanCommonTextWords("人灯合一属性：激活人灯合一后，可开启人灯合一养成属性。") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：每天可免费在永久活动里领取灯心碎片×99.") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("颗灯芯碎片") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + suipian * 500 + LanResManager.getLanCommonTextWords("亿，所有武功") + suipian * 50000 + LanResManager.getLanCommonTextWords("层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts8 = new FTextArea();
         this.fts8.x = 275 + 10 - 115;
         this.fts8.y = 42 + 40 + 95 - 165;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 170;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("宝莲灯(已激活)");
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("宝莲灯：人物可自己切换宝莲灯，宝莲灯将飘浮人物头顶。") + "<br>" + LanResManager.getLanCommonTextWords("宝莲灯心：攻击时有几率触发灯心，持续10秒；在此状态下，自身将受灯心的庇护，") + "<br>" + LanResManager.getLanCommonTextWords("对手所有攻击伤害和技能效果都将被免疫，且由于灯心的效果，每攻击一次对手，") + "<br>" + LanResManager.getLanCommonTextWords("都将瞬间给对手造成10倍的伤害效果和技能效果；当状态解除后，灯心光照，自己") + "<br>" + LanResManager.getLanCommonTextWords("瞬间消失在场景内，持续5秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.visible = false;
         this.check.x = 275 + 10 - 115;
         this.check.y = 28 + 35 + 40 + 95 - 165;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         this.checkLabel.visible = false;
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel);
         this.fts9 = new FTextArea();
         this.fts9.x = 275 + 10 - 115;
         this.fts9.y = 42 + 40 + 95 + 40 - 165;
         this.fts9.textColor = StaticValue.GREEN;
         this.fts9.width = 170;
         this.fts9.height = 20;
         this.fts9.htmlText = LanResManager.getLanCommonTextWords("三圣母(已激活)");
         this.fts9.visible = false;
         addChild(this.fts9);
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.visible = false;
         this.check2.x = 275 + 10 - 115;
         this.check2.y = 28 + 35 + 40 + 95 + 40 - 165;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel2 = new FLabel();
         this.checkLabel2.visible = false;
         with(this.checkLabel2)
         {
            x = check2.x + 20;
            --check2.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel2);
         this.fts10 = new FTextArea();
         this.fts10.x = 20 + 208 - 50;
         this.fts10.y = 20 + 159;
         this.fts10.textColor = StaticValue.GREEN;
         this.fts10.width = 170;
         this.fts10.height = 20;
         this.fts10.htmlText = LanResManager.getLanCommonTextWords("金身隐者(已激活)");
         addChild(this.fts10);
         ToolTips.createToolTips(this.fts10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("金身隐者：拥有金身隐者的玩家可获得隐者主动技能：隐者秘术") + "<br>" + LanResManager.getLanCommonTextWords("隐者秘术：使用之后自身可瞬间变身成金身隐者，持续60秒；在此状态下，自身每次跳") + "<br>" + LanResManager.getLanCommonTextWords("跃都将触发秘隐之术瞬间隐身，且破除所有对手的锁定；且自身在此状态下，每次攻击") + "<br>" + LanResManager.getLanCommonTextWords("对手，都将施发隐者暗器，瞬间破除对手所有攻击，持续5秒，使自身达到全免伤，免") + "<br>" + LanResManager.getLanCommonTextWords("效果的状态。冷却120秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,37]));
               break;
            case this.check2:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check2.selectState,38]));
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if(this.isDrag)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_SKILL_DRAG,"",this.currSkill));
            }
            this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.yijinjingtupoCanvas._parent2 = param1;
         this.yijinjingtupoCanvas._parent3 = this;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_XIAYIYE_CLICK));
               break;
            case this.lingWuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.YIJINJING_LINGWU_SHOW));
               this.onShowLv(true);
         }
      }
      
      public function setInitialize(param1:Boolean, param2:YiJinJingVO) : void
      {
         this.isDrag = param2.isUseSkill;
         this.setMainInitialize(param2.hp,param2.mp,param2.cp,param2.act,param2.def);
         this.setSkill(param2.skill,this.isDrag);
         this.setBowPage(param2.nowID,param2.nowLookingID);
         var _loc3_:String = param2.getSkillAddStr();
         this.setWuXueJiaCheng(_loc3_);
         this.setJihuo(param2.isZhongJi);
         this.setJiHuoYijinjing(param1);
         this.isMain = param1;
         this.check.selectState = param2.baoliandeng;
         this.check2.selectState = param2.sanshengmu;
      }
      
      public function setJiHuoYijinjing(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_ZUIZHONGMIJI_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.YIJINJING_ZUIZHONGMIJI_JIHUO_ID])
            {
               this.fts1.htmlText = LanResManager.getLanCommonTextWords("易筋经最终秘籍（已激活）");
               this.fts1.textColor = StaticValue.GREEN;
            }
            else
            {
               this.fts1.htmlText = LanResManager.getLanCommonTextWords("易筋经最终秘籍（未激活）");
               this.fts1.textColor = StaticValue.RED;
            }
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_SHENLIANXINFA_ID];
            this.shendan = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_SHENLIANDAN_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_TISHENZHISHU_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_ZUANSHIVIP_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_XUANYUANGUP];
            this.isLearn1 = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_XUANYUANGUP];
            this.fts10.visible = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_HUANGJINYINZHE_ID];
            this.fts11.visible = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_ZHENYUAN_ID];
            this.fts11num = GameState.dictMainStatus[725538];
            this.isLearn2 = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_HUANGJINYINZHE_ID];
            this.setSkillJiHuo(200340,200361);
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_RENDENGHEYI_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.YIJINJING_DENGXINSUIPIAN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.YIJINJING_SANSHENGMU_ID])
            {
               this.fts9.visible = true;
               this.check2.visible = true;
               this.checkLabel2.visible = true;
            }
            else
            {
               this.fts9.visible = false;
               this.check2.visible = false;
               this.checkLabel2.visible = false;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.YIJINJING_BAOLIANDENG_ID])
            {
               this.fts8.visible = true;
               this.check.visible = true;
               this.checkLabel.visible = true;
            }
            else
            {
               this.fts8.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_ZUIZHONGMIJI_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_ZUIZHONGMIJI_JIHUO_ID])
            {
               this.fts1.htmlText = LanResManager.getLanCommonTextWords("易筋经最终秘籍（已激活）");
               this.fts1.textColor = StaticValue.GREEN;
            }
            else
            {
               this.fts1.htmlText = LanResManager.getLanCommonTextWords("易筋经最终秘籍（未激活）");
               this.fts1.textColor = StaticValue.RED;
            }
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_SHENLIANXINFA_ID];
            this.shendan = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_SHENLIANDAN_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_TISHENZHISHU_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_ZUANSHIVIP_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_XUANYUANGUP];
            this.isLearn1 = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_XUANYUANGUP];
            this.fts10.visible = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_HUANGJINYINZHE_ID];
            this.isLearn2 = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_HUANGJINYINZHE_ID];
            this.setSkillJiHuo(200340,200361);
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_RENDENGHEYI_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_DENGXINSUIPIAN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_SANSHENGMU_ID])
            {
               this.fts9.visible = true;
               this.check2.visible = true;
               this.checkLabel2.visible = true;
            }
            else
            {
               this.fts9.visible = false;
               this.check2.visible = false;
               this.checkLabel2.visible = false;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_BAOLIANDENG_ID])
            {
               this.fts8.visible = true;
               this.check.visible = true;
               this.checkLabel.visible = true;
            }
            else
            {
               this.fts8.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
            this.fts11.visible = GameState.dictTargetStatus[SpecialGoodsID.YIJINJING_ZHENYUAN_ID];
            this.fts11num = GameState.dictTargetStatus[725538];
         }
      }
      
      private function setJihuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("易筋活血终极心法(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("易筋活血终极心法(未激活)");
         }
      }
      
      private function setWuXueJiaCheng(param1:String) : void
      {
         var _loc2_:Array = param1.split(";");
         var _loc3_:String = "<textformat leading=\'1\'>";
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ += _loc2_[_loc4_] + "<br>";
            _loc4_++;
         }
         _loc3_ += "</textformat>";
         this.fta5.htmlText = _loc3_;
      }
      
      private function setMainInitialize(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:String = "";
         _loc6_ = _loc6_ + ("<textformat leading=\'1\'><font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>");
         _loc6_ = _loc6_ + (LanResManager.getLanCommonTextWords("攻击：+") + param4 + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + param5 + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param1 + "<br>" + LanResManager.getLanCommonTextWords("内力：+") + param2 + "<br>" + LanResManager.getLanCommonTextWords("体力：+") + param3 + "<br>");
         _loc6_ = _loc6_ + "</font>";
         _loc6_ = _loc6_ + "</textformat>";
         this.fta1.htmlText = _loc6_;
      }
      
      private function setSkill(param1:Skill, param2:Boolean) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.setShowCount(false);
         this.jianshuContainer.addChild(this.item);
         if(param2)
         {
            this.item.filters = [];
         }
         else
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
      }
      
      private function setBowPage(param1:int, param2:int) : void
      {
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            removeChild(this.gongImg);
         }
         if(param2 == 0)
         {
            if(this.gongImgObj[1] != null)
            {
               this.gongImg = this.gongImgObj[1];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/yijinjing/" + 1 + ".png",351,211);
               this.gongImgObj[1] = this.gongImg;
            }
         }
         else if(this.gongImgObj[param2] != null)
         {
            this.gongImg = this.gongImgObj[param2];
         }
         else
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/yijinjing/" + param2 + ".png",351,211);
            this.gongImgObj[param2] = this.gongImg;
         }
         if(param2 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param2 == 12)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         param2--;
         if(param1 > param2 && param2 >= 0)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.lingWuBtn.enabled = false;
         }
         else if(param1 == param2)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.lingWuBtn.enabled = true;
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.lingWuBtn.enabled = false;
         }
         this.gongImg.x = 198 - this.gongImg.width / 2;
         this.gongImg.y = 106 - this.gongImg.height / 2;
         addChildAt(this.gongImg,1);
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yijinjingtupoCanvas.x == 138)
            {
               TweenMax.to(this.yijinjingtupoCanvas,1,{"x":410});
               this.tupoBo = true;
            }
            this.lingWuBtn.enabled = false;
            this.previousButton.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(this.yijinjingtupoCanvas.x == 410)
            {
               TweenMax.to(this.yijinjingtupoCanvas,1,{"x":138});
               this.tupoBo = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ,"",false));
            }
            this.lingWuBtn.enabled = true;
            this.previousButton.enabled = true;
            this.nextButton.enabled = true;
         }
      }
      
      public function isYijinjingtupoCanvasShow() : Boolean
      {
         if(this.yijinjingtupoCanvas.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setYijinjingLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.yijinjingtupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setYijinjingLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yijinjingtupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setYijinjingLingwuJiyuanzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yijinjingtupoCanvas.setJiyuanzhi(param1,param2,param3);
      }
      
      public function setYijinjingLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.yijinjingtupoCanvas.setGoods(param1,param2);
      }
      
      public function setYijinjingLingwuBtn(param1:Boolean) : void
      {
         this.yijinjingtupoCanvas.setBtn(param1);
      }
      
      public function setYiJinJingEnabledFun() : void
      {
         this.lingWuBtn.enabled = this.lingWuBtn.visible = false;
         this.previousButton.enabled = this.previousButton.visible = false;
         this.nextButton.enabled = this.nextButton.visible = false;
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_YiJinJing(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_YIJINJING_DONGFANG1)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_YIJINJING_NANFANG2)
            {
               _loc4_.x = 40 + 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_YIJINJING_XIFANG3)
            {
               _loc4_.x = 40 + 4 + 1 + 40;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_YIJINJING_BEIFANG4)
            {
               _loc4_.x = 40 + 4 + 1 + 80;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_20171115NIZHUANYIJINJING)
            {
               _loc4_.x = 40 + 4 + 1 + 120;
               _loc4_.y = 4 + 1;
               _loc4_.Select = true;
               _loc4_.isHotGoods = true;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_XICHUANHONGMIANBAIHUAPAO)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               _loc4_.x = 331;
               _loc4_.y = 147 - 300;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(this.kuangHD);
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
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
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkillJiHuo(param1:int, param2:int) : void
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
         if(this.mainSkillItemFace2)
         {
            if(this.mainSkillItemFace2.parent)
            {
               this.mainSkillItemFace2.parent.removeChild(this.mainSkillItemFace2);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         _loc3_.isLearn = 1;
         this.mainSkillItemFace = new ItemFace(_loc3_);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
         var _loc4_:Skill = new Skill(param2);
         _loc4_.isLearn = 1;
         this.mainSkillItemFace2 = new ItemFace(_loc4_);
         this.mainSkillItemFace2.showKungFuTag();
         this.mainSkillItemFace2.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace2);
         if(this.isLearn1)
         {
            this.mainSkillItemFace.visible = true;
            this.kuang1.visible = true;
         }
         else
         {
            this.mainSkillItemFace.visible = false;
            this.kuang1.visible = false;
         }
         if(this.isLearn2)
         {
            this.mainSkillItemFace2.visible = true;
            this.kuang2.visible = true;
         }
         else
         {
            this.mainSkillItemFace2.visible = false;
            this.kuang2.visible = false;
         }
      }
   }
}

