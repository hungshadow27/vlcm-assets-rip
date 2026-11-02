package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
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
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.bazhentu.model.info.BaZhenTuVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class BaZhenTu extends Sprite
   {
      
      public static const UI_BAZHENTU_GUANBI_CLICK:String = "UI_BAZHENTU_GUANBI_CLICK";
      
      private var bg1:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var bazhentu:BaZhenTuTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const BAZHENTU_MAX:int = 8;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var boll1:DisplayObject;
      
      private var boll2:DisplayObject;
      
      private var boll3:DisplayObject;
      
      private var boll4:DisplayObject;
      
      private var boll5:DisplayObject;
      
      private var boll6:DisplayObject;
      
      private var boll7:DisplayObject;
      
      private var boll8:DisplayObject;
      
      private var bg1Spr:Sprite;
      
      private var bg2Spr:Sprite;
      
      private var bg3Spr:Sprite;
      
      private var bg4Spr:Sprite;
      
      private var bg5Spr:Sprite;
      
      private var bg6Spr:Sprite;
      
      private var bg7Spr:Sprite;
      
      private var bg8Spr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var fts1:FTextArea;
      
      private var shengmen:Boolean = false;
      
      private var shangmen:Boolean = false;
      
      private var xiumen:Boolean = false;
      
      private var dumen:Boolean = false;
      
      private var jingmen:Boolean = false;
      
      private var simen:Boolean = false;
      
      private var jingmen2:Boolean = false;
      
      private var kaimen:Boolean = false;
      
      private var fts3:FTextArea;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      public var check2:FCheckBox;
      
      private var checkLabel2:FLabel;
      
      private var fts2:FTextArea;
      
      private var tianshi:int = 0;
      
      private var dishi:int = 0;
      
      private var renshi:int = 0;
      
      private var shenshi:int = 0;
      
      private var moshi:int = 0;
      
      private var fts4:FTextArea;
      
      private var checkCB:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var fts5:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var checkWq2:FCheckBox;
      
      private var fts7:FTextArea;
      
      private var checkCB2:FCheckBox;
      
      private var fts8:FTextArea;
      
      private var checkDT:FCheckBox;
      
      private var _shiyongBtn:SmallButton;
      
      private var goods:Goods;
      
      public function BaZhenTu()
      {
         var title:FTextArea;
         var fjjn:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         box = new FCanvas();
         box.skin = "box_transparence";
         addChild(box);
         box.x = 2;
         box.y = 231;
         box.width = 400 + 1;
         box.height = 135;
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.bg1Spr = new Sprite();
         this.bg1Spr.x = 178;
         this.bg1Spr.y = 8;
         addChild(this.bg1Spr);
         this.bg2Spr = new Sprite();
         this.bg2Spr.x = 120;
         this.bg2Spr.y = 38;
         addChild(this.bg2Spr);
         this.bg3Spr = new Sprite();
         this.bg3Spr.x = 92;
         this.bg3Spr.y = 94;
         addChild(this.bg3Spr);
         this.bg4Spr = new Sprite();
         this.bg4Spr.x = 120;
         this.bg4Spr.y = 160;
         addChild(this.bg4Spr);
         this.bg5Spr = new Sprite();
         this.bg5Spr.x = 178;
         this.bg5Spr.y = 187;
         addChild(this.bg5Spr);
         this.bg6Spr = new Sprite();
         this.bg6Spr.x = 245;
         this.bg6Spr.y = 160;
         addChild(this.bg6Spr);
         this.bg7Spr = new Sprite();
         this.bg7Spr.x = 267;
         this.bg7Spr.y = 94;
         addChild(this.bg7Spr);
         this.bg8Spr = new Sprite();
         this.bg8Spr.x = 245;
         this.bg8Spr.y = 38;
         addChild(this.bg8Spr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37 - 130;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 10 - 20;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170 - 130;
         this.cengshu.y = 230 - 20 + 25 - 10 - 20;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 - 130;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 10 - 20;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 300;
         this.tishengBtn.y = 205;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("提升阵法");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 24 + 50;
         title.y = 250 + 12 - 15 + 23 - 17;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("八阵图") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 230 - 12 - 15;
         this.miaoshu.x = 23 - 11;
         this.miaoshu.y = 288 + 7 - 18;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100 + 30;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13 + 17 - 25;
         this.shuxing.y = 250 + 20 - 3 - 17;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36 - 15;
         fjjn.y = 255 + 5 + 5 + 6 + 22 - 20;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶级技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33 - 20;
         this.kuang.y = 300 - 2 + 20 - 15;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33 - 20;
         this.jinengSpr.y = 300 + 20 - 15;
         addChild(this.jinengSpr);
         this.bazhentu = new BaZhenTuTupoCanvas();
         addChild(this.bazhentu);
         this.bazhentu.x = 138;
         this.bazhentu.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.bazhentu.mask = $mask;
         addEventListener(UI_BAZHENTU_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("乾坤八阵秘技（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击10888亿、防御9888亿、血量12888亿、所有武功提升 108888层") + "<br>";
            if(shengmen && shangmen && xiumen)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("使用生门之石、伤门之石、休门之石可激活乾坤八阵秘技第一层") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：2588亿、防御2088亿、血量2888亿 所有武功提升 1888层") + "<br>" + LanResManager.getLanCommonTextWords("乾坤八阵 (特殊技能)：每攻击66次，都有50%的几率触发乾坤八阵，抵抗定身效果八秒！") + "<br>";
            }
            if(dumen && jingmen && simen)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("使用杜门之石、景门之石、死门之石可激活乾坤八阵秘技第二层") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：5088亿、防御4888亿、血量5888亿 所有武功提升 2888层") + "<br>" + LanResManager.getLanCommonTextWords("乾坤八阵 (特殊技能)：每攻击36次，都有50%的几率触发乾坤八阵，抵抗定身效果八秒！") + "<br>";
            }
            if(jingmen2 && kaimen)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("使用惊门之石、开门之石可激活乾坤八阵秘技第三层") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：8888亿、防御6888亿、血量9888亿 所有武功提升 3888层") + "<br>" + LanResManager.getLanCommonTextWords("乾坤八阵 (特殊技能)：每攻击18次，都有50%的几率触发乾坤八阵，抵抗定身效果八秒！") + "<br>";
            }
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 10 + 20;
         this.fts3.width = 130;
         this.fts3.height = 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("返璞归真（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("可使用归真能力使人物返璞于之前的形态") + "<br>" + LanResManager.getLanCommonTextWords("返璞归真：攻击12888888888888 防御10888888888888 血量13888888888888暴击 88888闪避88888   所有武功2100000层") + "<br>" + "" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 10;
         this.check.y = 50;
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
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = this.check.x;
         this.check2.y = this.check.y + 20;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel2 = new FLabel();
         with(this.checkLabel2)
         {
            x = check2.x + 20;
            --check2.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel2);
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 250;
         this.fts2.y = 7;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("八门神器秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("★八门神器特殊属性：激活该秘籍后，将激活八阵图养成属性，可使用天石、地石、人石、神") + "<br>" + LanResManager.getLanCommonTextWords("石、魔石 5种石头进行养成，每种养成石可养成350个。") + "<br>" + LanResManager.getLanCommonTextWords("每个增加：攻击200亿，所有武功20000层。八阵图") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用天石") + tianshi + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击：") + tianshi * 5000000 + "  " + LanResManager.getLanCommonTextWords("防御：") + tianshi * 5000000 + "  " + LanResManager.getLanCommonTextWords("生命：") + tianshi * 25000000 + "  " + LanResManager.getLanCommonTextWords("武功层数:") + tianshi * 50 + "  " + LanResManager.getLanCommonTextWords("战斗力：") + tianshi * 200000 + "  " + "<br>" + LanResManager.getLanCommonTextWords("当前已使用地石") + dishi + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击：") + dishi * 5000000 + "  " + LanResManager.getLanCommonTextWords("防御：") + dishi * 5000000 + "  " + LanResManager
            .getLanCommonTextWords("生命：") + dishi * 25000000 + "  " + LanResManager.getLanCommonTextWords("武功层数:") + dishi * 50 + "  " + LanResManager.getLanCommonTextWords("战斗力：") + dishi * 200000 + "  " + "<br>" + LanResManager.getLanCommonTextWords("当前已使用人石") + renshi + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击：") + renshi * 5000000 + "  " + LanResManager.getLanCommonTextWords("防御：") + renshi * 5000000 + "  " + LanResManager.getLanCommonTextWords("生命：") + renshi * 25000000 + "  " + LanResManager.getLanCommonTextWords("武功层数:") + renshi * 50 + "  " + LanResManager.getLanCommonTextWords("战斗力：") + renshi * 200000 + "  " + "<br>" + LanResManager.getLanCommonTextWords("当前已使用神石") + shenshi + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击：") + shenshi * 5000000 + "  " + LanResManager.getLanCommonTextWords("防御：") + shenshi * 5000000 + "  " + LanResManager.getLanCommonTextWords("生命：") + shenshi * 25000000 + "  " + LanResManager
            .getLanCommonTextWords("武功层数:") + shenshi * 50 + "  " + LanResManager.getLanCommonTextWords("战斗力：") + shenshi * 200000 + "  " + "<br>" + LanResManager.getLanCommonTextWords("当前已使用魔石") + moshi + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("攻击：") + moshi * 5000000 + "  " + LanResManager.getLanCommonTextWords("防御：") + moshi * 5000000 + "  " + LanResManager.getLanCommonTextWords("生命：") + moshi * 25000000 + "  " + LanResManager.getLanCommonTextWords("武功层数:") + moshi * 50 + "  " + LanResManager.getLanCommonTextWords("战斗力：") + moshi * 200000 + "  " + "<br>" + LanResManager.getLanCommonTextWords("激活100%扣除对手30%青龙战纹，技能在10秒内有效，冷却时间90秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 255 + 37;
         this.fts4.y = 7 + 20 + 60;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("天使与恶魔");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("情侣套装：拥有天使与恶魔的化身，神族和魔族设计打造而成的情侣套件，男角色使用") + "<br>" + LanResManager.getLanCommonTextWords("可获得天使化身，女角色使用可获得恶魔化身。激活天使与恶魔的玩家，每次攻击时都") + "<br>" + LanResManager.getLanCommonTextWords("有几率触发天使之翼，可瞬间冲击对手的生命值瞬间下降60%且附带天使净化效果使对") + "<br>" + LanResManager.getLanCommonTextWords("手的所有能力失效； 且当自身受到攻击时有几率触发恶魔之翼可瞬间吸收对手的所有") + "<br>" + LanResManager.getLanCommonTextWords("技能效果及伤害，达到全免伤，效果持续10秒。技能无冷却。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkCB = new FCheckBox();
         addChild(this.checkCB);
         this.checkCB.x = 256 + 117;
         this.checkCB.y = 7 + 20 + 60;
         this.checkCB.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 50;
         this.equipContainers.y = 160;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 7 + 20 + 60;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("碎魂饮血");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：80888亿、防御60888亿、血量80888亿、所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("碎魂饮血：攻击时100%触发碎魂饮血，持续10秒；在此状态下，碎魂的玩家周围将形成一层血") + "<br>" + LanResManager.getLanCommonTextWords("色包围自己，使自身免疫所有负面状态和伤害；且在此状态下，每受到对手一次攻击或是技能") + "<br>" + LanResManager.getLanCommonTextWords("效果都将瞬间转移给对手，使对手受到血色缠绕，定身原地5秒。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 70;
         this.checkWq.y = 7 + 20 + 60;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 7 + 20 + 60 + 25;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 110;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("碎魂之殇");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：6888亿、防御2888亿、血量8888亿、所有武功提升 50000层") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq2 = new FCheckBox();
         addChild(this.checkWq2);
         this.checkWq2.visible = false;
         this.checkWq2.x = 70;
         this.checkWq2.y = 7 + 20 + 60 + 25;
         this.checkWq2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 7 + 20 + 60 + 25 + 25;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 110;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("血色轮回");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("血色轮回：金色之日被血色侵蚀，化身血色轮回，受到恶魔的诅咒。") + "<br>" + LanResManager.getLanCommonTextWords("血色金轮：攻击时有几率触发血色金轮，持续20秒；在此状态下，自身将吸收") + "<br>" + LanResManager.getLanCommonTextWords("血色妖气，在效果下自身每受到一次攻击都将反噬对手血金轮，使对手瞬间无") + "<br>" + LanResManager.getLanCommonTextWords("法移动，持续10秒；自身每攻击对手一次，都将100%对对手所有勋章效果，使") + "<br>" + LanResManager.getLanCommonTextWords("其失效，持续10秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkCB2 = new FCheckBox();
         addChild(this.checkCB2);
         this.checkCB2.x = 70;
         this.checkCB2.y = 7 + 20 + 60 + 25 + 25;
         this.checkCB2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts8 = new FTextArea();
         this.fts8.x = 310;
         this.fts8.y = 7 + 20 + 60 + 25 + 25 + 25;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 110;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("神鬼八阵");
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 500000层") + "<br>" + LanResManager.getLanCommonTextWords("神鬼八阵：攻击时100%触发神鬼八阵，持续10秒；在此状态下，对手被困八阵之中，") + "<br>" + LanResManager.getLanCommonTextWords("方向絮乱，无法逃离；且在八阵之中，对手心智受到严重摧残，每秒掉血60%；当状") + "<br>" + LanResManager.getLanCommonTextWords("态解除后，对手被神鬼吞噬，将瞬间掉血80%且无法回血，持续10秒。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkDT = new FCheckBox();
         addChild(this.checkDT);
         this.checkDT.x = 380;
         this.checkDT.y = 7 + 20 + 60 + 25 + 25 + 25;
         this.checkDT.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this._shiyongBtn = new SmallButton();
         this._shiyongBtn.label = LanResManager.getLanCommonTextWords("使用");
         addChild(this._shiyongBtn);
         this._shiyongBtn.x = 348;
         this._shiyongBtn.y = 28;
         this._shiyongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkCB:
               this.checkCB2.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkCB.selectState,88]));
               break;
            case this.check:
               this.check2.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,3]));
               break;
            case this.check2:
               this.check.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check2.selectState,4]));
               break;
            case this.checkWq:
               this.checkWq2.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,108]));
               break;
            case this.checkWq2:
               this.checkWq.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq2.selectState,110]));
               break;
            case this.checkDT:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDT.selectState,109]));
               break;
            case this.checkCB2:
               this.checkCB.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkCB2.selectState,111]));
         }
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BAZHENTU_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BAZHENTU_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BAZHENTU_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
               break;
            case this._shiyongBtn:
               if(this._shiyongBtn.enabled && this.goods != null)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53099,[23,this.goods.id,this.goods.position]);
               }
         }
      }
      
      private function getGoodsShiyong(param1:int) : void
      {
         this.goods = null;
         var _loc2_:Array = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(param1,true);
         if(param1 > 0 && _loc2_.length > 0)
         {
            this.goods = _loc2_[0];
            this._shiyongBtn.enabled = true;
            return;
         }
         this._shiyongBtn.enabled = false;
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.bazhentu._parent2 = param1;
         this.bazhentu._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:BaZhenTuVO) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setJiHuo(param1);
         this.check.selectState = param2.check1;
         this.check2.selectState = param2.check2;
         this.checkCB.selectState = param2.checkCB;
         this.checkCB2.selectState = param2.checkCB2;
         this.checkWq.selectState = param2.checkWq;
         this.checkWq2.selectState = param2.checkWq2;
         this.checkDT.selectState = param2.checkDT;
         this.getGoodsShiyong(param2.xiaohaoGoodsID);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_QIANKUNBAZHEN_ID];
            this.shengmen = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_SHENGZHISHI_ID];
            this.shangmen = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_SHANGZHISHI_ID];
            this.xiumen = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_XIUZHISHI_ID];
            this.dumen = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_DUZHISHI_ID];
            this.jingmen = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_JINGZHISHI_ID];
            this.simen = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_SIZHISHI_ID];
            this.jingmen2 = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_JINGMENZHISHI_ID];
            this.kaimen = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_KAIZHISHI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_FANPUGUIZHEN_ID];
            this.check.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_FANPUGUIZHEN_ID];
            this.checkLabel.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_FANPUGUIZHEN_ID];
            this.check2.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_FANPUGUIZHEN_ID];
            this.checkLabel2.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_FANPUGUIZHEN_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_BAMENSHENQI_ID];
            this.tianshi = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_TIANSHI_ID];
            this.dishi = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_DISHI_ID];
            this.renshi = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_RENSHI_ID];
            this.shenshi = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_SHENSHI_ID];
            this.moshi = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_MOSHI_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_TIANSHIYUEMO_ID];
            this.checkCB.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_TIANSHIYUEMO_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_XUESELUNHUI_ID];
            this.checkCB2.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_XUESELUNHUI_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_SHENGUIBAZHEN_ID];
            this.checkDT.visible = GameState.dictMainStatus[SpecialGoodsID.BAZHENTU_SHENGUIBAZHEN_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_QIANKUNBAZHEN_ID];
            this.shengmen = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_SHENGZHISHI_ID];
            this.shangmen = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_SHANGZHISHI_ID];
            this.xiumen = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_XIUZHISHI_ID];
            this.dumen = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_DUZHISHI_ID];
            this.jingmen = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_JINGZHISHI_ID];
            this.simen = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_SIZHISHI_ID];
            this.jingmen2 = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_JINGMENZHISHI_ID];
            this.kaimen = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_KAIZHISHI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_FANPUGUIZHEN_ID];
            this.check.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_FANPUGUIZHEN_ID];
            this.checkLabel.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_FANPUGUIZHEN_ID];
            this.check2.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_FANPUGUIZHEN_ID];
            this.checkLabel2.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_FANPUGUIZHEN_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_BAMENSHENQI_ID];
            this.tianshi = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_TIANSHI_ID];
            this.dishi = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_DISHI_ID];
            this.renshi = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_RENSHI_ID];
            this.shenshi = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_SHENSHI_ID];
            this.moshi = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_MOSHI_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_TIANSHIYUEMO_ID];
            this.checkCB.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_TIANSHIYUEMO_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_XUESELUNHUI_ID];
            this.checkCB2.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_XUESELUNHUI_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_SHENGUIBAZHEN_ID];
            this.checkDT.visible = GameState.dictTargetStatus[SpecialGoodsID.BAZHENTU_SHENGUIBAZHEN_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         var i:int = 0;
         while(i < 8)
         {
            if(this["boll" + String(i + 1)])
            {
               if(this["boll" + String(i + 1)].parent)
               {
                  this["boll" + String(i + 1)].parent.removeChild(this["boll" + String(i + 1)]);
               }
            }
            this["boll" + String(i + 1)] = null;
            if(i < id)
            {
               this["boll" + String(i + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bazhentu/liang" + i + ".swf");
            }
            else
            {
               this["boll" + String(i + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bazhentu/an" + i + ".swf");
            }
            this["bg" + String(i + 1) + "Spr"].addChild(this["boll" + String(i + 1)]);
            this["boll" + String(i + 1)].visible = true;
            i++;
         }
         mcId = 1;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/bazhentu/bg.swf";
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
      
      public function setShuxingJiacheng(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param6 + "</font>";
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
            this.tishengBtn.enabled = false;
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            else
            {
               this.shangyiyeButton.enabled = true;
            }
            if(param2 >= this.BAZHENTU_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.tishengBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
               this.tishengBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.tishengBtn.enabled = false;
            }
         }
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         var _loc4_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.jinengSpr.addChild(_loc4_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.bazhentu.x == 138)
            {
               TweenMax.to(this.bazhentu,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.bazhentu.x == 410)
            {
               TweenMax.to(this.bazhentu,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BAZHENTU_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.BAZHENTU_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.bazhentu.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.bazhentu.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.bazhentu.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.bazhentu.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.bazhentu.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_BaZhenTu(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_BAZHENTU_SUIHUNYINXUE)
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
            else if(_loc3_.res.position == ItemPositionRange.POSTION_BAZHENTU_SUIHUNZHISHANG)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = -40;
               this.kuangHD.y = 0;
               _loc4_.x = 2 - 40;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq2.visible = true;
                  this.fts6.visible = true;
               }
               else
               {
                  this.checkWq2.visible = false;
                  this.fts6.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

