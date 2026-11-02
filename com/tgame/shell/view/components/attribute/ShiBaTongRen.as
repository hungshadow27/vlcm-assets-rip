package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
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
   import com.tgame.moudels.shibatongren.model.info.ShiBaTongRenMainPanelVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class ShiBaTongRen extends Sprite
   {
      
      public static const UI_SHIBATONGRENTUPO_GUANBI_CLICK:String = "UI_SHIBATONGRENTUPO_GUANBI_CLICK";
      
      private var _$parent:DisplayObject;
      
      private var gongMc:MovieClip;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fta6:FTextArea;
      
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
      
      private var shibatongrentupoCanvas:ShiBaTongRenTupCanvas;
      
      private var xianglongVo:ShiBaTongRenMainPanelVO;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var tianlong1:Boolean = false;
      
      private var tianlong2:Boolean = false;
      
      private var tianlong3:Boolean = false;
      
      private var tianlong4:Boolean = false;
      
      private var tianlong5:Boolean = false;
      
      private var tianlong6:Boolean = false;
      
      private var tianlong7:Boolean = false;
      
      private var tianlong8:Boolean = false;
      
      private var fts4:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var checkHz:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var checkDt:FCheckBox;
      
      private var fts7:FTextArea;
      
      private var suipian:int = 0;
      
      private var ynchk_lssh:FCheckBox;
      
      private var ynKuang:Bitmap;
      
      private var ynEquip:Sprite;
      
      private var ft_ynlssh:FTextArea;
      
      private var ynItemSpr:Sprite;
      
      private var isMainchar:Boolean = true;
      
      private var jianSelectConstiner:Sprite;
      
      private var jianNum:int;
      
      private var nowShowJian:DisplayObject;
      
      private var nowEquipID:int;
      
      private var nowEquip:Goods;
      
      private var nowIndex:int = 0;
      
      private var upButton:FSimpleButton;
      
      private var downButton:FSimpleButton;
      
      private var jianGoodsArr:Array;
      
      private var ynEquip1:Sprite;
      
      private var ynItemSpr1:Sprite;
      
      private var fts8:FTextArea;
      
      public function ShiBaTongRen()
      {
         var $mask:Sprite;
         var tf1:TextFormat = null;
         this.ftArr = [];
         this.lockImgArr = [];
         this.SkillAr = new Array();
         this.jianGoodsArr = [];
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 2;
         this.fc1.y = 2;
         this.fc1.width = 398;
         this.fc1.height = 280;
         this.fc1.skin = "box";
         addChild(this.fc1);
         this.img1 = StaticValue.getBitmapByClassName("ui.18zhang.tiao");
         addChild(this.img1);
         this.img1.x = 10;
         this.img1.y = 218;
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 20;
            x = 10;
            y = 220;
            textColor = StaticValue.ORANGE;
            htmlText = "    " + LanResManager.getLanCommonTextWords("人物属性加成：");
         }
         addChild(this.fta1);
         this.fta3 = new FTextArea();
         this.tf = new TextFormat();
         this.tf.align = "center";
         with(this.fta3)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 116;
            height = 16;
            x = 265;
            y = 167 + 20 - 10;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            htmlText = LanResManager.getLanCommonTextWords("第一关");
         }
         addChild(this.fta3);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            filters = StaticValue.filter;
            width = 90;
            height = 20;
            x = 318;
            y = 300;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("附加技能");
         }
         addChild(this.fta5);
         this.skillName = new FTextArea();
         with(this.skillName)
         {
            filters = StaticValue.filter;
            width = 160;
            height = 20;
            x = 11;
            y = 280 + 8;
            textColor = StaticValue.PURPLE;
            htmlText = LanResManager.getLanCommonTextWords("罗汉降世");
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
            y = 305;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("通过十二关考验时领悟，凝聚佛门圣力，以雷霆万钧之势击退对手，通过十八关考验后，该武学威力将会有巨大提升。");
         }
         addChild(this.skillDesc);
         this.lockImg = StaticValue.getBitmapByClassName("ui.ride.skill.assembled.skill.slot.lock");
         this.addChild(this.lockImg);
         this.lockImg.x = 325;
         this.lockImg.y = 318;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 325 + 2;
         this.mainSkillContainer.y = 318 + 2;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.fta6 = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 18;
         with(this.fta6)
         {
            filters = StaticValue.filter;
            defaultTextFormat = tf1;
            width = 230;
            height = 40;
            x = 260;
            y = 5;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("十八铜人阵");
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
            width = 160;
            height = 135;
            x = 220 + 10;
            y = 50 - 20;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.miaoshu);
         this.shuxing = new FTextArea();
         with(this.shuxing)
         {
            filters = StaticValue.filter;
            width = 365;
            height = 75;
            x = 20;
            y = 240;
            textColor = StaticValue.BlUE50;
            htmlText = "";
         }
         addChild(this.shuxing);
         this.shibatongrentupoCanvas = new ShiBaTongRenTupCanvas();
         this.shibatongrentupoCanvas._parent3 = this;
         addChild(this.shibatongrentupoCanvas);
         this.shibatongrentupoCanvas.x = 138;
         this.shibatongrentupoCanvas.y = -10;
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
         this.shibatongrentupoCanvas.mask = $mask;
         addEventListener(UI_SHIBATONGRENTUPO_GUANBI_CLICK,this.aa1);
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 10;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("刀枪不入(未激活)");
         addChild(this.fts);
         this.fts.visible = false;
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击8888888 防御6888888 血量18888888 暴击88 闪避88 人物防御属性提升30% 玄武战纹4%") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 10 + 170;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20 + 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("左青龙纹身") + "<br>" + LanResManager.getLanCommonTextWords("（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("可激活铁骨金僧，并可获得攻击2000亿 、防御 800亿 及技能——铁骨金僧") + "<br>" + LanResManager.getLanCommonTextWords("铁骨金僧：被攻击时有较高几率触发技能铁骨金僧，在此状态下人物将可以在1分钟内抵抗下对手90%") + "<br>" + LanResManager.getLanCommonTextWords("的伤害效果，并且在这1分钟内还将提高自身血量18倍。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 110 + 33;
         this.fts2.y = 10 + 170;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20 + 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("右白虎纹身") + "<br>" + LanResManager.getLanCommonTextWords("（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("可激活苦禅心法，并可获得攻击2000亿 、防御 800亿 及技能——苦禅心法") + "<br>" + LanResManager.getLanCommonTextWords("苦禅心法：可增加提升提升人物攻击、防御、闪避、暴击、血量属性各300%的全属性加成，且所有武") + "<br>" + LanResManager.getLanCommonTextWords("功将提升80000层。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 10 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20 + 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("八部天龙秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>";
            if(tianlong1)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("一天众") + "<br>" + LanResManager.getLanCommonTextWords("攻击：8888亿、防御12888亿、血量10888亿、所有武功提升 60000层") + "<br>";
            }
            if(tianlong2)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("二龙众") + "<br>" + LanResManager.getLanCommonTextWords("攻击：8888亿、防御12888亿、血量10888亿、所有武功提升 60000层") + "<br>";
            }
            if(tianlong3)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("三夜叉") + "<br>" + LanResManager.getLanCommonTextWords("攻击：8888亿、防御12888亿、血量10888亿、所有武功提升 60000层") + "<br>";
            }
            if(tianlong4)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("四乾达婆") + "<br>" + LanResManager.getLanCommonTextWords("攻击：8888亿、防御12888亿、血量10888亿、所有武功提升 60000层") + "<br>";
            }
            if(tianlong5)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("五阿修罗") + "<br>" + LanResManager.getLanCommonTextWords("攻击：8888亿、防御12888亿、血量10888亿、所有武功提升 60000层") + "<br>";
            }
            if(tianlong6)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("六迦喽罗") + "<br>" + LanResManager.getLanCommonTextWords("攻击：8888亿、防御12888亿、血量10888亿、所有武功提升 60000层") + "<br>";
            }
            if(tianlong7)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("七紧那罗") + "<br>" + LanResManager.getLanCommonTextWords("攻击：8888亿、防御12888亿、血量10888亿、所有武功提升 60000层") + "<br>";
            }
            if(tianlong8)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("八摩呼罗迦") + "<br>" + LanResManager.getLanCommonTextWords("攻击：8888亿、防御12888亿、血量10888亿、所有武功提升 60000层") + "<br>";
            }
            _loc1_ += LanResManager.getLanCommonTextWords("八部天龙（特殊技能）：攻击时有几率触发八部天龙效果，持续10秒。自身召唤八部天众给予对手致") + "<br>" + LanResManager.getLanCommonTextWords("命一击，瞬间掉90%血量且沉睡5秒。5秒后，八部天众产生大爆炸，令对手经脉尽断，无法攻击，持续10秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 10 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("八部撼金龙");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：80888亿、防御60888亿、血量80888亿、 所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("八部撼金龙：不属于龙族、不属于仙界、地界的生物，拥有所有龙族不一样的外观，只有八部撼") + "<br>" + LanResManager.getLanCommonTextWords("金龙认可的主人方可骑乘它，拥有撼金龙的玩家即可获得该认可。") + "<br>" + LanResManager.getLanCommonTextWords("撼金分离：攻击时100%触发撼金分离，持续10秒；在此状态下，每攻击一次，都可将对手进行分") + "<br>" + LanResManager.getLanCommonTextWords("离，每分离一次对手的所有勋章，所有技能都将被封印。冷却60秒。") + "<br>" + LanResManager.getLanCommonTextWords("撼金流离：攻击时100%使对手攻速移速降低50%，技能无冷却。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 10 + 70 + 25;
         this.checkZq.y = 7 + 20 + 20;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 10 + 20 + 20 + 25;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("襄阳大将");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("襄阳大将：拥有霸者之气的将统，玩家可随时操作其灵魂附身转生。") + "<br>" + LanResManager.getLanCommonTextWords("霸气威慑：攻击时有几率触霸气威慑，持续10秒；在此状态下，自身不管移动到哪，") + "<br>" + LanResManager.getLanCommonTextWords("每秒都将自身范围5格内的所有对手产生威慑力，可瞬间震晕5格内的所有对手；且") + "<br>" + LanResManager.getLanCommonTextWords("对手在此状态下，若5秒内无法脱逃可瞬间在造成对手掉血80%；霸气环绕，英雄无") + "<br>" + LanResManager.getLanCommonTextWords("敌，在此状态下自身将免疫对手所有负面状态。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkHz = new FCheckBox();
         addChild(this.checkHz);
         this.checkHz.x = 10 + 70;
         this.checkHz.y = 7 + 20 + 20 + 25;
         this.checkHz.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 10 + 20 + 20 + 25 + 25;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 110;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("龙神守护");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("神龙：龙族信仰之圣兽，犹如黄金般打造的龙头，内含不朽之力，人物可自己切换该神龙。") + "<br>" + LanResManager.getLanCommonTextWords("龙神护体：被攻击时100%触发龙神护体，持续10秒；自身在此状态下，每秒都将触发龙神怒吼，") + "<br>" + LanResManager.getLanCommonTextWords("每次怒吼可瞬间清除自身所有负面状态，且自身产生无敌BUFF3秒；且怒吼中时，只要范围5格") + "<br>" + LanResManager.getLanCommonTextWords("内存在其他玩家，都将瞬间被击退，震碎耳膜，在原地呆滞，持续10秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.x = 10 + 70;
         this.checkDt.y = 7 + 20 + 20 + 25 + 25;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts7 = new FTextArea();
         this.fts7.x = 10;
         this.fts7.y = 10 + 20 + 20 + 25 + 25 + 20;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 110;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("天龙武神秘籍");
         this.fts7.visible = false;
         addChild(this.fts7);
         this.ynEquip = new Sprite();
         with(this.ynEquip.graphics)
         {
            beginFill(65535,0);
            drawRect(0,0,45,80);
            endFill();
         }
         this.ynEquip.x = 170;
         this.ynEquip.y = 165;
         this.ynEquip.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.ynchk_lssh = new FCheckBox();
         this.ynchk_lssh.name = "4";
         addChild(this.ynchk_lssh);
         this.ynchk_lssh.textColor = StaticValue.WHITE;
         this.ynchk_lssh.x = 55;
         this.ynchk_lssh.y = 185;
         this.ynchk_lssh.addEventListener(MouseEvent.CLICK,this.onCheckClickYN);
         this.ft_ynlssh = new FTextArea();
         this.ft_ynlssh.x = 55 + 25;
         this.ft_ynlssh.y = 185;
         this.ft_ynlssh.width = 65;
         this.ft_ynlssh.textColor = StaticValue.WHITE;
         this.ft_ynlssh.htmlText = LanResManager.getLanCommonTextWords("龙神守护气旋");
         addChild(this.ft_ynlssh);
         this.ynKuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.ynKuang.x = 2;
         this.ynKuang.y = 0;
         this.ynEquip.addChild(this.ynKuang);
         this.ynKuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.ynKuang.x = 2;
         this.ynKuang.y = -80;
         this.ynEquip.addChild(this.ynKuang);
         this.ynItemSpr = new Sprite();
         with(this.ynItemSpr.graphics)
         {
            beginFill(65535,0);
            drawRect(0,0,45,40);
            endFill();
         }
         this.ynEquip.addChild(this.ynItemSpr);
         this.ynEquip1 = new Sprite();
         with(this.ynEquip1.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,45,40);
            endFill();
         }
         this.ynEquip1.x = 170;
         this.ynEquip1.y = 130;
         addChild(this.ynEquip1);
         this.ynEquip1.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick1,false,30);
         this.ynKuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.ynKuang.x = 2;
         this.ynKuang.y = -5;
         this.ynEquip1.addChild(this.ynKuang);
         this.ynItemSpr1 = new Sprite();
         with(this.ynItemSpr1.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,45,40);
            endFill();
         }
         this.ynEquip1.addChild(this.ynItemSpr1);
         this.upButton = new FSimpleButton();
         this.upButton.skin = "equipListRightBtn";
         this.upButton.rotation = -90;
         this.upButton.addEventListener(MouseEvent.CLICK,this.onUpDownClick);
         this.downButton = new FSimpleButton();
         this.downButton.skin = "equipListRightBtn";
         this.downButton.rotation = 90;
         this.downButton.addEventListener(MouseEvent.CLICK,this.onUpDownClick);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 227 + 18;
         this.previousButton.y = 167 + 20 - 10;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 355 + 18;
         this.nextButton.y = 167 + 20 - 10;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始闯关");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 275 + 15;
         this.lingWuBtn.y = 190 + 20 - 5;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.ynEquip);
         this.fts8 = new FTextArea();
         this.fts8.x = 10;
         this.fts8.y = 10 + 20 + 20;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 110;
         this.fts8.height = 20;
         this.fts8.htmlText = new Goods(SpecialGoodsID.SHIBATONGREN_JINGANGSHANGJING_ID).res.name;
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(SpecialGoodsID.SHIBATONGREN_JINGANGSHANGJING_ID).res.desc + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClickYN(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.ynchk_lssh:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUENANDINGZHI_QIXUAN_ZIDONGHUANZHUANG,"",[param1.target.selectState,param1.target.name]));
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(!this.isLockOn)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,27]));
               break;
            case this.checkHz:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz.selectState,68]));
               break;
            case this.checkDt:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,70]));
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
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showXiangLongLingWuPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.SHIBATONGREN_ARROW_CLICK,"",0));
               break;
            case this.nextButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.SHIBATONGREN_ARROW_CLICK,"",1));
               break;
            case this.lingWuBtn:
               if(this.tupoBo)
               {
                  return;
               }
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.SHIBATONGREN_CHUANGGUAN,""));
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
         this.shibatongrentupoCanvas._parent2 = param1;
         this.shibatongrentupoCanvas._parent3 = this;
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
      }
      
      public function initilizeUI(param1:Boolean, param2:ShiBaTongRenMainPanelVO) : void
      {
         this.showYNequipselect(param1);
         this.checkZq.selectState = param2.isZuoQi;
         this.checkHz.selectState = param2.isHuanZhuang;
         this.checkDt.selectState = param2.isDanTian;
         this.xianglongVo = param2;
         this.setMainMsgSBTR(param2.viewSkillDesc);
         this.setZhaoShiMsg(param2.viewSkillName,param2.learnedSkillID,param2.viewSkillID,param2.learnedSkillID >= 18);
         this.setChatShuXing(param2.jiacheng);
         this.skillName.htmlText = param2.bigSkill.res.name;
         this.setSkill(new Skill(param2.bigSkillID),param2.learnedSkillID);
         var _loc3_:int = param2.learnedSkillID;
         var _loc4_:String = "";
         if(_loc3_ < 12)
         {
            _loc4_ = "";
         }
         else if(11 < _loc3_ < 18)
         {
            _loc4_ = "\t " + LanResManager.getLanCommonTextWords("击退距离") + "：" + _loc3_.toString() + LanResManager.getLanCommonTextWords("米");
         }
         else
         {
            _loc4_ = "\t " + LanResManager.getLanCommonTextWords("定身") + "：" + _loc3_.toString() + LanResManager.getLanCommonTextWords("秒");
         }
         this.skillDesc.htmlText += _loc4_;
         this.setJiHuo(param1);
      }
      
      private function loadImg(param1:int) : void
      {
         if(this.bit1 != null && this.bit1.parent != null)
         {
            this.bit1.parent.removeChild(this.bit1);
         }
         this.bit1 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/shibatongren/" + param1 + ".jpg",222,211);
         this.bit1.x = 2;
         this.bit1.y = 2;
         addChildAt(this.bit1,1);
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1, param4:Boolean = false) : void
      {
         this.fta3.htmlText = param1;
         var _loc5_:int = 0;
         if(param3 == 0)
         {
            _loc5_ = 1;
         }
         else
         {
            _loc5_ = param3;
         }
         this.loadImg(_loc5_);
         this.nowLevel = param2;
         this.previousButtonEnabled(true);
         this.lingWuButtonEnabled(true);
         this.nextButtonEnabled(true);
         if(param2 == 0 && param3 == 1)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始闯关");
            this.lingWuButtonEnabled(true);
         }
         else if(param2 >= param3 || param4)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已过关");
            this.lingWuButtonEnabled(false);
         }
         else if(param3 - param2 == 1 && param2 != 18)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始闯关");
            this.lingWuButtonEnabled(true);
         }
         else if(param2 < param3 && param3 - param2 != 1 && param2 != 18)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未闯关");
            this.lingWuButtonEnabled(false);
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未闯关");
            this.lingWuButtonEnabled(false);
         }
         if(this.isLockOn)
         {
            if(param2 == 0)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未闯关");
            }
            else
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已过关");
            }
         }
         if(param3 == 1)
         {
            this.previousButtonEnabled(false);
            this.nextButtonEnabled(true);
         }
         else if(param3 == 18)
         {
            this.nextButtonEnabled(false);
            this.previousButtonEnabled(true);
         }
      }
      
      public function setMainMsgSBTR(param1:String) : void
      {
         this.miaoshu.htmlText = param1;
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
            _loc5_.width = 110;
            if(_loc2_ >= 3)
            {
               _loc5_.x = 10 + (_loc2_ - 3) * 120;
               _loc5_.y = 258;
            }
            else
            {
               _loc5_.x = 10 + _loc2_ * 120;
               _loc5_.y = 240;
            }
            this.ftArr.push(_loc5_);
            this.addChild(_loc5_);
            _loc2_++;
         }
      }
      
      public function showXiangLongLingWuPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.shibatongrentupoCanvas.x == 138)
            {
               TweenMax.to(this.shibatongrentupoCanvas,1,{"x":410});
               this.tupoBo = true;
               this.previousButtonEnabled(false);
               this.nextButtonEnabled(false);
               this.lingWuButtonEnabled(false);
               this.shibatongrentupoCanvas.BtnEnableTrue();
            }
         }
         else if(this.shibatongrentupoCanvas.x == 410)
         {
            TweenMax.to(this.shibatongrentupoCanvas,1,{"x":138});
            this.tupoBo = false;
            this.previousButtonEnabled(true);
            this.nextButtonEnabled(true);
            this.lingWuButtonEnabled(true);
            if(this.nowLevel == 0)
            {
               this.previousButtonEnabled(false);
            }
            if(this.nowLevel == 18)
            {
               this.nextButtonEnabled(false);
            }
            this.shibatongrentupoCanvas.BtnEnableFalse();
         }
      }
      
      public function hideChuangguanPanel() : void
      {
         this.showXiangLongLingWuPanel(false);
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.SHIBATONGREN_CHUANGGUAN_CLOSE));
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
         if(param2 >= 12)
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
         this.shibatongrentupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.shibatongrentupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.shibatongrentupoCanvas.setGoods(param1,param2);
      }
      
      public function setShuoming(param1:String) : void
      {
         this.shibatongrentupoCanvas.setShuoming(param1);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         this.shibatongrentupoCanvas.setBtn(param1);
      }
      
      public function closeMiniPanel() : void
      {
         if(this.shibatongrentupoCanvas.x == 410)
         {
            TweenMax.to(this.shibatongrentupoCanvas,1,{"x":138});
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
      
      public function lockOn() : void
      {
         this.isLockOn = true;
         this.isDragMainSkill = true;
         this.previousButtonEnabled(false);
         this.nextButtonEnabled(false);
         this.lingWuButtonEnabled(false);
         this.isMainchar = false;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            if(GameState.dictMainStatus[40794])
            {
               this.fts.textColor = StaticValue.GREEN;
               this.fts.htmlText = LanResManager.getLanCommonTextWords("刀枪不入(已激活)");
               this.fts.visible = true;
            }
            else
            {
               this.fts.textColor = StaticValue.RED;
               this.fts.htmlText = LanResManager.getLanCommonTextWords("刀枪不入(未激活)");
               this.fts.visible = false;
            }
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_ZUOQINGLONG_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_YOUBAIHU_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_BABUTIANLONG_ID];
            this.tianlong1 = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_BABU1_ID];
            this.tianlong2 = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_BABU2_ID];
            this.tianlong3 = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_BABU3_ID];
            this.tianlong4 = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_BABU4_ID];
            this.tianlong5 = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_BABU5_ID];
            this.tianlong6 = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_BABU6_ID];
            this.tianlong7 = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_BABU7_ID];
            this.tianlong8 = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_BABU8_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_BABUHANJINLONG_ID])
            {
               this.fts4.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.checkZq.visible = false;
            }
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_XIANGYANGDAJIANG_ID];
            this.checkHz.visible = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_XIANGYANGDAJIANG_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_LONGSHENSHOUHU_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_LONGSHENSHOUHU_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_TIANLONGWUSHEN_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_LONGSHENSUIPIAN_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.SHIBATONGREN_JINGANGSHANGJING_ID];
         }
         else
         {
            if(GameState.dictTargetStatus[40794])
            {
               this.fts.textColor = StaticValue.GREEN;
               this.fts.htmlText = LanResManager.getLanCommonTextWords("刀枪不入(已激活)");
               this.fts.visible = true;
            }
            else
            {
               this.fts.textColor = StaticValue.RED;
               this.fts.htmlText = LanResManager.getLanCommonTextWords("刀枪不入(未激活)");
               this.fts.visible = false;
            }
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_ZUOQINGLONG_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_YOUBAIHU_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_BABUTIANLONG_ID];
            this.tianlong1 = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_BABU1_ID];
            this.tianlong2 = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_BABU2_ID];
            this.tianlong3 = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_BABU3_ID];
            this.tianlong4 = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_BABU4_ID];
            this.tianlong5 = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_BABU5_ID];
            this.tianlong6 = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_BABU6_ID];
            this.tianlong7 = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_BABU7_ID];
            this.tianlong8 = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_BABU8_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_BABUHANJINLONG_ID])
            {
               this.fts4.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.checkZq.visible = false;
            }
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_XIANGYANGDAJIANG_ID];
            this.checkHz.visible = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_XIANGYANGDAJIANG_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_LONGSHENSHOUHU_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_LONGSHENSHOUHU_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_TIANLONGWUSHEN_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_LONGSHENSUIPIAN_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.SHIBATONGREN_JINGANGSHANGJING_ID];
         }
      }
      
      public function showYN_LSSH(param1:Boolean) : void
      {
         this.ynchk_lssh.enabled = param1;
         this.ft_ynlssh.visible = this.ynchk_lssh.visible;
         if(param1 == false)
         {
            this.ynchk_lssh.selectState = false;
         }
      }
      
      public function setCHK_LSSH(param1:Boolean) : void
      {
         this.ynchk_lssh.selectState = param1;
      }
      
      public function setYN(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.ynItemSpr.numChildren > 0)
         {
            this.ynItemSpr.removeChildAt(0);
         }
         if(!this.isMainchar)
         {
            this.ynEquip.mouseEnabled = false;
         }
         else
         {
            this.ynEquip.mouseEnabled = true;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSITION_LONGSHENSHOUHU)
            {
               _loc4_.x = 4;
               _loc4_.y = 2;
               this.ynItemSpr.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_20171115ZHIZUNBAQI)
            {
               _loc4_.x = 4;
               _loc4_.y = 2 - 80;
               this.ynItemSpr.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      public function showYNequipselect(param1:Boolean = true) : void
      {
         while(this.ynItemSpr1.numChildren > 0)
         {
            this.ynItemSpr1.removeChildAt(0);
         }
         if(!this.isMainchar)
         {
            this.ynEquip1.mouseEnabled = false;
         }
         else
         {
            this.ynEquip1.mouseEnabled = true;
         }
         var _loc2_:Array = [];
         if(param1)
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.YNsbtrArr;
         }
         else
         {
            _loc2_ = GameInstance.lookPlayerData.goodsInfo.YNsbtrArr;
         }
         if(_loc2_.length <= 0)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length - 1)
         {
            this.jianGoodsArr[_loc3_] = _loc2_[_loc3_ + 1];
            _loc3_++;
         }
         this.nowEquip = _loc2_[0];
         var _loc4_:ItemFace = new ItemFace(this.nowEquip);
         if(ItemPositionRange.POSITION_SHIBALUOHAN_ARR.indexOf(this.nowEquip.res.position) != -1)
         {
            _loc4_.x = 4;
            _loc4_.y = -3;
            this.ynItemSpr1.addChild(_loc4_);
         }
      }
      
      private function onItemClick1(param1:Event) : void
      {
         if(!this.isLockOn)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function closeJianSelectSpr() : void
      {
         if(!this.jianSelectConstiner)
         {
            return;
         }
         this.jianSelectConstiner.removeEventListener(MouseEvent.MOUSE_DOWN,this.selectJianEvent);
         if(this.jianSelectConstiner.parent)
         {
            this.jianSelectConstiner.parent.removeChild(this.jianSelectConstiner);
         }
      }
      
      public function showSelectJianBar() : void
      {
         var count:int;
         var i:int;
         var gOK:Goods = null;
         var item:ItemFace = null;
         if(!this.jianSelectConstiner)
         {
            this.jianSelectConstiner = new Sprite();
            with(this.jianSelectConstiner.graphics)
            {
               
               beginFill(16711680,0);
               drawRect(0,0,45,125);
               endFill();
            }
            this.jianSelectConstiner.x = 170;
         }
         addChild(this.jianSelectConstiner);
         if(this.isMainchar)
         {
            this.jianSelectConstiner.addEventListener(MouseEvent.CLICK,this.selectJianEvent);
         }
         while(this.jianSelectConstiner.numChildren > 0)
         {
            this.jianSelectConstiner.removeChildAt(0);
         }
         if(this.nowIndex < 0)
         {
            this.nowIndex += this.jianGoodsArr.length;
         }
         else if(this.nowIndex >= this.jianGoodsArr.length)
         {
            this.nowIndex -= this.jianGoodsArr.length;
         }
         this.upButton.x = 14;
         this.upButton.y = 15;
         this.downButton.x = 31;
         this.downButton.y = 120;
         if(this.jianGoodsArr.length > 3)
         {
            this.jianSelectConstiner.addChild(this.upButton);
            this.jianSelectConstiner.addChild(this.downButton);
         }
         count = 0;
         i = this.nowIndex;
         while(i < this.jianGoodsArr.length)
         {
            gOK = this.jianGoodsArr[i];
            if(gOK != null)
            {
               item = new ItemFace(gOK);
               this.jianSelectConstiner.addChild(item);
               item.x = 5;
               item.y = 88 - 36 * count;
               count++;
            }
            if(count == 3)
            {
               break;
            }
            i++;
         }
      }
      
      private function onUpDownClick(param1:Event) : void
      {
         switch(param1.target)
         {
            case this.upButton:
               ++this.nowIndex;
               this.showSelectJianBar();
               break;
            case this.downButton:
               --this.nowIndex;
               this.showSelectJianBar();
         }
      }
      
      private function selectJianEvent(param1:Event) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Goods = null;
         if(param1.target is ItemFace)
         {
            _loc2_ = param1.target as ItemFace;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getBaseItem() as Goods;
            }
            this.jianSelectConstiner.removeEventListener(MouseEvent.MOUSE_DOWN,this.selectJianEvent);
            if(this.jianSelectConstiner.parent)
            {
               this.jianSelectConstiner.parent.removeChild(this.jianSelectConstiner);
            }
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_SELECT_SHOW_SBTR,"",_loc3_.res.position));
         }
      }
   }
}

